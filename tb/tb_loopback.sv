module tb_loopback;

    logic clk;
    logic rst_n;

    real analog_in;
    real analog_out;

    logic [9:0] digital_code;

    integer pass_count;
    integer fail_count;

    real error;

    adc_dac_top dut (
        .clk(clk),
        .rst_n(rst_n),
        .analog_in(analog_in),
        .digital_code(digital_code),
        .analog_out(analog_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("waves/loopback_wave.vcd");
        $dumpvars(0, tb_loopback);
    end

    task check_loopback;
    begin

        error = analog_in - analog_out;

        if (error < 0)
            error = -error;

        if (error < 0.002) begin

            pass_count = pass_count + 1;

            $display(
                "[PASS] Vin=%0f Vout=%0f Error=%0f",
                analog_in,
                analog_out,
                error
            );

        end
        else begin

            fail_count = fail_count + 1;

            $display(
                "[FAIL] Vin=%0f Vout=%0f Error=%0f",
                analog_in,
                analog_out,
                error
            );

        end

    end
    endtask

    initial begin

        pass_count = 0;
        fail_count = 0;

        rst_n = 0;
        analog_in = 0.0;

        #20;
        rst_n = 1;

        analog_in = 0.00;
        #25;
        check_loopback();

        analog_in = 0.25;
        #25;
        check_loopback();

        analog_in = 0.50;
        #25;
        check_loopback();

        analog_in = 0.75;
        #25;
        check_loopback();

        analog_in = 1.00;
        #25;
        check_loopback();

        $display("");
        $display("=================================");
        $display("LOOPBACK TEST SUMMARY");
        $display("PASS COUNT = %0d", pass_count);
        $display("FAIL COUNT = %0d", fail_count);
        $display("=================================");

        $finish;

    end

endmodule
