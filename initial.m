%pkg load communications;

% Configuration
gainfact = 0.5;
frlen = 2048;
base = 2^15;
seg_len=16;
start_index = 9;
start_coef=(start_index - 1)*frlen/seg_len + 1;
end_coef = start_coef + frlen /2 -1;