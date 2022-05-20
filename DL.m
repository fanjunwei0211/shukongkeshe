X0=0;
Y0=0;
Xe=6;
Ye=8;
u1=0;
Regbit=4;  %�Ĵ���λ��
steplen=1; %��������
speed=1;  %pause(speed/100)
ruinmode=1;    %�岹ģʽѡ��0-->DDA   1-->���ȽϷ�
loadmode=0;    %����ģʽѡ��0-->0     2-->�����     3-->ȫ����
leftmode=0;    %���ƹ��  0-->�ر�  1-->����


% axes(handles.axes1);
% get(handles.X0,'string');
% X0=str2double(get(handles.X0,'string'));
% get(handles.Y0,'string');
% Y0=str2double(get(handles.Y0,'string'));
% get(handles.Xe,'string');
% Xe=str2double(get(handles.Xe,'string'));
% get(handles.Ye,'string');
% Ye=str2double(get(handles.Ye,'string'));
% if (isnan(X0)||isnan(Y0)||isnan(Xe)||isnan(Ye))
%     warndlg('����������','����','on');
% end
% if (isempty(X0)||isempty(Y0)||isempty(Xe)||isempty(Ye))
%      warndlg('����������','����','on');
% end
if ((X0==Xe)&&(Y0==Ye))
     warndlg('��β������ͬ��������Ч������������','����','on');
end

u1=0;
plot([X0,Xe],[Y0,Ye],'k');
dx=abs(X0-Xe);
dy=abs(Y0-Ye);
if dx>dy
   axis([min([X0,Xe])-dx*0.2,min([X0,Xe])+dx*1.2,min([Y0,Ye])-dx*0.2,min([Y0,Ye])+dx*1.2]);
else
   axis([min([X0,Xe])-dy*0.2,min([X0,Xe])+dy*1.2,min([Y0,Ye])-dy*0.2,min([Y0,Ye])+dy*1.2]); 
end
axis equal;
grid on;
grid minor;
hold on;



PX1=X0;
PY1=Y0;
PX2=X0;
PY2=Y0;
Jvx=abs(X0-Xe);
Jvy=abs(Y0-Ye);
Jrx=0;
Jry=0;
Ex0=abs(PX1-Xe);
Ey0=abs(PY1-Ye);
OF=2^Regbit;
if (Xe>X0&&Ye>Y0)   %��һ����
   t=1;
end
if (Xe<X0&&Ye>Y0)   %�ڶ�����
   t=2;
end
if (Xe<X0&&Ye<Y0)   %��������
   t=3;
end
if (Xe>X0&&Ye<Y0)   %��������
   t=4;
end
% if get(handles.DDA,'value')
%     ruinmode=0;
% else
%     ruinmode=1;
% end
if ruinmode==0 %DDA��
    if loadmode==1
        Jrx=OF/2;
        Jry=OF/2;
    end
    if loadmode==2
        Jrx=OF-1;
        Jry=OF-1;
    end
    if leftmode==0
        while Jvx<OF/2&&Jvy<OF/2
        Jvx=Jvx*2;
        Jvy=Jvy*2;
        end
    end
switch t
    case 1 %��һ����
        while Ex0>0.5*steplen||Ey0>0.5*steplen
            Jrx=Jrx+Jvx;
            Jry=Jry+Jvy;
            if Jrx>=OF
                Jrx=Jrx-OF;
                PX2=PX1+steplen;%��+X����һ������
                Ex0=abs(PX2-Xe);
            end
            if  Jry>=OF
                Jry=Jry-OF;
                PY2=PY1+steplen;%��+Y����һ������
                Ey0=abs(PY2-Ye);
            end
            if  (PX2==PX1&&PY2==PY1)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                pause(speed/100);
            end
            PX1=PX2;
            PY1=PY2;
        end
    case 2 %�ڶ�����
        while Ex0>0.5*steplen||Ey0>0.5*steplen
            Jrx=Jrx+Jvx;
            Jry=Jry+Jvy;
            if Jrx>=OF
                Jrx=Jrx-OF;
                PX2=PX1-steplen;%��-X����һ������
                Ex0=abs(PX2-Xe);
            end
            if  Jry>=OF
                Jry=Jry-OF;
                PY2=PY1+steplen;%��+Y����һ������
                Ey0=abs(PY2-Ye);
            end
            if  (PX2==PX1&&PY2==PY1)
            else
                plot([PX1,PX2],[PY1,PY2],'y','linewidth',1);
                pause(speed/100);
            end
            PX1=PX2;
            PY1=PY2;
        end
     case 3 %��������
        while Ex0>0.5*steplen||Ey0>0.5*steplen
            Jrx=Jrx+Jvx;
            Jry=Jry+Jvy;
            if Jrx>=OF
                Jrx=Jrx-OF;
                PX2=PX1-steplen;%��-X����һ������
                Ex0=abs(PX2-Xe);
            end
            if  Jry>=OF
                Jry=Jry-OF;
                PY2=PY1-steplen;%��-Y����һ������
                Ey0=abs(PY2-Ye);
            end
            if  (PX2==PX1&&PY2==PY1)
            else
                plot([PX1,PX2],[PY1,PY2],'y','linewidth',1);
                pause(speed/100);
            end
            PX1=PX2;
            PY1=PY2;
        end
   case 4 %��������
        while Ex0>0.5*steplen||Ey0>0.5*steplen
            Jrx=Jrx+Jvx;
            Jry=Jry+Jvy;
            if Jrx>=OF
                Jrx=Jrx-OF;
                PX2=PX1+steplen;   %��+X����һ������
                Ex0=abs(PX2-Xe);
            end
            if  Jry>=OF
                Jry=Jry-OF;
                PY2=PY1-steplen;   %��-Y����һ������
                Ey0=abs(PY2-Ye);
            end
            if  (PX2==PX1&&PY2==PY1)
            else
                plot([PX1,PX2],[PY1,PY2],'y','linewidth',1);
                pause(speed/100);
            end
            PX1=PX2;
            PY1=PY2;
        end
     end
end
if ruinmode==1 %��㷨
    X=X0;
    Y=Y0;
    F=0;
    Ex1=abs(X-Xe);
    Ey1=abs(Y-Ye);
    switch t
        case 1  %��һ����
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X+steplen],[Y,Y],'y','linewidth',1);
                    pause(speed/100);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X+steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y+steplen],'y','linewidth',1);
                    pause(speed/100);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y+steplen;
                    Ey1=abs(Y-Ye);
                end
            end
        case 2  %�ڶ�����
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X-steplen],[Y,Y],'y','linewidth',1);
                    pause(speed/100);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X-steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y+steplen],'y,','linewidth',1');
                    pause(speed/100);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y+steplen;
                    Ey1=abs(Y-Ye);
                end
            end
       case 3  %��������
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X-steplen],[Y,Y],'y','linewidth',1);
                    pause(speed/100);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X-steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y-steplen],'y','linewidth',1);
                    pause(speed/100);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y-steplen;
                    Ey1=abs(Y-Ye);
                end
            end  
        case 4  %��������
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X+steplen],[Y,Y],'y','linewidth',1);
                    pause(speed/100);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X+steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y-steplen],'y','linewidth',1);
                    pause(speed/100);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y-steplen;
                    Ey1=abs(Y-Ye);
                end
            end  
    end
end