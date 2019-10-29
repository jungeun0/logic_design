module mux          ( out,
                      in0,
                      in1,
                      sel  );
                     
                     
  output out;
  input in0;
  input in1;
  input sel;

  assign out = (sel)? in1 : in0 ;
endmodule


module mux4to1_inst ( in,
                      sel,
                      out);
                      
                      
                      
  input [3:0] in;
  input [1:0] sel;
  output out;
  
  wire [1:0]co;
  
  
  mux mux_u0 ( .in0(in[0]),
               .in1(in[1]),
               .sel(sel[0]),
               .out(co[0]) );
               
  
  mux mux_u1 ( .in0(in[2]),
               .in1(in[3]),
               .sel(sel[0]),
               .out(co[1]) );
               
  mux mux_u2 ( .in0(co[0]),
               .in1(co[1]),
               .sel(sel[1]),
               .out(out));   
               
endmodule
 
 
module mux4to1_if   ( in,
                      sel,
                      out); 
 
         
 input [3:0] in;
 input [1:0] sel;
 output out;
 
// wire [1:0] co;
 
 reg out;
 reg [1:0] co;
 
 
 always @(*)begin
    if(sel[0] == 1'b0)begin
      co[0] <= in[0];
      co[1] <= in[2];
    end else begin
      co[0] <= in[1];
      co[1] <= in[3];
      
    end
    
    if(sel[1] == 1'b0)begin
      out <= co[0];
    end else begin
      out <= co[1]; 
    end
 end 
endmodule


module mux4to1_case ( in,
                      sel,
                      out); 
 
         
 input [3:0] in;
 input [1:0] sel;
 output out;
 
 
 reg out;
 
  always @(*)begin
   case (sel)
     2'b00 : {out} = in[0];
     2'b01 : {out} = in[2];
     2'b10 : {out} = in[1];
     2'b11 : {out} = in[3];
    
   endcase
  end
 endmodule         
 
   