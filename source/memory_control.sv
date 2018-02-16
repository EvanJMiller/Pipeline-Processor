/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 1;

  // aissign cache outputs
  assign ccif.iload = (ccif.iREN == 1'b1 & ccif.iwait == 1'b0) ? ccif.ramload : 32'd0;
  assign ccif.dload = ccif.ramload;

  // assign ram outputs
  assign ccif.ramstore = ccif.dstore;
  assign ccif.ramaddr  = ((ccif.dREN == 1'b1) || (ccif.dWEN == 1'b1)) ? ccif.daddr : ccif.iaddr;
  assign ccif.ramWEN   = ccif.dWEN;
  assign ccif.ramREN   = ((ccif.dREN == 1'b1 || ccif.iREN == 1'b1) && ccif.dWEN == 1'b0) ? 1'b1 : 1'b0;

  // wait signal logic
  always_comb begin
    if (ccif.ramstate == ACCESS) begin
      if (ccif.iREN == 1 && ccif.dWEN == 1'b0 && ccif.dREN == 1'b0) begin
        ccif.iwait = 1'b0;
      end else begin
        ccif.iwait = 1'b1;
      end
    end else begin
      ccif.iwait = 1'b1;
    end

    if (ccif.ramstate == ACCESS) begin
      if (ccif.dREN == 1'b1) begin
        ccif.dwait = 1'b0;
      end else begin
        if (ccif.dWEN == 1'b1) begin
          ccif.dwait = 1'b0;
        end else begin
          ccif.dwait = 1'b1;
        end
      end
    end else begin
      ccif.dwait = 1'b1;
    end
  end // always_comb
endmodule
