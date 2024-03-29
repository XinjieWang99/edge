
clear,clc;
close all;
addpath('./npy-matlab/')
% filename = ' E:\FFQ\ѧϰ�ļ�\��Ե��ȡ\data\input.jpg';
% inputpath = 'D:/ʵ�����ݼ�/test/npys/1.npy';
% labelpath = 'D:/ʵ�����ݼ�/test/seg/1.npy';
% inputpath ='D:/FFQ/ѧϰ�ļ�/��Ե���/��Ե��ȡ/data/filter_input_0901.png';
% inputpath = 'C:/Users/user/Desktop/1.png';%1��ǿ��0815
inputpath ='XuanDong_Method.png';
segpath = 'D:/FFQ/ѧϰ�ļ�/��Ե���/��Ե��ȡ/data/filter_seg_0901.png';
labelpath = 'D:/FFQ/ѧϰ�ļ�/��Ե���/��Ե��ȡ/data/filter_edge_0901.png';
savepath = 'D:/FFQ/ѧϰ�ļ�/��Ե���/��Ե��ȡ/edge-detection-master/edge-result/0827���״�/��ǿǰ/';
v_num = 5;
% v = 0.8; % v = 0.5;
v = v_num/10.0 ;

% f=imread(filename);
% input_image = readNPY(inputpath);
% label_image = readNPY(labelpath);
input_image = imread(inputpath);
seg_image = imread(segpath);
label_image1 = imread(labelpath);
label_image = double(label_image1)/255; 
% imwrite(input_image,['E:/FFQ/ѧϰ�ļ�/��Ե��ȡ/data/','1_input','.jpg']);%�������롢��ǩͼƬ
% imwrite(label_image,['E:/FFQ/ѧϰ�ļ�/��Ե��ȡ/data/','1_label','.jpg']);%
% input_image = imread('E:\FFQ\ѧϰ�ļ�\��Ե��ȡ\data\en.jpg');
InitialImage=double(input_image)/255; 
% %ͼ���ֵ��
% level=graythresh(image);%ʹ��graythresh����Ҷ��ż�
% im=imbinarize(image,level)
% [r c d]=size(input_image);
% InitialImage=double(f)/255; 

canny_image = canny(input_image); % best
canny_and_GL_image = canny_and_GL(InitialImage);% best
Sobel_image = Sobel(InitialImage);  % better
% 
Fraction_G_L_image = Fraction_G_L(InitialImage,v);
CRONE_image = CRONE(InitialImage,v);  % good
FD_module_iamge = FD_module(InitialImage,v);
[first_improve_GL_image,fx,fy] = first_improve_GL(InitialImage,v); % better 0.5

% f1 = figure (1);
% f1=imshow(input_image,[]);
% title('ԭʼͼ��');

%--------------------------
% Muchang = sqrt(fx.^2+fy.^2);
% Jiaodu = atan(fy./fx);
% Bianyuantu = first_improve_GL_image;
% [m,n]=size(Bianyuantu);
% Lianjietu = zeros(m,n);
% for i = 3:m-2
%     for j = 3:n-2
%         if Bianyuantu(i,j) == 1
%             for x = -2:2
%                 for y = -2:2
%                     if(abs(Muchang(i,j)-Muchang(i+x,j+y))<35)&&...
%                             (abs(Jiaodu(i,j)-Jiaodu(i+x,j+y))<15*pi/180)
%                         Lianjietu(i+x,j+y)=1; %�������������˵� ������������
%                     end
%                 end
%             end
%         end
%     end       
% end
% figure(1)
% imshow(Lianjietu,[]);
% title('��Ե����ͼ');
%--------------------------

% f2 = figure (2);
% imshow(label_image,[]);
% title('��ǩ');

f3 = figure (3);
% % subplot(1,2,1)
imshow(canny_image,[]); % ��Եͼ����ʾ
% title('canny');

