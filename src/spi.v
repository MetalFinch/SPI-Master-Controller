module spi (
    input        clk,
    input        rst,
    output       nCS,
    output       sck,
    input        miso,
    output [12:0] Dout
);

    // Free-running counter
    reg [22:0] cntr;
    always @(posedge clk) begin
        if (rst)
            cntr <= 23'd0;
        else
            cntr <= cntr + 1'b1;
    end

    // SPI clock (4 MHz from 16 MHz)
    assign sck = cntr[1];

    // Rising edge detect
    wire sck_rise = (cntr[1:0] == 2'b01);

    // Chip select control
    reg cs_ff = 1'b1;
    always @(posedge clk) begin
        if (rst)
            cs_ff <= 1'b1;
        else if (cntr == 23'd3)
            cs_ff <= 1'b0;
        else if (cntr == 23'd67)
            cs_ff <= 1'b1;
    end
    assign nCS = cs_ff;

    // Shift register for data capture
    reg [15:0] shr;
    always @(posedge clk) begin
        if (rst)
            shr <= 16'd0;
        else if (sck_rise && ~nCS)
            shr <= {shr[14:0], miso};
    end

    // Output register (stable data)
    reg [12:0] dout_r;
    always @(posedge clk) begin
        if (rst)
            dout_r <= 13'd0;
        else if (nCS)
            dout_r <= shr[15:3];
    end

    assign Dout = dout_r;

endmodule
