function varargout = wan051810402_6(varargin)
% WAN051810402_6 MATLAB code for wan051810402_6.fig
%      WAN051810402_6, by itself, creates a new WAN051810402_6 or raises the existing
%      singleton*.
%
%      H = WAN051810402_6 returns the handle to a new WAN051810402_6 or the handle to
%      the existing singleton*.
%
%      WAN051810402_6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WAN051810402_6.M with the given input arguments.
%
%      WAN051810402_6('Property','Value',...) creates a new WAN051810402_6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before wan051810402_6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to wan051810402_6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help wan051810402_6

% Last Modified by GUIDE v2.5 20-May-2022 15:23:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wan051810402_6_OpeningFcn, ...
                   'gui_OutputFcn',  @wan051810402_6_OutputFcn, ...
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




% --- Executes just before wan051810402_6 is made visible.
function wan051810402_6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wan051810402_6 (see VARARGIN)
% Choose default command line output for wan051810402_6
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes wan051810402_6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = wan051810402_6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function X0_Callback(hObject, eventdata, handles)
% hObject    handle to X0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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



function Y0_Callback(hObject, eventdata, handles)
% hObject    handle to Y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes on button press in line.
function line_Callback(hObject, eventdata, handles)
% hObject    handle to line (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X0 Y0 Xe Ye u1;
axes(handles.axes1);
get(handles.X0,'string');
X0=str2double(get(handles.X0,'string'));
get(handles.Y0,'string');
Y0=str2double(get(handles.Y0,'string'));
get(handles.Xe,'string');
Xe=str2double(get(handles.Xe,'string'));
get(handles.Ye,'string');
Ye=str2double(get(handles.Ye,'string'));
if (isnan(X0)||isnan(Y0)||isnan(Xe)||isnan(Ye))
    warndlg('请输入数字','警告','on');
end
if (isempty(X0)||isempty(Y0)||isempty(Xe)||isempty(Ye))
     warndlg('请输入数字','警告','on');
end
if ((X0==Xe)&&(Y0==Ye))
     warndlg('首尾坐标相同，输入无效，请重新输入','警告','on');
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
   grid on;
   hold on;

axis equal;


% --- Executes on button press in lineonestepIP.
function lineonestepIP_Callback(hObject, eventdata, handles)
% hObject    handle to lineonestepIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X0 Xe Y0 Ye Regbit steplen;
get(handles.X0,'string');
X0=str2double(get(handles.X0,'string'));
get(handles.Y0,'string');
Y0=str2double(get(handles.Y0,'string'));
get(handles.Xe,'string');
Xe=str2double(get(handles.Xe,'string'));
get(handles.Ye,'string');
Ye=str2double(get(handles.Ye,'string'));
get(handles.Regbit,'string');
Regbit=str2double(get(handles.Regbit,'string'));
get(handles.steplen,'string');
steplen=str2double(get(handles.steplen,'string'));
global u1 PX1 PY1 PX2 PY2 Jvx1 Jrx1 Jvy1 Jry1 Ex0 Ey0 OF xe ye F1;
k=0;
axes(handles.axes1)
if u1==0
    PX1=X0;
    PY1=Y0;
    PX2=X0;
    PY2=Y0;
    Jvx1=abs(X0-Xe);
    Jvy1=abs(Y0-Ye);
    Jrx1=0;
    Jry1=0;
    Ex0=abs(PX1-Xe);
    Ey0=abs(PY1-Ye);
    OF=2^Regbit;
    u1=u1+1;
    if get(handles.DDA,'value')
        way=0;
    else
        way=1;
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
    if get(handles.halfload,'value')
        Jrx1=OF/2;
        Jry1=OF/2;
    end
    if get(handles.fullload,'value')
        Jrx1=OF-1;
        Jry1=OF-1;
    end
    if get(handles.leftmove,'value')
        while Jvx1<OF/2&&Jvy1<OF/2
            Jvx1=OF*2;
            Jvy1=OF*2;
        end
    end
    if way==0 %DDA法
        while k==0  %判断是否产生位移
            switch t
                case 1 %第一象限
                    if Ex0>0.5*steplen||Ey0>0.5*steplen
                        Jrx1=Jrx1+Jvx1;
                        Jry1=Jry1+Jvy1;
                        if Jrx1>=OF
                            Jrx1=Jrx1-OF;
                            PX2=PX1+steplen;%向+X进给一个步长
                            Ex0=abs(PX2-Xe);
                        end
                        if  Jry1>=OF
                            Jry1=Jry1-OF;
                            PY2=PY1+steplen;%向+Y进给一个步长
                            Ey0=abs(PY2-Ye);
                        end
                        if  (PX2==PX1&&PY2==PY1)
                        else
                            plot([PX1,PX2],[PY1,PY2],'red');
                            k=1;
                        end
                        PX1=PX2;
                        PY1=PY2;
                    else
                        k=1;
                    end
                    if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    end
                case 2 %第二象限
                    if Ex0>0.5*steplen||Ey0>0.5*steplen
                        Jrx1=Jrx1+Jvx1;
                        Jry1=Jry1+Jvy1;
                        if Jrx1>=OF
                            Jrx1=Jrx1-OF;
                            PX2=PX1-steplen;%向-X进给一个步长
                            Ex0=abs(PX2-Xe);
                        end
                        if  Jry1>=OF
                            Jry1=Jry1-OF;
                            PY2=PY1+steplen;%向+Y进给一个步长
                            Ey0=abs(PY2-Ye);
                        end
                        if  (PX2==PX1&&PY2==PY1)
                        else
                            plot([PX1,PX2],[PY1,PY2],'red');
                            k=1;
                        end
                        PX1=PX2;
                        PY1=PY2;
                    else
                        k=1;
                    end
                    if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    end
                case 3 %第三象限
                    if Ex0>0.5*steplen||Ey0>0.5*steplen
                        Jrx1=Jrx1+Jvx1;
                        Jry1=Jry1+Jvy1;
                        if Jrx1>=OF
                            Jrx1=Jrx1-OF;
                            PX2=PX1-steplen;%向-X进给一个步长
                            Ex0=abs(PX2-Xe);
                        end
                        if  Jry1>=OF
                            Jry1=Jry1-OF;
                            PY2=PY1-steplen;%向-Y进给一个步长
                            Ey0=abs(PY2-Ye);
                        end
                        if  (PX2==PX1&&PY2==PY1)
                        else
                            plot([PX1,PX2],[PY1,PY2],'red');
                            k=1;
                        end
                        PX1=PX2;
                        PY1=PY2;
                    else
                        k=1;
                    end
                    if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    end
                case 4 %第四象限
                    if Ex0>0.5*steplen||Ey0>0.5*steplen
                        Jrx1=Jrx1+Jvx1;
                        Jry1=Jry1+Jvy1;
                        if Jrx1>=OF
                            Jrx1=Jrx-OF;
                            PX2=PX1+steplen;   %向+X进给一个步长
                            Ex0=abs(PX2-Xe);
                        end
                        if  Jry1>=OF
                            Jry1=Jry1-OF;
                            PY2=PY1-steplen;   %向-Y进给一个步长
                            Ey0=abs(PY2-Ye);
                        end
                        if  (PX2==PX1&&PY2==PY1)
                        else
                            plot([PX1,PX2],[PY1,PY2],'red');
                            k=1;
                        end
                        PX1=PX2;
                        PY1=PY2;
                    else
                        k=1;
                    end
                    if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    end
            end
        end
    end
    if way==1  %逐点法
        xe=X0;
        ye=Y0;
        F1=0;
        Ex0=abs(xe-Xe);
        Ey0=abs(ye-Ye);
        switch t
            case 1  %第一象限
                if Ex0>0.5*steplen||Ey0>0.5*steplen
                    if F1>=0
                        plot([xe,xe+steplen],[ye,ye],'red');
                        F1=F1-abs(Ye-Y0)*steplen;
                        xe=xe+steplen;
                        Ex0=abs(xe-Xe);
                    else
                        plot([xe,xe],[ye,ye+steplen],'red');
                        F1=F1+abs(Xe-X0)*steplen;
                        ye=ye+steplen;
                        Ey0=abs(ye-Ye);
                    end
                end
                if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    u1=0;
                end
            case 2  %第二象限
                if Ex0>0.5*steplen||Ey0>0.5*steplen
                    if F1>=0
                        plot([xe,xe-steplen],[ye,ye],'red');
                        F1=F1-abs(Ye-Y0)*steplen;
                        xe=xe-steplen;
                        Ex1=abs(xe-Xe);
                    else
                        plot([xe,xe],[ye,ye+steplen],'red');
                        F1=F1+abs(Xe-X0)*steplen;
                        ye=ye+steplen;
                        Ey1=abs(ye-Ye);
                    end
                end
                if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    u1=0;
                end
            case 3  %第三象限
                if Ex0>0.5*steplen||Ey0>0.5*steplen
                    if F1>=0
                        plot([xe,xe-steplen],[ye,ye],'red');
                        F1=F1-abs(Ye-Y0)*steplen;
                        xe=xe-steplen;
                        Ex0=abs(xe-Xe);
                    else
                        plot([xe,xe],[ye,ye-steplen],'red');
                        F1=F1+abs(Xe-X0)*steplen;
                        ye=ye-steplen;
                        Ey0=abs(ye-Ye);
                    end
                end
                if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    u1=0;
                end
            case 4  %第四象限
                if Ex0>0.5*steplen||Ey0>0.5*steplen
                    if F1>=0
                        plot([xe,xe+steplen],[ye,ye],'red');
                        F1=F1-abs(Ye-Y0)*steplen;
                        xe=xe+steplen;
                        Ex0=abs(xe-Xe);
                    else
                        plot([xe,xe],[ye,ye-steplen],'red');
                        F1=F1+abs(Xe-X0)*steplen;
                        ye=ye-steplen;
                        Ey0=abs(ye-Ye);
                    end
                end
                if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    u1=0;
                end
        end
    end
else
    if get(handles.DDA,'value')
        way=0;
    else
        way=1;
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
    if way==0 %DDA法
        while k==0  %判断是否产生位移
            switch t
                case 1 %第一象限
                    if Ex0>0.5*steplen||Ey0>0.5*steplen
                        Jrx1=Jrx1+Jvx1;
                        Jry1=Jry1+Jvy1;
                        if Jrx1>=OF
                            Jrx1=Jrx1-OF;
                            PX2=PX1+steplen;%向+X进给一个步长
                            Ex0=abs(PX2-Xe);
                        end
                        if  Jry1>=OF
                            Jry1=Jry1-OF;
                            PY2=PY1+steplen;%向+Y进给一个步长
                            Ey0=abs(PY2-Ye);
                        end
                        if  (PX2==PX1&&PY2==PY1)
                        else
                            plot([PX1,PX2],[PY1,PY2],'red');
                            k=1;
                        end
                        PX1=PX2;
                        PY1=PY2;
                    else
                        k=1;
                    end
                    if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    end
                case 2 %第二象限
                    if Ex0>0.5*steplen||Ey0>0.5*steplen
                        Jrx1=Jrx1+Jvx1;
                        Jry1=Jry1+Jvy1;
                        if Jrx1>=OF
                            Jrx1=Jrx1-OF;
                            PX2=PX1-steplen;%向-X进给一个步长
                            Ex0=abs(PX2-Xe);
                        end
                        if  Jry1>=OF
                            Jry1=Jry1-OF;
                            PY2=PY1+steplen;%向+Y进给一个步长
                            Ey0=abs(PY2-Ye);
                        end
                        if  (PX2==PX1&&PY2==PY1)
                        else
                            plot([PX1,PX2],[PY1,PY2],'red');
                            k=1;
                        end
                        PX1=PX2;
                        PY1=PY2;
                    else
                        k=1;
                    end
                    if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    end
                case 3 %第三象限
                    if Ex0>0.5*steplen||Ey0>0.5*steplen
                        Jrx1=Jrx1+Jvx1;
                        Jry1=Jry1+Jvy1;
                        if Jrx1>=OF
                            Jrx1=Jrx1-OF;
                            PX2=PX1-steplen;%向-X进给一个步长
                            Ex0=abs(PX2-Xe);
                        end
                        if  Jry1>=OF
                            Jry1=Jry1-OF;
                            PY2=PY1-steplen;%向-Y进给一个步长
                            Ey0=abs(PY2-Ye);
                        end
                        if  (PX2==PX1&&PY2==PY1)
                        else
                            plot([PX1,PX2],[PY1,PY2],'red');
                            k=1;
                        end
                        PX1=PX2;
                        PY1=PY2;
                    else
                        k=1;
                    end
                    if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    end
                case 4 %第四象限
                    if Ex0>0.5*steplen||Ey0>0.5*steplen
                        Jrx1=Jrx1+Jvx1;
                        Jry1=Jry1+Jvy1;
                        if Jrx1>=OF
                            Jrx1=Jrx-OF;
                            PX2=PX1+steplen;   %向+X进给一个步长
                            Ex0=abs(PX2-Xe);
                        end
                        if  Jry1>=OF
                            Jry1=Jry1-OF;
                            PY2=PY1-steplen;   %向-Y进给一个步长
                            Ey0=abs(PY2-Ye);
                        end
                        if  (PX2==PX1&&PY2==PY1)
                        else
                            plot([PX1,PX2],[PY1,PY2],'red');
                            k=1;
                        end
                        PX1=PX2;
                        PY1=PY2;
                    else
                        k=1;
                    end
                    if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    end
            end
        end
    end
    if way==1
        switch t
            case 1  %第一象限
                if Ex0>0.5*steplen||Ey0>0.5*steplen
                    if F1>=0
                        plot([xe,xe+steplen],[ye,ye],'red');
                        F1=F1-abs(Ye-Y0)*steplen;
                        xe=xe+steplen;
                        Ex0=abs(xe-Xe);
                    else
                        plot([xe,xe],[ye,ye+steplen],'red');
                        F1=F1+abs(Xe-X0)*steplen;
                        ye=ye+steplen;
                        Ey0=abs(ye-Ye);
                    end
                end
                if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    u1=0;
                end
            case 2  %第二象限
                if Ex0>0.5*steplen||Ey0>0.5*steplen
                    if F1>=0
                        plot([xe,xe-steplen],[ye,ye],'red');
                        F1=F1-abs(Ye-Y0)*steplen;
                        xe=xe-steplen;
                        Ex0=abs(xe-Xe);
                    else
                        plot([xe,xe],[ye,ye+steplen],'red');
                        F1=F1+abs(Xe-X0)*steplen;
                        ye=ye+steplen;
                        Ey0=abs(ye-Ye);
                    end
                end
            case 3  %第三象限
                if Ex0>0.5*steplen||Ey0>0.5*steplen
                    if F1>=0
                        plot([xe,xe-steplen],[ye,ye],'red');
                        F1=F1-abs(Ye-Y0)*steplen;
                        xe=xe-steplen;
                        Ex0=abs(xe-Xe);
                    else
                        plot([xe,xe],[ye,ye-steplen],'red');
                        F1=F1+abs(Xe-X0)*steplen;
                        ye=ye-steplen;
                        Ey0=abs(ye-Ye);
                    end
                end
            case 4  %第四象限
                if Ex0>0.5*steplen||Ey0>0.5*steplen
                    if F1>=0
                        plot([xe,xe+steplen],[ye,ye],'red');
                        F1=F1-abs(Ye-Y0)*steplen;
                        xe=xe+steplen;
                        Ex0=abs(xe-Xe);
                    else
                        plot([xe,xe],[ye,ye-steplen],'red');
                        F1=F1+abs(Xe-X0)*steplen;
                        ye=ye-steplen;
                        Ey0=abs(ye-Ye);
                    end
                end
                if Ex0<0.5*steplen&&Ey0<0.5*steplen  %判断是否完成插补
                    errordlg('插补完成');
                    u1=0;
                end
        end
        
    end
    
end
function lineconstepIP_Callback(hObject, eventdata, handles)
% hObject    handle to lineconstepIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X0 Xe Y0 Ye Regbit steplen ;
global speed;
get(handles.X0,'string');
X0=str2double(get(handles.X0,'string'));
get(handles.Y0,'string');
Y0=str2double(get(handles.Y0,'string'));
get(handles.Xe,'string');
Xe=str2double(get(handles.Xe,'string'));
get(handles.Ye,'string');
Ye=str2double(get(handles.Ye,'string'));
get(handles.Regbit,'string');
Regbit=str2double(get(handles.Regbit,'string'));
get(handles.steplen,'string');
steplen=str2double(get(handles.steplen,'string'));
global u1
u1=0;
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
axes(handles.axes1)
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
if get(handles.DDA,'value')
    way=0;
else
    way=1;
end
if way==0 %DDA法
    if get(handles.halfload,'value')
        Jrx=OF/2;
        Jry=OF/2;
    end
    if get(handles.fullload,'value')
        Jrx=OF-1;
        Jry=OF-1;
    end
    if get(handles.leftmove,'value')
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
                plot([PX1,PX2],[PY1,PY2],'y','linewidth',1);
                pause(speed);
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
                pause(speed);
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
                pause(speed);
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
                pause(speed);
            end
            PX1=PX2;
            PY1=PY2;
        end
     end
end
if way==1 %逐点法
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
                    pause(speed);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X+steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y+steplen],'y','linewidth',1);
                    pause(speed);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y+steplen;
                    Ey1=abs(Y-Ye);
                end
            end
        case 2  %第二象限
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X-steplen],[Y,Y],'y','linewidth',1);
                    pause(speed);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X-steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y+steplen],'y,','linewidth',1');
                    pause(speed);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y+steplen;
                    Ey1=abs(Y-Ye);
                end
            end
       case 3  %第三象限
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X-steplen],[Y,Y],'y','linewidth',1);
                    pause(speed);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X-steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y-steplen],'y','linewidth',1);
                    pause(speed);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y-steplen;
                    Ey1=abs(Y-Ye);
                end
            end  
        case 4  %第四象限
            while Ex1>0.5*steplen||Ey1>0.5*steplen
                if F>=0
                    plot([X,X+steplen],[Y,Y],'y','linewidth',1);
                    pause(speed);
                    F=F-abs(Ye-Y0)*steplen;
                    X=X+steplen;
                    Ex1=abs(X-Xe);
                else
                    plot([X,X],[Y,Y-steplen],'y','linewidth',1);
                    pause(speed);
                    F=F+abs(Xe-X0)*steplen;
                    Y=Y-steplen;
                    Ey1=abs(Y-Ye);
                end
            end  
    end
