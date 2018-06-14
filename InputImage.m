%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONTACT:
% Shuo Zhang (shuo.zhang@buaa.edu.cn)

% TERMS OF USE : 
% Any scientific work that makes use of our code should appropriately
% mention this in the text and cite our CVIU 2016 paper. For commercial
% use, please contact us.

% PAPER TO CITE:
% Shuo Zhang, Hao Sheng, Chao Li, Jun Zhang and Zhang Xiong.
% Robust depth estimation for light field via spinning parallelogram operator
% Computer Vision and Image Understanding, 2016, 145(C), 148-159

% BIBTEX TO CITE:
%   @article{Zhang2016Robust,
%     title={Robust depth estimation for light field via spinning parallelogram 
%   		  operator},
%     author={Zhang, Shuo and Sheng, Hao and Li, Chao and Zhang, Jun and Xiong, 
%   		  Zhang},
%     journal={Computer Vision and Image Understanding},
%     volume={145},
%     pages={148-159},
%     year={2016},
%     } 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  Parameter setting
% input path
file_input = 'input/'; 
% angular resolution 
NumView = 9; 
% test
count = 0;
img = imread(strcat(file_input,'input_Cam0',num2str(count/10),num2str(mod(count,10)),'.png'));
[height, width, nB] = size(img);

%% LF image for SPO input
LF = zeros(height*NumView,width*NumView,nB); 
for i = 1:NumView
    for j = 1:NumView
        num2 = mod(count,10);
        num1 = floor(count/10);
        img = imread([file_input,'input_Cam0',num2str(num1),num2str(num2),'.png']);
        LF(i:NumView:end,j:NumView:end,:) = img;
        count = count+1;
    end
end
imwrite(uint8(LF),'lf.png');
