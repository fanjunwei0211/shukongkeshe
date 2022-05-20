CX0=5;
CY0=0;
CXe=-3;
CYe=4;
CXr=0;
CYr=0;
clockwise = 1; %0-->ÄæÔ²»¡  1-->Ë³Ô²»¡

if ((CX0-CXr)^2+(CY0-CYr)^2)~=((CXe-CXr)^2+(CYe-CYr)^2)
    warndlg('Ô²ÐÄ×ø±ê´íÎó','¾¯¸æ','on');
else
    CR=sqrt((CX0-CXr)^2+(CY0-CYr)^2);
%     set(handles.CR,'string',CR);
    CX0r=CX0-CXr;
    CY0r=CY0-CYr;
    CXer=CXe-CXr;
    CYer=CYe-CYr;
    if CX0r>0
        if CY0r>0
            CA0=abs(atan(CY0r./CX0r));
        elseif CY0r==0
            CA0=0;
        else
            CA0=2*pi-abs(atan(CY0r./CX0r));
        end
    elseif CX0r==0
        if CY0r>0
            CA0=pi/2;
        else
            CA0=pi*3/2;
        end
    else
        if CY0r>0
            CA0=pi-abs(atan(CY0r./CX0r));
        elseif CY0r==0
            CA0=pi;
        else
            CA0=pi+abs(atan(CY0r./CX0r));
        end
    end
    if CXer>0
        if CYer>0
            CAe=abs(atan(CYer./CXer));
        elseif CYer==0
            CAe=0;
        else
            CAe=2*pi-abs(atan(CYer./CXer));
        end
    elseif CXer==0
        if CYer>0
            CAe=pi/2;
        else
            CAe=pi*3/2;
        end
    else
        if CYer>0
            CAe=pi-abs(atan(CYer./CXer));
        elseif CYer==0
            CAe=pi;
        else
            CAe=pi+abs(atan(CYer./CXer));
        end
    end
    if clockwise==1  %Ë³Ô²»¡
        if CAe>CA0
            t=CA0:0.01:CAe;
        else
            t=CA0:0.01:CAe+2*pi;
        end
    else
        if CAe>=CA0
            t=CAe:0.01:CA0+2*pi;
        else
            t=CAe:0.01:CA0;
        end
    end
    cx=CR*cos(t)+CXr;
    cy=CR*sin(t)+CYr;
    plot(cx,cy,'black','linewidth',1.5);
    hold on;
    plot(CXr,CYr)
    axis([CXr-CR*1.2,CXr+CR*1.2,CYr-CR*1.2,CYr+CR*1.2]);
    axis square;
    grid on;
    hold on;
end