end


function CX0_Callback(hObject, eventdata, handles)
% hObject    handle to CX0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CX0 as text
%        str2double(get(hObject,'String')) returns contents of CX0 as a double


% --- Executes during object creation, after setting all properties.
function CX0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CX0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CY0_Callback(hObject, eventdata, handles)
% hObject    handle to CY0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CY0 as text
%        str2double(get(hObject,'String')) returns contents of CY0 as a double


% --- Executes during object creation, after setting all properties.
function CY0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CY0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CXe_Callback(hObject, eventdata, handles)
% hObject    handle to CXe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CXe as text
%        str2double(get(hObject,'String')) returns contents of CXe as a double


% --- Executes during object creation, after setting all properties.
function CXe_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CXe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CYe_Callback(hObject, eventdata, handles)
% hObject    handle to CYe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CYe as text
%        str2double(get(hObject,'String')) returns contents of CYe as a double


% --- Executes during object creation, after setting all properties.
function CYe_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CYe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CXr_Callback(hObject, eventdata, handles)
% hObject    handle to CXr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CXr as text
%        str2double(get(hObject,'String')) returns contents of CXr as a double


% --- Executes during object creation, after setting all properties.
function CXr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CXr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CYr_Callback(hObject, eventdata, handles)
% hObject    handle to CYr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CYr as text
%        str2double(get(hObject,'String')) returns contents of CYr as a double


