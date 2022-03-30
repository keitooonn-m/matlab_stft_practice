% 5年生の短時間Fourier変換（short-time Fourier transform: STFT）実習
clear; close all; clc;

%% 440Hz＋880Hzの信号（10秒，サンプリング周波数16kHz）を生成
time = 10;  % 信号の時間長
Fs = 16000; % サンプリング周波数
f1 = 440;   % 1つめの信号の周波数
f2 = 880;   % 2つめの信号の周波数
omega1 = 2 * pi * f1;   % 1つめの信号の角周波数
omega2 = 2 * pi * f2;   % 2つめの信号の角周波数
t = 0:1/Fs:time;    %変数t

wave1 = sin(omega1 * t);    % 1つめの信号
wave2 = sin(omega2 * t);    % 2つめの信号

wave = wave1 + wave2;

%% STFT実装

% パワースペクトログラムの表示

% 上記ができたら自分の声をaudacityで録音してwavファイルを用意し，パワースペクトログラムで見てみる

% Good luck!