function [dfn_on]=dfn_activacion(in_neta,op)

switch op
    case 1
        dfn_on=(logsig(in_neta).*(1-logsig(in_neta)))';
    case 2
        dfn_on=(1-tansig(in_neta).^2)';
    otherwise
        disp('opcion no valida');

end