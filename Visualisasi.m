%% Edited by : Bima Priambodo Wahyu Rianto
% D4 Mechatronics Engineering
% Departement of Mechanical and Energy Departement
% Politeknik Elektronika Negeri Surabaya
clear all
clc
%%
data =  xlsread('D:\RESEARCH\PENS\TUGAS AKHIR NJER\5. BELAJAR\ambildata6\dataset new 2\Fitur\Fitur.xlsx','emd-stat-rms-5detik');
%% 5 detik
figure(1)
plot3(data(1:40,1),data(1:40,2),data(1:40,3),'LineStyle','none','Marker','o','MarkerFaceColor','r')
hold on
plot3(data(41:80,1),data(41:80,2),data(41:80,3),'LineStyle','none','Marker','s','MarkerFaceColor','g')
hold on
plot3(data(81:120,1),data(81:120,2),data(81:120,3),'LineStyle','none','Marker','^','MarkerFaceColor','b')
hold on
plot3(data(121:140,1),data(121:140,2),data(121:140,3),'LineStyle','none','Marker','diamond','MarkerFaceColor','m')
title('Data Feature Extraction');
xlabel('RMS');
ylabel('Kurtosis');
zlabel('Skewness');
legend('Bearing Normal','Rusak (Outer)','Rusak (Inner)','Rusak (Ball)')
grid on
%% VISUALILASI DATA  1 detik
figure(1)
plot3(data(1:100,1),data(1:100,2),data(1:100,3),'LineStyle','none','Marker','o','MarkerFaceColor','r')
hold on
plot3(data(101:200,1),data(101:200,2),data(101:200,3),'LineStyle','none','Marker','s','MarkerFaceColor','g')
hold on
plot3(data(201:300,1),data(201:300,2),data(201:300,3),'LineStyle','none','Marker','^','MarkerFaceColor','b')
hold on
plot3(data(301:400,1),data(301:400,2),data(301:400,3),'LineStyle','none','Marker','diamond','MarkerFaceColor','m')
title('Data Feature Extraction');
xlabel('RMS');
ylabel('Kurtosis');
zlabel('Skewness');
legend('Bearing Normal','Rusak (Outer)','Rusak (Inner)','Rusak (Ball)')
grid on
%% plot data 2D
n = length(data(1:20,1));
n = 1:n;
figure(2)
plot(n,data(61:80,1),'Marker','o','MarkerFaceColor','r')
hold on
plot(n,data(61:80,2),'Marker','s','MarkerFaceColor','g')
hold on
plot(n,data(61:80,3),'Marker','^','MarkerFaceColor','b')
hold on
title('Data Feature Extraction');
xlabel('Sample Data Ke N');
ylabel('Nilai Extraksi Ciri');
legend('RMS','Kurtosis','Skewness')
xlim([1 20])
grid on
%%
data =  xlsread("D:\RESEARCH\PENS\TUGAS AKHIR NJER\5. BELAJAR\ambildata6\dataset new 2\DATASET5DETIK.xlsx",'dataset2');
plot(data(1:5000,1))
hold on
plot(data(1:5000,21))
hold on
plot(data(1:5000,41))
hold on
plot(data(1:5000,61))
hold on

