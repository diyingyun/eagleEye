
clear;
clc;
tic
a=imread('d:\image\xx.jpg','jpg');       %Read a image 
%a=imread('d:\image\clock.tif','tif');
%a=imread('d:\image\zhuangjia.tiff','tiff');
%a=a(:,:,1);
% % a=M;
% %load('source_N0.02.mat');
% %a=X;
%a=imread('syn1-g2.gif'); 
%load('装甲车N_0.01.mat');
%a=b;
%a=noise_h;
subplot(1,2,1);
imshow(a);  
[m,n]=size(a);
 
%b=imnoise(a,'salt & pepper',0.003);
%b=imnoise(b,'gaussian',0,0.0015);
%b = IMNOISE(a,'speckle',0.09);
%b=a;
a0=double(a);
h=1;                          
a1=zeros(m,n);
% 计算平均领域灰度的一维灰度直方图
for i=1:m
    for j=1:n
        for k=-h:h
            for w=-h:h;
                p=i+k;
                q=j+w;
                if (p<=0)|( p>m)
                    p=i;
                end
                if (q<=0)|(q>n)
                    q=j;
                end
                 a1(i,j)=a0(p,q)+a1(i,j);
             end
        end
        a2(i,j)=uint8(1/9*a1(i,j));
    end
end
fxy=zeros(256,256);
% 计算二维直方图
for i=1:m
    for j=1:n
        c=a0(i,j);
        d=double(a2(i,j));
        fxy(c+1,d+1)=fxy(c+1,d+1)+1;
     end
  end
%  figure,
%  mesh(fxy);
%  title('二维灰度直方图');
Pxy=fxy/m/n;
P0=zeros(256,256);
Ui=zeros(256,256);
Uj=zeros(256,256);
P0(1,1)=Pxy(1,1);
for i=2:256
    P0(1,i)=P0(1,i-1)+Pxy(1,i);
end
for i=2:256
    P0(i,1)=P0(i-1,1)+Pxy(i,1);
end
for i=2:256
    for j=2:256
        P0(i,j)=P0(i,j-1)+P0(i-1,j)-P0(i-1,j-1)+Pxy(i,j);
    end
end
P1=ones(256,256)-P0;
Ui(1,1)=0;
for i=2:256
    Ui(1,i)=Ui(1,i-1)+(1-1)*Pxy(1,i);
end
for i=2:256
    Ui(i,1)=Ui(i-1,1)+(i-1)*Pxy(i,1);
end
for i=2:256
    for j=2:256
        Ui(i,j)=Ui(i,j-1)+Ui(i-1,j)-Ui(i-1,j-1)+(i-1)*Pxy(i,j);
    end
end
Uj(1,1)=0;
for i=2:256
    Uj(1,i)=Uj(1,i-1)+(i-1)*Pxy(1,i);
end
for i=2:256
    Uj(i,1)=Uj(i-1,1)+(1-1)*Pxy(i,1);
end
for i=2:256
    for j=2:256
        Uj(i,j)=Uj(i,j-1)+Uj(i-1,j)-Uj(i-1,j-1)+(j-1)*Pxy(i,j);
    end
end
uti=0;
utj=0;
for i=1:256
    for j=1:256
        uti=uti+(i-1)*Pxy(i,j); 
        utj=utj+(j-1)*Pxy(i,j);
    end
end
% for i=1:256
%     for j=1:256
%       Ui1(i,j)=Ui(256,256)-Ui(i,j);
%       Uj1(i,j)=Uj(256,256)-Uj(i,j);
%     end
% end
%计算类间方差
hmax=0;
for i=1:256
    for j=1:256
       if P0(i,j)~=0&P1(i,j)~=0
        h(i,j)=((uti*P0(i,j)-Ui(i,j))^2+(utj*P0(i,j)-Uj(i,j))^2)/(P1(i,j)*P0(i,j));
       else
        h(i,j)=0;
       end
    end
end
hmax=max(h(:));
for i=1:256
    for j=1:256
        if h(i,j)==hmax
             s=i-1;
             t=j-1;
             continue;
         end
     end
 end
hmax
s
t
z=ones(m,n); 
%c=zeros(m,n);  
for i=1:m
    for j=1:n
      if a(i,j)<=s&a2(i,j)<=t 
      %if double(b(i,j))+double(a2(i,j))<=s+t  
       z(i,j)=0;      
      end
  end
end
%imwrite(z,'D:\MATLAB7\work\feng\文章涉及到的\曲线otsu\曲线otsu实验结果\baboon\wuprocess.jpg'); 
%imwrite(z,'D:\MATLAB7\work\feng\文章涉及到的\曲线otsu\曲线otsu实验结果\baboon\you_process.jpg');
%imwrite(uint8(b),'D:\MATLAB7\work\feng\文章涉及到的\曲线otsu\曲线otsu实验结果\baboon\yuantu.jpg'); 
subplot(1,2,2);
imshow(z);
toc

 

 
 