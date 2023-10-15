`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2023 06:27:30 PM
// Design Name: 
// Module Name: tt_vending_machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tt_Vending_machine_add(
 input rst,
 input clock,
 input ch,//declaring rst, clock and ch as inputs
 input [1:0]d_q,
 output reg dispense,
 output reg [1:0]change// declaring d_q, dispense and change as outputs
 );
 reg [1:0]present_state,next_state;// declaring present and next states
 parameter s0=2'b00,s1=2'b01,s2=2'b10;
 //definng states s0 as 0cent s1 as 25cent & s2 as 50cents
 always@(d_q,present_state)// combinational block code
 begin
 if(ch==0)//if choice is chocolate
 begin
 case(present_state)
s0:
begin 
 if(d_q==2'b00) 
 begin //input is no coin
 next_state=s0;
 dispense=1'b0;
 change=2'b00; // no change
 end
 else if(d_q==2'b01)//input is a quarter coin
 begin
 next_state=s1;
 dispense=1'b0;
 change=2'b00; // no change
 end
 else if(d_q==2'b10)//input is a dollar coin 
 begin
 next_state=s0;
 dispense=1'b1;
 change=2'b01; // change is 25 cents
 end
end
s1:
 begin 
 if(d_q==2'b00)//input is no coin
 begin
 next_state=s1;
 dispense=1'b0;
 change=2'b00; // no change
 end 
 else if(d_q==2'b01)
 begin //input is a quarter coin 
 next_state=s2;
 dispense=1'b0;
 change=2'b00; // no change
 end
 else if (d_q==2'b10)
 begin //input is a dollar coin 
 next_state=s0;
 dispense=1'b1;
 change=2'b10; // change is 50 cents
 end
 end
s2:
 begin 
 if(d_q==2'b00)//input is no coin
 begin
 next_state=s2;
 dispense=1'b0;
 change=2'b00; // no change
 end 
 else if(d_q==2'b01)//input is a quarter coin 
 begin
 next_state=s0;
 dispense=1'b1;
 change=2'b00; // no change
 end
 else if(d_q==2'b10)//input is a dollar coin 
 begin
 next_state=s0;
 dispense=1'b1;
 change=2'b11; // change is 75 cents 
 end
 end
 endcase
 end
 if(ch==1)//if choice is vanilla
 begin
 case(present_state)
 s0:
 begin 
 if(d_q==2'b00)//input is no coin
 begin 
 next_state=s0;
 dispense=1'b0;
 change=2'b00; // no change
 end
 if(d_q==2'b01)// input is a quarter coin
 begin 
 next_state=s1;
 dispense=1'b0;
 change=2'b00;// no change
 end
 if(d_q==2'b10)// input is a dollar coin
 begin 
 next_state=s0;
 dispense=1'b1;
 change=2'b10; // change of 50 cents
 end
 end
 s1:
 begin
 if(d_q==2'b00)//input is no coin
 begin 
 next_state=s1;
 dispense=1'b0;
 change=2'b00; // no change
 end
 if(d_q==2'b01)// input is a quarter coin
 begin 
 next_state=s0;
 dispense=1'b1;
 change=2'b00;// no change
 end
 if(d_q==2'b10)// input is a dollar coin
 begin 
 next_state=s0;
 dispense=1'b1;
 change=2'b11; // change is 75 cents 
 end
 end
 endcase
 end
 end
 //sequential block code
 always@(posedge clock or negedge rst)
 begin
 if(~rst)
 begin
 present_state<=0;
 next_state<=0;//reset all states to Zero
 end
 else
 present_state<=next_state;
 end
endmodule
