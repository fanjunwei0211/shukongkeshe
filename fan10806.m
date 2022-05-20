function varargout = fan10806(varargin)
% FAN10806 MATLAB code for fan10806.fig
%      FAN10806, by itself, creates a new FAN10806 or raises the existing
%      singleton*.
%
%      H = FAN10806 returns the handle to a new FAN10806 or the handle to
%      the existing singleton*.
%
%      FAN10806('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FAN10806.M with the given input arguments.
%
%      FAN10806('Property','Value',...) creates a new FAN10806 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fan10806_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fan10806_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fan10806

% Last Modified by GUIDE v2.5 20-May-2022 20:03:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fan10806_OpeningFcn, ...
                   'gui_OutputFcn',  @fan10806_OutputFcn, ...
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
% End initialization code - DO NOT EDIT
X0=0;
Y0=0;
Xe=0;
Ye=0;
regbit=3;  %寄存器位数 默认3
steplen=1; %进给步长   默认1
speed=50;  %pause(speed/100)
ruinmode=1;    %插补模式选择0-->DDA   1-->逐点比较法
loadmode=0;    %加载模式选择0-->0     2-->半加载     3-->全加载
leftmode=0;    %左移规格化  0-->关闭  1-->开启
stepcnt=0;     %步进插补控制量 0-->初始化  1-->初始化完成     
picturecnt=0;


% --- Executes just before fan10806 is made visible.
function fan10806_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fan10806 (see VARARGIN)

% Choose default command line output for fan10806
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fan10806 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fan10806_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --------------------------------------------------------------------
function type_Callback(hObject, eventdata, handles)
% hObject    handle to type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function drawline_Callback(hObject, eventdata, handles)
% hObject    handle to drawline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.dline,'visible','on');
set(handles.dline,'position',[113 2.5 74.2 31.5]);
set(handles.dcircle,'visible','off');
set(handles.dcircle,'position',[0 0 0 0]);

% --------------------------------------------------------------------
function drawcircle_Callback(hObject, eventdata, handles)
% hObject    handle to drawcircle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.dline,'visible','off');
set(handles.dline,'position',[0 0 0 0]);
set(handles.dcircle,'visible','on');
set(handles.dcircle,'position',[113 2.5 74.2 31.5]);


function steplen_Callback(hObject, eventdata, handles)
% hObject    handle to steplen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global steplen;
steplen=str2double(get(handles.steplen,'string'));

% Hints: get(hObject,'String') returns contents of steplen as text
%        str2double(get(hObject,'String')) returns contents of steplen as a double


% --- Executes during object creation, after setting all properties.
function steplen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to steplen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function regbit_Callback(hObject, eventdata, handles)
% hObject    handle to regbit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global regbit;
regbit=str2double(get(handles.regbit,'string'));

% Hints: get(hObject,'String') returns contents of regbit as text
%        str2double(get(hObject,'String')) returns contents of regbit as a double


