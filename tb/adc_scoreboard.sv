class adc_scoreboard;

    function new();
    endfunction

    task check(
        real analog_in,
        int actual_code
    );

        int expected_code;

        if (analog_in <= 0.0)
            expected_code = 0;

        else if (analog_in >= 1.0)
            expected_code = 1023;

        else
            expected_code = int'(analog_in * 1023.0);

        if (expected_code == actual_code) begin

            $display(
                "[PASS] Vin=%0f Expected=%0d Actual=%0d",
                analog_in,
                expected_code,
                actual_code
            );

        end
        else begin

            $display(
                "[FAIL] Vin=%0f Expected=%0d Actual=%0d",
                analog_in,
                expected_code,
                actual_code
            );

        end

    endtask

endclass
