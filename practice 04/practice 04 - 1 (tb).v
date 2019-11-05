module tb3;
  
  reg [2:0] in;
  reg       en;

  wire [7:0] out1;
  wire [7:0] out2;
  
  dec3to8_shift dut_1(.out (out1),
                      .in (in),
                      .en (en));
                                   
  dec3to8_case dut_2( .out (out2),
                      .in (in),
                      .en (en));
                                                        
            


 initial begin
   $display("using shift: in,en");
   $display("using case : in,en");

   $display(" ========================================== ");
   $display(" en in out1 out2 ");
   $display(" ========================================== ");
  
   #(50) {en,in} = 4'b_0000; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_0001; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_0010; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_0011; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_0100; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_0101; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_0110; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_0111; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_1000; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_1001; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_1010; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_1011; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_1100; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_1101; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_1110; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);
   #(50) {en,in} = 4'b_1111; #(50) $display (" %b\t%b\t%b\t%b\t",en,in,out1,out2);

  end

endmodule

