class adc_transaction;

    // Input stimulus
    real analog_in;

    // Expected output
    int expected_code;

    // Constructor
    function new();
    endfunction

    // Display function
    function void display();
        $display("--------------------------------");
        $display("ADC Transaction");
        $display("analog_in     = %0f", analog_in);
        $display("expected_code = %0d", expected_code);
        $display("--------------------------------");
    endfunction

endclass
