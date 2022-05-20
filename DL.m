X0=0;
Y0=0;
Xe=6;
Ye=8;
Regbit=4;  %寄存器位数
steplen=1; %进给步长
speed=1;  %pause(speed/100)
ruinmode=1;    %插补模式选择0-->DDA   1-->逐点比较法
loadmode=0;    %加载模式选择0-->0     2-->半加载     3-->全加载
leftmode=0;    %左移规格化  0-->关闭  1-->开启


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
%     warndlg('请输入数字','警告','on');
% end
% if (isempty(X0)||isempty(Y0)||isempty(Xe)||isempty(Ye))
%      warndlg('请输入数字','警告','on');
% end
if ((X0==Xe)&&(Y0==Ye))
     warndlg('首尾坐标相同，输入无效，请重新输入','警告','on');
end

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
if (Xe>X0&&Ye>Y0)   %第一象限
   t=1;
end
if (Xe<X0&&Ye>Y0)   %第二象限
   t=2;
end
if (Xe<X0&&Ye<Y0)   %第三象限
   t=3;
end
if (Xe>X0&&Ye<Y0)   %第四象限
   t=4;
end
% if get(handles.DDA,'value')
%     ruinmode=0;
% else
%     ruinmode=1;
% end
if ruinmode==0 %DDA法
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
    case 1 %第一象限
        while Ex0>0.5*steplen||Ey0>0.5*steplen
            Jrx=Jrx+Jvx;
            Jry=Jry+Jvy;
            if Jrx>=OF
                Jrx=Jrx-OF;
                PX2=PX1+steplen;%向+X进给一个步长
                Ex0=abs(PX2-Xe);
            end
            if  Jry>=OF
                Jry=Jry-OF;
                PY2=PY1+steplen;%向+Y进给一个步长
                Ey0=abs(PY2-Ye);
            end
            if  (PX2==PX1&&PY2==PY1)
            else
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                pause(100/speed);
            end
            PX1=PX2;
            PY1=PY2;
        end
    case 2 %第二象限
        while Ex0>0.5*steplen||Ey0>0.5*steplen
            Jrx=Jrx+Jvx;
            Jry=Jry+Jvy;
            if Jrx>=OF
                Jrx=Jrx-OF;
                PX2=PX1-steplen;%向-X进给一个步长
                Ex0=abs(PX2-Xe);
            end
            if  Jry>=OF
                Jry=Jry-OF;
                PY2=PY1+steplen;%向+Y进给一个步长
                Ey0=abs(PY2-Ye);
            end
            if  (PX2==PX1&&PY2==PY1)
            else
                plot([PX1,PX2],[PY1,PY2],'y','linewidth',1);
                pause(100/speed);
            end
            PX1=PX2;
            PY1=PY2;
        end
     case 3 %第三象限
        while Ex0>0.5*steplen||Ey0>0.5*steplen
            Jrx=Jrx+Jvx;
            Jry=Jry+Jvy;
            if Jrx>=OF
                Jrx=Jrx-OF;
                PX2=PX1-steplen;%向-X进给一个步长
                Ex0=abs(PX2-Xe);
            end
            if  Jry>=OF
                Jry=Jry-OF;
                PY2=PY1-steplen;%向-Y进给一个步长
                Ey0=abs(PY2-Ye);
            end
            if  (PX2==PX1&&PY2==PY1)
            else
                plot([PX1,PX2],[PY1,PY2],'y','linewidth',1);
                pause(100/speed);
            end
            PX1=PX2;
            PY1=PY2;
        end
   case 4 %第四象限
        while Ex0>0.5*steplen||Ey0>0.5*steplen
            Jrx=Jrx+Jvx;
            Jry=Jry+Jvy;
            if Jrx>=OF
                Jrx=Jrx-OF;
                PX2=PX1+steplen;   %向+X进给一个步长
                Ex0=abs(PX2-Xe);
            end
            if  Jry>=OF
                Jry=Jry-OF;
                PY2=PY1-steplen;   %向-Y进给一个步长
                Ey0=abs(PY2-Ye);
            end
            if  (PX2==PX1&&PY2==PY1)
            else
                plot([PX1,PX2],[PY1,PY2],'y','linewidth',1);
                pause(100/speed);
            end
            PX1=PX2;
            PY1=PY2;
        end
     end
end
if ruinmode==1 %逐点法
    X=X0;
    Y=Y0;
    F=0;
    Ex1=abs(X-Xe);
    Ey1=abs(Y-Ye);
    switch t
        case 1  %第一象限
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X+steplen],[Y,Y],'y','linewidth',1);
                    pause(speed/100);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X+steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y+steplen],'y','linewidth',1);
                    pause(100/speed);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y+steplen;
                    Ey1=abs(Y-Ye);
                end
            end
        case 2  %第二象限
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X-steplen],[Y,Y],'y','linewidth',1);
                    pause(100/speed);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X-steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y+steplen],'y,','linewidth',1');
                    pause(100/speed);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y+steplen;
                    Ey1=abs(Y-Ye);
                end
            end
       case 3  %第三象限
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X-steplen],[Y,Y],'y','linewidth',1);
                    pause(100/speed);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X-steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y-steplen],'y','linewidth',1);
                    pause(100/speed);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y-steplen;
                    Ey1=abs(Y-Ye);
                end
            end  
        case 4  %第四象限
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X+steplen],[Y,Y],'y','linewidth',1);
                    pause(100/speed);
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