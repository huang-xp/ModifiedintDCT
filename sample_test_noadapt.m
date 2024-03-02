function [stego_sig] = sample_test_noadapt(sig, frlen,base,seg_len,start_coef,end_coef);

%[sig, sfrq, nbits] = wavread( 'Da_f2.wav' );
% [orig_sig2, sfrq, nbits] = wavread( 'Ja_f1.wav','native' );
len=length(sig);
init_idct4(frlen);

nf=floor(len/frlen);
orig_sig=sig(1:nf*frlen,1)*2^15;

for i=1:nf;
  subsig=orig_sig((i-1)*frlen+1:i*frlen,1);
  emb_data=floor(rand(frlen/2,1)*2);
  idct(:,i)=int_dct4(subsig);
  
  %idct(frlen/2+1:frlen,i)=idct(frlen/2+1:frlen,i)*2+emb_data;
  idct(start_coef:end_coef,i)=idct(start_coef:end_coef,i)*2+emb_data;
  subsig=int_dct4(idct(:,i),-1);

  stego_sig((i-1)*frlen+1:i*frlen,1)=subsig;
end;
%wavwrite(stego_sig/(2^15-1),sfrq,'stego_Da_f2.wav');
%imagesc(log(abs(idct)))

%for i=1:16;
%  sum_idct(i,:)=sum(idct((i-1)*frlen/16+1:i*frlen/16,:).^2);
%end;

%err=(stego_sig-orig_sig)/base;
%sum(err.^2)