function y = int_dct4(x, direc);

global R1 R2 T1 T2 S iR1 iR2 iT1 iT2 iS; 

N = length(x);
x1 = x(1:2:N);
x2 = x(2:2:N);


if nargin < 2
  tmp = round(T2*[x1; x2]);
  tmp = round(T1*tmp);
  tmp = round(S*tmp);
  tmp = round(R2*tmp);
  y = round(R1*tmp);
else
  tmp = round(iR1*x);
  tmp = round(iR2*tmp);
  tmp = round(iS*tmp);
  tmp = round(iT1*tmp);
  tmp = round(iT2*tmp);
  y(1:2:N) = tmp(1:N/2);
  y(2:2:N) = tmp(N/2+1:N);
  y = y';
end
