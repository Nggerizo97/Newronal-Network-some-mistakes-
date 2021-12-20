function [red] = rednet(op,entrada,j,salida)

nv=j;

vect=[];
 
for  n=1:nv
    nv=input(['Ingrese el valor(',num2str(n),'): ']);
    vect(n)=nv;
end
 
vect


switch op
    case 1 
        if entrada == 2 & salida == 1 
           red = [entrada vect salida];
        else 
            disp('opcion no valida');
        end
     case 2
         if entrada == 3 & salida == 1 
           red = [entrada vect salida];
        else 
            disp('opcion no valida');
         end
     case 3
         if entrada == 4 & salida == 1
           red = [entrada vect salida];
        else 
            disp('opcion no valida');
         end
    otherwise
         disp('opcion no valida');
         
       
end
