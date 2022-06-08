%DDA圆弧插补计算步数算法
CX0=5;   %起点X
CY0=0;   %起点Y
CXe=0;  %终点X
CYe=5;   %终点Y
CXr=0;   %圆心X
CYr=0;   %圆心Y
clockwise = 0; %0-->逆圆弧  1-->顺圆弧
steplen=1;  %步长
speed=50;   %速度

if ((CX0-CXr)^2+(CY0-CYr)^2)~=((CXe-CXr)^2+(CYe-CYr)^2)
    warndlg('圆心坐标错误','警告','on');
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
    if clockwise==0  %逆圆弧
        if CAe>CA0
            t=CA0:0.001:CAe;
        else
            t=CA0:0.001:CAe+2*pi;
        end
    else
        if CAe>=CA0
            t=CAe:0.001:CA0+2*pi;
        else
            t=CAe:0.001:CA0;
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


%--------------------------------DDA插补圆---------------------------------
PX1=CX0;
PY1=CY0;
PX2=CX0;
PY2=CY0;
CPx=CX0-CXr;
CPy=CY0-CYr;
CPX0=CX0-CXr;
CPY0=CY0-CYr;
CPXe=CXe-CXr;
CPYe=CYe-CYr;
dx=steplen;
dy=steplen;
xflag=1;    %Jrx累加开关
yflag=1;    %Jry累加开关
Jvx=abs(CPY0);   %y相对值
Jvy=abs(CPX0);   %x相对值
Jrx=0;
Jry=0;
regbit=4;
OF=2^regbit;
Cinf=0;
CEx = [0 0 0 0];
CEy = [0 0 0 0];
if Jvx>=OF || Jvy>=OF
    %报错
end
%插补准备判断象限计算步数
if clockwise==0   %逆圆弧
        if CPX0>0 && CPY0>=0       %逆圆弧1象限
            Cinf=110;
        elseif CPX0<=0 && CPY0>0   %逆圆弧2象限
            Cinf=120;
        elseif CPX0<0 && CPY0<=0   %逆圆弧3象限
            Cinf=130;
        elseif CPX0>=0 && CPY0<0   %逆圆弧4象限
            Cinf=140;
        end
else             %顺圆弧
        if CPX0>0 && CPY0<=0       %顺圆弧4象限
            Cinf=240;
        elseif CPX0<=0 && CPY0<0   %顺圆弧3象限
            Cinf=230;
        elseif CPX0<0 && CPY0>=0   %顺圆弧2象限
            Cinf=220;
        elseif CPX0>=0 && CPY0>0   %顺圆弧1象限
            Cinf=210;
        end
end

%终点坐标判别
if clockwise==0   %逆圆弧
    if CPXe>=0 && CPYe>0       %1象限
        Cinf=Cinf+1;
    elseif CPXe<0 && CPYe>=0   %2象限
        Cinf=Cinf+2;
    elseif CPXe<=0 && CPYe<0   %3象限
        Cinf=Cinf+3;
    elseif CPXe>0 && CPYe<=0   %4象限
        Cinf=Cinf+4;
    end
else
    if CPXe>0 && CPYe>=0       %1象限
        Cinf=Cinf+1;
    elseif CPXe<=0 && CPYe>0   %2象限
        Cinf=Cinf+2;
    elseif CPXe<0 && CPYe<=0   %3象限
        Cinf=Cinf+3;
    elseif CPXe>=0 && CPYe<0   %4象限
        Cinf=Cinf+4;
    end
end

