% Marzo 26 de 2020
clc
clear all
close all

data=database(3);
red=rednet(3, 4, 1, 1);
[f,c]=size(data);
epocas=0;
errorG=ones(1,red(end))*99;
perform=0.001;
e=cell(length(data),1);
err=0;
salidas=[];
promeg=99;
n=0.5;
newred=length(red)-1;
vectr=[];

for c=1:newred
    newred=input(['Ingrese el valor log 1 o tan 2(',num2str(c),'): ']);
    vectr(c)=newred;
end

for i=1:length(red)-1
    w{i}=-1+(1+1)*rand(red(i+1),red(i));
    b{i}=-1+(1+1)*rand(red(i+1),1);
    d{i}=zeros(red(i+1),1);
end

while ((promeg>=perform)&(epocas<=1000))

    for p=1:length(data)
        for i=1:length(red)-1
            if (i==1)
                 %con la funcion logsig
               a{i}=w{i}*data(p,(1:red(1)))'+b{i};
               Y{i}=fn_activacion(a{i},1);
            else
                %con la funcion tansig
                a{i}=w{i}*Y{i-1}+b{i};
                Y{i}=fn_activacion(a{i},vectr(i));
            end
        end   
        salidas=[salidas;Y{end}'];
        e{p}=data(p,end)-Y{end}';
        d{end}=e{p}';
        
        for k=length(d)-1:-1:1
            d{k}=w{k+1}'*d{k+1};
        end
        
        for i=1:length(b)
            b{i}=b{i}+n*d{i};
        end
            
        for i=1:length(red)-1
            dfn{i}=zeros(red(i+1),1);
        end   
        
       for i=1:length(red)-1
           if i==1
               dfn{i}=dfn_activacion(a{i},1)';
           else
               dfn{i}=dfn_activacion(a{i},vectr(i))';
           end
       end
        
       for i=1:length(w)
           if i==1
              w{i}=w{i}+n*d{i}.*dfn{i}*data(p,1:red(1));
          else
               w{i}=w{i}+n*d{i}.*dfn{i}*Y{i-1}';
          end
       end
 end 
    
    
    
   %hay que modificar esta parte para que de       
   err=0;
   for i=1:length(e)
    err=e{i}.^2; %creo que hay que modificar esto 
   end
   
   errorG=[errorG;err(1,:)]; % y verificar esto
   promeg=sum(errorG(end,:));
   %entre esta parte del codigo esta la solucion para que funcione.  
   
   epocas
   salidas
   promeg
   copia_salidas=salidas;
   salidas=[];
   epocas=epocas+1;
   e=cell(f,1); 
end

figure(1)

semilogy(1:length(errorG),errorG)
grid on
