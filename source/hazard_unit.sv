// interface
`include "hazard_unit_if.vh"
`include "cpu_types_pkg.vh"

// import types
import cpu_types_pkg::*;

module hazard_unit(
  hazard_unit_if.hazard hzif
);

//logic load_if, hazard_if;

always_comb begin
    // default values
    hzif.fetch_EN   = 1'b0;
    hzif.decode_EN  = 1'b0;
    hzif.exe_EN     = 1'b0;
    hzif.mem_EN     = 1'b0;
    hzif.fetch_NOP  = 1'b0;
    hzif.decode_NOP = 1'b0;
    hzif.exe_NOP    = 1'b0;
    hzif.mem_NOP    = 1'b0;
    hzif.PCWE       = 1'b1;

  if (hzif.PCSrc > 2'b00) begin
     hzif.decode_NOP = 1;
     hzif.fetch_NOP = 1;
     hzif.exe_NOP = 1;
     hzif.fetch_EN   = 1'b1;
     hzif.decode_EN  = 1'b1;
     hzif.exe_EN     = 1'b1;
     hzif.mem_EN     = 1'b1;
  end
  // if a read or write is occuring, stall latches
  else if (hzif.MemRd | hzif.MemWr) begin
    // if a dhit occurs, the write or read has completed, unstall latches
    if (hzif.dhit) begin
      hzif.fetch_EN  = 1'b1;
      hzif.decode_EN = 1'b1;
      hzif.exe_EN    = 1'b1;
      hzif.mem_EN    = 1'b1;
    end
  end
  // if a read after write hazard is occuring, stall PC, fetch, and decode latches, insert nop into decode latch
  else if (((hzif.exe_wsel == hzif.rs) | (hzif.exe_wsel == hzif.rt)) & (hzif.rs != 5'd0)) begin
    hzif.PCWE       = 1'b0;
    hzif.exe_EN     = 1'b1;
    hzif.mem_EN     = 1'b1;
    hzif.decode_NOP = 1'b1;
  end
  else if (((hzif.mem_wsel == hzif.rs) | (hzif.mem_wsel == hzif.rt)) & (hzif.rs != 5'd0)) begin
    hzif.PCWE       = 1'b0;
    hzif.exe_EN     = 1'b1;
    hzif.mem_EN     = 1'b1;
    hzif.decode_NOP = 1'b1;
  end
  // if a jump or branch is occuring, flush fetch, decode, and execute latches

  // else not waiting on memory or hazard, all latches enabled
  else if(hzif.ihit == 1'b1) begin
    hzif.fetch_EN  = 1'b1;
    hzif.decode_EN = 1'b1;
    hzif.exe_EN    = 1'b1;
    hzif.mem_EN    = 1'b1;
  end


// OLD CODE
  /*
  if(hzif.ihit | (~(hzif.MemRd | hzif.MemWr) | hzif.dhit )) begin
    hzif.fetch_EN  = 1'b1;
    hzif.decode_EN = 1'b1;
    hzif.exe_EN    = 1'b1;
    hzif.mem_EN    = 1'b1;
  end
  else begin
    hzif.mem_EN = 1'b1;
  end
  */

  /*
  if (hzif.dhit) begin
    hzif.fetch_EN  = 1'b1;
    hzif.decode_EN = 1'b1;
    hzif.exe_EN    = 1'b1;
    hzif.mem_EN    = 1'b1;
  end
  else if (hzif.MemWr | hzif.MemRd) begin
    hzif.fetch_EN = 1'b0;
    hzif.decode_EN = 1'b0;
    hzif.exe_EN = 1'b0;
  end
  //else if ((hzif.exe_wsel == hzif.rs) || (hzif.exe_wsel == hzif.rt)) begin
  else if ((hzif.exe_wsel[4:0] == hzif.rs[4:0]) & (hzif.exe_wsel != 32'b0)) begin
    hzif.PCWE       = 1'b0;
    hzif.decode_NOP = 1'b1;
    hzif.exe_EN     = 1'b1;
    hzif.mem_EN     = 1'b1;
    hazard_if = 1'b1;
  end
  else if (hzif.ihit) begin
    hzif.fetch_EN  = 1'b1;
    hzif.decode_EN = 1'b1;
    hzif.exe_EN    = 1'b1;
    hzif.mem_EN    = 1'b1;
  end
  */
end // always_comb

endmodule