switch Cinf
    case 111    %逆圆弧1-->1
        CEx(1)=ceil(abs(CX0-CXe)/steplen);CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=ceil(abs(CY0-CYe)/steplen);CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 122
        CEx(1)=0;CEx(2)=ceil(abs(CX0-CXe)/steplen);CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=ceil(abs(CY0-CYe)/steplen);CEy(3)=0;CEy(4)=0;
    case 133
        CEx(1)=0;CEx(2)=0;CEx(3)=ceil(abs(CX0-CXe)/steplen);CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=ceil(abs(CY0-CYe)/steplen);CEy(4)=0;
    case 144
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=ceil(abs(CX0-CXe)/steplen);
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=ceil(abs(CY0-CYe)/steplen);
    case 112
        CEx(1)=ceil(abs(CPX0)/steplen);CEx(2)=ceil(abs(CPXe)/steplen);CEx(3)=0;CEx(4)=0;
        CEy(1)=ceil(abs(abs(CPY0)-CR)/steplen);CEy(2)=ceil(abs(abs(CPYe)-CR)/steplen);CEy(3)=0;CEy(4)=0;
    case 123
        CEx(1)=0;CEx(2)=ceil(abs(abs(CPX0)-CR)/steplen);CEx(3)=ceil(abs(abs(CPXe)-CR)/steplen);CEx(4)=0;
        CEy(1)=0;CEy(2)=ceil(abs(CPY0)/steplen);CEy(3)=ceil(abs(CPYe)/steplen);CEy(4)=0;
    case 134
        CEx(1)=0;CEx(2)=0;CEx(3)=ceil(abs(CPX0)/steplen);CEx(4)=ceil(abs(CPXe)/steplen);
        CEy(1)=0;CEy(2)=0;CEy(3)=ceil(abs(abs(CPY0)-CR)/steplen);CEy(4)=ceil(abs(abs(CPYe)-CR)/steplen);
    case 141
        CEx(1)=ceil(abs(abs(CPXe)-CR)/steplen);CEx(2)=0;CEx(3)=0;CEx(4)=ceil(abs(abs(CPX0)-CR)/steplen);
        CEy(1)=ceil(abs(CPYe)/steplen);CEy(2)=0;CEy(3)=0;CEy(4)=ceil(abs(CPY0)/steplen);
    case 113
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 124
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 131
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 142
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 114
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 121
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 132
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 143    
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    %----------------------顺圆弧--------------------------------
    case 211    %逆圆弧1-->1
        CEx(1)=ceil(abs(CX0-CXe)/steplen);CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=ceil(abs(CY0-CYe)/steplen);CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 222
        CEx(1)=0;CEx(2)=ceil(abs(CX0-CXe)/steplen);CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=ceil(abs(CY0-CYe)/steplen);CEy(3)=0;CEy(4)=0;
    case 233
        CEx(1)=0;CEx(2)=0;CEx(3)=ceil(abs(CX0-CXe)/steplen);CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=ceil(abs(CY0-CYe)/steplen);CEy(4)=0;
    case 244
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=ceil(abs(CX0-CXe)/steplen);
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=ceil(abs(CY0-CYe)/steplen);
    case 214
        CEx(1)=ceil(abs(abs(CPX0)-CR)/steplen);CEx(2)=0;CEx(3)=0;CEx(4)=ceil(abs(abs(CPXe)-CR)/steplen);
        CEy(1)=ceil(abs(CPY0)/steplen);CEy(2)=0;CEy(3)=0;CEy(4)=ceil(abs(CPYe)/steplen);
    case 243
        CEx(1)=0;CEx(2)=0;CEx(3)=ceil(abs(CPXe)/steplen);CEx(4)=ceil(abs(CPX0)/steplen);
        CEy(1)=0;CEy(2)=0;CEy(3)=ceil(abs(CPYe)/steplen);CEy(4)=ceil(abs(abs(CPY0)-CR)/steplen);
    case 232
        CEx(1)=0;CEx(2)=ceil(bas(abs(CPXe)-CR)/steplen);CEx(3)=ceil(abs(abs(CPX0)-CR)/steplen);CEx(4)=0;
        CEy(1)=0;CEy(2)=ceil(abs(CPYe)/steplen);CEy(3)=ceil(abs(CPY0)/steplen);CEy(4)=0;
    case 221
        CEx(1)=ceil(abs(CPXe)/steplen);CEx(2)=ceil(abs(CPX0)/steplen);CEx(3)=0;CEx(4)=0;
        CEy(1)=ceil(abs(abs(CPYe)-CR)/steplen);CEy(2)=ceil(abs(abs(CPY0)-CR)/steplen);CEy(3)=0;CEy(4)=0;
    case 213
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 224
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 231
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 242
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 212
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 223
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 234
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    case 241   
        CEx(1)=0;CEx(2)=0;CEx(3)=0;CEx(4)=0;
        CEy(1)=0;CEy(2)=0;CEy(3)=0;CEy(4)=0;
    otherwise
        
end
fprintf("Cinf: %d\r\n", Cinf);
disp("CEx");
disp(CEx);
disp("CEy");
disp(CEy);