% --- Executes during object creation, after setting all properties.
function CYr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CYr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cicle.
function cicle_Callback(hObject, eventdata, handles)
% hObject    handle to cicle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CX0 CY0 CXe CYe;
global X Y;
global CXr CYr CR;
global steplen;
global CA0 CAE;
global CPx CPy dx dy;
global F;
global clockwise;
CX0=str2double(get(handles.CX0,'String'));
CXe=str2double(get(handles.CXe,'String'));
CY0=str2double(get(handles.CY0,'String'));
CYe=str2double(get(handles.CYe,'String'));
CXr=str2double(get(handles.CXr,'String'));
CYr=str2double(get(handles.CYr,'String'));
steplen=str2double(get(handles.steplen,'String'));
X=CX0;
Y=CY0;
CPx=X-CXr;
CPy=Y-CYr;
dx=steplen;
dy=steplen;
F=0;
if get(handles.anticlockwise,'value')
    clockwise=0;
else
    clockwise=1;
end
if ((CX0-CXr)*(CX0-CXr)+(CY0-CYr)*(CY0-CYr))~=((CXe-CXr)*(CXe-CXr)+(CYe-CYr)*(CYe-CYr))
    warndlg('圆心坐标错误','警告','on');
else
    CR=sqrt((CX0-CXr)^2+(CY0-CYr)^2);
    set(handles.CR,'string',CR);
    cx0p=CX0-CXr;
    cy0p=CY0-CYr;
    cx1p=CXe-CXr;
    cy1p=CYe-CYr;
    if cx0p>0
        if cy0p>0
            CA0=abs(atan(cy0p./cx0p));
        elseif cy0p==0
            CA0=0;
        else
            CA0=2*pi-abs(atan(cy0p./cx0p));
        end
    elseif cx0p==0
        if cy0p>0
            CA0=pi/2;
        else
            CA0=pi*3/2;
        end
    else
        if cy0p>0
            CA0=pi-abs(atan(cy0p./cx0p));
        elseif cy0p==0
            CA0=pi;
        else
            CA0=pi+abs(atan(cy0p./cx0p));
        end
    end
    if cx1p>0
        if cy1p>0
            CAE=abs(atan(cy1p./cx1p));
        elseif cy1p==0
            CAE=0;
        else
            CAE=2*pi-abs(atan(cy1p./cx1p));
        end
    elseif cx1p==0
        if cy1p>0
            CAE=pi/2;
        else
            CAE=pi*3/2;
        end
    else
        if cy1p>0
            CAE=pi-abs(atan(cy1p./cx1p));
        elseif cy1p==0
            CAE=pi;
        else
            CAE=pi+abs(atan(cy1p./cx1p));
        end
    end
    if get(handles.anticlockwise,'value')
        if CAE>CA0
            t=CA0:0.01:CAE;
        else
            t=CA0:0.01:CAE+2*pi;
        end
    else
        if CAE>=CA0
            t=CAE:0.01:CA0+2*pi;
        else
            t=CAE:0.01:CA0;
        end
    end
    cx=CR*cos(t)+CXr;
    cy=CR*sin(t)+CYr;
    plot(cx,cy,'black');
    hold on;
    plot(CXr,CYr,'.')
    axis([CXr-CR*1.2,CXr+CR*1.2,CYr-CR*1.2,CYr+CR*1.2]);
    axis square;
    grid on;
    hold on;
