`timescale 1ns/1ps

module tb_spi;

    reg clk = 0;
    reg rst = 1;
    reg miso = 0;

    wire nCS;
    wire sck;
    wire [12:0] Dout;

    spi dut (
        .clk(clk),
        .rst(rst),
        .nCS(nCS),
        .sck(sck),
        .miso(miso),
        .Dout(Dout)
    );

    always #31.25 clk = ~clk; // 16 MHz

    initial begin
        #200 rst = 0;
    end

    // Simulated SPI data stream
    always @(negedge sck) begin
        if (!nCS)
            miso <= $random;
    end

    initial begin
        #2000000 $stop;
    end

endmodule