% subplot(1,2,2)
%  figure (4);
% differ0 = abs(label_image-canny_image);  % ��ǩͼ-��Եͼ
% s1 = sum(differ0(:)) %4.1141e+04  (v=0.5)
% d0 = sum(canny_image(:)); % ��Ե���ص���Ŀ
% imshow(differ0,[]); % ��ǩͼ-��Եͼ ��ʾ
% title('differ0');
% saveas(f3,[savepath,'canny.jpg']);
% imwrite(canny_image,[savepath,'ȥ��ǰcanny0816.jpg']);


figure (4);
% % subplot(1,2,1)
imshow(canny_and_GL_image,[]); % ��Եͼ����ʾ
title('canny-and-GL');
% % subplot(1,2,2)
% % differ1 = abs(label_image-canny_and_GL_image); % ��ǩͼ-��Եͼ
% % d1 = sum(canny_and_GL_image(:));  % ��Ե���ص���Ŀ
% % imshow(differ1,[]);  % ��ǩͼ-��Եͼ ��ʾ
% % title('differ');
imwrite(canny_and_GL_image,[savepath,'5canny_and_GL_image0829.jpg']);

% figure (5);
% % subplot(1,2,1)
% imshow(Fraction_G_L_image,[]);
% title('Fraction-G-L');
% % subplot(1,2,2)
% % differ2 = abs(label_image-Fraction_G_L_image);
% % imshow(differ2,[]);
% % title('differ');
% imwrite(Fraction_G_L_image,[savepath,'Fraction_G_L_image0611.jpg']);

% figure (6);
% % % subplot(1,2,1)
% imshow(Sobel_image,[]);
% title('Sobel');

% % subplot(1,2,2)
% % differ3 = abs(label_image-Sobel_image);
% % imshow(differ3,[]);
% % title('differ');
% imwrite(Sobel_image,[savepath,'ȥ��ǰSobel_image0815.jpg']);

% figure (7);
% % subplot(1,2,1)
% imshow(CRONE_image,[]);
% title('CRONE');
% % subplot(1,2,2)
% % differ4 = abs(label_image-CRONE_image);
% % imshow(differ4,[]);
% % title('differ');
% imwrite(CRONE_image,[savepath,'CRONE_image.jpg']);

 
% figure (8);
% % % subplot(1,2,1)
% imshow(FD_module_iamge,[]);
% title('FD-module');

% % subplot(1,2,2)
% % differ5 = abs(label_image-FD_module_iamge);
% % imshow(differ5,[]);
% % title('differ');
% imwrite(FD_module_iamge,[savepath,'ȥ��ǰFD_module_iamge0816.jpg']);

% figure (9);
% % subplot(1,2,1)
% imshow(first_improve_GL_image,[]);
% title('first-improve-GL');
% imwrite(first_improve_GL_image,[savepath,'ȥ��ǰfirst_improve_GL_image0816.jpg']);

% subplot(1,2,2)
% figure (10);
% differ6 = abs(label_image-first_improve_GL_image);******
% 1: 3.2089e+04 ; 2: 3.1666e+04 ; 3: 3.1251e+04  4: 3.0793e+04  
% 5: 3.0264e+04   6: 2.9791e+04   7: 2.9371e+04  8: 2.9144e+04
% 9: 2.8890e+04   11: 2.8597e+04  12: 2.8902e+04
% 13:2.9473e+04  14:  3.0737e+04  15: 3.2758e+04  16: 3.6596e+04
% 17:4.2248e+04  18: 4.8629e+04  

% s6 = sum(differ6(:)) %(v=0.5) 3.0264e+04 ;(v=0.7)2.8890e+04

% imshow(differ6,[]);
% title('differ6');
% imwrite(first_improve_GL_image,[savepath,'v_0627/',num2str(v_num),'first_improve_GL_image0627.jpg']);

% figure (11); 
% connect = canny_image+first_improve_GL_image;

% s =sum( sum(abs(label_image-connect)))
%  temp = connect>0.5;
%  temp2 =(temp~=0);
% imshow(temp2,[])













