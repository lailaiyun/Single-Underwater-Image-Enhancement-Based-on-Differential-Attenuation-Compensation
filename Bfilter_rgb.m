%Bilateral filter for color image
function I=Bfilter_rgb(f,r,a,b)
%f:灰度图；r:滤波半径；a:全局方差；b:局部方差
[x,y]=meshgrid(-r:r);
w1=exp(-(x.^2+y.^2)/(2*a^2));
f=tofloat(f);%f=im2double(f);

%h = waitbar(0,'Applying bilateral filter...');
%set(h,'Name','Bilateral Filter Progress');

fr = f(:,:,1);
fg = f(:,:,2);
fb = f(:,:,3);
[m,n] = size(fr);
fr_temp = padarray(fr,[r r],'symmetric');
fg_temp = padarray(fg,[r r],'symmetric');
fb_temp = padarray(fb,[r r],'symmetric');
[gr,gg,gb] = deal(zeros(size(fr)));
 
 
for i = r+1:m+r
    for j = r+1:n+r
        temp1 = fr_temp(i-r:i+r,j-r:j+r);
        temp2 = fg_temp(i-r:i+r,j-r:j+r);
        temp3 = fb_temp(i-r:i+r,j-r:j+r);
        dr = temp1 - fr_temp(i,j);
        dg = temp2 - fg_temp(i,j);
        db = temp3 - fb_temp(i,j);
        w2 = exp(-(dr.^2+dg.^2+db.^2)/(2*b^2));
        w = w1.*w2;
        gr(i-r,j-r) = sum(sum(temp1.*w))/sum(w(:));
        gg(i-r,j-r) = sum(sum(temp2.*w))/sum(w(:));
        gb(i-r,j-r) = sum(sum(temp3.*w))/sum(w(:));
    end
 %   waitbar((i-r)/n);
end
I = cat(3,gr,gg,gb);


end