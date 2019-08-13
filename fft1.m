%% Edited by : Bima Priambodo Wahyu Rianto
% D4 Mechatronics Engineering
% Departement of Mechanical and Energy Departement
% Politeknik Elektronika Negeri Surabaya
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc
%%
% load data
data = xlsread("D:\RESEARCH\PENS\TUGAS AKHIR NJER\5. BELAJAR\ambildata6\dataset new 2\DATASET5DETIK.xlsx",'dataset');
%data = xlsread('ball.xlsx','xbawah1');
%Determine variables and Display size
[N,m] = size(data);
Fs = 1000;          %frekuensi sampling
t = (0:N-1)/Fs;     %time vector
a = data(:,1);      %array of data for FFT

% %% Simulasi sinyal
% f1 = 50; %hz
% f2 = 100; %hz
% Fs = 1000;             % Sampling frequency                    
% T = 1/Fs;              % Sampling period  
% N = 1500;              % Length of signal
% t = (0:N-1)*T;         % Time vector
% %generate 2 sinyal
% y = 2*sin(2*pi*f1*t) + 3*sin(2*pi*f2*t);
% a = y + 8*randn(size(t)); %dengan penambahan noise random
%% FFT

%panjang fft
nfft=length(a);

% amplitude spectrum via Fast Fourier transform
signalX = fft(a);
signalAmp = 2*(abs(signalX)/nfft);

% vector of frequencies in Hz
hz = linspace(0,Fs/2,floor(nfft/2)+1);

%plots 
%
 figure(1)
 subplot(2,1,1)
 plot(t,a)
 xlim ([0 0.2])
 hold on
 xlabel('Time (s)'), ylabel('Amplitude')
 title('Time domain')
% 
 subplot(2,1,2)
 plot(hz,signalAmp(1:length(hz))) 
 axis ([0 500 0 0.4])
 hold on
 xlabel('Frequency (Hz)'), ylabel('Amplitude')
 title('FFT Frequency domain')
 
%cari peak tertinggi
%[pk,lk] = findpeaks(signalAmp(1:length(hz)),hz,'MinPeakHeight',0.01)
%plot(hz,signalAmp(1:length(hz)),lk,pk,'o') 
