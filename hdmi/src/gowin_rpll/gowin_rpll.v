//Copyright (C)2014-2021 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.8
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9C
//Created Time: Fri Nov 12 14:05:41 2021

module Gowin_rPLL (clkout, lock, clkin);

output clkout;
output lock;
input clkin;

wire clkoutp_o;
wire clkoutd_o;
wire clkoutd3_o;
wire gw_gnd;

assign gw_gnd = 1'b0;

rPLL rpll_inst (
    .CLKOUT(clkout),
    .LOCK(lock),
    .CLKOUTP(clkoutp_o),
    .CLKOUTD(clkoutd_o),
    .CLKOUTD3(clkoutd3_o),
    .RESET(gw_gnd),
    .RESET_P(gw_gnd),
    .CLKIN(clkin),
    .CLKFB(gw_gnd),
    .FBDSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .IDSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .ODSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .PSDA({gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .DUTYDA({gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FDLY({gw_gnd,gw_gnd,gw_gnd,gw_gnd})
);

defparam rpll_inst.FCLKIN = "27";
defparam rpll_inst.DYN_IDIV_SEL = "false";
defparam rpll_inst.DYN_FBDIV_SEL = "false";
defparam rpll_inst.DYN_ODIV_SEL = "false";
defparam rpll_inst.PSDA_SEL = "0000";
defparam rpll_inst.DYN_DA_EN = "true";
defparam rpll_inst.DUTYDA_SEL = "1000";
defparam rpll_inst.CLKOUT_FT_DIR = 1'b1;
defparam rpll_inst.CLKOUTP_FT_DIR = 1'b1;
defparam rpll_inst.CLKOUT_DLY_STEP = 0;
defparam rpll_inst.CLKOUTP_DLY_STEP = 0;
defparam rpll_inst.CLKFB_SEL = "internal";
defparam rpll_inst.CLKOUT_BYPASS = "false";
defparam rpll_inst.CLKOUTP_BYPASS = "false";
defparam rpll_inst.CLKOUTD_BYPASS = "false";
defparam rpll_inst.DYN_SDIV_SEL = 2;
defparam rpll_inst.CLKOUTD_SRC = "CLKOUT";
defparam rpll_inst.CLKOUTD3_SRC = "CLKOUT";
defparam rpll_inst.DEVICE = "GW1NR-9C";

// 480p
//defparam rpll_inst.IDIV_SEL = 2;
//defparam rpll_inst.FBDIV_SEL = 13;
//defparam rpll_inst.ODIV_SEL = 4;

// 720p "1280x720D" 74.25*5=371.25Mhz
//defparam rpll_inst.IDIV_SEL = 3;
//defparam rpll_inst.FBDIV_SEL = 54;
//defparam rpll_inst.ODIV_SEL = 2;

// NeXT "1120x832v2" CVT-RBv2 61.632*5=308.160Mhz 2%tol (307.8Mhz) identified as 1152x864 (XGA+ 4:3)
//defparam rpll_inst.IDIV_SEL = 4;
//defparam rpll_inst.FBDIV_SEL = 56;
//defparam rpll_inst.ODIV_SEL = 2;

// Fail // 1080p "1920x1080R" CVT-RB 138.5*5=692.5Mhz 2%tol 688.5Mhz
//defparam rpll_inst.IDIV_SEL = 1;
//defparam rpll_inst.FBDIV_SEL = 50;
//defparam rpll_inst.ODIV_SEL = 2;

// Fail // 1080p "1920x1080R2" CVT-RBv2 133.32*5=666.6Mhz 2%tol 661.6Mhz
//defparam rpll_inst.IDIV_SEL = 1;
//defparam rpll_inst.FBDIV_SEL = 48;
//defparam rpll_inst.ODIV_SEL = 2;

// Fail // 1080p "1920x1080@54R2" 54Hz CVT-RBv2 119.664*5=598.32Mhz 2%tol 594Mhz
//defparam rpll_inst.IDIV_SEL = 0;
//defparam rpll_inst.FBDIV_SEL = 21;
//defparam rpll_inst.ODIV_SEL = 2;

// Fail // 1080p "1920x1080x54R2" 52Hz CVT-RBv2 115.128*5=575.64Mhz 576Mhz 0.2%tol
//defparam rpll_inst.IDIV_SEL = 2;
//defparam rpll_inst.FBDIV_SEL = 63;
//defparam rpll_inst.ODIV_SEL = 2;

// 1080p "1920x1080x30R2" 30Hz CVT-RBv2 65.76*5=328.8Mhz 329.4Mhz 0.2%tol
defparam rpll_inst.IDIV_SEL = 4;
defparam rpll_inst.FBDIV_SEL = 60;
defparam rpll_inst.ODIV_SEL = 2;

// Fail // 1080p "1920x1080x50R2" 50Hz CVT-RBv2 110.599*5=552.995Mhz 553.5Mhz 0.2%tol 
//defparam rpll_inst.IDIV_SEL = 1;
//defparam rpll_inst.FBDIV_SEL = 40;
//defparam rpll_inst.ODIV_SEL = 2;

// Fail // 4k "3840x2160x13R2" 13Hz CVT-RBv2 110.837*5=554.185Mhz 553.5 0.2%tol
//defparam rpll_inst.FBDIV_SEL = 40;
//defparam rpll_inst.IDIV_SEL = 1;
//defparam rpll_inst.ODIV_SEL = 2;

// 1440p "2560x1440x30R2" 30.1Hz 116.096*5=580.48 580.5Mhz
//defparam rpll_inst.IDIV_SEL = 1;
//defparam rpll_inst.FBDIV_SEL = 42;
//defparam rpll_inst.ODIV_SEL = 2;

endmodule //Gowin_rPLL
