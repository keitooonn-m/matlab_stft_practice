function fact(time,wave,Fs)
%% STFT実装
[~, b]=size(wave);
timeAxis = time * Fs;
N = 1024; % FFT長
shift = N / 2; % シフト長
s = size(wave, 1); % 波のサイズ
J = ceil(s / shift); %
win = hann(1, N); %　ハン窓

%　行列の初期化
X = zeros(N, J); 
spect = zeros(N, J); 
pad = J * shift - timeAxis;
wave = [wave;zeros(b, pad)'];

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
end