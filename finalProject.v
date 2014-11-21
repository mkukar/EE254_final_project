`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:34:45 11/10/2014 
// Design Name: 
// Module Name:    helicopter_game 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module helicopter_game(ClkPort, btnC, vga_h_sync, vga_v_sync, vga_r, vga_g, vga_b, vgaRed1, vgaRed2, vgaGreen1, vgaGreen2, vgaBlue2
    );

//inputs

input ClkPort;
input btnC;

//output

output vga_h_sync, vga_v_sync, vga_r, vga_g, vga_b, vgaRed1, vgaRed2, vgaGreen1, vgaGreen2, vgaBlue2;

//localparam

wire ClkPort, reset, vga_clk, inDisplayArea;
wire [9:0] CounterX;
wire [9:0] CounterY;

reg [26:0] div_clk;
reg vga_r, vga_g, vga_b,vgaRed1, vgaRed2,vgaGreen1, vgaGreen2, vgaBlue2;




assign reset = btnC;


always @ (posedge ClkPort, posedge reset)
	begin
		if (reset)
			div_clk <= 0;
		else
			div_clk <= div_clk + 1'b1;
	end
assign vga_clk = div_clk[1];

hvsync_generator videoout(
.clk(vga_clk), 
.reset(reset), 
.vga_h_sync(vga_h_sync),
.vga_v_sync(vga_v_sync),
.inDisplayArea(inDisplayArea),
.CounterX(CounterX),
.CounterY(CounterY)
);

always @ (posedge vga_clk)
	begin
		vga_r <= red1 & inDisplayArea;
		vga_g <= green1 & inDisplayArea;
		vga_b <= blue1 & inDisplayArea;
		vgaRed1 <= red2 & inDisplayArea;
		vgaRed2 <= red3 & inDisplayArea;
		vgaGreen1 <= green2 & inDisplayArea;
		vgaGreen2 <= green3 & inDisplayArea;
		vgaBlue2 <= blue2 & inDisplayArea;
	end

wire red1 = (CounterY >=100&&CounterY<=200) && (CounterX >= 100 && CounterX <= 200);
wire red2 = (CounterY >=100&&CounterY<=200) && (CounterX >= 100 && CounterX <= 200);
wire red3 = (CounterY >=100&&CounterY<=200) && (CounterX >= 100 && CounterX <= 200);

wire green1 = (CounterY >=100&&CounterY<=200) && (CounterX >= 100 && CounterX <= 200);
wire green2 = (CounterY >=100&&CounterY<=200) && (CounterX >= 100 && CounterX <= 200);
wire green3 = (CounterY >=100&&CounterY<=200) && (CounterX >= 100 && CounterX <= 200);

wire blue1 = (CounterY >=100&&CounterY<=200) && (CounterX >= 100 && CounterX <= 200);
wire blue2 = (CounterY >=100&&CounterY<=200) && (CounterX >= 100 && CounterX <= 200);
endmodule
