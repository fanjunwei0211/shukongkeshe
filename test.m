% 
% syms t;
% ezplot(3*sin(t),3*cos(t))
% hold on;
% 
% 
% syms x;
% ezplot('sin(x)',[-3,3]);
% hold on;
% axis([-4,4,-4,4]);
% 
% set(handles.test1,'string',num2str(regbit));

f = figure('Position',[500 500 400 300]);
c = uicontrol('String','Continue','Callback','uiresume(f)');
uiwait(f)
disp('Program execution has resumed');