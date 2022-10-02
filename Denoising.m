function[R1,G1,B1] = Denosing(Original,r,a,b)

% r ,a ,b are parameters of bilateral filtering
% In our paper, r = 5;a = 3; b = 0.1; 


R1 = bfilt_gray(ori_img(:,:,1),r,a,b);
G1 = bfilt_gray(ori_img(:,:,2),r,a,b);
B1 = bfilt_gray(ori_img(:,:,3),r,a,b);
end