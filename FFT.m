clc
clear all

data = xlsread("D:\RESEARCH\PENS\TUGAS AKHIR NJER\5. BELAJAR\ambildata6\dataset new 2\DATASET5DETIK.xlsx",'dataset2');
n = length(data(1,:));
tic
signalX = [];
signalAmp = [];
m=1
for m = 1:n
    signalX = [signalX, fft(data(:,m))];
    signalAmp =[signalAmp, 2*(abs(signalX(:,m))/n);];
end
toc
fitur = signalAmp(1:2501,:);