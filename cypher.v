module d_flipflop(Q,D,clk,reset);
output Q;
input D;
input reset;
input clk;
reg Q;
always@(posedge clk,negedge reset)
if(!reset) Q<=1'b0;
else Q<=D;
endmodule

module cypher(x,clk,load,reset,Out);

input clk;
input load;
input reset;
input x; 
wire D;
wire [8:1] Out1,Out2,Out1A,Out2B;
output [8:1]Out;
wire [8:1]A;
assign A=8'b10011101;
wire [8:1]Q;
xnor(D,Q[1],Q[8]);
and(clk1,clk,load);
d_flipflop DFF1(Q[1],D,clk1,reset);
d_flipflop DFF2(Q[2],Q[1],clk1,reset);
d_flipflop DFF3(Q[3],Q[2],clk1,reset);
d_flipflop DFF4(Q[4],Q[3],clk1,reset);
d_flipflop DFF5(Q[5],Q[4],clk1,reset);
d_flipflop DFF6(Q[6],Q[5],clk1,reset);
d_flipflop DFF7(Q[7],Q[6],clk1,reset);
d_flipflop DFF8(Q[8],Q[7],clk1,reset);

xor(Out1[1],Q[1],A[1]);and(Out1A[1],Out1[1],x);
xor(Out1[2],Q[2],A[2]);and(Out1A[2],Out1[2],x);
xor(Out1[3],Q[3],A[3]);and(Out1A[3],Out1[3],x);
xor(Out1[4],Q[4],A[4]);and(Out1A[4],Out1[4],x);
xor(Out1[5],Q[5],A[5]);and(Out1A[5],Out1[5],x);
xor(Out1[6],Q[6],A[6]);and(Out1A[6],Out1[6],x);
xor(Out1[7],Q[7],A[7]);and(Out1A[7],Out1[7],x);
xor(Out1[8],Q[8],A[8]);and(Out1A[8],Out1[8],x);

xor(Out2[1],Q[1],Out1[1]);and(Out2B[1],Out2[1],~x);
xor(Out2[2],Q[2],Out1[2]);and(Out2B[2],Out2[2],~x);
xor(Out2[3],Q[3],Out1[3]);and(Out2B[3],Out2[3],~x);
xor(Out2[4],Q[4],Out1[4]);and(Out2B[4],Out2[4],~x);
xor(Out2[5],Q[5],Out1[5]);and(Out2B[5],Out2[5],~x);
xor(Out2[6],Q[6],Out1[6]);and(Out2B[6],Out2[6],~x);
xor(Out2[7],Q[7],Out1[7]);and(Out2B[7],Out2[7],~x);
xor(Out2[8],Q[8],Out1[8]);and(Out2B[8],Out2[8],~x);

or(Out[1],Out1A[1],Out2B[1]);
or(Out[2],Out1A[2],Out2B[2]);
or(Out[3],Out1A[3],Out2B[3]);
or(Out[4],Out1A[4],Out2B[4]);
or(Out[5],Out1A[5],Out2B[5]);
or(Out[6],Out1A[6],Out2B[6]);
or(Out[7],Out1A[7],Out2B[7]);
or(Out[8],Out1A[8],Out2B[8]); 
endmodule
