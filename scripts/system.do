onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Datapath IF}
add wave -noupdate -expand -group {Datapath IF} /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -expand -group {Datapath IF} /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -expand -group {Datapath IF} /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -expand -group {Datapath IF} -radix unsigned /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -expand -group {Datapath IF} /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -expand -group {Datapath IF} /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -expand -group {Datapath IF} /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate -expand -group {Datapath IF} /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -expand -group {Datapath IF} /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -expand -group {Datapath IF} /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -divider {Register File IF}
add wave -noupdate -expand -group {Register File IF} /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate -expand -group {Register File IF} -radix unsigned /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate -expand -group {Register File IF} /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate -expand -group {Register File IF} /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate -expand -group {Register File IF} /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate -expand -group {Register File IF} /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate -expand -group {Register File IF} /system_tb/DUT/CPU/DP/rfif/rdat2
add wave -noupdate -divider {ALU IF}
add wave -noupdate -group {ALU IF} /system_tb/DUT/CPU/DP/aluif/negative
add wave -noupdate -group {ALU IF} /system_tb/DUT/CPU/DP/aluif/overflow
add wave -noupdate -group {ALU IF} /system_tb/DUT/CPU/DP/aluif/zero
add wave -noupdate -group {ALU IF} /system_tb/DUT/CPU/DP/aluif/porta
add wave -noupdate -group {ALU IF} /system_tb/DUT/CPU/DP/aluif/portb
add wave -noupdate -group {ALU IF} /system_tb/DUT/CPU/DP/aluif/out
add wave -noupdate -group {ALU IF} /system_tb/DUT/CPU/DP/aluif/ALUOP
add wave -noupdate -divider {Control Unit IF}
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/func
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/ALUOp
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/ExtOp
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/MemtoReg
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/PCSrc
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/RegDst
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/RegWr
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/ALUSrc
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/MemRd
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/MemWr
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/shift
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/jal
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/branch
add wave -noupdate -group {Control Unit IF} /system_tb/DUT/CPU/DP/ctrluif/halt
add wave -noupdate -divider {Fetch Register IF}
add wave -noupdate -expand -group {Fetch Reg IF} /system_tb/DUT/CPU/DP/frif/fetch_imemload
add wave -noupdate -expand -group {Fetch Reg IF} /system_tb/DUT/CPU/DP/frif/decode_imemload
add wave -noupdate -expand -group {Fetch Reg IF} -radix decimal /system_tb/DUT/CPU/DP/frif/fetch_pc_4
add wave -noupdate -expand -group {Fetch Reg IF} /system_tb/DUT/CPU/DP/frif/decode_pc_4
add wave -noupdate -divider {Decode Register IF}
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_rdat1
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_rdat2
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_ex_out
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_pc_4
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_jump_addr
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_shamt
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_rt
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_rd
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_ALUOp
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_jal
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_RegDst
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_shift
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_ALUSrc
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_MemWr
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_MemRd
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_branch
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_PCSrc
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_halt
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_RegWr
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/decode_MemtoReg
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_rdat1
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_rdat2
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_ex_out
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_pc_4
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_jump_addr
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_shamt
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_rt
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_rd
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_ALUOp
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_jal
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_RegDst
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_shift
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_ALUSrc
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_MemWr
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_MemRd
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_branch
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_PCSrc
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_halt
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_RegWr
add wave -noupdate -group {Decode Reg} /system_tb/DUT/CPU/DP/drif/exe_MemtoReg
add wave -noupdate -divider {Execute Register}
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_jump_addr
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_pc_4
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_branch_addr
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_rdat1
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_ex_out
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_alu_out
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_rdat2
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_wsel
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_MemWr
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_MemRd
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_branch
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_zero
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_PCSrc
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_halt
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_RegWr
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/exe_MemtoReg
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_jump_addr
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_pc_4
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_branch_addr
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_rdat1
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_ex_out
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_alu_out
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_rdat2
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_wsel
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_MemWr
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_MemRd
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_branch
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_zero
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_PCSrc
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_halt
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_RegWr
add wave -noupdate -group {Execute Reg} /system_tb/DUT/CPU/DP/erif/mem_MemtoReg
add wave -noupdate -divider {Memory Register}
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/mem_pc_4
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/mem_dmemload
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/mem_ex_out
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/mem_alu_out
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/mem_wsel
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/mem_halt
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/mem_RegWr
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/mem_MemtoReg
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/wrb_pc_4
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/wrb_dmemload
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/wrb_ex_out
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/wrb_alu_out
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/wrb_wsel
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/wrb_halt
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/wrb_RegWr
add wave -noupdate -group {Memory Reg} /system_tb/DUT/CPU/DP/mrif/wrb_MemtoReg
add wave -noupdate -divider {Datapath Local}
add wave -noupdate -expand -group {Datapath Local} /system_tb/DUT/CPU/DP/CLK
add wave -noupdate -expand -group {Datapath Local} /system_tb/DUT/CPU/DP/nRST
add wave -noupdate -expand -group {Datapath Local} -radix decimal /system_tb/DUT/CPU/DP/pc
add wave -noupdate -expand -group {Datapath Local} /system_tb/DUT/CPU/DP/npc
add wave -noupdate -expand -group {Datapath Local} /system_tb/DUT/CPU/DP/pc_4
add wave -noupdate -expand -group {Datapath Local} /system_tb/DUT/CPU/DP/pc_jump
add wave -noupdate -expand -group {Datapath Local} -radix decimal /system_tb/DUT/CPU/DP/pc_branch
add wave -noupdate -expand -group {Datapath Local} /system_tb/DUT/CPU/DP/pc_register
add wave -noupdate -expand -group {Datapath Local} /system_tb/DUT/CPU/DP/ext_out
add wave -noupdate -divider {Memory Control}
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/iwait
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/dwait
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/iREN
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/dREN
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/dWEN
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/iload
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/dload
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/dstore
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/iaddr
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/daddr
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/ramWEN
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/ramREN
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/ramstate
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/ramaddr
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/ramstore
add wave -noupdate -group {Memory Control} /system_tb/DUT/CPU/CC/ccif/ramload
add wave -noupdate -divider {Hazard Unit}
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/fetch_EN
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/decode_EN
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/exe_EN
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/mem_EN
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/fetch_NOP
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/decode_NOP
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/exe_NOP
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/mem_NOP
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/ihit
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/dhit
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/MemRd
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/MemWr
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/PCWE
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/PCSrc
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/rs
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/rt
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/exe_wsel
add wave -noupdate -expand -group {Hazard Unit} /system_tb/DUT/CPU/DP/hzif/mem_wsel
add wave -noupdate -divider {Pipeline Registers EN}
add wave -noupdate -group {Pipeline Reg EN} /system_tb/DUT/CPU/DP/fetch_EN
add wave -noupdate -group {Pipeline Reg EN} /system_tb/DUT/CPU/DP/decode_EN
add wave -noupdate -group {Pipeline Reg EN} /system_tb/DUT/CPU/DP/exe_EN
add wave -noupdate -group {Pipeline Reg EN} /system_tb/DUT/CPU/DP/mem_EN
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FWD/fuif/ex_rsel1
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FWD/fuif/ex_rsel2
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FWD/fuif/ex_rdat1
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FWD/fuif/ex_rdat2
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FWD/fuif/mem_wsel
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FWD/fuif/mem_dat
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FWD/fuif/wb_wsel
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FWD/fuif/wb_dat
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FWD/fuif/mem_wen
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FWD/fuif/wb_wen
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FWD/fuif/memToReg
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FWD/fuif/rdat1_out
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FWD/fuif/rdat2_out
add wave -noupdate -group dcache -expand -subitemconfig {{/system_tb/DUT/CPU/CM/DCACHE/dcache[0]} -expand} /system_tb/DUT/CPU/CM/DCACHE/dcache
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/next_dcache
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/mem_addr.tag
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/mem_addr
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/evict
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/next_evict
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/flush
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/next_flush
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/flush_idx
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/next_flush_idx
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/flush_frame
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/next_flush_frame
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/state
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/next_state
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/prev_state
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/next_prev_state
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/cache_hit
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/next_cache_hit
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/hit_count
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM/DCACHE/next_hit_count
add wave -noupdate /system_tb/DUT/CPU/CM/DCACHE/prev_addr
add wave -noupdate -expand -group icache -expand -subitemconfig {{/system_tb/DUT/CPU/CM/ICACHE/i_cache[6]} -expand} /system_tb/DUT/CPU/CM/ICACHE/i_cache
add wave -noupdate -expand -group icache /system_tb/DUT/CPU/CM/ICACHE/next_i_cache
add wave -noupdate -expand -group icache /system_tb/DUT/CPU/CM/ICACHE/state
add wave -noupdate -expand -group icache /system_tb/DUT/CPU/CM/ICACHE/next_state
add wave -noupdate -expand -group icache /system_tb/DUT/CPU/CM/ICACHE/cache_hit
add wave -noupdate -expand -group icache /system_tb/DUT/CPU/CM/ICACHE/ram_hit
add wave -noupdate -expand -group icache -expand /system_tb/DUT/CPU/CM/ICACHE/mem_addr
add wave -noupdate -radix decimal /system_tb/DUT/CPU/CM/ICACHE/addr
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ccwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ccinv
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ccwrite
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/cctrans
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ccsnoopaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ccwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ccinv
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ccwrite
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/cctrans
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ccsnoopaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iwait
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate /system_tb/DUT/CPU/DP/ctrluif/op
add wave -noupdate -label {drif op code} /system_tb/DUT/CPU/DP/drif/op_out
add wave -noupdate -label {erif op code} /system_tb/DUT/CPU/DP/erif/op_out
add wave -noupdate -label {mrif op code} /system_tb/DUT/CPU/DP/mrif/op_out
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/dhit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {817178 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 207
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {472998 ps} {1260552 ps}
