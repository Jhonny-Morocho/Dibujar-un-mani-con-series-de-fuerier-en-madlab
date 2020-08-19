subplot(2,1,1)
title('ARMONICAS INDIVIDUALES');
t=0:.1:12.5;
for n=1:11
    y=par(n,t);
    y=y+(pi^2/3);
    
    if n==3
        plot(t,y,'0-g')
    end
    hold on
end

for n=1:11

    y=par (n, t);
    z=z+y;
    
    if n==1
        plot (t, z+pi^2/3, 'r')
    end
    
    if n==3
        plot (t, z+pi^2/3, 'm')
    end

    if n==5
        plot (t, z+pi^2/3, 'g')
    end

    if n==7
        plot (t, z+pi^2/3,'c')
    end
    
    if n==9
        plot (t, z+pi^2/3, 'y')
    end
    
    if n==11
        grid on
        plot(t, z+pi^2/3, 'b')

    end
    hold on

end