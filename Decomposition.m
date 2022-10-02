function [Cr,Dg,Db] = Decomposition(R1,G1,B1)

% v = max(m,n) denotes that the filter size of  mean filter 
[m,n] = size(R1);
v = max(m,n);

% Cr is the base layer(BL) of R channel
H = fspecial('average',[v v]);     
Cr = imfilter(R1,H);

%Dg is the Detail layer(DL) of D channel
%Cg is the base layer(BL) of D channel
Cg = imfilter(G1,H);
Dg = G1 - Cg;


%Db is the Detail layer(DL) of B channel
%Cb is the base layer(BL) of B channel
%Step5:DL of B channel
Cb = imfilter(B1,H);
Db = B1 - Cb;

end