if clockwise==0   %逆圆弧
    while CEx(1)>0 || CEx(2)>0 || CEx(3)>0 || CEx(4)>0 || CEy(1)>0 || CEy(2)>0 || CEy(3)>0 || CEy(4)>0
        if xflag
            Jrx=Jrx+Jvx;
        end
        if yflag
            Jry=Jry+Jvy;
        end
        if CPx>0 && CPy>=0   %1象限
            if Jrx>=OF     %x溢出
                Jrx=Jrx-OF;
                PX2=PX1-dx;
                Jvy=Jvy-dx; 
                if CEx(1)>1 
                    CEx(1)=CEx(1)-1;
                else      
                    CEx(1)=CEx(1)-1;
                    xflag=0;
                end
            end
            if Jry>=OF    %y溢出
                Jry=Jry-OF;
                PY2=PY1+dy;
                Jvx=Jvx+dy;  
                if CEy(1)>1 
                    CEy(1)=CEy(1)-1;
                else  
                    CEy(1)=CEy(1)-1;
                    yflag=0;
                end
            end
            if(PX1 == PX2 && PY1 == PY2)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                pause(1/speed);
            end
            PX1 = PX2;
            PY1 = PY2;
            if PX2-CXr==0 && CEy(1)>0
                CEy(2)=CEy(2)-CEy(1);
                CEy(1)=0;
            end
            if CEx(1)<=0 && CEy(1)<=0
                xflag=1;
                yflag=1;
                Jrx=0;
                Jry=0;
            end
        elseif CPx<=0 && CPy>0 %2象限
            if Jrx>=OF     %x溢出
                Jrx=Jrx-OF;
                PX2=PX1-dx;
                Jvy=Jvy+dx; 
                if CEx(2)>1 
                    CEx(2)=CEx(2)-1;
                else      
                    CEx(2)=CEx(2)-1;
                    Jrx=0;
                    xflag=0;
                end
            end
            if Jry>=OF    %y溢出
                Jry=Jry-OF;
                PY2=PY1-dy;
                Jvx=Jvx-dy;  
                if CEy(2)>1 
                    CEy(2)=CEy(2)-1;
                else  
                    CEy(2)=CEy(2)-1;
                    Jry=0;
                    yflag=0;
                end
            end
            if(PX1 == PX2 && PY1 == PY2)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                pause(1/speed);
            end
            PX1 = PX2;
            PY1 = PY2;
            if PY2-CYr==0 && CEx(2)>0
                CEx(3)=CEx(3)-CEx(2);
                CEx(2)=0;
            end
            if CEx(2)<=0 && CEy(2)<=0
                xflag=1;
                yflag=1;
                Jrx=0;
                Jry=0;
            end
        elseif CPx<0 && CPy<=0 %3象限
            if Jrx>=OF     %x溢出
                Jrx=Jrx-OF;
                PX2=PX1+dx;
                Jvy=Jvy-dx; 
                if CEx(3)>1 
                    CEx(3)=CEx(3)-1;
                else      
                    CEx(3)=CEx(3)-1;
                    xflag=0;
                end
            end
            if Jry>=OF    %y溢出
                Jry=Jry-OF;
                PY2=PY1-dy;
                Jvx=Jvx+dy;  
                if CEy(3)>1 
                    CEy(3)=CEy(3)-1;
                else  
                    CEy(3)=CEy(3)-1;
                    yflag=0;
                end
            end
            if(PX1 == PX2 && PY1 == PY2)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                pause(1/speed);
            end
            if PX2-CXr==0 && CEy(3)>0
                CEy(4)=CEy(4)-CEy(3);
                CEy(3)=0;
            end
            if CEx(3)<=0 && CEy(3)<=0
                CEy(3)=0;
                xflag=1;
                yflag=1;
                Jrx=0;
                Jry=0;
            end
            PX1 = PX2;
            PY1 = PY2;
        elseif CPx>=0 && CPy<0 %4象限
            if Jrx>=OF     %x溢出
                Jrx=Jrx-OF;
                PX2=PX1+dx;
                Jvy=Jvy+dx; 
                if CEx(4)>1 
                    CEx(4)=CEx(4)-1;
                else      
                    CEx(4)=CEx(4)-1;
                    xflag=0;
                end
            end
            if Jry>=OF    %y溢出
                Jry=Jry-OF;
                PY2=PY1+dy;
                Jvx=Jvx-dy;  
                if CEy(4)>1 
                    CEy(4)=CEy(4)-1;
                else  
                    CEy(4)=CEy(4)-1;
                    yflag=0;
                end
            end
            if(PX1 == PX2 && PY1 == PY2)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                pause(1/speed);
            end
            if PY2-CYr==0 && CEx(4)>0
                CEx(1)=CEx(1)-CEx(4);
                CEx(4)=0;
            end
            if CEx(4)<=0 && CEy(4)<=0
                CEy(4)=0;
                xflag=1;
                yflag=1;
                Jrx=0;
                Jry=0;
            end
            PX1 = PX2;
            PY1 = PY2;
        end
        CPx=PX1-CXr;
        CPy=PY1-CYr;
    end
