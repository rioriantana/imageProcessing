function varargout = citraInfrared(varargin)
% CITRAINFRARED M-file for citraInfrared.fig
%      CITRAINFRARED, by itself, creates a new CITRAINFRARED or raises the existing
%      singleton*.
%
%      H = CITRAINFRARED returns the handle to a new CITRAINFRARED or the handle to
%      the existing singleton*.
%
%      CITRAINFRARED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CITRAINFRARED.M with the given input arguments.
%
%      CITRAINFRARED('Property','Value',...) creates a new CITRAINFRARED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before citraInfrared_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to citraInfrared_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help citraInfrared

% Last Modified by GUIDE v2.5 15-Apr-2016 08:25:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @citraInfrared_OpeningFcn, ...
                   'gui_OutputFcn',  @citraInfrared_OutputFcn, ...
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


% --- Executes just before citraInfrared is made visible.
function citraInfrared_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to citraInfrared (see VARARGIN)

% Choose default command line output for citraInfrared
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes citraInfrared wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = citraInfrared_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
project=guidata(gcbo);
[namafile,direktori]=uigetfile({'*.jpg';'*.*'},'Buka Citra');
I=imread(strcat(direktori,namafile));
%A=gray2rgb(I);
set(project.figure1, 'CurrentAxes', project.axes1);
set(imshow(I));
set(project.axes1, 'Userdata', I);


%project=guidata(gcbo);
%I=get(project.axes1, 'Userdata');
%A=rgb2gray(I);
%cla;
%set(project.figure1, 'CurentAxes', project.axes1);
%set(imshow(A));
%set(project.axes1, 'Userdata', A);
%set(project.figure1, 'Userdata', A);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(~, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(~, ~, ~)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[namafile,direktori]=uigetfile({'*.jpg';'*.*'},'Buka Citra');
project=guidata(gcbo);
B= get(project.axes1, 'Userdata');
px=[-1 0 1; -1 0 1;-1 0 1];
O=filter2(px,B);
py=px;
A=filter2(px,B);
edge_p=sqrt(O.^2+A.^2);
cla;
set(project.figure1, 'CurrentAxes', project.axes2);
set(imshow(edge_p/255));
set(project.axes2, 'Userdata', edge_p);


