function varargout = dsp_filtering_sound(varargin)
% DSP_FILTERING_SOUND MATLAB code for dsp_filtering_sound.fig
%      DSP_FILTERING_SOUND, by itself, creates a new DSP_FILTERING_SOUND or raises the existing
%      singleton*.
%
%      H = DSP_FILTERING_SOUND returns the handle to a new DSP_FILTERING_SOUND or the handle to
%      the existing singleton*.
%
%      DSP_FILTERING_SOUND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DSP_FILTERING_SOUND.M with the given input arguments.
%
%      DSP_FILTERING_SOUND('Property','Value',...) creates a new DSP_FILTERING_SOUND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dsp_filtering_sound_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dsp_filtering_sound_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dsp_filtering_sound

% Last Modified by GUIDE v2.5 11-Dec-2016 14:00:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dsp_filtering_sound_OpeningFcn, ...
                   'gui_OutputFcn',  @dsp_filtering_sound_OutputFcn, ...
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

% ---------------------------------------------semnal1 logic

% --- Executes just before dsp_filtering_sound is made visible.
function dsp_filtering_sound_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dsp_filtering_sound (see VARARGIN)

% Choose default command line output for dsp_filtering_sound
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dsp_filtering_sound wait for user response (see UIRESUME)
% uiwait(handles.figure1);

    global semnal1;
    semnal1 = 'semnal1.wav';
    global semnal2;
    semnal2 = 'semnal2.wav';

% --- Outputs from this function are returned to the command line.
function varargout = dsp_filtering_sound_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in btnOpenSemnalAudio1.
function btnOpenSemnalAudio1_Callback(hObject, eventdata, handles)
% hObject    handle to btnOpenSemnalAudio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global semnal1;
    global wav;
    global Fs;
    global hh
        
    [wav, Fs] = wavread(semnal1);
    axes(handles.semnal_audio_1_axes);
    plot(wav);
    zoom xon;
    hh = generateFOB(500,1300,4001,Fs);
    
    SpectruSemnalNefiltrat(handles)
    SpectruSemnalFiltrat(handles)
    
% --- Executes on button press in btnOpenSemnalAudio2.
function btnOpenSemnalAudio2_Callback(hObject, eventdata, handles)
% hObject    handle to btnOpenSemnalAudio2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global semnal2;
    global wav;
    global Fs;
    global hh;
        
    [wav, Fs] = wavread(semnal2);
    axes(handles.semnal_audio_1_axes);
    plot(wav);
    zoom xon;
    hh = generateFTS(1200,4001,Fs);
    
    SpectruSemnalNefiltrat(handles)
    SpectruSemnalFiltrat(handles)

function SpectruSemnalNefiltrat(handles)

    global wav
    global Fs
    
    S = fftshift(abs(fft(wav)));
    axaFFT = linspace(-Fs/2, Fs/2, length(wav));
    
    axes(handles.spectru_semnal_audio_1_nefiltrat_axes);
    displayGraph(axaFFT, S,0, 'Spectru semnal audio nefiltrat', 0, 0);
    zoom xon;

function SpectruSemnalFiltrat(handles)

    global Fs;
    global fwav;
    global wav;
    global hh;

    fwav = conv(wav,hh);

    fswav = fftshift(abs(fft(fwav)));
    ax = linspace(-Fs/2 , Fs/2, length(fswav));

    axes(handles.spectru_semnal_audio_1_filtrat_axes);
    displayGraph(ax, fswav,0, 'Spectru semnal audio filtrat', 0, 0);
    zoom xon;

% --- Executes on button press in btnRedareSemnal1Original.
function btnRedareSemnal1Original_Callback(hObject, eventdata, handles)
% hObject    handle to btnRedareSemnal1Original (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global wav;
    global Fs;
    sound(wav, Fs);

% --- Executes on button press in btnRedareSemnal1Filtrat.
function btnRedareSemnal1Filtrat_Callback(hObject, eventdata, handles)
% hObject    handle to btnRedareSemnal1Filtrat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global Fs;
    global fwav;
    sound(fwav,Fs);
