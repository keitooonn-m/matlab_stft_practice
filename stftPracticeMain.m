% 5年生の短時間Fourier変換（short-time Fourier transform: STFT）実習
clear; close all; clc;

%% 440Hz＋880Hzの信号（10秒，サンプリング周波数16kHz）を生成
time = 10;  % 信号の時間長
Fs = 16000; % サンプリング周波数
f1 = 440;   % 1つめの信号の周波数
f2 = 880;   % 2つめの信号の周波数
omega1 = 2 * pi * f1;   % 1つめの信号の角周波数
omega2 = 2 * pi * f2;   % 2つめの信号の角周波数
timeAxis = time * Fs;
t = linspace(0, time, timeAxis)';    %変数t

wave1 = sin(omega1 * t);    % 1つめの信号
wave2 = sin(omega2 * t);    % 2つめの信号

wave = wave1 + wave2;

%% STFT実装

N = 1024; % FFT長
shift = N / 2; % シフト長
s = size(wave, 1); % 波のサイズ
J = ceil(s / shift); %
win = hann(1, N); %　ハン窓

%　行列の初期化
X = zeros(N, J); 
spect = zeros(N, J); 
pad = J * shift - timeAxis;
wave = [wave;zeros(1, pad)'];

for i = 1 : J - 1
    a = wave(shift * (i - 1) +1:N + shift * (i - 1)); % 切り出し
    X(:, i) = a;
    spect(:, i) = (abs(fft(X(:, i) .* win))).^2;  % スペクトグラム作る
end


% パワースペクトログラムの表示
spectg = 10 * log10(spect);
x = 0 : time;
y = 0 : Fs;
imagesc(x, y, spectg); % 表示
axis xy;    %　左下原点

% 上記ができたら自分の声をaudacityで録音してwavファイルを用意し，パワースペクトログラムで見てみる

% Good luck!