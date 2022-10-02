function R_out = Compensation(R1,G1,B1,Cr,Dg,Db)
    [m,n]=size(R1);
    %Step 4 R_3
    A = R1;
    B = reshape(A,[],size(A,1)*size(A,2));
    B = sort(B,2,'ascend');
    B = reshape(B,size(A,1),[]);
    Bup = B.'; 

    thre= m*n*0.2;
    a = floor(thre/n); 
    b = (thre/n - a)*m;

    if a ==0
        a=1;
    else a = a;
    end

    if b == 0
        b = m;
    else b = floor(b);
    end
    thre_value = Bup(a,b);    

    R3=zeros(m,n);
    for i=1:m
        for j=1:n
            if R1(i,j)>=thre_value
                R3(i,j)=R1(i,j);
            else R3(i,j)=0;
            end

        end
    end
    %Judge
    G_ave = mean2(G1); 
    B_ave = mean2(B1);
    if G_ave > B_ave
        R_out = Cr + Dg ;
    else R_out = Cr + Db ;
    end
end

