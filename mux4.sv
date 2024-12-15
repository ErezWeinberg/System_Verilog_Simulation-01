// 4->1 multiplexer template
module mux4 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic d2,          // Data input 2
    input logic d3,          // Data input 3
    input logic [1:0] sel,   // Select input
    output logic z           // Output
);
// Internal wires for connecting MUX2 outputs
    logic mux1_out, mux2_out;
    
    // First stage MUX2s
    mux2 first_mux1 (
        .d0(d0),
        .d1(d1),
        .sel(sel[0]),
        .z(mux1_out)
    );
    
    mux2 first_mux2 (
        .d0(d2),
        .d1(d3),
        .sel(sel[0]),
        .z(mux2_out)
    );
    
    // Final stage MUX2
    mux2 final_mux (
        .d0(mux1_out),
        .d1(mux2_out),
        .sel(sel[1]),
        .z(z)
    );
// End of code

endmodule
