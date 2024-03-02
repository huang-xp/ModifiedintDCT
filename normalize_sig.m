%files = dir('.\original_data\*.wav');
files = dir('*.wav');
%files = dir('Ja_m5.wav');
N = 2048;
for n=1:length(files)
	[path, name, ext] = fileparts(files(n).name);
	disp(name);
	[x,fs,nbits] = wavread(files(n).name);
	%left = x(:,1);
	%right = x(:,2);
	len = length( x );
	times = floor( len/N );
	%sig2_left = left(1:times*N);
	%sig2_right = right(1:times*N);
	%sig2 = [sig2_left,sig2_right];
	wavwrite(x(1:times*N), fs, nbits, [name '.wav']);
	%wavwrite(sig2, fs, nbits, [name '_.wav']);
end