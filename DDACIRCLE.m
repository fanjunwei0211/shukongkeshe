%DDAԲ���岹û�м��㲽����BUG
CX0=5;
CY0=0;
CXe=0;
CYe=5;
CXr=0;
CYr=0;
clockwise = 0; %0-->��Բ��  1-->˳Բ��
steplen=1;
speed=50;

if ((CX0-CXr)^2+(CY0-CYr)^2)~=((CXe-CXr)^2+(CYe-CYr)^2)
    warndlg('Բ���������','����','on');
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
    if clockwise==0  %��Բ��
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


%-------------------------DDA�岹Բ--------------------------------
PX1=CX0;
PY1=CY0;
PX2=CX0;
PY2=CY0;
CPx=PX1-CXr;
CPy=PY1-CYr;
dx=steplen;
dy=steplen;
Jvx=abs(CPy);   %y���ֵ
Jvy=abs(CPx);   %x���ֵ
Jrx=0;
Jry=0;
regbit=3;
OF=2^regbit;
if Jvx>=OF || Jvy>=OF
    %����
end
if clockwise==0   %��Բ��
    xflag=1;
    yflag=1;
    while (sqrt((PX1-CXe)^2+(PY1-CYe)^2))>=steplen
        if xflag
            Jrx=Jrx+Jvx;
        end
        if yflag
            Jry=Jry+Jvy;
        end
        pause(1/speed);
        if CPx>0 && CPy>=0   %1����
            
            if Jrx>=OF    %x���
                Jrx=Jrx-OF;
                PX2=PX1-dx;
                Jvy=Jvy-dx;                
            end
            if Jry>=OF   %y���
                Jry=Jry-OF;
                PY2=PY1+dy;
                Jvx=Jvx+dy;                
            end
            if(PX1 == PX2 && PY1 == PY2)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
            end
            if abs(abs(PY2)-CR)<=0
                yflag=0;
                Jry=0;
            else
                yflag=1;
            end
            if PX2-CXr == 0
                xflag=0;
            else
                xflag=1;
            end
            PX1 = PX2;
            PY1 = PY2;
        elseif CPx<=0 && CPy>0 %2����
            if Jrx>=OF    %x���
                Jrx=Jrx-OF;
                PX2=PX1-dx;
                Jvy=Jvy+dx;                
            end
            if Jry>=OF   %y���
                Jry=Jry-OF;
                PY2=PY1-dy;
                Jvx=Jvx-dy;                
            end
            if(PX1 == PX2 && PY1 == PY2)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
            end
            if abs(abs(PX2)-CR)<=0
                xflag=0;
                Jrx=0;
            else
                xflag=1;
            end
            if PY2-CYr == 0
                yflag=0;
            else
                yflag=1;
            end
            PX1 = PX2;
            PY1 = PY2;
        elseif CPx<0 && CPy<=0 %3����
            if Jrx>=OF    %x���
                Jrx=Jrx-OF;
                PX2=PX1+dx;
                Jvy=Jvy-dx;                
            end
            if Jry>=OF   %y���
                Jry=Jry-OF;
                PY2=PY1-dy;
                Jvx=Jvx+dy;                
            end
            if(PX1 == PX2 && PY1 == PY2)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
            end
            if abs(abs(PY2)-CR)<=0
                yflag=0;
                Jry=0;
            else
                yflag=1;
            end
            if PX2-CYr == 0
                xflag=0;
            else
                xflag=1;
            end
            PX1 = PX2;
            PY1 = PY2;
        else %4����
            if Jrx>=OF    %x���
                Jrx=Jrx-OF;
                PX2=PX1+dx;
                Jvy=Jvy-dx;                
            end
            if Jry>=OF   %y���
                Jry=Jry-OF;
                PY2=PY1+dy;
                Jvx=Jvx-dy;                
            end
            if(PX1 == PX2 && PY1 == PY2)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
            end
            if abs(abs(PX2)-CR)<=0
                xflag=0;
                Jrx=0;
            else
                xflag=1;
            end
            if PY2-CYr == 0
                yflag=0;
            else
                yflag=1;
            end
            PX1 = PX2;
            PY1 = PY2;
        end
        CPx=PX1-CXr;
        CPy=PY1-CYr;
    end
% else
%     while (sqrt((X-CXe)^2+(Y-CYe)^2))>=steplen
%         if CPx>0 && CPy<=0   %4����
%             
%         end
%         if CPx<=0 && CPy<0   %3����
%             
%         end
%         if CPx<0 && CPy>=0   %2����
%             
%         end
%         if CPx>=0 && CPy>0   %1����
%             
%         end
%         CPx=X-CXr;
%         CPy=Y-CYr;
%     end
end
