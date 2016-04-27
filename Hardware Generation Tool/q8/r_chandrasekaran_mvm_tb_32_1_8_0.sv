module tbench1 ();
  parameter COUNT=4;
  
   logic signed [b-1:0] data_in;
     logic signed [2*b-1:0] data_out;
  
    logic clk, reset, start, loadMatrix, loadVector;
   
    mvm_32_1_8_0 dut (clk, reset, loadMatrix, loadVector, start, done, data_in, data_out);
  logic signed [b-1:0] xData[(COUNT*K)-1:0];
   logic signed [b-1:0] aData[(COUNT*K*K)-1:0];
  logic signed [2*b-1:0] outputData[(COUNT*K)-1:0];

  //integer filehandle=("output");
  initial $readmemh("aData", aData);
   initial $readmemh("xData", xData);

  //integer outputfilehandle=("output");
  initial $readmemh("expectedOutput", outputData);

  initial clk=0;
  always #5 clk=~clk;

  initial begin
    integer i,j,t;
      

    for (j = 0; j < COUNT; j++) begin
         @(posedge clk);
         start=0;
         reset=1;

         @(posedge clk);
         reset = 0;
   
         @(posedge clk);
         loadMatrix=1;

         for (i = (j*K*K)  ; i <(j*K*K)+(K*K) ; i++) begin //K+(COUNT*K*K)
            @(posedge clk)
            #1; data_in<=aData[i];
            loadMatrix=0;
         end

         /*for(i=0;i<K;i=i+1) begin
           @(posedge clk)
            #1;
         end*/
   
         @(posedge clk);
         loadVector=0;
         @(posedge clk);
         loadVector=1;

         for (i = (j*K); i < (j*K)+K; i++) begin
            @(posedge clk)
            #1; data_in<=xData[i];
            loadVector=0;
         end
         
           @(posedge clk)
            #1;
         
        @(posedge clk);
         start = 1;
         @(posedge clk);
         start = 0; 
        
        $display("for random set:%d",j+1);
        @(posedge done);
         #1;
         for (i = 0; i < K; i++) begin
            @(posedge clk);
            #1; $display("y[%d] = %d. Expected value is %d",i, data_out, outputData[i+(K*j)]);   
         end
         
            
    end
  $finish;
   end
  

endmodule

module tbench2 ();
   parameter COUNT=4;
   
    logic signed [b-1:0] data_in;
    logic signed [2*b-1:0] data_out;
  
      logic clk, reset, start, loadMatrix, loadVector;
   
   mvm_32_1_8_0 dut (clk, reset, loadMatrix, loadVector, start, done, data_in, data_out);
   logic signed [b-1:0] xData[(COUNT*K)-1:0];
   logic signed [b-1:0] aData[(COUNT*K*K)-1:0];
   logic signed [2*b-1:0] outputData[(COUNT*K)-1:0];

   //integer filehandle=("output");
   initial $readmemh("aData", aData);
   initial $readmemh("xData", xData);

   //integer outputfilehandle=("output");
   initial $readmemh("expectedOutput", outputData);

   initial clk=0;
   always #5 clk=~clk;

   initial begin
      integer i,j,t;
      

     for (j = 0; j < COUNT; j++) begin
         @(posedge clk);
         start=0;
         reset=1;

         @(posedge clk);
         reset = 0;
   
         @(posedge clk);
         loadVector=0;
         @(posedge clk);
         loadVector=1;

         for (i = (j*K); i < (j*K)+K; i++) begin
            @(posedge clk)
            #1; data_in<=xData[i];
            loadVector=0;
         end
         
          @(posedge clk)
            #1;
         @(posedge clk);
         loadMatrix=1;

         for (i = (j*K*K)  ; i <(j*K*K)+(K*K) ; i++) begin //K+(COUNT*K*K)
            @(posedge clk)
            #1; data_in<=aData[i];
            loadMatrix=0;
         end
          @(posedge clk)
            #1;

        @(posedge clk);
         start = 1;
         @(posedge clk);
         start = 0; 
         @(posedge clk); 
      @(posedge clk); 
        
        $display("for random set:%d",j+1);
        @(posedge done);
         #1;
         for (i = 0; i < K; i++) begin
            @(posedge clk);
            #1; $display("y[%d] = %d. Expected value is %d",i, data_out, outputData[i+(K*j)]);   
         end
         
            
      end
   $finish;
   end
   

endmodule

module tbench3 ();
   parameter COUNT=4;
   
    logic signed [b-1:0] data_in;
    logic signed [2*b-1:0] data_out;
  
      logic clk, reset, start, loadMatrix, loadVector;
   
   mvm_32_1_8_0 dut (clk, reset, loadMatrix, loadVector, start, done, data_in, data_out);
   logic signed [b-1:0] xData[(COUNT*K)-1:0];
   logic signed [b-1:0] aData[(COUNT*K*K)-1:0];
   logic signed [2*b-1:0] outputData[(COUNT*K)-1:0];

   //integer filehandle=("output");
   initial $readmemh("aData", aData);
   initial $readmemh("xData", xData);

   //integer outputfilehandle=("output");
   initial $readmemh("expectedOutput", outputData);

   initial clk=0;
   always #5 clk=~clk;

   initial begin
      integer i,j,t;
      

     for (j = 0; j < COUNT; j++) begin
         @(posedge clk);
         start=0;
         reset=1;

         @(posedge clk);
         reset = 0;
   
         @(posedge clk);
         loadVector=0;
         @(posedge clk);
         loadVector=1;

         for (i = (j*K); i < (j*K)+K; i++) begin
            @(posedge clk)
            #1; data_in<=xData[i];
            loadVector=0;
         end
         
          @(posedge clk)
            #1;
         @(posedge clk);
         loadMatrix=1;

         for (i = (j*K*K)  ; i <(j*K*K)+(K*K) ; i++) begin //K+(COUNT*K*K)
            @(posedge clk)
            #1; data_in<=aData[i];
            loadMatrix=0;
         end
          @(posedge clk)
            #1;

        @(posedge clk);
         start = 1;
         @(posedge clk);
         start = 0; 

         @(posedge clk)
         @(posedge clk)
         @(posedge clk)

         if(j==1) begin
            @(posedge clk);
            reset = 1;
            @(posedge clk);
            reset = 0; 
            $display("for random set:%d Reset was triggered",j+1);
            for (i = 0; i < K; i++) begin
               @(posedge clk);
               #1; $display("y[%d] = %d. Expected value is %d",i, data_out, outputData[i+(K*j)]);   
            end
         end
         else begin
        
        $display("for random set:%d",j+1);
        @(posedge done);
         #1;
         for (i = 0; i < K; i++) begin
            @(posedge clk);
            #1; $display("y[%d] = %d. Expected value is %d",i, data_out, outputData[i+(K*j)]);   
         end

      end
         
            
      end
   $finish;
   end
   

endmodule
