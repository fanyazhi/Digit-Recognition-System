module xillyvga  #(
		  parameter C_S_AXI_DATA_WIDTH = 32,
		  parameter C_S_AXI_ADDR_WIDTH = 32,
		  parameter C_M_AXI_ADDR_WIDTH = 32,
		  parameter C_M_AXI_DATA_WIDTH = 32,
		  parameter C_S_AXI_MIN_SIZE = 32'h000001ff,
		  parameter C_USE_WSTRB = 1,
		  parameter C_DPHASE_TIMEOUT = 8,
		  parameter C_BASEADDR = 32'h79c00000,
		  parameter C_HIGHADDR = 32'h79c0ffff,
		  parameter C_SLV_AWIDTH = 32,
		  parameter C_SLV_DWIDTH = 32,
		  parameter C_MAX_BURST_LEN = 256,
		  parameter C_NATIVE_DATA_WIDTH = 32
		  )
  (
  input  S_AXI_ACLK,
  input [31:0] S_AXI_ARADDR,
  input  S_AXI_ARESETN,
  input  S_AXI_ARVALID,
  input [31:0] S_AXI_AWADDR,
  input  S_AXI_AWVALID,
  input  S_AXI_BREADY,
  input  S_AXI_RREADY,
  input [31:0] S_AXI_WDATA,
  input [3:0] S_AXI_WSTRB,
  input  S_AXI_WVALID,
  input  clk_in,
  input  m_axi_aclk,
  input  m_axi_aresetn,
  input  m_axi_arready,
  input  m_axi_awready,
  input [1:0] m_axi_bresp,
  input  m_axi_bvalid,
  input [31:0] m_axi_rdata,
  input  m_axi_rlast,
  input [1:0] m_axi_rresp,
  input  m_axi_rvalid,
  input  m_axi_wready,
  output  S_AXI_ARREADY,
  output  S_AXI_AWREADY,
  output [1:0] S_AXI_BRESP,
  output  S_AXI_BVALID,
  output [31:0] S_AXI_RDATA,
  output [1:0] S_AXI_RRESP,
  output  S_AXI_RVALID,
  output  S_AXI_WREADY,
  output [31:0] m_axi_araddr,
  output [1:0] m_axi_arburst,
  output [3:0] m_axi_arcache,
  output [3:0] m_axi_arlen,
  output [2:0] m_axi_arprot,
  output [2:0] m_axi_arsize,
  output  m_axi_arvalid,
  output [31:0] m_axi_awaddr,
  output [1:0] m_axi_awburst,
  output [3:0] m_axi_awcache,
  output [3:0] m_axi_awlen,
  output [2:0] m_axi_awprot,
  output [2:0] m_axi_awsize,
  output  m_axi_awvalid,
  output  m_axi_bready,
  output  m_axi_rready,
  output [31:0] m_axi_wdata,
  output  m_axi_wlast,
  output [3:0] m_axi_wstrb,
  output  m_axi_wvalid,
  output vga_clk,
  output [7:0] vga_blue,
  output [7:0] vga_green,
  output  vga_hsync,
  output [7:0] vga_red,
  output  vga_vsync,
  output  vga_de
  );


  xillyvga_core xillyvga_core_ins (
    .S_AXI_ACLK(S_AXI_ACLK),
    .S_AXI_ARADDR(S_AXI_ARADDR),
    .S_AXI_ARESETN(S_AXI_ARESETN),
    .S_AXI_ARVALID(S_AXI_ARVALID),
    .S_AXI_AWADDR(S_AXI_AWADDR),
    .S_AXI_AWVALID(S_AXI_AWVALID),
    .S_AXI_BREADY(S_AXI_BREADY),
    .S_AXI_RREADY(S_AXI_RREADY),
    .S_AXI_WDATA(S_AXI_WDATA),
    .S_AXI_WSTRB(S_AXI_WSTRB),
    .S_AXI_WVALID(S_AXI_WVALID),
    .clk_in(clk_in),
    .m_axi_aclk(m_axi_aclk),
    .m_axi_aresetn(m_axi_aresetn),
    .m_axi_arready(m_axi_arready),
    .m_axi_awready(m_axi_awready),
    .m_axi_bresp(m_axi_bresp),
    .m_axi_bvalid(m_axi_bvalid),
    .m_axi_rdata(m_axi_rdata),
    .m_axi_rlast(m_axi_rlast),
    .m_axi_rresp(m_axi_rresp),
    .m_axi_rvalid(m_axi_rvalid),
    .m_axi_wready(m_axi_wready),
    .S_AXI_ARREADY(S_AXI_ARREADY),
    .S_AXI_AWREADY(S_AXI_AWREADY),
    .S_AXI_BRESP(S_AXI_BRESP),
    .S_AXI_BVALID(S_AXI_BVALID),
    .S_AXI_RDATA(S_AXI_RDATA),
    .S_AXI_RRESP(S_AXI_RRESP),
    .S_AXI_RVALID(S_AXI_RVALID),
    .S_AXI_WREADY(S_AXI_WREADY),
    .m_axi_araddr(m_axi_araddr),
    .m_axi_arburst(m_axi_arburst),
    .m_axi_arcache(m_axi_arcache),
    .m_axi_arlen(m_axi_arlen),
    .m_axi_arprot(m_axi_arprot),
    .m_axi_arsize(m_axi_arsize),
    .m_axi_arvalid(m_axi_arvalid),
    .m_axi_awaddr(m_axi_awaddr),
    .m_axi_awburst(m_axi_awburst),
    .m_axi_awcache(m_axi_awcache),
    .m_axi_awlen(m_axi_awlen),
    .m_axi_awprot(m_axi_awprot),
    .m_axi_awsize(m_axi_awsize),
    .m_axi_awvalid(m_axi_awvalid),
    .m_axi_bready(m_axi_bready),
    .m_axi_rready(m_axi_rready),
    .m_axi_wdata(m_axi_wdata),
    .m_axi_wlast(m_axi_wlast),
    .m_axi_wstrb(m_axi_wstrb),
    .m_axi_wvalid(m_axi_wvalid),
    .vga_clk(vga_clk),
    .vga_blue(vga_blue),
    .vga_green(vga_green),
    .vga_hsync(vga_hsync),
    .vga_red(vga_red),
    .vga_vsync(vga_vsync),
    .vga_de(vga_de)
  );
endmodule
