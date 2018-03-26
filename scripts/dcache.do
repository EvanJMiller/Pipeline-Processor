onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dcache_tb/CLK
add wave -noupdate /dcache_tb/nRST
add wave -noupdate -group Caches_If /dcache_tb/cif0/dwait
add wave -noupdate -group Caches_If /dcache_tb/cif0/dREN
add wave -noupdate -group Caches_If /dcache_tb/cif0/dWEN
add wave -noupdate -group Caches_If /dcache_tb/cif0/dload
add wave -noupdate -group Caches_If /dcache_tb/cif0/dstore
add wave -noupdate -group Caches_If /dcache_tb/cif0/daddr
add wave -noupdate -expand -group Datapath_Cache_If /dcache_tb/dcif/halt
add wave -noupdate -expand -group Datapath_Cache_If /dcache_tb/dcif/dhit
add wave -noupdate -expand -group Datapath_Cache_If /dcache_tb/dcif/dmemREN
add wave -noupdate -expand -group Datapath_Cache_If /dcache_tb/PROG/dcif/dmemWEN
add wave -noupdate -expand -group Datapath_Cache_If {/dcache_tb/DC/dcache[0].frame_1.data}
add wave -noupdate -expand -group Datapath_Cache_If /dcache_tb/dcif/flushed
add wave -noupdate -expand -group Datapath_Cache_If /dcache_tb/dcif/dmemload
add wave -noupdate -expand -group Datapath_Cache_If /dcache_tb/dcif/dmemstore
add wave -noupdate -expand -group Datapath_Cache_If /dcache_tb/dcif/dmemaddr
add wave -noupdate /dcache_tb/DC/mem_addr
add wave -noupdate -group Evict /dcache_tb/DC/evict
add wave -noupdate -group Evict /dcache_tb/DC/next_evict
add wave -noupdate -group Flush /dcache_tb/DC/flush
add wave -noupdate -group Flush /dcache_tb/DC/next_flush
add wave -noupdate -group Flush /dcache_tb/DC/flush_idx
add wave -noupdate -group Flush /dcache_tb/DC/next_flush_idx
add wave -noupdate -group Flush /dcache_tb/DC/flush_frame
add wave -noupdate -group Flush /dcache_tb/DC/next_flush_frame
add wave -noupdate -expand -group State /dcache_tb/DC/state
add wave -noupdate -expand -group State /dcache_tb/DC/next_state
add wave -noupdate -expand -group State /dcache_tb/DC/prev_state
add wave -noupdate -expand -group Hit /dcache_tb/DC/cache_hit
add wave -noupdate -expand -group Hit /dcache_tb/DC/hit_count
add wave -noupdate -expand -group Hit /dcache_tb/DC/next_hit_count
add wave -noupdate -group {RAM If} /dcache_tb/ramif/ramREN
add wave -noupdate -group {RAM If} /dcache_tb/ramif/ramWEN
add wave -noupdate -group {RAM If} /dcache_tb/ramif/ramaddr
add wave -noupdate -group {RAM If} /dcache_tb/ramif/ramstore
add wave -noupdate -group {RAM If} /dcache_tb/ramif/ramload
add wave -noupdate -group {RAM If} /dcache_tb/ramif/ramstate
add wave -noupdate -group {RAM If} /dcache_tb/ramif/memREN
add wave -noupdate -group {RAM If} /dcache_tb/ramif/memWEN
add wave -noupdate -group {RAM If} /dcache_tb/ramif/memaddr
add wave -noupdate -group {RAM If} /dcache_tb/ramif/memstore
add wave -noupdate -expand -group Caches -expand -subitemconfig {{/dcache_tb/DC/dcache[0]} -expand {/dcache_tb/DC/dcache[0].frame_1} -expand} /dcache_tb/DC/dcache
add wave -noupdate -expand -group Caches /dcache_tb/DC/next_dcache
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1141607 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {1023100 ps} {1225100 ps}