else
    while CEx(1)>0 || CEx(2)>0 || CEx(3)>0 || CEx(4)>0 || CEy(1)>0 || CEy(2)>0 || CEy(3)>0 || CEy(4)>0
        if xflag
            Jrx=Jrx+Jvx;
        end
        if yflag
            Jry=Jry+Jvy;
        end
        if CPx>=0 && CPy>0   %1象限
            if Jrx>=OF     %x溢出
                Jrx=Jrx-OF;
                PX2=PX1+dx;
                Jvy=Jvy+dx; 
                if CEx(1)>1 
                    CEx(1)=CEx(1)-1;
                else      
                    CEx(1)=CEx(1)-1;
                    xflag=0;
                end
            end
            if Jry>=OF    %y溢出
                Jry=Jry-OF;
                PY2=PY1-dy;
                Jvx=Jvx-dy;  
                if CEy(1)>1 
                    CEy(1)=CEy(1)-1;
                else  
                    CEy(1)=CEy(1)-1;
                    yflag=0;
                end
            end
            if(PX1 == PX2 && PY1 == PY2)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                pause(1/speed);
            end
            PX1 = PX2;
            PY1 = PY2;
            if PY2-CYr==0 && CEx(1)>0
                CEx(2)=CEx(2)-CEx(1);
                CEx(1)=0;
            end
            if CEx(1)<=0 && CEy(1)<=0
                xflag=1;
                yflag=1;
                Jrx=0;
                Jry=0;
            end
        elseif CPx<0 && CPy>=0 %2象限
            if Jrx>=OF     %x溢出
                Jrx=Jrx-OF;
                PX2=PX1+dx;
                Jvy=Jvy-dx; 
                if CEx(2)>1 
                    CEx(2)=CEx(2)-1;
                else      
                    CEx(2)=CEx(2)-1;
                    Jrx=0;
                    xflag=0;
                end
            end
            if Jry>=OF    %y溢出
                Jry=Jry-OF;
                PY2=PY1+dy;
                Jvx=Jvx+dy;  
                if CEy(2)>1 
                    CEy(2)=CEy(2)-1;
                else  
                    CEy(2)=CEy(2)-1;
                    Jry=0;
                    yflag=0;
                end
            end
            if(PX1 == PX2 && PY1 == PY2)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                pause(1/speed);
            end
            PX1 = PX2;
            PY1 = PY2;
            if PX2-CXr==0 && CEy(2)>0
                CEy(3)=CEy(3)-CEy(2);
                CEy(2)=0;
            end
            if CEx(2)<=0 && CEy(2)<=0
                xflag=1;
                yflag=1;
                Jrx=0;
                Jry=0;
            end
        elseif CPx<=0 && CPy<0 %3象限
            if Jrx>=OF     %x溢出
                Jrx=Jrx-OF;
                PX2=PX1-dx;
                Jvy=Jvy+dx; 
                if CEx(3)>1 
                    CEx(3)=CEx(3)-1;
                else      
                    CEx(3)=CEx(3)-1;
                    xflag=0;
                end
            end
            if Jry>=OF    %y溢出
                Jry=Jry-OF;
                PY2=PY1+dy;
                Jvx=Jvx-dy;  
                if CEy(3)>1 
                    CEy(3)=CEy(3)-1;
                else  
                    CEy(3)=CEy(3)-1;
                    yflag=0;
                end
            end
            if(PX1 == PX2 && PY1 == PY2)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                pause(1/speed);
            end
            if PY2-CYr==0 && CEx(3)>0
                CEx(4)=CEx(4)-CEx(3);
                CEx(3)=0;
            end
            if CEx(3)<=0 && CEy(3)<=0
                CEy(3)=0;
                xflag=1;
                yflag=1;
                Jrx=0;
                Jry=0;
            end
            PX1 = PX2;
            PY1 = PY2;
        elseif CPx>0 && CPy<=0 %4象限
            if Jrx>=OF     %x溢出
                Jrx=Jrx-OF;
                PX2=PX1-dx;
                Jvy=Jvy-dx; 
                if CEx(4)>1 
                    CEx(4)=CEx(4)-1;
                else      
                    CEx(4)=CEx(4)-1;
                    xflag=0;
                end
            end
            if Jry>=OF    %y溢出
                Jry=Jry-OF;
                PY2=PY1-dy;
                Jvx=Jvx+dy;  
                if CEy(4)>1 
                    CEy(4)=CEy(4)-1;
                else  
                    CEy(4)=CEy(4)-1;
                    yflag=0;
                end
            end
            if(PX1 == PX2 && PY1 == PY2)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                pause(1/speed);
            end
            if PX2-CXr==0 && CEy(4)>0
                CEy(1)=CEy(1)-CEy(4);
                CEy(4)=0;
            end
            if CEx(4)<=0 && CEy(4)<=0
                CEy(4)=0;
                xflag=1;
                yflag=1;
                Jrx=0;
                Jry=0;
            end
            PX1 = PX2;
            PY1 = PY2;
        end
        CPx=PX1-CXr;
        CPy=PY1-CYr;
    end
end

disp("CEx");
disp(CEx);
disp("CEy");
disp(CEy);