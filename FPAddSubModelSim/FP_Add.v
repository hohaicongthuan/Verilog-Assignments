module FP_Add(sum, a_original, b_original);
   input [31:0] a_original, b_original;
   output [31:0] sum;

   reg           sumneg;
   reg [7:0]    sumexp;
   reg [25:0]    sumsig;
   assign        sum[31]    = sumneg;
   assign        sum[30:23] = sumexp;
   assign        sum[22:0]  = sumsig;

   reg [31:0]    a, b;
   reg [25:0]    asig, bsig;
   reg [7:0]    aexp, bexp;
   reg           aneg, bneg;
   reg [7:0]    diff;

   always @( a_original or b_original )
     begin
        /// Step 1: Copy inputs to a and b so that a's exponent not smaller than b's.
        if ( a_original[30:23] < b_original[30:23] ) begin

           a = b_original;  b = a_original;

        end else begin
           a = a_original;  b = b_original;
        end
        /// Step 2: Break operand into sign (neg), exponent, and significand.
    
        aneg = a[31]; bneg = b[31];
        aexp = a[30:23];  bexp = b[30:23];
        
        asig = { 2'b0, aexp ? 1'b1 : 1'b0, a[22:0] };
        bsig = { 2'b0, bexp ? 1'b1 : 1'b0, b[22:0] };

        /// Step 3: Un-normalize b so that aexp == bexp.
        //
        diff = aexp - bexp;
        bsig = bsig >> diff;

        /// Step 4: If necessary, negate significands.
        //
        if ( aneg ) asig = -asig;
        if ( bneg ) bsig = -bsig;
        /// Step 5: Compute sum.
        //
        sumsig = asig + bsig;
        /// Step 6: Take absolute value of sum.
        //
        sumneg = sumsig[25];
        if ( sumneg ) sumsig = -sumsig;
        /// Step 7: Normalize sum. (Three cases.)
        //
        if ( sumsig[24] ) begin
           //
           // Case 1: Sum overflow.
           //         Right shift significand and increment exponent.
           sumexp = aexp + 1;
           sumsig = sumsig >> 1;
        end else if ( sumsig ) begin:A
           //
           // Case 2: Sum is nonzero and did not overflow.
           //         Normalize. (See cases 2a and 2b.)
           integer pos, adj, i;
           // Find position of first non-zero digit.
           pos = 0;
           for (i = 23; i >= 0; i = i - 1 ) if ( !pos && sumsig[i] ) pos = i;
           // Compute amount to shift significand and reduce exponent.
           adj = 23 - pos;
           if ( aexp < adj ) begin
              //
              // Case 2a:
              //   Exponent too small, floating point underflow, set to zero.
              sumexp = 0;
              sumsig = 0;
              sumneg = 0;
           end else begin
              //
              // Case 2b: Adjust significand and exponent.
              sumexp = aexp - adj;
              sumsig = sumsig << adj;
           end
        end else begin
           //
           // Case 3: Sum is zero.
           sumexp = 0;
           sumsig = 0;
        end
     end
endmodule