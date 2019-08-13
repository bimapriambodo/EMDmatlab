%% Edited by : Bima Priambodo Wahyu Rianto
% D4 Mechatronics Engineering
% Departement of Mechanical and Energy Departement
% Politeknik Elektronika Negeri Surabaya
clear all
clc
%%
data =  xlsread("D:\RESEARCH\PENS\TUGAS AKHIR NJER\5. BELAJAR\ambildata6\dataset new 2\DATASET5DETIK.xlsx",'DATASET2');
n = length(data(1,:));
tic
dataemd = []
m=1
for m = 1:n
    dataemd = [dataemd; {emd(data(:,m),'Interpolation','pchip')}];
end
toc

%% Visualisasi Nilai EMD
normal = [];
for i = 1:20
    normal =[normal, dataemd{i,1}(1:5000,1:3)]; %diambil nilai  IMF 1 - IMF 3
end
outer = [];
for i = 1:20
    outer =[outer, dataemd{20+i,1}(1:5000,1:3)];
end
inner = [];
for i = 1:20
    inner =[inner, dataemd{40+i,1}(1:5000,1:3)];
end
ball = [];
for i = 1:20
    ball =[ball, dataemd{60+i,1}(1:5000,1:3)];
end

for index=1:3
    subplot(2,2,index)
    plot(ball(1:5000, index)) %ganti data setiap kondisi
    xlim([0 100]) 
    hold on
    title(['IMF ',num2str(index)])
    ylabel('Amplitude')
    xlabel('Time [ms]')
end
 subplot(2,2,4), plot(dataemd{61,1}(1:5000,end)), %ganti data setiap kondisi
 xlim([0 5000]),
 hold on, 
 title(['RESIDU']),
 xlabel('Time [ms]');
 
%% Hitung Nilai Energy Berdasarkan Jumlah Sampel
tic
IMF1 = []; %ambil data IMF1
for i = 1:80
    IMF1 =[IMF1, dataemd{i,1}(:,1)];
end
IMF2 = []; %ambil data IMF2
for i = 1:80
    IMF2 =[IMF2, dataemd{i,1}(:,2)];
end
IMF3 = []; %ambil data IMF3
for i = 1:80
    IMF3 =[IMF3, dataemd{i,1}(:,3)];
end

% % Energi IMF1
% EIMF1 = [];
% for i = 1:n
% EIMF1 = [EIMF1, sum(abs(IMF1(:,i).*IMF1(:,i)))];
% end
% TOTEIMF1= sum(abs(EIMF1)); %total energi IMF1
% EIMF1 = EIMF1./TOTEIMF1; %normalisasi
% EIMF1 = EIMF1';
% 
% % Energi IMF2
% EIMF2 = [];
% for i = 1:n
% EIMF2 = [EIMF2, sum(abs(IMF2(:,i).*IMF2(:,i)))];
% end
% TOTEIMF2= sum(abs(EIMF2)); %total energi IMF2
% EIMF2 = EIMF2./TOTEIMF2; %normalisasi
% EIMF2 = EIMF2';
% 
% % Energi IMF3
% EIMF3 = [];
% for i = 1:n
% EIMF3 = [EIMF3, sum(abs(IMF3(:,i).*IMF3(:,i)))];
% end
% TOTEIMF3= sum(abs(EIMF3)); %total energi IMF3
% EIMF3 = EIMF3./TOTEIMF3; %normalisasi
% EIMF3 = EIMF3';

rmsimf1 = [];
for i = 1:n
rmsimf1 = [rmsimf1, rms(IMF1(:,i),1)];
end
rmsimf2 = [];
for i = 1:n
rmsimf2 = [rmsimf2, rms(IMF2(:,i),1)];
end
rmsimf3 = [];
for i = 1:n
rmsimf3 = [rmsimf3, rms(IMF3(:,i),1)];
end
toc
rmsimf1=rmsimf1';
rmsimf2=rmsimf2';
rmsimf3=rmsimf3';
DATABARU = [rmsimf1,rmsimf2,rmsimf3];
%% VISUALILASI DATA ENERGY EMD 5 detik
figure(1)
plot3(EIMF1(1:20,1),EIMF2(1:20,1),EIMF3(1:20,1),'LineStyle','none','Marker','o','MarkerFaceColor','r')
hold on
plot3(EIMF1(21:40,1),EIMF2(21:40,1),EIMF3(21:40,1),'LineStyle','none','Marker','s','MarkerFaceColor','g')
hold on
plot3(EIMF1(41:60,1),EIMF2(41:60,1),EIMF3(41:60,1),'LineStyle','none','Marker','^','MarkerFaceColor','b')
hold on
plot3(EIMF1(61:80,1),EIMF2(61:80,1),EIMF3(61:80,1),'LineStyle','none','Marker','diamond','MarkerFaceColor','m')
title('Data Feature Extraction');
xlabel('Energy IMF 1');
ylabel('Energy IMF 2');
zlabel('Energy IMF 3');
legend('Bearing Normal','Rusak (Outer)','Rusak (Inner)','Rusak (Ball)')
grid on
%% VISUALILASI DATA ENERGY EMD 1 detik
figure(1)
plot3(EIMF1(1:100,1),EIMF2(1:100,1),EIMF3(1:100,1),'LineStyle','none','Marker','o','MarkerFaceColor','r')
hold on
plot3(EIMF1(101:200,1),EIMF2(101:200,1),EIMF3(101:200,1),'LineStyle','none','Marker','s','MarkerFaceColor','g')
hold on
plot3(EIMF1(201:300,1),EIMF2(201:300,1),EIMF3(201:300,1),'LineStyle','none','Marker','^','MarkerFaceColor','b')
hold on
plot3(EIMF1(301:400,1),EIMF2(301:400,1),EIMF3(301:400,1),'LineStyle','none','Marker','diamond','MarkerFaceColor','m')
title('Data Feature Extraction');
xlabel('Energy IMF 1');
ylabel('Energy IMF 2');
zlabel('Energy IMF 3');
legend('Bearing Normal','Rusak (Outer)','Rusak (Inner)','Rusak (Ball)')
grid on
%% Diagnostic Feature Designer EMD - STATISTICAL 5 detik
time = milliseconds(1:5000);
IMF1 = []; %ambil data IMF1
for i = 1:140
    IMF1 =[IMF1, {array2timetable(dataemd{i,1}(1:5000,1),'RowTime', time)}];
