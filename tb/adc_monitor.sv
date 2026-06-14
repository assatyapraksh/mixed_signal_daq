class adc_monitor;

    virtual adc_if vif;

    function new(virtual adc_if vif);
        this.vif = vif;
    endfunction

    task monitor();

        $display(
            "[MONITOR] analog_in=%0f digital_out=%0d",
            vif.analog_in,
            vif.digital_out
        );

    endtask

endclass
