// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);


// ------------------
// אותות ביניים לחיבור השערים
    logic nand1_out;    // יציאת NAND העליון
    logic nand2_out;    // יציאת NAND האמצעי
    logic nand3_out;    // יציאת NAND התחתון

    // NAND עליון - מקבל d0
    NAND2 #(
        .Tpdlh(10),    // השהיית עליה
        .Tpdhl(10)     // השהיית ירידה
    ) nand1 (
        .a(d0),
        .b(nand3_out), // מקבל את היציאה מ-NAND התחתון
        .z(nand1_out)
    );

    // NAND אמצעי - מקבל d1
    NAND2 #(
        .Tpdlh(10),
        .Tpdhl(10)
    ) nand2 (
        .a(d1),
        .b(sel),
        .z(nand2_out)
    );

    // NAND תחתון - מקבל sel
    NAND2 #(
        .Tpdlh(10),
        .Tpdhl(10)
    ) nand3 (
        .a(sel),
        .b(sel),
        .z(nand3_out)
    );

    // OR סופי - מחבר את יציאות ה-NAND העליונים
    OR2 #(
        .Tpdlh(10),
        .Tpdhl(10)
    ) or1 (
        .a(nand1_out),
        .b(nand2_out),
        .z(z)
    );

// End of code

endmodule