end
IMF1 = IMF1';

IMF2 = []; %ambil data IMF2
for i = 1:140
    IMF2 =[IMF2, {array2timetable(dataemd{i,1}(1:5000,2),'RowTime', time)}];
end
IMF2 = IMF2';

IMF3 = []; %ambil data IMF3
for i = 1:140
    IMF3 =[IMF3, {array2timetable(dataemd{i,1}(1:5000,3),'RowTime', time)}];
end
IMF3 = IMF3';

IMF4 = []; %ambil data IMF3
for i = 1:140
    IMF4 =[IMF4, {array2timetable(dataemd{i,1}(1:5000,4),'RowTime', time)}];
end
IMF4 = IMF4';

IMF5 = []; %ambil data IMF3
for i = 1:140
    IMF5 =[IMF5, {array2timetable(dataemd{i,1}(1:5000,5),'RowTime', time)}];
end
IMF5 = IMF5';

 %Membuat Label Kondisi data
 A=repmat(1,1,40); 
 B=repmat(2,1,40);
 C=repmat(3,1,40);   
 D=repmat(4,1,20); 
 
Condition = categorical([A,B,C,D]'); %buat kondisi data
databaru  = table(IMF1,IMF2,IMF3,IMF4,IMF5,Condition);
%% Diagnostic Feature Designer EMD - STATISTICAL 1` detik UNTUK visualisasi saja, 25 sample
time = milliseconds(1:1000);
NORMALIMF1 = []; %ambil data IMF1
for i = 1:5
    NORMALIMF1 =[NORMALIMF1, {array2timetable(dataemd{i,1}(1:1000,1),'RowTime', time)}];
end

NORMALIMF2 = []; %ambil data IMF2
for i = 1:5
    NORMALIMF2 =[NORMALIMF2, {array2timetable(dataemd{i,1}(1:1000,2),'RowTime', time)}];
end

NORMALIMF3 = []; %ambil data IMF3
for i = 1:5
    NORMALIMF3 =[NORMALIMF3, {array2timetable(dataemd{i,1}(1:1000,3),'RowTime', time)}];
end

NORMALIMF4 = []; %ambil data IMF4
for i = 1:5
    NORMALIMF4 =[NORMALIMF4, {array2timetable(dataemd{i,1}(1:1000,4),'RowTime', time)}];
end

NORMALIMF5 = []; %ambil data IMF5
for i = 1:5
    NORMALIMF5 =[NORMALIMF5, {array2timetable(dataemd{i,1}(1:1000,5),'RowTime', time)}];
end

NORMALIMF = [NORMALIMF1;NORMALIMF2;NORMALIMF3;NORMALIMF4;NORMALIMF5]';

%OUTER
OUTERIMF1 = []; %ambil data IMF1
for i = 101:125
    OUTERIMF1 =[OUTERIMF1, {array2timetable(dataemd{i,1}(1:1000,1),'RowTime', time)}];
end

OUTERIMF2 = []; %ambil data IMF2
for i = 101:125
    OUTERIMF2 =[OUTERIMF2, {array2timetable(dataemd{i,1}(1:1000,2),'RowTime', time)}];
end

OUTERIMF3 = []; %ambil data IMF3
for i = 101:125
    OUTERIMF3 =[OUTERIMF3, {array2timetable(dataemd{i,1}(1:1000,3),'RowTime', time)}];
end

OUTERIMF4 = []; %ambil data IMF4
for i = 101:125
    OUTERIMF4 =[OUTERIMF4, {array2timetable(dataemd{i,1}(1:1000,4),'RowTime', time)}];
end

OUTERIMF5 = []; %ambil data IMF5
for i = 101:125
    OUTERIMF5 =[OUTERIMF5, {array2timetable(dataemd{i,1}(1:1000,5),'RowTime', time)}];
end

OUTERIMF = [OUTERIMF1;OUTERIMF2;OUTERIMF3;OUTERIMF4;OUTERIMF5]';

%INNER
INNERIMF1 = []; %ambil data IMF1
for i = 201:225
    INNERIMF1 =[INNERIMF1, {array2timetable(dataemd{i,1}(1:1000,1),'RowTime', time)}];
end

INNERIMF2 = []; %ambil data IMF2
for i = 201:225
    INNERIMF2 =[INNERIMF2, {array2timetable(dataemd{i,1}(1:1000,2),'RowTime', time)}];
end

INNERIMF3 = []; %ambil data IMF3
for i = 201:225
    INNERIMF3 =[INNERIMF3, {array2timetable(dataemd{i,1}(1:1000,3),'RowTime', time)}];
end

INNERIMF4 = []; %ambil data IMF4
for i = 201:225
    INNERIMF4 =[INNERIMF4, {array2timetable(dataemd{i,1}(1:1000,4),'RowTime', time)}];
end

INNERIMF5 = []; %ambil data IMF5
for i = 201:225
    INNERIMF5 =[INNERIMF5, {array2timetable(dataemd{i,1}(1:1000,5),'RowTime', time)}];
end

INNERIMF = [INNERIMF1;INNERIMF2;INNERIMF3;INNERIMF4;INNERIMF5]';

%BALL
BALLIMF1 = []; %ambil data IMF1
for i = 301:325
    BALLIMF1 =[BALLIMF1, {array2timetable(dataemd{i,1}(1:1000,1),'RowTime', time)}];
end

BALLIMF2 = []; %ambil data IMF2
for i = 301:325
    BALLIMF2 =[BALLIMF2, {array2timetable(dataemd{i,1}(1:1000,2),'RowTime', time)}];
end

BALLIMF3 = []; %ambil data IMF3
for i = 301:325
    BALLIMF3 =[BALLIMF3, {array2timetable(dataemd{i,1}(1:1000,3),'RowTime', time)}];
end

BALLIMF4 = []; %ambil data IMF4
for i = 301:325
    BALLIMF4 =[BALLIMF4, {array2timetable(dataemd{i,1}(1:1000,4),'RowTime', time)}];
end

BALLIMF5 = []; %ambil data IMF5
for i = 301:325
    BALLIMF5 =[BALLIMF5, {array2timetable(dataemd{i,1}(1:1000,5),'RowTime', time)}];
end

BALLIMF = [BALLIMF1;BALLIMF2;BALLIMF3;BALLIMF4;BALLIMF5]';

DATABARU = [NORMALIMF;OUTERIMF;INNERIMF;BALLIMF];
DATABARU = [NORMALIMF];
%Membuat Label Kondisi data
 A=repmat(1,1,25);
 A=repmat(1,1,5); 
 B=repmat(2,1,25);
 C=repmat(3,1,25);   
 D=repmat(4,1,25); 
 
Condition = categorical([A,B,C,D]'); %buat kondisi data
databaru  = table(DATABARU(:,1),DATABARU(:,2),DATABARU(:,3),...
    DATABARU(:,4),DATABARU(:,5),Condition);

Condition = categorical([A]'); %buat kondisi data
databaru  = table(DATABARU(:,1),DATABARU(:,2),DATABARU(:,3),...
    Condition);


%% Diagnostic Feature Designer EMD - STATISTICAL 1` detik 
time = milliseconds(1:1000);
IMF1 = []; %ambil data IMF1
for i = 1:400
    IMF1 =[IMF1, {array2timetable(dataemd{i,1}(1:1000,1),'RowTime', time)}];
end
IMF1 = IMF1';

IMF2 = []; %ambil data IMF2
for i = 1:400
    IMF2 =[IMF2, {array2timetable(dataemd{i,1}(1:1000,2),'RowTime', time)}];
end
IMF2 = IMF2';

IMF3 = []; %ambil data IMF3
for i = 1:400
    IMF3 =[IMF3, {array2timetable(dataemd{i,1}(1:1000,3),'RowTime', time)}];
end
IMF3 = IMF3';

IMF4 = []; %ambil data IMF3
for i = 1:400
    IMF4 =[IMF4, {array2timetable(dataemd{i,1}(1:1000,4),'RowTime', time)}];
end
IMF4 = IMF4';

IMF5 = []; %ambil data IMF3
for i = 1:400
    IMF5 =[IMF5, {array2timetable(dataemd{i,1}(1:1000,5),'RowTime', time)}];
end
IMF5 = IMF5';

 %Membuat Label Kondisi data
 A=repmat(1,1,100); 
 B=repmat(2,1,100);
 C=repmat(3,1,100);   
 D=repmat(4,1,100); 
 
Condition = categorical([A,B,C,D]'); %buat kondisi data
databaru  = table(IMF1,IMF2,IMF3,IMF4,IMF5,Condition);