% 5年生の短時間Fourier変換（short-time Fourier transform: STFT）実習
clear; close all; clc;

% 440Hz＋880Hzの信号（10秒，サンプリング周波数16kHz）を生成
time = 10;
Fs = 16000;
f1=440;
f2=880;
omega1=2*pi*f1;
omega2=2*pi*f2;
t=0:Fs:time;

Wave1=sin(omega1*t);
Wave2=sin(omega2*t);

Wave=Wave1+Wave2;

% STFT実装

% パワースペクトログラムの表示

% 上記ができたら自分の声をaudacityで録音してwavファイルを用意し，パワースペクトログラムで見てみる

% Good luck!