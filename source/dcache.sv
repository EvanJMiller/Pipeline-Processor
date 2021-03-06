// interfaces
`include "datapath_cache_if.vh"
`include "caches_if.vh"

// cput types
`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;

module dcache (
  input logic CLK, nRST,
  datapath_cache_if.dcache dcif,
  caches_if.dcache ccif
);


//dcache frame
typedef struct packed{
  logic lru;
  dcache_frame frame_1;
  dcache_frame frame_2;
} dcache_line;


dcache_line [7:0] dcache; // 8 entry 2-way associative, 2 words per block, 64 bits per block
dcache_line [7:0] next_dcache;
dcachef_t mem_addr;
logic evict, next_evict;
logic flush, next_flush;
logic [2:0] flush_idx, next_flush_idx;
dcache_frame flush_frame, next_flush_frame;
word_t prev_addr;
word_t next_prev_addr;



// states
typedef enum {IDLE, LOAD1, LOAD2, WRITE1, WRITE2, FLUSH, WRITE_HIT_CNT, HALT} cacheState;
cacheState state;
cacheState next_state;
cacheState prev_state, next_prev_state;

logic cache_hit, next_cache_hit;
word_t hit_count;
word_t next_hit_count;

//logic ram_hit;

assign mem_addr = dcif.dmemaddr;
//assign dcif.dhit = (ram_hit | cache_hit);
assign dcif.dhit = cache_hit;

always_ff @(negedge nRST, posedge CLK) begin
  if (nRST == 1'b0) begin
    dcache <= '0;
    cache_hit <= 1'b0;
    state <= IDLE;
    prev_state <= IDLE;
    evict <= 1'b0;
    flush <= 1'b0;
    flush_idx <= 3'b000;
    flush_frame <= '0;
    hit_count <= '0;
    prev_addr <= '0;

  end
  else begin
    dcache <= next_dcache;
    cache_hit <= next_cache_hit;
    prev_state <= next_prev_state;
    state <= next_state;
    evict <= next_evict;
    flush <= next_flush;
    flush_idx <= next_flush_idx;
    flush_frame <= next_flush_frame;
    hit_count <= next_hit_count;
    prev_addr <= next_prev_addr;

  end
end // always_ff

always_comb begin
  ccif.dREN        = 1'b0;
  ccif.dWEN        = 1'b0;
  ccif.daddr       = '0;
  ccif.dstore      = '0;
  dcif.flushed     = 1'b0;
  next_dcache      = dcache;
  next_cache_hit   = 1'b0;
  next_evict       = evict;
  next_flush       = flush;
  next_flush_idx   = flush_idx;
  next_flush_frame = flush_frame;
  next_state       = state;
  next_prev_state  = prev_state;
  next_hit_count   = hit_count;
  next_prev_addr   = '0;
  dcif.dmemload = '0;
  casez(state)
    IDLE: begin
      // Halt and flush dirty data back to memory
      if (dcif.halt == 1'b1) begin
        next_state = FLUSH;
        next_prev_state = IDLE;
        next_flush = 1'b1;
      end
      /*else if (dcif.dmemaddr == prev_addr) begin
          if(cache_hit == 1'b1) begin
            next_cache_hit = 1'b0;
          end
      end*/
      // Reading data from cache
      else if (dcif.dmemREN == 1'b1) begin
        // Compare tag, check valid bits - frame 1
        if(mem_addr.tag == dcache[mem_addr.idx].frame_1.tag & dcache[mem_addr.idx].frame_1.valid == 1) begin
          // Cache hit in frame 1 - word 0
          if (mem_addr.blkoff == 1'b0) begin
            dcif.dmemload = dcache[mem_addr.idx].frame_1.data[0];
          end
          // Cache hit in frame 1 - word 1
          else if (mem_addr.blkoff == 1'b1) begin
            dcif.dmemload = dcache[mem_addr.idx].frame_1.data[1];
          end
          next_dcache[mem_addr.idx].lru = 1'b1; // update lru to frame 2

          // Set next_cache_hit accordingly
          if(prev_state == IDLE & cache_hit == 1'b0) begin
            next_cache_hit  = 1'b1;
          end
          else if (prev_state == LOAD2) begin
            next_cache_hit = 1'b1;
          end
          else begin
            next_cache_hit = 1'b0;
          end

          next_state = IDLE;
          next_prev_state = IDLE;
          if (prev_state != LOAD2 & cache_hit == 1'b0) begin
            //next_cache_hit = 1'b1;
            next_hit_count = hit_count + 1'b1;
          end
        end // hit in frame 1

        // Compare tag, check valid bits - frame 2
        else if (mem_addr.tag == dcache[mem_addr.idx].frame_2.tag & dcache[mem_addr.idx].frame_2.valid == 1) begin
          // Cache hit in frame 2 - word 0
          if (mem_addr.blkoff == 1'b0) begin
            dcif.dmemload = dcache[mem_addr.idx].frame_2.data[0];
          end
          // Cache hit in frame 2 - word 1
          else if (mem_addr.blkoff == 1'b1) begin
            dcif.dmemload = dcache[mem_addr.idx].frame_2.data[1];
          end
          next_dcache[mem_addr.idx].lru = 1'b0; // update lru to frame 1
          // if(next_state != LOAD1) begin
          //next_cache_hit  = 1'b1;
          // end

          // Set next_cache_hit accordingly
          if(prev_state == IDLE & cache_hit == 1'b0) begin
            next_cache_hit  = 1'b1;
          end
          else if (prev_state == LOAD2) begin
            next_cache_hit = 1'b1;
          end
          else begin
            next_cache_hit = 1'b0;
          end

          next_state = IDLE;
          next_prev_state = IDLE;
          if (prev_state != LOAD2 & cache_hit == 1'b0) begin
            //next_cache_hit = 1'b1;
            next_hit_count = hit_count + 1'b1;
          end
        end // hit in frame 2

        // else need to load block from memory
        else begin
          next_state = LOAD1;
          next_prev_state = IDLE;
          if (dcache[mem_addr.idx].frame_1.valid == 1'b1 & dcache[mem_addr.idx].frame_2.valid == 1'b1) begin
            next_evict = 1'b1;
          end
        end
      end // dmemREN

      // Writing data to cache
      else if (dcif.dmemWEN == 1'b1) begin
        // Compare tag, check dirty bits - frame 1
        if(mem_addr.tag == dcache[mem_addr.idx].frame_1.tag & dcache[mem_addr.idx].frame_1.valid == 1) begin
        //if(mem_addr.tag == dcache[mem_addr.idx].frame_1.tag & dcache[mem_addr.idx].frame_1.dirty == 0) begin
          // Cache hit in frame 1 - word 0
          if (mem_addr.blkoff == 1'b0) begin
            next_dcache[mem_addr.idx].frame_1.data[0] = dcif.dmemstore;
          end
          // Cache hit in frame 1 - word 1
          else if (mem_addr.blkoff == 1'b1) begin
            next_dcache[mem_addr.idx].frame_1.data[1] = dcif.dmemstore;
          end
          next_dcache[mem_addr.idx].frame_1.dirty = 1'b1;
          //if (prev_state != IDLE) begin
          //  next_cache_hit  = 1'b1;
          //end

          // Set next_cache_hit accordingly
          if(prev_state == IDLE & cache_hit == 1'b0) begin
            next_cache_hit  = 1'b1;
          end
          else if (prev_state == LOAD2) begin
            next_cache_hit = 1'b1;
          end
          else begin
            next_cache_hit = 1'b0;
          end

          next_state = IDLE;
          next_prev_state = IDLE;
          //if (prev_state != LOAD2) begin
          if (prev_state != LOAD2 & cache_hit == 1'b0) begin
            next_hit_count = hit_count + 1'b1;
          end
        end // hit in frame 1

        // Compare tag, check dirty bits - frame 2
        else if (mem_addr.tag == dcache[mem_addr.idx].frame_2.tag & dcache[mem_addr.idx].frame_2.valid == 1) begin
        //else if (mem_addr.tag == dcache[mem_addr.idx].frame_2.tag & dcache[mem_addr.idx].frame_2.dirty == 0) begin
          // Cache hit in frame 2 - word 0
          if (mem_addr.blkoff == 1'b0) begin
            next_dcache[mem_addr.idx].frame_2.data[0] = dcif.dmemstore;
            //dcif.dmemload = dcache[mem_addr.idx].frame_2.data[0];
          end
          // Cache hit in frame 2 - word 1
          else if (mem_addr.blkoff == 1'b1) begin
            next_dcache[mem_addr.idx].frame_2.data[1] = dcif.dmemstore;
            //dcif.dmemload = dcache[mem_addr.idx].frame_2.data[1];
          end
          next_dcache[mem_addr.idx].frame_2.dirty = 1'b1;
          //if (prev_state != IDLE) begin
          //next_cache_hit  = 1'b1;
          //end

          // Set next_cache_hit accordingly
          if(prev_state == IDLE & cache_hit == 1'b0) begin
            next_cache_hit  = 1'b1;
          end
          else if (prev_state == LOAD2) begin
            next_cache_hit = 1'b1;
          end
          else begin
            next_cache_hit = 1'b0;
          end

          next_state = IDLE;
          next_prev_state = IDLE;
          //if (prev_state != LOAD2 ) begin
          if (prev_state != LOAD2 & cache_hit == 1'b0) begin
            next_hit_count = hit_count + 1'b1;
          end
        end // hit in frame 2

        // else need to load block from memory
        else begin
          next_state = LOAD1;
          if (dcache[mem_addr.idx].frame_1.valid == 1'b1 & dcache[mem_addr.idx].frame_2.valid == 1'b1) begin
            next_evict = 1'b1;
          end
        end
      end // dmemWEN
       next_prev_addr = dcif.dmemaddr;
    end // IDLE

    LOAD1: begin
      ccif.dREN = 1'b1;
       ccif.daddr = {dcif.dmemaddr[31:3], 3'b000};
      if(ccif.dwait == 1'b1) begin
        next_state = LOAD1;
        next_prev_state = LOAD1;
      end
      else begin
        // check for eviction
        if(evict == 1'b1) begin
          // Check which frame to evict
          if(dcache[mem_addr.idx].lru == 1'b0) begin // frame 1 lru
            // check for dirty in frame 1
            if(dcache[mem_addr.idx].frame_1.dirty == 1'b1) begin
              next_state = WRITE1;
              next_prev_state = LOAD1;
            end
            else begin
              next_dcache[mem_addr.idx].frame_1.data[0] = ccif.dload;
              next_state = LOAD2;
              next_prev_state = LOAD1;
            end
          end // frame 1 lru

          else begin // frame 2 lru
            // check for dirty in frame 2
            if(dcache[mem_addr.idx].frame_2.dirty == 1'b1) begin
              next_state = WRITE1;
              next_prev_state = LOAD1;
            end
            else begin
              next_dcache[mem_addr.idx].frame_2.data[0] = ccif.dload;
              next_state = LOAD2;
              next_prev_state = LOAD1;
            end
          end // frame 2 lru
        end // evict

        // one of the frames at the index is empty
        else begin
          // check which frame to fill
          //if (dcache[mem_addr.idx].frame_1.valid == 1'b0) begin
          if (dcache[mem_addr.idx].lru == 1'b0) begin
            next_dcache[mem_addr.idx].frame_1.data[0] = ccif.dload;
          end
          else begin
            next_dcache[mem_addr.idx].frame_2.data[0] = ccif.dload;
          end
          next_state = LOAD2;
          next_prev_state = LOAD1;
        end // evict_else
      end // dwait_else
    end // LOAD1

    LOAD2: begin
      ccif.dREN = 1'b1;
      //ccif.daddr = dcif.dmemaddr + 32'd4;
       ccif.daddr = {dcif.dmemaddr[31:3], 3'b100};

      if(ccif.dwait == 1'b1) begin
        next_state = LOAD2;
        next_prev_state = LOAD2;
      end
      else begin
        // check for eviction
        if(evict == 1'b1) begin
          // Check which frame to evict
          if(dcache[mem_addr.idx].lru == 1'b0) begin // frame 1 is lru
            next_dcache[mem_addr.idx].frame_1.data[1] = ccif.dload;
            next_dcache[mem_addr.idx].frame_1.valid = 1'b1; // update valid
            next_dcache[mem_addr.idx].frame_1.tag = mem_addr.tag; // set tag
          end
          else begin
            next_dcache[mem_addr.idx].frame_2.data[1] = ccif.dload; // frame 2 is lru
            next_dcache[mem_addr.idx].frame_2.valid = 1'b1; // update valid
            next_dcache[mem_addr.idx].frame_2.tag = mem_addr.tag; // set tag
          end
          next_state = IDLE;
          next_prev_state = LOAD2;
          next_dcache[mem_addr.idx].lru = ~(dcache[mem_addr.idx].lru); // update lru to other frame
          next_evict = 1'b0; // set evict low now that load is done
        end // evict

        // one of the frames at the index is empty
        else begin
            // check which frame to fill
            //if (dcache[mem_addr.idx].frame_1.valid == 1'b0) begin
            if (dcache[mem_addr.idx].lru == 1'b0) begin
              next_dcache[mem_addr.idx].frame_1.data[1] = ccif.dload;
              next_dcache[mem_addr.idx].frame_1.valid = 1'b1; // update valid
              next_dcache[mem_addr.idx].frame_1.tag = mem_addr.tag; // set tag
              next_dcache[mem_addr.idx].lru = 1'b1; // update lru to other frame
            end
            else begin
              next_dcache[mem_addr.idx].frame_2.data[1] = ccif.dload;
              next_dcache[mem_addr.idx].frame_2.valid = 1'b1; // update valid
              next_dcache[mem_addr.idx].frame_2.tag = mem_addr.tag; // set tag
              next_dcache[mem_addr.idx].lru = 1'b0; // update lru to other frame
            end
            next_state = IDLE;
            next_prev_state = LOAD2;
        end // evict_else
      end // dwait_else
    end // LOAD2

    WRITE1: begin
      ccif.dWEN = 1'b1;
      if(ccif.dwait == 1'b1) begin
        next_state = WRITE1;
        next_prev_state = WRITE1;
      end
      //else begin
        // not flushing
        if(flush == 1'b0) begin
          // check which frame to write
          if(dcache[mem_addr.idx].lru == 1'b0) begin
            ccif.daddr = {dcache[mem_addr.idx].frame_1.tag, mem_addr.idx, 3'b000};
            ccif.dstore = dcache[mem_addr.idx].frame_1.data[0];
          end
          else begin
            ccif.daddr = {dcache[mem_addr.idx].frame_2.tag, mem_addr.idx, 3'b000};
            ccif.dstore = dcache[mem_addr.idx].frame_2.data[0];
          end
        end // not flushing

        else begin // flushing on halt
          ccif.daddr = {flush_frame.tag, flush_idx, 3'b000};
          ccif.dstore = flush_frame.data[0];
        end
        if(ccif.dwait == 1'b0) begin
          next_state = WRITE2;
          next_prev_state = WRITE1;
        end
      //end // dwait else
    end // WRITE1

    WRITE2: begin
      ccif.dWEN = 1'b1;

      if(ccif.dwait == 1'b1) begin
        next_state = WRITE2;
        next_prev_state = WRITE2;
      end

      //else begin
        if(flush == 1'b0) begin
          // check which frame to write
          if(dcache[mem_addr.idx].lru == 1'b0) begin
            ccif.daddr = {dcache[mem_addr.idx].frame_1.tag, mem_addr.idx, 3'b100};
            ccif.dstore = dcache[mem_addr.idx].frame_1.data[1];
            next_dcache[mem_addr.idx].frame_1.dirty = 1'b0; // data is no longer dirty
          end
          else begin
            ccif.daddr = {dcache[mem_addr.idx].frame_2.tag, mem_addr.idx, 3'b100};
            ccif.dstore = dcache[mem_addr.idx].frame_2.data[1];
            next_dcache[mem_addr.idx].frame_2.dirty = 1'b0; // data is no longer dirty
          end
          if(ccif.dwait == 1'b0) begin
            next_state = LOAD1;
            next_prev_state = WRITE1;
          end
        end // not flushing

        else begin // flushing on halt
          ccif.daddr = {flush_frame.tag, flush_idx, 3'b100};
          ccif.dstore = flush_frame.data[1];
          if(flush_idx != 3'b111) begin
            if(ccif.dwait == 1'b0) begin
              next_state = FLUSH;
              next_prev_state = WRITE1;
            end
          end
          else begin
            if(ccif.dwait == 1'b0) begin
              next_state = WRITE_HIT_CNT;
              next_prev_state = WRITE1;
            end
          end
        end // flushing
      //end // else dwait
    end // WRITE2

    FLUSH: begin
      if(dcache[flush_idx].frame_1.dirty == 1'b1) begin
        next_flush_frame = dcache[flush_idx].frame_1;
        next_dcache[flush_idx].frame_1.dirty = 1'b0;
        //next_flush_idx = flush_idx;
        next_state = WRITE1;
        next_prev_state = FLUSH;
      end
      else if(dcache[flush_idx].frame_2.dirty == 1'b1) begin
        next_flush_frame = dcache[flush_idx].frame_2;
        next_dcache[flush_idx].frame_2.dirty = 1'b0;
        //next_flush_idx = flush_idx;
        next_state = WRITE1;
        next_prev_state = FLUSH;
      end
      else if(flush_idx == 3'b111) begin
        next_state = WRITE_HIT_CNT;
        next_prev_state = FLUSH;
      end
      else begin
        next_flush_idx = flush_idx + 3'd1;
        next_state = FLUSH;
        next_prev_state = FLUSH;
      end
    end // FLUSH

    WRITE_HIT_CNT: begin
      // write hit count to address 0x3100
      ccif.dWEN = 1'b1;
      if(ccif.dwait == 1'b1) begin
        next_state = WRITE_HIT_CNT;
        next_prev_state = WRITE_HIT_CNT;
      end
      else begin
        next_state = HALT;
      end
      ccif.daddr = 32'h3100;
      ccif.dstore = hit_count;
      //dcif.flushed = 1'b1;
    end

    HALT: begin
      dcif.flushed = 1'b1;
    end

  endcase // endcase

end // always_comb
endmodule