% --- Executes during object creation, after setting all properties.
function regbit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to regbit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1); %指定需要清空的坐标轴
cla reset;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function speedslider_Callback(hObject, eventdata, handles)
% hObject    handle to speedslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global speed;
speed=get(handles.speedslider,'value');
set(handles.speed,'string',num2str(speed));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function speedslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speedslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function speed_Callback(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global speed;
speed=str2double(get(handles.speed,'string'));
set(handles.speedslider,'value',speed);
% Hints: get(hObject,'String') returns contents of speed as text
%        str2double(get(hObject,'String')) returns contents of speed as a double


% --- Executes during object creation, after setting all properties.
function speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global stepcnt;
set(handles.speed,'string','0');
set(handles.X0,'string','0');
set(handles.Xe,'string','0');
set(handles.Y0,'string','0');
set(handles.Ye,'string','0');
set(handles.steplen,'string','0');
set(handles.regbit,'string','0');
set(handles.speedslider,'value',0);
stepcnt=0;

% --- Executes on button press in leftmove.
function leftmove_Callback(hObject, eventdata, handles)
% hObject    handle to leftmove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global leftmode;
if get(handles.leftmove,'value')
    leftmode=1;
else
    leftmode=0;
end

% Hint: get(hObject,'Value') returns toggle state of leftmove



function X0_Callback(hObject, eventdata, handles)
% hObject    handle to X0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X0;
X0=str2double(get(handles.X0,'String'));

% Hints: get(hObject,'String') returns contents of X0 as text
%        str2double(get(hObject,'String')) returns contents of X0 as a double


% --- Executes during object creation, after setting all properties.
function X0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in theline.
function theline_Callback(hObject, eventdata, handles)
% hObject    handle to theline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X0 Y0 Xe Ye;
axes(handles.axes1);
if (isnan(X0)||isnan(Y0)||isnan(Xe)||isnan(Ye))
    warndlg('请输入数字','警告','on');
end
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


function Y0_Callback(hObject, eventdata, handles)
% hObject    handle to Y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Y0;
Y0=str2double(get(handles.Y0,'String'));

% Hints: get(hObject,'String') returns contents of Y0 as text
%        str2double(get(hObject,'String')) returns contents of Y0 as a double


% --- Executes during object creation, after setting all properties.
function Y0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Xe_Callback(hObject, eventdata, handles)
% hObject    handle to Xe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Xe;
Xe=str2double(get(handles.Xe,'String'));

% Hints: get(hObject,'String') returns contents of Xe as text
%        str2double(get(hObject,'String')) returns contents of Xe as a double


% --- Executes during object creation, after setting all properties.
function Xe_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ye_Callback(hObject, eventdata, handles)
% hObject    handle to Ye (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ye;
Ye=str2double(get(handles.Ye,'String'));
% Hints: get(hObject,'String') returns contents of Ye as text
%        str2double(get(hObject,'String')) returns contents of Ye as a double


% --- Executes during object creation, after setting all properties.
function Ye_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ye (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in stepline.
function stepline_Callback(hObject, eventdata, handles)
% hObject    handle to stepline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global X0 Y0 Xe Ye regbit steplen speed ruinmode loadmode leftmode;
global X0 Y0 Xe Ye regbit steplen speed ruinmode loadmode leftmode stepcnt;
global PX1 PY1 PX2 PY2 Jvx Jvy Jrx Jry Ex0 Ey0 OF X Y F Ex1 Ey1;
cnt=0;
axes(handles.axes1); 
if stepcnt==0
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
    OF=2^regbit;
    X=X0;
    Y=Y0;
    F=0;
    if ruinmode==0 %DDA法
        if loadmode==1
            Jrx=OF/2;
            Jry=OF/2;
        end
        if loadmode==2
            Jrx=OF-1;
            Jry=OF-1;
        end
        if leftmode==1
            while Jvx<OF/2&&Jvy<OF/2
            Jvx=Jvx*2;
            Jvy=Jvy*2;
            end
        end
    end
    stepcnt=1;
end

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
if ruinmode==0 %DDA法
    while cnt==0
        switch t
            case 1 %第一象限
                if Ex0>0.5*steplen||Ey0>0.5*steplen
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
                        cnt=1;
                    end
                    PX1=PX2;
                    PY1=PY2;
                else
                    errordlg('插补完成');
                    stepcnt=0;
                    cnt=1;
                end
            case 2 %第二象限
                if Ex0>0.5*steplen||Ey0>0.5*steplen
                    Jrx=Jrx+Jvx;
                    Jry=Jry+Jvy;
                    pause(1/speed);
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
                        plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                        cnt=1;
                    end
                    PX1=PX2;
                    PY1=PY2;
                else
                    errordlg('插补完成');
                    stepcnt=0;
                    cnt=1;
                end
             case 3 %第三象限
                if Ex0>0.5*steplen||Ey0>0.5*steplen
                    Jrx=Jrx+Jvx;
                    Jry=Jry+Jvy;
                    pause(1/speed);
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
                        plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                        cnt=1;
                    end
                    PX1=PX2;
                    PY1=PY2;
                else
                    errordlg('插补完成');
                    stepcnt=0;
                    cnt=1;
                end
           case 4 %第四象限
                if Ex0>0.5*steplen||Ey0>0.5*steplen
                    Jrx=Jrx+Jvx;
                    Jry=Jry+Jvy;
                    pause(1/speed);
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
                        plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                        cnt=1;
                    end
                    PX1=PX2;
                    PY1=PY2;
                else
                    errordlg('插补完成');
                    stepcnt=0;
                    cnt=1;
                end
        end
    end

end
if ruinmode==1 %逐点法
    Ex1=abs(X-Xe);
    Ey1=abs(Y-Ye);
    switch t
        case 1  %第一象限
            if Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X+steplen],[Y,Y],'r','linewidth',1);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X+steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y+steplen],'r','linewidth',1);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y+steplen;
                    Ey1=abs(Y-Ye);
                end
            else
                errordlg('插补完成');
                stepcnt=0;
            end
        case 2  %第二象限
            if Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X-steplen],[Y,Y],'r','linewidth',1);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X-steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y+steplen],'r','linewidth',1');
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y+steplen;
                    Ey1=abs(Y-Ye);
                end
            else
                errordlg('插补完成');
                stepcnt=0;
            end
       case 3  %第三象限
            if Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X-steplen],[Y,Y],'r','linewidth',1);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X-steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y-steplen],'r','linewidth',1);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y-steplen;
                    Ey1=abs(Y-Ye);
                end
            else
                errordlg('插补完成');
                stepcnt=0;
            end  
        case 4  %第四象限
            if Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X+steplen],[Y,Y],'r','linewidth',1);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X+steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y-steplen],'r','linewidth',1);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y-steplen;
                    Ey1=abs(Y-Ye);
                end
            else
                errordlg('插补完成');
                stepcnt=0;
            end  
    end
