clc ;clear all;close all;

image = imread('image_name');
ori_img = double(image);


r = 5;
a = 3; 
b = 0.1; 
[R1,G1,B1] = Denosing(Original,r,a,b);


[Cr,Dg,Db] = Decomposition(R1,G1,B1);

R_out = Compensation(R1,G1,B1,Cr,Dg,Db);


[R_new,G_new,B_new] = ScaleGrayWorld(R_out,G1,B1);

final = cat(3,R_new,G_new,B_new);

output=uint8(final);