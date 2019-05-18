    function alpha=alpha_n(Vm)
        alpha=(Vm+50)/(100*(1-exp((Vm+50)/(-10))));
    end