function [fn_on]=fn_activacion(in_neta,op)

switch op
    case 1
        fn_on=logsig(in_neta);
    case 2
        fn_on=tansig(in_neta);
    otherwise
        disp('opcion no valida');

end