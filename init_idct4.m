function init_idct4(N);

global R1 R2 T1 T2 S iR1 iR2 iT1 iT2 iS; 

[c, r] = size(R1);
if c == N
  return;
end

zmat = zeros(N/2, N/2);

for k=0:N/2-1
  H1(N/2-k, k+1) = -tan((2*k+1)*pi/(8*N));
  H2(N/2-k, k+1) = sin((N-(2*k+1))*pi/(4*N));
  D(k+1, k+1) = (-1)^rem(k, 2);
  I(k+1,k+1) = 1;
  C(k+1,:) = sqrt(4/N)*cos(2*(k+1/2)*((0:(N/2-1))+1/2)*pi/N);
end
H3 = H1;

K1 = -(C*D + sqrt(2)*I)*C;
K2 = C/sqrt(2);
K3 = sqrt(2)*C*D + I;

R1 = [I, zmat; H1, I];
R2 = [I, H2; zmat, I];
T1 = [-D, K2; zmat, I];
T2 = [I, zmat; K3, I];
S = [I, zmat; H3+K1, I]; 
clear I zmat H1 H2 H3 K1 K2 K3;
iR1 = inv(R1);
iR2 = inv(R2);
iT1 = inv(T1);
iT2 = inv(T2);
iS = inv(S);