end


% --- Executes on button press in contiline.
function contiline_Callback(hObject, eventdata, handles)
% hObject    handle to contiline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X0 Y0 Xe Ye regbit steplen speed ruinmode loadmode leftmode;
axes(handles.axes1); 
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
OF=2^regbit;
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


if ruinmode==0 %DDA法
    if loadmode==1
        Jrx=OF/2;
        Jry=OF/2;
    end
    if loadmode==2
        Jrx=OF-1;
        Jry=OF-1;
    end
    if leftmode==1
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
            pause(1/speed);
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
                
            end
            PX1=PX2;
            PY1=PY2;
        end
    case 2 %第二象限
        while Ex0>0.5*steplen||Ey0>0.5*steplen
            Jrx=Jrx+Jvx;
            Jry=Jry+Jvy;
            pause(1/speed);
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
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                
            end
            PX1=PX2;
            PY1=PY2;
        end
     case 3 %第三象限
        while Ex0>0.5*steplen||Ey0>0.5*steplen
            Jrx=Jrx+Jvx;
            Jry=Jry+Jvy;
            pause(1/speed);
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
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
                
            end
            PX1=PX2;
            PY1=PY2;
        end
   case 4 %第四象限
        while Ex0>0.5*steplen||Ey0>0.5*steplen
            Jrx=Jrx+Jvx;
            Jry=Jry+Jvy;
            pause(1/speed);
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
                plot([PX1,PX2],[PY1,PY2],'b','linewidth',1);
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
                    plot([X,X+steplen],[Y,Y],'r','linewidth',1);
                    pause(1/speed);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X+steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y+steplen],'r','linewidth',1);
                    pause(1/speed);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y+steplen;
                    Ey1=abs(Y-Ye);
                end
            end
        case 2  %第二象限
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X-steplen],[Y,Y],'r','linewidth',1);
                    pause(1/speed);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X-steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y+steplen],'r','linewidth',1');
                    pause(1/speed);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y+steplen;
                    Ey1=abs(Y-Ye);
                end
            end
       case 3  %第三象限
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X-steplen],[Y,Y],'r','linewidth',1);
                    pause(1/speed);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X-steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y-steplen],'r','linewidth',1);
                    pause(1/speed);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y-steplen;
                    Ey1=abs(Y-Ye);
                end
            end  
        case 4  %第四象限
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X+steplen],[Y,Y],'r','linewidth',1);
                    pause(1/speed);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X+steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y-steplen],'r','linewidth',1);
                    pause(1/speed);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y-steplen;
                    Ey1=abs(Y-Ye);
                end
            end  
    end
end


% --------------------------------------------------------------------
function choice_Callback(hObject, eventdata, handles)
% hObject    handle to choice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(fan10806);

% --------------------------------------------------------------------
function savefig_Callback(hObject, eventdata, handles)
% hObject    handle to savefig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global picturecnt;
picturecnt  = picturecnt+1;
axes(handles.axes1);
% frame = getframe; % 获得当前坐标区的内容
% im = frame.cdata; % 获得图像数据
% imwrite(im,'modified_a.png'); 
h = figure('visible','off');
new_axes = copyobj(handles.axes1,h);%axes1表示坐标系对象
set(new_axes,'Units','normalized','Position',[0.1 0.1 0.8 0.8]);
[filename, pathname] = uiputfile({'*.png';'*.bmp';'*.jpg'},'图片保存为');
if filename ~= 0
    file = strcat(pathname,filename);
    saveas(h,file);
    msgbox('图像已成功保存','确认！','warn');