end
      
 
% --- Executes on button press in ciclestepIP.
function ciclestepIP_Callback(hObject, eventdata, handles)
% hObject    handle to ciclestepIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CXe CYe;
global X Y;
global CXr CYr;
global steplen;
global CPx CPy dx dy;
global F;
global clockwise;
if clockwise==0 
    if (sqrt((X-CXe)^2+(Y-CYe)^2))>=steplen
        if CPx>0 && CPy>=0
            if F>=0
                F=F-2*steplen*CPx+steplen^2;
                plot([X,X-dx],[Y,Y],'r')
                X=X-dx;
            else
                F=F+2*steplen*CPy+steplen^2;
                plot([X,X],[Y,Y+dy],'r')
                Y=Y+dy;
            end
        elseif CPx<=0 && CPy>0
            if F>=0
                F=F-2*steplen*CPy+steplen^2;
                plot([X,X],[Y,Y-dy],'r')
                Y=Y-dy;
            else
                F=F-2*steplen*CPx+steplen^2;
                plot([X,X-dx],[Y,Y],'r')
                X=X-dx;
            end
        elseif CPx<0 && CPy<=0
            if F>=0
                F=F+2*steplen*CPx+steplen^2;
                plot([X,X+dx],[Y,Y],'r')
                X=X+dx;
            else
                F=F-2*CPy*steplen+steplen^2;
                plot([X,X],[Y,Y-dy],'r')
                Y=Y-dy;
            end
        else
            if F>=0
                F=F+2*steplen*CPy+steplen^2;
                plot([X,X],[Y,Y+dy],'r')
                Y=Y+dy;
            else
                F=F+2*steplen*CPx+steplen^2;
                plot([X,X+dx],[Y,Y],'r')
                X=X+dx;
            end
        end
        CPx=X-CXr;
        CPy=Y-CYr;
    end
    if (sqrt((X-CXe)^2+(Y-CYe)^2))<steplen
        errordlg('插补完成');
    end
