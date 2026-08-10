module digital_dice (
    input  wire       clk,
    input  wire       reset,
    input  wire       roll,
    output reg [6:0]  seg
);

    reg [2:0] random_count;
    reg [2:0] dice_value;

    // Continuous counter
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            random_count <= 3'd1;
        end
        else begin
            if (random_count == 3'd6)
                random_count <= 3'd1;
            else
                random_count <= random_count + 1'b1;
        end
    end

    // Roll the dice
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            dice_value <= 3'd1;
        end
        else if (roll) begin
            dice_value <= random_count;
        end
    end

    // 7-segment decoder
    // Common-anode display
    always @(*) begin
        case (dice_value)

            3'd1: seg = 7'b1111001;
            3'd2: seg = 7'b0100100;
            3'd3: seg = 7'b0110000;
            3'd4: seg = 7'b0011001;
            3'd5: seg = 7'b0010010;
            3'd6: seg = 7'b0000010;

            default: seg = 7'b1111111;

        endcase
    end

endmodule
