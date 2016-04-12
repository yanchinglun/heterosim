onerr {resume}
add list -bin /test_bench/clk
add list -bin /test_bench/DUT/the_uart_0/chipselect
add list -hex /test_bench/DUT/the_uart_0/address
add list -hex /test_bench/DUT/the_uart_0/writedata
add list -hex /test_bench/DUT/the_uart_0/readdata
add list -bin /test_bench/DUT/the_uart_0/tx_ready
add list -asc /test_bench/DUT/the_uart_0/tx_data
add list -bin /test_bench/DUT/the_uart_0/rx_char_ready
add list -asc /test_bench/DUT/the_uart_0/rx_data
add list -hex /test_bench/DUT/the_ddr2/pll_ref_clk
add list -hex /test_bench/DUT/the_ddr2/mem_cke
add list -hex /test_bench/DUT/the_ddr2/soft_reset_n
add list -hex /test_bench/DUT/the_ddr2/global_reset_n
add list -hex /test_bench/DUT/the_ddr2/reset_phy_clk_n
add list -hex /test_bench/DUT/the_ddr2/reset_request_n
add list -hex /test_bench/DUT/the_ddr2/phy_clk
add list -hex /test_bench/DUT/the_ddr2/local_address
add list -hex /test_bench/DUT/the_ddr2/local_size
add list -hex /test_bench/DUT/the_ddr2/local_burstbegin
add list -hex /test_bench/DUT/the_ddr2/local_read_req
add list -hex /test_bench/DUT/the_ddr2/local_write_req
add list -hex /test_bench/DUT/the_ddr2/local_ready
add list -hex /test_bench/DUT/the_ddr2/local_wdata
add list -hex /test_bench/DUT/the_ddr2/local_be
add list -hex /test_bench/DUT/the_ddr2/local_rdata_valid
add list -hex /test_bench/DUT/the_ddr2/local_rdata
add list -hex /test_bench/DUT/the_ddr2/mem_clk
add list -hex /test_bench/DUT/the_ddr2/mem_cs_n
add list -hex /test_bench/DUT/the_ddr2/mem_addr
add list -hex /test_bench/DUT/the_ddr2/mem_ba
add list -hex /test_bench/DUT/the_ddr2/mem_ras_n
add list -hex /test_bench/DUT/the_ddr2/mem_cas_n
add list -hex /test_bench/DUT/the_ddr2/mem_we_n
add list -hex /test_bench/DUT/the_ddr2/mem_dm
add list -hex /test_bench/DUT/the_ddr2/mem_dq
add list -hex /test_bench/DUT/the_ddr2/mem_dqs
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -delta none
configure list -usegating 1
configure list -gateexpr { /test_bench/clk'rising }