else
    if (sqrt((X-CXe)^2+(Y-CYe)^2))>=steplen
         if CPx>0 && CPy<=0
            if F>=0
                F=F-2*steplen*CPx+steplen^2;
                plot([X,X-dx],[Y,Y],'r')
                X=X-dx;
            else
                F=F-2*steplen*CPy+steplen^2;
                plot([X,X],[Y,Y-dy],'r')
                Y=Y-dy;
            end
         end
         if CPx<=0 && CPy<0
            if F>=0
                F=F+2*steplen*CPy+steplen^2;
                plot([X,X],[Y,Y+dy],'r')
                Y=Y+dy;
            else
                F=F-2*steplen*CPx+steplen^2;
                plot([X,X-dx],[Y,Y],'r')
                X=X-dx;
            end
         end
         if CPx<0 && CPy>=0
            if F>=0
                F=F+2*steplen*CPx+steplen^2;
                plot([X,X+dx],[Y,Y],'r')
                X=X+dx;
            else
                F=F+2*steplen*CPy+steplen^2;
                plot([X,X],[Y,Y+dy],'r')
                Y=Y+dy;
            end
         end
         if CPx>=0 && CPy>0
            if F>=0
                F=F-2*steplen*CPy+steplen^2;
                plot([X,X],[Y,Y-dy],'r')
                Y=Y-dy;
            else
                F=F+2*steplen*CPx+steplen^2;
                plot([X,X+dx],[Y,Y],'r')
                X=X+dx;
            end
         end
         CPx=X-CXr;
         CPy=Y-CYr;
    end
    if (sqrt((X-CXe)^2+(Y-CYe)^2))<steplen
        errordlg('插补完成');
    end
