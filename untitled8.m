Address_original_data='D:\大论文\应力-应变数据\24M\';%原始数据存储位置
Dis = dir(Address_original_data); 
DirCell=struct2cell(Dis);
filename0 = sort_nat(DirCell(1,3:end));%带后缀的CSV文件名字
filename0 =filename0';

Address_original_data1='D:\大论文\大论文\第七章\未分析完全的试样\';%原始数据存储位置
Dis1 = dir(Address_original_data1); 
DirCell1=struct2cell(Dis1);
filename01 = sort_nat(DirCell1(1,3:end));%带后缀的CSV文件名字
filename01=filename01';

clc

for i=1:size(filename01,1)
    filename02=cell2mat(filename01(i));
    j = find('.'==filename02);
    imname = filename02(1,1:j-1);
    for k=1:size(filename0,1)
        filename00=cell2mat(filename0(k));
        if strcmp(imname,filename00)==1
            N_unanalysed(i)=k;
        end
    end
end
i
% clear; clc
% 
% rootPath = '.\';
% 
% % 生成文件（用于测试）
% fp = fopen('test.txt','w');
% fclose(fp);
% 
% % 新建文件夹（路径）
% subPath1 = fullfile(rootPath,'1');
% subPath2 = fullfile(rootPath,'2');
% 
% if ~exist(subPath1,'dir')
%     mkdir(subPath1) % 新建
% end
% if ~exist(subPath2,'dir')
%     mkdir(subPath2) % 新建
% end
% 
% % 移动文件
% fileName = 'test.txt';
% source = fullfile(rootPath,fileName);
% destination = fullfile(subPath1,fileName);
% 
% movefile(source,destination); % 移动
% 
% % 复制文件
% source = fullfile(subPath1,fileName);
% destination = fullfile(subPath2,fileName);
% copyfile(source,destination); %  复制
% 
% % 删除文件
% file = fullfile(subPath1,fileName);
% recycle('on') % 设置'off'，则不进入回收站，直接删除。
% delete(file)
% 
% % 删除文件夹
% rmdir(subPath1) 
% try
%     rmdir(subPath2)  % 注：若文件夹内有文件，是无法删除的
% catch
%    disp('文件夹内有文件，无法删除')
% end
% 
% % 修改文件夹名
% subPath3 = fullfile(rootPath,'3');
% movefile(subPath2,subPath3); % 没有直接修改文件夹名的函数，可以通过移动实现修改
% 
