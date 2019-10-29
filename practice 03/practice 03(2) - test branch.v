module tb_prj031;

  
  
  
  
  
  reg [1:0]sel;
  reg [3:0]in;
   
  wire o1;
  
  wire o2;
  
  wire o3;
  
  mux4to1_inst dut_1( .out (o1),
                     .sel (sel),
                     .in (in));
                      
  mux4to1_if dut_2( .out (o2),
                     .sel (sel),
                     .in (in));
  
  mux4to1_case dut_3( .out (o3),
                     .sel (sel),
                     .in (in));

  initial begin
   $display("using inst : o1");
   $display("using if : o2 ");
   $display("using case : o3 ");
   
    
   $display(" ========================================== ");
   $display(" sel0 sel1 in0 in1 in2 in3 o1 o2 o3 ");
   $display(" ========================================== ");
  
  
   #(50) {sel[0],sel[1],in[0],in[1],in[2],in[3]} = 6'b_110001; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t",sel[0],sel[1],in[0],in[1],in[2],in[3],o1,o2,o3);
   #(50) {sel[0],sel[1],in[0],in[1],in[2],in[3]} = 6'b_011001; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t",sel[0],sel[1],in[0],in[1],in[2],in[3],o1,o2,o3);
   #(50) {sel[0],sel[1],in[0],in[1],in[2],in[3]} = 6'b_100101; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t",sel[0],sel[1],in[0],in[1],in[2],in[3],o1,o2,o3);
   #(50) {sel[0],sel[1],in[0],in[1],in[2],in[3]} = 6'b_111111; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t",sel[0],sel[1],in[0],in[1],in[2],in[3],o1,o2,o3);
   #(50) {sel[0],sel[1],in[0],in[1],in[2],in[3]} = 6'b_010010; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t",sel[0],sel[1],in[0],in[1],in[2],in[3],o1,o2,o3);
   #(50) {sel[0],sel[1],in[0],in[1],in[2],in[3]} = 6'b_100110; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t",sel[0],sel[1],in[0],in[1],in[2],in[3],o1,o2,o3);
   #(50) {sel[0],sel[1],in[0],in[1],in[2],in[3]} = 6'b_110001; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t",sel[0],sel[1],in[0],in[1],in[2],in[3],o1,o2,o3);
        
   #(50) $finish;

  
  end

endmodule