end
function cicleconstepIP_Callback(hObject, eventdata, handles)
% hObject    ha ndle to cicleconstepIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CXe CYe CX0 CY0;
global X Y;
global CXr CYr;
global steplen;
global CPx CPy dx dy;
global F;
global clockwise;
global speed;
global Regbit;
get(handles.Regbit,'string');
Regbit=str2double(get(handles.Regbit,'string'));
OF=2^Regbit;
if get(handles.DDA,'value')
    way=0;
else
    way=1;
end
if way==0 %DDA法
    if get(handles.halfload,'value')
        Jrx=OF/2;
        Jry=OF/2;
    end
    if get(handles.fullload,'value')
        Jrx=OF-1;
        Jry=OF-1;
    end
    if get(handles.leftmove,'value')
        while Jvx<OF/4&&Jvy<OF/4
            Jvx=Jvx*2;
            Jvy=Jvy*2;
        end
    end
    
else
    if clockwise==0
        while (sqrt((X-CXe)^2+(Y-CYe)^2))>=steplen
            if CPx>0 && CPy>=0
                if F>=0
                    F=F-2*steplen*CPx+steplen^2;
                    plot([X,X-dx],[Y,Y],'y','linewidth',1)
                    X=X-dx;
                    pause(speed);
                else
                    F=F+2*steplen*CPy+steplen^2;
                    plot([X,X],[Y,Y+dy],'y','linewidth',1)
                    Y=Y+dy;
                    pause(speed);
                end
            elseif CPx<=0 && CPy>0
                if F>=0
                    F=F-2*steplen*CPy+steplen^2;
                    plot([X,X],[Y,Y-dy],'y','linewidth',1)
                    Y=Y-dy;
                    pause(speed);
                else
                    F=F-2*steplen*CPx+steplen^2;
                    plot([X,X-dx],[Y,Y],'y','linewidth',1)
                    X=X-dx;
                    pause(speed);
                end
            elseif CPx<0 && CPy<=0
                if F>=0
                    F=F+2*steplen*CPx+steplen^2;
                    plot([X,X+dx],[Y,Y],'y','linewidth',1)
                    X=X+dx;
                    pause(speed);
                else
                    F=F-2*CPy*steplen+steplen^2;
                    plot([X,X],[Y,Y-dy],'y','linewidth',1)
                    Y=Y-dy;
                    pause(speed);
                end
            else
                if F>=0
                    F=F+2*steplen*CPy+steplen^2;
                    plot([X,X],[Y,Y+dy],'y','linewidth',1)
                    Y=Y+dy;
                    pause(speed);
                else
                    F=F+2*steplen*CPx+steplen^2;
                    plot([X,X+dx],[Y,Y],'y','linewidth',1)
                    X=X+dx;
                    pause(speed);
                end
            end
            CPx=X-CXr;
            CPy=Y-CYr;
        end
    else
        while (sqrt((X-CXe)^2+(Y-CYe)^2))>=steplen
            if CPx>0 && CPy<=0
                if F>=0
                    F=F-2*steplen*CPx+steplen^2;
                    plot([X,X-dx],[Y,Y],'y','linewidth',1)
                    X=X-dx;
                    pause(speed);
                else
                    F=F-2*steplen*CPy+steplen^2;
                    plot([X,X],[Y,Y-dy],'y','linewidth',1)
                    Y=Y-dy;
                    pause(speed);
                end
            end
            if CPx<=0 && CPy<0
                if F>=0
                    F=F+2*steplen*CPy+steplen^2;
                    plot([X,X],[Y,Y+dy],'y','linewidth',1)
                    Y=Y+dy;
                    pause(speed);
                else
                    F=F-2*steplen*CPx+steplen^2;
                    plot([X,X-dx],[Y,Y],'y','linewidth',1)
                    X=X-dx;
                    pause(speed);
                end
            end
            if CPx<0 && CPy>=0
                if F>=0
                    F=F+2*steplen*CPx+steplen^2;
                    plot([X,X+dx],[Y,Y],'y','linewidth',1)
                    X=X+dx;
                    pause(speed);
                else
                    F=F+2*steplen*CPy+steplen^2;
                    plot([X,X],[Y,Y+dy],'y','linewidth',1)
                    Y=Y+dy;
                    pause(speed);
                end
            end
            if CPx>=0 && CPy>0
                if F>=0
                    F=F-2*steplen*CPy+steplen^2;
                    plot([X,X],[Y,Y-dy],'y','linewidth',1)
                    Y=Y-dy;
                    pause(speed);
                else
                    F=F+2*steplen*CPx+steplen^2;
                    plot([X,X+dx],[Y,Y],'y','linewidth',1)
                    X=X+dx;
                    pause(speed);
                end
            end
            CPx=X-CXr;
            CPy=Y-CYr;
        end
    end
