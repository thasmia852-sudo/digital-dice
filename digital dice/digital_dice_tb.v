`timescale 1ns/1ps

module digital_dice_tb;

    reg clk;
    reg reset;
    reg roll;

    wire [6:0] seg;

    // Instantiate Digital Dice
    digital_dice DUT (
        .clk   (clk),
        .reset (reset),
        .roll  (roll),
        .seg   (seg)
    );

    // Clock generation
    initial begin
        clk = 0;

        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin

        // Initial values
        reset = 1;
        roll  = 0;

        #20;

        // Release reset
        reset = 0;

        // Roll 1
        #30;
        roll = 1;

        #10;
        roll = 0;

        // Roll 2
        #50;
        roll = 1;

        #10;
        roll = 0;

        // Roll 3
        #50;
        roll = 1;

        #10;
        roll = 0;

        // Continue simulation
        #100;

        $finish;

    end

    // Display simulation information
    initial begin
        $monitor(
            "Time=%0t ns | Reset=%b | Roll=%b | Random=%d | Dice=%d | SEG=%b",
            $time,
            reset,
            roll,
            DUT.random_count,
            DUT.dice_value,
            seg
        );
    end

endmodule
