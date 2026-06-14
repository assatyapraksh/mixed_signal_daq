class adc_driver;

    virtual adc_if vif;

    function new(virtual adc_if vif);
        this.vif = vif;
    endfunction

    task drive(real vin);

        vif.analog_in = vin;

        $display("[DRIVER] Driving analog_in = %0f", vin);

    endtask

endclass