end
X=CX0;
Y=CY0;
CPx=X-CXr;
CPy=Y-CYr;
dx=steplen;
dy=steplen;
F=0;

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


% --- Executes on button press in cleanscree.
function cleanscree_Callback(hObject, eventdata, handles)
% hObject    handle to cleanscree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;



% --- Executes on button press in quit.
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(wan051810402_6);
% --- Executes on button press in leftmove.
function leftmove_Callback(hObject, eventdata, handles)
% hObject    handle to leftmove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of leftmove



function steplen_Callback(hObject, eventdata, handles)
% hObject    handle to steplen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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



function Regbit_Callback(hObject, eventdata, handles)
% hObject    handle to Regbit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Regbit as text
%        str2double(get(hObject,'String')) returns contents of Regbit as a double


% --- Executes during object creation, after setting all properties.
function Regbit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Regbit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in cicleconstepIP.

   
% --- Executes on button press in lineconstepIP.



% --- Executes on slider movement.
function speedslider_Callback(hObject, eventdata, handles)
% hObject    handle to speedslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global speed;
speed=1/get(handles.speedslider,'value');
set(handles.speed,'string',num2str(1/speed));
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

% Hints: get(hObject,'String') returns contents of speed as text
%        str2double(get(hObject,'String')) returns contents of speed as a double
global speed;
speed=1/str2double(get(handles.speed,'string'));
set(handles.speedslider,'value',1/speed);

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


% --- Executes on button press in cleardata.
function cleardata_Callback(hObject, eventdata, handles)
% hObject    handle to cleardata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.speed,'string',[]);
set(handles.X0,'string',[]);
set(handles.Xe,'string',[]);
set(handles.Y0,'string',[]);
set(handles.Ye,'string',[]);
set(handles.steplen,'string',[]);
set(handles.Regbit,'string',[]);
set(handles.CX0,'string',[]);
set(handles.CY0,'string',[]);
set(handles.CXe,'string',[]);
set(handles.CYe,'string',[]);
set(handles.CXr,'string',[]);
set(handles.CYr,'string',[]);
set(handles.leftmove,'value',0);
set(handles.speedslider,'value',0);
set(handles.CR,'string',[]);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over cicle.
function cicle_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to cicle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in DDA.
function DDA_Callback(hObject, eventdata, handles)
% hObject    handle to DDA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DDA


% --- Executes on button press in pointIP.
function pointIP_Callback(hObject, eventdata, handles)
% hObject    handle to pointIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pointIP


% --- Executes on button press in noload.
function noload_Callback(hObject, eventdata, handles)
% hObject    handle to noload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noload
