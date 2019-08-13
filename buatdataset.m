%% Edited by : Bima Priambodo Wahyu Rianto
% D4 Mechatronics Engineering
% Departement of Mechanical and Energy Departement
% Politeknik Elektronika Negeri Surabaya
clear all
clc
%%
%Membuat dataset .mat dengan format timetable
data =  xlsread('D:\RESEARCH\PENS\TUGAS AKHIR NJER\5. BELAJAR\ambildata6\dataset new 2\DATASET5DETIK.xlsx','dataset');
time = milliseconds(1:1000);

n = length(data(1,:))
dataset = []
for i = 1:n
    dataset = [dataset; {array2timetable(data(:,i), 'RowTime', time)}];
end

%Membuat Label Kondisi data
 A=repmat(1,1,100); 
 B=repmat(2,1,100);
 C=repmat(3,1,100);   
 D=repmat(4,1,100); 
 
Condition = categorical([A,B,C,D]'); %buat kondisi data
databaru  = table(dataset,Condition);
%% Buat segmentasi sinyal
data =  xlsread('D:\RESEARCH\PENS\TUGAS AKHIR NJER\5. BELAJAR\ambildata6\dataset new 2\DATASET5DETIK.xlsx','dataset');
p = 5 %kelompok data
n = (length(data) / p); %mau dibuat berapa kolom
data = data(1:5000,80);
dataset = []
    for i = 1:n
        a = (i-1) * p + 1; %rumusnya menyebalkan dari alfian;
        b = i * p;
        dataset = [dataset, data(a:b)];
    end 
dataset = dataset';
