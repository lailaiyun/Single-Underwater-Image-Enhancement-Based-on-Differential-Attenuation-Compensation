function [R_new,G_new,B_new] = ScaleGrayWorld(R_out,G1,B1)

Rave = mean2(R_out);
Gave = mean2(G1); 
Bave = mean2(B1);
K = (Rave + Gave + Bave) / 3;

% a is the scale parameter of R channel
a=0.8;

R_new=a*(K/Rave)*R_out;
G_new=(K/Gave)*G1;
B_new=(K/Bave)*B1;

end