else
    msgbox('操作已取消','确认','warn');
end

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to speedslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speedslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in noload.
function noload_Callback(hObject, eventdata, handles)
% hObject    handle to noload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global loadmode;
if get(handles.noload,'value')
    loadmode = 0;
end



% Hint: get(hObject,'Value') returns toggle state of noload


% --- Executes on button press in halfload.
function halfload_Callback(hObject, eventdata, handles)
% hObject    handle to halfload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global loadmode;
if get(handles.halfload,'value')
    loadmode = 1;
end

% Hint: get(hObject,'Value') returns toggle state of halfload


% --- Executes on button press in fullload.
function fullload_Callback(hObject, eventdata, handles)
% hObject    handle to fullload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global loadmode;
if get(handles.fullload,'value')
    loadmode = 2;
end

% Hint: get(hObject,'Value') returns toggle state of fullload


% --- Executes on button press in zhudian.
function zhudian_Callback(hObject, eventdata, handles)
% hObject    handle to zhudian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ruinmode;
if get(handles.zhudian,'value')
    ruinmode = 1;
end
% Hint: get(hObject,'Value') returns toggle state of zhudian


% --- Executes on button press in dda.
function dda_Callback(hObject, eventdata, handles)
% hObject    handle to dda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ruinmode;
if get(handles.dda,'value')
    ruinmode = 0;
end
% Hint: get(hObject,'Value') returns toggle state of dda


% --- Executes during object creation, after setting all properties.
function stepline_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stepline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function Xr0_Callback(hObject, eventdata, handles)
% hObject    handle to Xr0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Xr0 as text
%        str2double(get(hObject,'String')) returns contents of Xr0 as a double


% --- Executes during object creation, after setting all properties.
function Xr0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xr0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in thecircle.
function thecircle_Callback(hObject, eventdata, handles)
% hObject    handle to thecircle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in stepcircle.
function stepcircle_Callback(hObject, eventdata, handles)
% hObject    handle to stepcircle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in contcircle.
function contcircle_Callback(hObject, eventdata, handles)
% hObject    handle to contcircle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Yr0_Callback(hObject, eventdata, handles)
% hObject    handle to Yr0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Yr0 as text
%        str2double(get(hObject,'String')) returns contents of Yr0 as a double


% --- Executes during object creation, after setting all properties.
function Yr0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Yr0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Xre_Callback(hObject, eventdata, handles)
% hObject    handle to Xre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Xre as text
%        str2double(get(hObject,'String')) returns contents of Xre as a double


% --- Executes during object creation, after setting all properties.
function Xre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Yre_Callback(hObject, eventdata, handles)
% hObject    handle to Yre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Yre as text
%        str2double(get(hObject,'String')) returns contents of Yre as a double


% --- Executes during object creation, after setting all properties.
function Yre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Yre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Xr_Callback(hObject, eventdata, handles)
% hObject    handle to Xr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Xr as text
%        str2double(get(hObject,'String')) returns contents of Xr as a double


% --- Executes during object creation, after setting all properties.
function Xr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Yr_Callback(hObject, eventdata, handles)
% hObject    handle to Yr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Yr as text
%        str2double(get(hObject,'String')) returns contents of Yr as a double


% --- Executes during object creation, after setting all properties.
function Yr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Yr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CR_Callback(hObject, eventdata, handles)
% hObject    handle to CR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CR as text
%        str2double(get(hObject,'String')) returns contents of CR as a double


% --- Executes during object creation, after setting all properties.
function CR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in anticlockwise.
function anticlockwise_Callback(hObject, eventdata, handles)
% hObject    handle to anticlockwise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global clockw;
clockw = 0;
set(handles.clockwise,'value',0);
set(handles.anticlockwise,'value',1);
% Hint: get(hObject,'Value') returns toggle state of anticlockwise


% --- Executes on button press in clockwise.
function clockwise_Callback(hObject, eventdata, handles)
% hObject    handle to clockwise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global clockw;
clockw = 1;
set(handles.clockwise,'value',1);
set(handles.anticlockwise,'value',0);
% Hint: get(hObject,'Value') returns toggle state of clockwise


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over zhudian.
function zhudian_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to zhudian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on clockwise and none of its controls.
function clockwise_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to clockwise (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
