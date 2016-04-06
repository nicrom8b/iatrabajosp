%%Datos
%% fo = [8 6]
%% rest = [4 2 60;2 4 48]
%% [rango,X,zeta,optimo]=simplex1(fo,rest,'max',100)

function [rango,X,zeta,optimo] = simplex1(fo,rest,obj,cant)
 for n = 1:size(fo,2)
     rango(n)=0;
     for m=1: size(rest,1)
        rtemp= rest(m,size(rest,2))/rest(m,n) ;
        if rtemp > rango(n)
            rango(n)=rtemp;
        end;
     end;    
 end;
 
zeta=0;
zetamin=100000000;
for i=1:cant
    for n=1:size(fo,2)
        X(i,n)=round(rand()*rango(n)+1);
    end;
    
    for m=1:size(rest,1)
        recurso(m)=sum(X(i,:).*rest(m,1:size(rest,2)-1));
    end;
    
    if obj=='max'
        if(recurso <= rest(:,size(rest,2))' )
            if (zeta < sum(fo.*X(i,:)))
                zeta = sum(fo.*X(i,:));
                optimo= X(i,:);
            end;
        end; 
    else 
        if(recurso >= rest(:,size(rest,2))' )
            if (zetamin > sum(fo.*X(i,:)))
                zetamin = sum(fo.*X(i,:));
                optimo= X(i,:);
            end;
        end;   
    end;
end;

if obj~='max'
    zeta=zetamin;
end;
 
end
