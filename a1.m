function varargout = a1(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @a1_OpeningFcn, ...
                   'gui_OutputFcn',  @a1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

 function a1_OpeningFcn(hObject, eventdata, handles, varargin)%初始化
handles.output = hObject;
guidata(hObject, handles);
% loadlibrary('pulse','pulse');
% calllib('pulse','InitController');
% calllib('pulse','SetYdirReverse');
% calllib('pulse','SetXdirReverse');
global x01;
global y01;
global x02;
global y02;
global x03;
global y03;
global r;
global steps;%步长
global F;
global digit;%寄存器位数
global jvx;
global jvy;
global jrx;
global jry;
global xi;
global yj;
global xii;
global yjj;
global xiii;
global yjjj;
global o;
global stepslei;
global Ex;
global Ey;
global Ex3;
global Ey3;
global E;
global E3;
global oo;
global jrx3;
global jry3;
global pp;%控制圆弧插补时只在起点进行余数寄存器相关操作
global ppp;
global z;
global zy;
global zz;
global zzy;
global k;%寄存器实际位移的位数
global kk;
global s;
global jvxcun;
global jvycun;
global sss;
sss=0;
jvxcun=0;
jvycun=0;
s=0;
x01=0;
y01=0;
x02=0;
y02=0;
x03=0;
y03=0;
r=0;
steps=0;
F=0;
digit=0;
jrx3=0;
jry3=0;
xiii=0;
yjjj=0;
stepslei=0;
jvx=abs(y01-y03);
jvy=abs(x01-x03);
m=0;
mm=0;
o=0; %点了几下插补按钮
oo=0;
pp=0;
ppp=0;
z=0;
zy=0;
zz=0;
zzy=0;
k=0;
kk=0;

function varargout = a1_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

%逐点插补直线
%--------------------------PL3输入-------------------------------
function edit5_Callback(hObject, eventdata, handles)%起点X坐标
global x01;
x01=str2double(get(handles.edit5,'string'));
if x01~=fix(x01)
    warndlg('请输入整数','错误！');
    x01=0;
    set(handles.edit5,'string','0');
end

function edit6_Callback(hObject, eventdata, handles)%起点Y坐标
global y01;
y01=str2double(get(handles.edit6,'string'));
if y01~=fix(y01)
    warndlg('请输入整数','错误！');
    y01=0;
    set(handles.edit6,'string','0');
end

function edit7_Callback(hObject, eventdata, handles)%终点X坐标
global x02;
x02=str2double(get(handles.edit7,'string'));
if x02~=fix(x02)
    warndlg('请输入整数','错误！');
    x02=0;
    set(handles.edit7,'string','0');
end

function edit8_Callback(hObject, eventdata, handles)%终点Y坐标
global y02;
y02=str2double(get(handles.edit8,'string'));
if y02~=fix(y02)
    warndlg('请输入整数','错误！');
    y02=0;
    set(handles.edit8,'string','0');
end

%--------------------------PL3按钮--------------------------------

function pushbutton1_Callback(hObject, eventdata, handles)%画理论直线
global x01;
global y01;
global x02;
global y02;
xe=x02-x01;
ye=y02-y01;
k=(y02-y01)/(x02-x01);
if xe>0||ye>0||k<0&&k>-inf
    warndlg('请输入与X轴夹角为180-270度的直线','错误！');
end
line([x01,x02],[y01,y02]);
grid on;
set(gca,'YTickMode','manual','YTick',-10000:1:10000)
set(gca,'XTickMode','manual','XTick',-10000:1:10000)
axis equal;

function pushbutton2_Callback(hObject, eventdata, handles)%直线插补

global x01;
global y01;
global x02;
global y02;
global steps;
global F;
global xiii;
global yjjj;
global o;
global oo;
global stepslei;
xi=x01;
yj=y01;
xii=x01;
yjj=y01;
i=0;
xe=x02-x01;
ye=y02-y01;
k=(y02-y01)/(x02-x01);
stepsmax=abs(xe)+abs(ye);
E=xe+ye;
if xe>0||ye>0||k<0~=k==-inf
    warndlg('请输入与X轴夹角为180-270度的直线','错误！');
end
if k==0||k==-inf
    if k==0
        mode=get(handles.radiobutton11,'value')%单步插补
        if mode==1%下面进行单步插补编程
          steps=str2double(get(handles.edit16,'string'))%获取插补步数
          if stepslei>stepsmax
              stepslei=stepsmax;
          end
          while i~=steps
             if stepslei>=stepsmax
                 return
             end              
              if o~=0 %如果不是起点开始画
                  xii=xiii;
                  yjj=yjjj;    
              end
             xi=xii;%向-X走一步
             yj=yjj;
             xii=xii-1;
             yjj=yjj;
             line([xi,xii],[yj,yjj],'color','red','linewidth',3);             
if xi~=xii
    calllib('pulse','PulseOutX',1)
end
if yj~=yjj
    calllib('pulse','PulseOutY',1)
end
if yj~=yjj&&xi~=xii
    calllib('pulse','PulseOutXY',1)
end             
             i=i+1
             xiii=xii;
             yjjj=yjj;
             o=o+1;
             stepslei=stepslei+1;
          end
          if xiii==x02&&yjjj==y02
            warndlg('插补结束！','注意！');
            return
            end
      else mode==0%下面进行连续插补编程
           while i~=stepsmax
               xi=xii;
               yj=yjj;
               xii=xii-1;
               yjj=yjj;
               line([xi,xii],[yj,yjj],'color','red','linewidth',3);
               if xi~=xii
    calllib('pulse','PulseOutX',1)
end
if yj~=yjj
    calllib('pulse','PulseOutY',1)
end
if yj~=yjj&&xi~=xii
    calllib('pulse','PulseOutXY',1)
end
               i=i+1;
               pause(1);
           end
           warndlg('插补结束！','注意！');
       end  %if的end 
    else k==-inf
        mode=get(handles.radiobutton11,'value')%单步插补
        if mode==1%下面进行单步插补编程            
          steps=str2double(get(handles.edit16,'string'))%获取插补步数
          if steps>stepsmax
              steps=stepsmax;
          end
          while i~=steps
              if stepslei>=stepsmax
                 return
             end              
              if o~=0 %如果不是起点开始画
                  xii=xiii;
                  yjj=yjjj;    
              end
             xi=xii;%向-y走一步
             yj=yjj;
             xii=xii;
             yjj=yjj-1;
             line([xi,xii],[yj,yjj],'color','red','linewidth',3);
             if xi~=xii
    calllib('pulse','PulseOutX',1)
end
if yj~=yjj
    calllib('pulse','PulseOutY',1)
end
if yj~=yjj&&xi~=xii
    calllib('pulse','PulseOutXY',1)
end
             i=i+1;
             xiii=xii;
             yjjj=yjj;
             o=o+1;
             stepslei=stepslei+1;
          end
          if xiii==x02&&yjjj==y02
            warndlg('插补结束！','注意！');
            return
            end
      else mode==0%下面进行连续插补编程
           while i~=stepsmax
               xi=xii;
               yj=yjj;
               xii=xii;
               yjj=yjj-1;
               line([xi,xii],[yj,yjj],'color','red','linewidth',3);
               if xi~=xii
    calllib('pulse','PulseOutX',1)
end
if yj~=yjj
    calllib('pulse','PulseOutY',1)
end
if yj~=yjj&&xi~=xii
    calllib('pulse','PulseOutXY',1)
end
               i=i+1;
               pause(1);
           end
           warndlg('插补结束！','注意！');
        end
    end
else 
    mode=get(handles.radiobutton11,'value')%单步插补
    if mode==1%下面进行单步插补编程
          steps=str2double(get(handles.edit16,'string'))%获取插补步数
          if steps>stepsmax
              steps=stepsmax;
          end
          while i~=steps
              if stepslei>=stepsmax
                 return
             end              
              if o~=0 %如果不是起点开始画
                  xii=xiii;
                  yjj=yjjj;    
              end
                  if F>=0
                   xi=xii;
                   yj=yjj;
                   xii=xii-1;
                   yjj=yjj;
                   line([xi,xii],[yj,yjj],'color','red','linewidth',3);
                   if xi~=xii
    calllib('pulse','PulseOutX',1)
end
if yj~=yjj
    calllib('pulse','PulseOutY',1)
end
if yj~=yjj&&xi~=xii
    calllib('pulse','PulseOutXY',1)
end
                   F=F-abs(ye);
                   i=i+1;
                   stepslei=stepslei+1; 
                  else
                   if F<0
                   xi=xii;
                   yj=yjj;
                   xii=xii;
                   yjj=yjj-1;
                   line([xi,xii],[yj,yjj],'color','red','linewidth',3);
                   if xi~=xii
    calllib('pulse','PulseOutX',1)
end
if yj~=yjj
    calllib('pulse','PulseOutY',1)
end
if yj~=yjj&&xi~=xii
    calllib('pulse','PulseOutXY',1)
end
                   F=F+abs(xe);
                   i=i+1;
                   stepslei=stepslei+1;
                   end
                  end  
                   xiii=xii;
                   yjjj=yjj;
                   o=o+1;  
          end
          if xiii==x02&&yjjj==y02
            warndlg('插补结束！','注意！');
            return
          end
    end
    if mode==0
        while i~=stepsmax
                  if F>=0
                   xi=xii;
                   yj=yjj;
                   xii=xii-1;
                   yjj=yjj;
                   i=i+1;
                   line([xi,xii],[yj,yjj],'color','red','linewidth',3);
                   if xi~=xii
    calllib('pulse','PulseOutX',1)
end
if yj~=yjj
    calllib('pulse','PulseOutY',1)
end
if yj~=yjj&&xi~=xii
    calllib('pulse','PulseOutXY',1)
end
                   F=F-abs(ye)
                  else
                   if F<0
                   xi=xii;
                   yj=yjj;
                   xii=xii;
                   yjj=yjj-1;
                   i=i+1;
                   line([xi,xii],[yj,yjj],'color','red','linewidth',3);
                   if xi~=xii
    calllib('pulse','PulseOutX',1)
end
if yj~=yjj
    calllib('pulse','PulseOutY',1)
end
if yj~=yjj&&xi~=xii
    calllib('pulse','PulseOutXY',1)
end
                   F=F+abs(xe)
                   end
                  end 
             pause(1);
        end
          warndlg('插补结束！','注意！');
    end              
end

%-----------------------插补方式分割线-----------------------------

%数字积分法插补圆弧
%--------------------------DC23输入-------------------------------

function edit9_Callback(hObject, eventdata, handles)%起点X坐标
global x01;
x01=str2double(get(handles.edit9,'string'));
if x01~=fix(x01)
    warndlg('请输入整数','错误！');
    x01=0;
    set(handles.edit9,'string','0');
end

function edit10_Callback(hObject, eventdata, handles)%起点Y坐标
global y01;
y01=str2double(get(handles.edit10,'string'));
if y01~=fix(y01)
    warndlg('请输入整数','错误！');
    y01=0;
    set(handles.edit10,'string','0');
end

function edit11_Callback(hObject, eventdata, handles)%终点X坐标
global x02;
x02=str2double(get(handles.edit11,'string'));
if x02~=fix(x02)
    warndlg('请输入整数','错误！');
    x02=0;
    set(handles.edit11,'string','0');
end

function edit12_Callback(hObject, eventdata, handles)%终点Y坐标
global y02;
y02=str2double(get(handles.edit12,'string'));
if y02~=fix(y02)
    warndlg('请输入整数','错误！');
    y02=0;
    set(handles.edit12,'string','0');
end

function edit13_Callback(hObject, eventdata, handles)%圆心X坐标
global x03;
x03=str2double(get(handles.edit13,'string'));
if x03~=fix(x03)
    warndlg('请输入整数','错误！');
    x03=0;
    set(handles.edit13,'string','0');
end

function edit14_Callback(hObject, eventdata, handles)%圆心Y坐标
global y03;
y03=str2double(get(handles.edit14,'string'));
if y03~=fix(y03)
    warndlg('请输入整数','错误！');
    y03=0;
    set(handles.edit14,'string','0');
end

function edit15_Callback(hObject, eventdata, handles)%圆弧半径
global r;
r=str2double(get(handles.edit15,'string'));
if r~=fix(r)
    warndlg('请输入整数','错误！');
    r=0;
    set(handles.edit15,'string','0');
end

function edit17_Callback(hObject, eventdata, handles)%寄存器位数
global digit;
digit=str2double(get(handles.edit17,'string'));
if digit~=fix(digit)
    warndlg('请输入整数','错误！');
    digit=0;
    set(handles.edit17,'string','0');
end

%--------------------------DC23按钮-------------------------------

function pushbutton3_Callback(hObject, eventdata, handles)%画理论圆弧
global x01;
global y01;
global x02;
global y02;
global x03;
global y03;
global r;
A2=pi-atan(abs(y01-y03)/abs(x03-x01));
A3=pi+atan(abs(y02-y03)/abs(x02-x03));
if x01>x03||x02>x03
    warndlg('请输入半径与X轴夹角为90-270度的圆弧','错误！');
end
A=linspace(A2,A3,100);
r=((x01-x03).^2+(y01-y03).^2).^(0.5);
if r~=((x02-x03).^2+(y02-y03).^2).^(0.5)
    warndlg('请输入正确的圆心','错误！');
    return
end
set(handles.edit15,'string',r)
x=r*cos(A)+x03;
y=r*sin(A)+y03;
plot(x,y);
grid on;
set(gca,'YTickMode','manual','YTick',-10000:1:10000)
set(gca,'XTickMode','manual','XTick',-10000:1:10000)
axis equal;

function pushbutton4_Callback(hObject, eventdata, handles)%画圆弧插补
global x01;
global y01;
global x02;
global y02;
global x03;
global y03;
global jvx;
global jvy;
global jrx;
global jry;
global jvx3;
global jvy3;
global jrx3;
global jry3;
global steps;
global digit;
global r;
global o;
global oo;
global xiii;
global yjjj;
global xi;
global yj;
global xii;
global yjj;
global Ex;
global Ey;
global Ex3;
global Ey3;
global E;
global E3;
global pp;
global ppp;
global z;
global zy;
global zz;
global zzy;
global k;
global kk;
global s;
global jvxcun;
global jvycun;
global sss;
if o==0 %这个函数第一次执行
    xi=x01;
    yj=y01;
    xii=x01;
    yjj=y01;
    xe=abs(x02-x01);
    ye=abs(y02-y01);
    Ex=ceil(r-abs(x01-x03));
    Ey=ceil(abs(y01-y03));
    Ex3=ceil(r-abs(x02-x03));
    Ey3=ceil(abs(y02-y03));
    E=0;
    E3=0;
    jvx=abs(y01-y03);
    jvy=abs(x01-x03);
end
m=0;
mm=0;
i=0;
p=0;%连续插补死循环的循环次数
if digit==0
    warndlg('寄存器位数不能为0','错误！')
    return
end
way=get(handles.radiobutton5,'value')%是否采用余数寄存器判断
type=get(handles.radiobutton6,'value')%全加载还是半加载判断
fashion=get(handles.radiobutton10,'value')%是否采用左移规格化判断
if way==0 %采用余数寄存器
    if type==1&&pp==0 %采用半加载
        %此处进行半加载编程
        jrx=(2.^digit)/2;
        jry=(2.^digit)/2;
        pp=pp+1;
    end
    if type==0&&pp==0 %采用全加载
        jrx=2.^digit-1;
        jry=2.^digit-1;
        pp=pp+1;
    end
end
if fashion==1&&o==0 %采用左移规格化
    %此处进行采用左移规格化编程
    if 2.^digit<=2*r
        warndlg('寄存器容量应大于2倍圆弧半径，请先清除插补后再输入寄存器位数','错误！');
        set(handles.edit17,'string','0');
        return
    end
    if jvx<2.^(digit-2)&&jvy<2.^(digit-2)%X,Y寄存器均需要左移，错误，应实现有一个满足条件就不左移
    if jvx<2.^(digit-2) %X寄存器所寄存的数是否左移
        z=digit-2 %寄存器X最多左移的位数
        zz=1;
    end
    if jvy<2.^(digit-2) %Y寄存器所寄存的数是否左移
        zy=digit-2 %寄存器Y最多左移的位数
        zzy=1;
    end
        if jvx>jvy%比较两个寄存器所存数的大小，先移动较大者,先移动X
         while z~=0    
        if jvx<2.^zz %左移一位
           jvx=jvx*2
           jvy=jvy*2;
           k=k+1;
        end
           zz=zz+1;
           z=z-1;
           m=m+1;
         end
        end
        if jvy>jvx%比较两个寄存器所存数的大小，先移动较大者 
         while zy~=0    
        if jvy<2.^zzy %左移一位
           jvy=jvy*2
           jvx=jvx*2; 
           k=k+1;
        end
           zzy=zzy+1;
           zy=zy-1;
           mm=mm+1;
         end
        end
    end
    s=k;
end    
%下方开始进行不采用余数寄存器，不采用左移规格化的编程
mode=get(handles.radiobutton11,'value')%判断插补方式
if mode==1 %采用单步插补方式
    if xi==x02&&yj==y02%如果当点点已是终点，则结束
        warndlg('插补结束！','注意！');
        return
    end
    steps=str2double(get(handles.edit16,'string'))%获取插补步数
          while (1)
              if x01<=x03&&y01>=y03&&xi<=x03&&yj>=y03 %第二象限 
                  if o~=0 %如果不是从开始点画
                      jvx=jvxcun;
                      jvy=jvycun;
                  end
                  if o==0&&fashion~=1 %从起点开始且不采用左移规格化
                      jvx=abs(y01-y03);
                      jvy=abs(x01-x03);
                  end
                  jrx=jrx+jvx;
                  jry=jry+jvy;                  
                  if Ex==0
                      jvx=0;
                      jrx=0;
                  end
                  if jrx>2.^digit-1 %JRX溢出？
                      xii=xi-1;%向-X走一步
                      if fashion==0
                     jvy=jvy+1;
                      end
                     if fashion==1
                         jvy=jvy+2.^s
                     end
                     jrx=jrx-2.^digit;
                     Ex=Ex-1;
                  end

                  if Ey==0
                      jvy=0;
                      jry=0;
                  end
                  if jry>2.^digit-1 %JRY溢出？
                     yjj=yj-1;%向-Y走一步
                     if fashion==0
                     jvx=jvx-1;
                     end
                     if fashion==1
                     jvx=abs(jvx-2.^s);
                     end
                     jry=jry-2.^digit;
                     Ey=Ey-1;
                  end
                  line([xi,xii],[yj,yjj],'color','red','linewidth',3);
                  if xi~=xii
    calllib('pulse','PulseOutX',1)
end
if yj~=yjj
    calllib('pulse','PulseOutY',1)
end
if yj~=yjj&&xi~=xii
    calllib('pulse','PulseOutXY',1)
end
                  jvxcun=jvx;
                  jvycun=jvy;
                  xi=xii;
                  yj=yjj;
                  o=o+1;
                  xiii=xii;
                  yjjj=yjj;
                  i=i+1;
                  if i>steps
                      return
                  end
              end
                  if xi<=x03&&yj<=y03&&Ey==0 %开始第三象限
                      if oo==0
                      jvx3=abs(yj-y03);
                      jvy3=abs(xi-x03); 
                      end
                      m=0;
                      mm=0;
                      s=0;
if fashion==1&&oo==0 %采用左移规格化
    %此处进行采用左移规格化编程
    if 2.^digit<=2*r
        warndlg('寄存器容量应大于2倍圆弧半径，请先清除插补后再输入寄存器位数','错误！');
        set(handles.edit17,'string','0');
        return
    end
    if jvx3<2.^(digit-2)&&jvy3<2.^(digit-2)%X,Y寄存器均需要左移，错误，应实现有一个满足条件就不左移
    if jvx3<2.^(digit-2) %X寄存器所寄存的数是否左移
        z=digit-2 %寄存器X最多左移的位数
        zz=1;
    end
    if jvy3<2.^(digit-2) %Y寄存器所寄存的数是否左移
        zy=digit-2 %寄存器Y最多左移的位数
        zzy=1;
    end
        if jvx3>jvy3%比较两个寄存器所存数的大小，先移动较大者,先移动X
         while z~=0    
        if jvx3<2.^zz %左移一位
           jvx3=jvx3*2
           jvy3=jvy3*2; 
           kk=kk+1;
        end
           zz=zz+1;
           z=z-1;
           m=m+1;
         end
        end
        if jvy3>jvx3%比较两个寄存器所存数的大小，先移动较大者 
         while zy~=0    
        if jvy3<2.^zzy %左移一位
           jvy3=jvy3*2
           jvx3=jvx3*2; 
           kk=kk+1;
        end
           zzy=zzy+1;
           zy=zy-1;
           mm=mm+1;
         end
        end
    end
    sss=kk;
end                      
                      if type==1&&ppp==0 %采用半加载
                         jrx3=(2.^digit)/2;
                         jry3=(2.^digit)/2;
                         ppp=ppp+1;
                      end
                      if type==0&&way~=1&&ppp==0
                         jrx3=(2.^digit)-1;
                         jry3=(2.^digit)-1;
                         ppp=ppp+1;
                      end
                      if jvx3==0&&jvy3==0&&jrx3==0&&jry3==0
                          warndlg('请勿输入经过圆点的圆弧','错误！');
                      end
                  while (1)
                      if oo~=0 %如果不是从开始点画
                      jvxcun=jvx3;
                      jvycun=jvy3;
                  end
                  if oo==0&&fashion~=1 %从起点开始
                      jvx3=abs(yj-y03);
                      jvy3=abs(xi-x03);
                  end
                      jrx3=jrx3+jvx3;
                      jry3=jry3+jvy3;
                  if Ex3==0
                      jvx3=0;
                      jrx3=0;
                  end
                  if jrx3>2.^digit-1 %JRX溢出？
                      xii=xi+1;%向-X走一步
                     if fashion==0
                     jvy3=jvy3-1;
                      end
                     if fashion==1
                         jvy3=abs(jvy3-2.^sss);
                     end
                     jrx3=jrx3-2.^digit;
                     Ex3=Ex3-1;
                  end
                  if Ey3==0
                      jvy3=0;
                      jry3=0;
                  end
                  if jry3>2.^digit-1 %JRY溢出？
                     yjj=yj-1;%向-Y走一步
                     if fashion==0
                     jvx3=jvx3+1;
                     end
                     if fashion==1
                     jvx3=jvx3+2.^sss;
                     end
                     jry3=jry3-2.^digit;
                     Ey3=Ey3-1;
                  end
                  line([xi,xii],[yj,yjj],'color','red','linewidth',3);
                  if xi~=xii
    calllib('pulse','PulseOutX',1)
end
if yj~=yjj
    calllib('pulse','PulseOutY',1)
end
if yj~=yjj&&xi~=xii
    calllib('pulse','PulseOutXY',1)
end
                  jvxcun=jvx3;
                  jvycun=jvy3;
                  xi=xii;
                  yj=yjj; 
                  mm=mm+1;
                  E3=Ex3+Ey3;
                  oo=oo+1;
                  xiii=xii;
                  yjjj=yjj;
                  i=i+1;
                  if i>steps
                      return
                  end
                  end %第三象限在这里结束~
              end
              m=m+1;
              E=Ex+Ey;
              if i>=steps||E==0
                  return
              end        
          end %死循环在这里结束     
end
if mode==0 %采用连续插补方式
    if xi==x02&&yj==y02%如果当点点已是终点，则结束
        warndlg('插补结束！','注意！');
        return
    end
    while (1)
              if x01<=x03&&y01>=y03&&xi<=x03&&yj>=y03 %第二象限 
                  if o~=0 %如果不是从开始点画
                      jvx=jvxcun;
                      jvy=jvycun;
                  end
                  if o==0&&fashion~=1 %从起点开始且不采用左移规格化
                      jvx=abs(y01-y03);
                      jvy=abs(x01-x03);
                  end
                  jrx=jrx+jvx;
                  jry=jry+jvy;                  
                  if Ex==0
                      jvx=0;
                      jrx=0;
                  end
                  if jrx>2.^digit-1 %JRX溢出？
                      xii=xi-1;%向-X走一步
                      if fashion==0
                     jvy=jvy+1;
                      end
                     if fashion==1
                         jvy=jvy+2.^s
                     end
                     jrx=jrx-2.^digit;
                     Ex=Ex-1;
                  end

                  if Ey==0
                      jvy=0;
                      jry=0;
                  end
                  if jry>2.^digit-1 %JRY溢出？
                     yjj=yj-1;%向-Y走一步
                     if fashion==0
                     jvx=jvx-1;
                     end
                     if fashion==1
                     jvx=abs(jvx-2.^s);
                     end
                     jry=jry-2.^digit;
                     Ey=Ey-1;
                  end
                  line([xi,xii],[yj,yjj],'color','red','linewidth',3);
                  if xi~=xii
    calllib('pulse','PulseOutX',1)
end
if yj~=yjj
    calllib('pulse','PulseOutY',1)
end
if yj~=yjj&&xi~=xii
    calllib('pulse','PulseOutXY',1)
end
                  jvxcun=jvx;
                  jvycun=jvy;
                  xi=xii;
                  yj=yjj;
                  o=o+1;
                  xiii=xii;
                  yjjj=yjj;
                  i=i+1;
              end
                  if xi<=x03&&yj<=y03&&Ey==0 %开始第三象限
                      if oo==0
                      jvx3=abs(yj-y03);
                      jvy3=abs(xi-x03); 
                      end
                      m=0;
                      mm=0;
                      s=0;
if fashion==1&&oo==0 %采用左移规格化
    %此处进行采用左移规格化编程
    if 2.^digit<=2*r
        warndlg('寄存器容量应大于2倍圆弧半径，请先清除插补后再输入寄存器位数','错误！');
        set(handles.edit17,'string','0');
        return
    end
    if jvx3<2.^(digit-2)&&jvy3<2.^(digit-2)%X,Y寄存器均需要左移，错误，应实现有一个满足条件就不左移
    if jvx3<2.^(digit-2) %X寄存器所寄存的数是否左移
        z=digit-2 %寄存器X最多左移的位数
        zz=1;
    end
    if jvy3<2.^(digit-2) %Y寄存器所寄存的数是否左移
        zy=digit-2 %寄存器Y最多左移的位数
        zzy=1;
    end
        if jvx3>jvy3%比较两个寄存器所存数的大小，先移动较大者,先移动X
         while z~=0    
        if jvx3<2.^zz %左移一位
           jvx3=jvx3*2
           jvy3=jvy3*2; 
           kk=kk+1;
        end
           zz=zz+1;
           z=z-1;
           m=m+1;
         end
        end
        if jvy3>jvx3%比较两个寄存器所存数的大小，先移动较大者 
         while zy~=0    
        if jvy3<2.^zzy %左移一位
           jvy3=jvy3*2
           jvx3=jvx3*2; 
           kk=kk+1;
        end
           zzy=zzy+1;
           zy=zy-1;
           mm=mm+1;
         end
        end
    end
    sss=kk;
end                      
                      if type==1&&ppp==0 %采用半加载
                         jrx3=(2.^digit)/2;
                         jry3=(2.^digit)/2;
                         ppp=ppp+1;
                      end
                      if type==0&&way~=1&&ppp==0
                         jrx3=(2.^digit)-1;
                         jry3=(2.^digit)-1;
                         ppp=ppp+1;
                      end
                      if jvx3==0&&jvy3==0&&jrx3==0&&jry3==0
                          warndlg('请勿输入经过圆点的圆弧','错误！');
                      end
                  while (1)
                      if oo~=0 %如果不是从开始点画
                      jvxcun=jvx3;
                      jvycun=jvy3;
                  end
                  if oo==0&&fashion~=1 %从起点开始
                      jvx3=abs(yj-y03);
                      jvy3=abs(xi-x03);
                  end
                      jrx3=jrx3+jvx3;
                      jry3=jry3+jvy3;
                  if Ex3==0
                      jvx3=0;
                      jrx3=0;
                  end
                  if jrx3>2.^digit-1 %JRX溢出？
                      xii=xi+1;%向-X走一步
                     if fashion==0
                     jvy3=jvy3-1;
                      end
                     if fashion==1
                         jvy3=abs(jvy3-2.^sss);
                     end
                     jrx3=jrx3-2.^digit;
                     Ex3=Ex3-1;
                  end
                  if Ey3==0
                      jvy3=0;
                      jry3=0;
                  end
                  if jry3>2.^digit-1 %JRY溢出？
                     yjj=yj-1;%向-Y走一步
                     if fashion==0
                     jvx3=jvx3+1;
                     end
                     if fashion==1
                     jvx3=jvx3+2.^sss;
                     end
                     jry3=jry3-2.^digit;
                     Ey3=Ey3-1;
                  end
                  line([xi,xii],[yj,yjj],'color','red','linewidth',3);
                  if xi~=xii
    calllib('pulse','PulseOutX',1)
end
if yj~=yjj
    calllib('pulse','PulseOutY',1)
end
if yj~=yjj&&xi~=xii
    calllib('pulse','PulseOutXY',1)
end
                  jvxcun=jvx3;
                  jvycun=jvy3;
                  xi=xii;
                  yj=yjj; 
                  mm=mm+1;
                  E3=Ex3+Ey3;
                  oo=oo+1;
                  xiii=xii;
                  yjjj=yjj;
                  i=i+1;
                  if xi==x02&&yj==y02%如果当点点已是终点，则结束
                  warndlg('插补结束！','注意！');
                  return
                  end
                  if E3==0
                      return
                  end
                  pause(1);
                  end %第三象限在这里结束~
              end
              m=m+1;
              E=Ex+Ey;
              if E==0
                  return
              end
              pause(1);
          end %死循环在这里结束  
end

%------------------------插补方式及步长----------------------------

function edit16_Callback(hObject, eventdata, handles)%步长

%--------------------------主界面按钮------------------------------

function pushbutton6_Callback(hObject, eventdata, handles)%清除插补
cla reset
calllib('pulse','InitController');
global steps;
global F;
global o
global stepslei
global jvx;
global jvy;
global jrx;
global jry;
global jvx3;
global jvy3;
global jrx3;
global jry3;
global Ex;
global Ey;
global Ex3;
global Ey3;
global E;
global E3;
global oo;
global pp;
global ppp;
global z;
global zy;
global zz;
global zzy;
global k;
global kk;
global s;
global jvxcun;
global jvycun;
global sss;
sss=0;
jvxcun=0;
jvycun=0;
stepslei=0;
steps=0;
F=0;
o=0;
oo=0;
jvx=0;
jvy=0;
jrx=0;
jry=0;
jvx3=0;
jvy3=0;
jrx3=0;
jry3=0;
Ex=0;
Ey=0;
Ex3=0;
Ey3=0;
E=0;
E3=0;
pp=0;
ppp=0;
z=0;
zy=0;
zz=0;
zzy=0;
k=0;
kk=0;
s=0;

function pushbutton7_Callback(hObject, eventdata, handles)%关闭界面
close
calllib('pulse','CloseController');
unloadlibrary pulse;

function pushbutton8_Callback(hObject, eventdata, handles)%清除数据
global x01;
global y01;
global x02;
global y02;
global x03;
global y03;
set(handles.edit5,'string','0');
set(handles.edit6,'string','0');
set(handles.edit7,'string','0');
set(handles.edit8,'string','0');
set(handles.edit9,'string','0');
set(handles.edit10,'string','0');
set(handles.edit11,'string','0');
set(handles.edit12,'string','0');
set(handles.edit13,'string','0');
set(handles.edit14,'string','0');
set(handles.edit15,'string','0');
set(handles.edit16,'string','0');
set(handles.edit17,'string','0');
x01=0;
y01=0;
x02=0;
y02=0;
x03=0;
y03=0;

%-----------------------------结束---------------------------------

function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit1_Callback(hObject, eventdata, ~)

function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)

function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
