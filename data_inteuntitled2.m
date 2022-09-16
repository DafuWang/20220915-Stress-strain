% %%%%%%%%%%%%%%%%%%%%%%%%%%%应力应变数据处理%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 应力应变数据处理程序
% 3-横向（微应变）；4-纵向1（微应变）；5-纵向2（微应变）；6-位移计1（毫米）；7-位移计2（毫米）；8-力（千牛）
%读取完之后就转化为应力和应变了
clc
tic
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %% %%%%%%%%%%%%%%%%%%%%%%%%%原始数据文件名和地址输入%%%%%%%%%%%%%%%%%%%%%%%%%
Address_original_data='D:\大论文\应力-应变数据\24M\';%原始数据存储位置
Dis = dir(Address_original_data); 
DirCell=struct2cell(Dis);
filename0 = sort_nat(DirCell(1,3:end));%带后缀的CSV文件名字
filename0=filename0';

joint_point.ratio=[str2double('0.95'),str2double('0.95')];%拼接点处应力比

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('ijk.mat')
% ijk=1;
for ij=ijk:size(filename0,1)
ijk=ij;
save test.mat ij ijk filename0 Address_original_data joint_point
save ijk.mat ijk
clear
load('test.mat')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%获取word文件名%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filename02=cell2mat(filename01(ij));
% j = find('.'==filename02);
% filename = filename02(1,1:j-1);
% strcmpi(filenames{i}, filenames2{j});  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%获取文件夹名字%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename=cell2mat(filename0(ij));
fileadress=strcat(Address_original_data,filename);
ij,filename
%%%%%%%%%%%%%%%%%%%%%%%%%%%%保存有效数据通道（第一次处理需要使用）%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% excel_adress_name=strcat(fileadress,'\有效数据通道.xlsx');
% sheet_number1='sheet1';
% NUM=[3,4,5,6,7,8];
% Chan_name.transverse= NUM(1);
% Chan_name.vertical_1=NUM(2);Chan_name.vertical_2=NUM(3);
% Chan_name.LVDT_1=NUM(4);Chan_name.LVDT_2=NUM(5);
% Chan_name.load=NUM(6);
% Chan_name0=[Chan_name.transverse,Chan_name.vertical_1,Chan_name.vertical_2,Chan_name.LVDT_1,Chan_name.LVDT_2,Chan_name.load]';
% xlswrite(excel_adress_name,Chan_name0,sheet_number1,strcat(char(65),'1'));%样本名

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%读取有效数据通道%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NUM0=readtable(strcat(fileadress,'\有效数据通道.xlsx'));%读取excell数据
NUM=table2array(NUM0(:,1));

Chan_name.transverse= NUM(1);
Chan_name.vertical_1=NUM(2);Chan_name.vertical_2=NUM(3);
Chan_name.LVDT_1=NUM(4);Chan_name.LVDT_2=NUM(5);
Chan_name.load=NUM(6);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filespec_user = (strcat('D:\大论文\大论文\第七章\应力应变数据报告\',filename,'.doc'));% 设定测试Word文件名和路径
[Word,Document,Content,Selection]=word_active_and_open(filespec_user);%word得激活和创建
L=word_PageSetup(Document);%% 页面设置
Content.Start = 0;%设定光标位置
Paragraphformat = Selection.ParagraphFormat;

Num.figures=1;n_table=1;Num.equation=1;Num.Table=1;Num.refer=1;%用于记录图片、表格、公式、参考文献得个数
%% %%%%%%%%%%%%%%%%%%%%%%%%标题%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
title = strcat(filename,'应力应变数据处理报告');
Content.Text = title;L=set_format_title1(Content);%字体和段落格式设定 
%% 
n_title2=1;n_title3=1;n_title4=1;%用于记录二级，三级，四级标题
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title1 = strcat(num2str(n_title2),'. 原始数据');n_title2=n_title2+1;
Selection.Text = Title1;L=set_format_title2(Selection);%格式设定

Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
[T1_content] =Title1_content(Chan_name);

for i=1:size(T1_content)%不同段落的写入
Selection.Text = T1_content{i,1};L=set_format_for_text(Selection);
Selection.Start = Content.end;Selection.TypeParagraph;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%应力应变获取和计算%%%%%%%%%%%%%%%%%%%%%%%%%%% %

[maximum,joint_point,stress,full_strain_gauge_t,full_strain_gauge_v1,full_strain_gauge_v2,strain_lvdt1,strain_lvdt2,...
ultimate_stress,index_for_stress,strain_gauge0,strain_gauge1,strain_gauge2,strain_gauge_average,...
ultimate_strain_gauge0,ultimate_strain_gauge1,ultimate_strain_gauge2,ultimate_strain_lvdt1,ultimate_strain_lvdt2]...
=reading_orignal_data_from_excell(fileadress,Chan_name,joint_point); %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%应变数据拼接和平均%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
[strain_joint11,strain_joint22,strain_joint12,strain_joint21,... %
strain_joint11_22,strain_joint12_21,strain_joint12_22,strain_joint11_21,index_for_joint,index_for_joint_average]...
=first_proces_orignal_data(index_for_stress,strain_gauge1,strain_lvdt1,strain_gauge2,strain_lvdt2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%原始应变数据拼接和平均数据保存%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[I1,I_strain,I_strain_jiont,I_strain_jiont_average]=original_and_first_proces_data_save(full_strain_gauge_t,full_strain_gauge_v1,full_strain_gauge_v2,stress,strain_lvdt1,strain_lvdt2,...
                                                     ultimate_stress,strain_gauge0,strain_gauge1,strain_gauge2,...
                                                     ultimate_strain_gauge0,ultimate_strain_gauge1,ultimate_strain_gauge2,ultimate_strain_lvdt1,ultimate_strain_lvdt2,...
                                                     strain_joint11,strain_joint22,strain_joint12,strain_joint21,...
                                                     strain_joint11_22,strain_joint12_21,strain_joint12_22,strain_joint11_21,...
                                                     index_for_stress,index_for_joint,index_for_joint_average,...                                                   
                                                     fileadress,filename);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%原始应变数据拼接和平均数据画图%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I=1;%图的编号
[I,II,Document,Content,Selection,Num,n_table]=original_and_first_proces_data_figures(maximum,stress,full_strain_gauge_t,full_strain_gauge_v1,full_strain_gauge_v2,strain_lvdt1,strain_lvdt2,...
                                             joint_point,index_for_stress,index_for_joint,index_for_joint_average,strain_gauge1,strain_gauge2,strain_gauge_average,...
                                             strain_joint11,strain_joint22,strain_joint12,strain_joint21,...
                                             strain_joint11_22,strain_joint12_21,strain_joint12_22,strain_joint11_21,...
                                             fileadress,filename,I,...
                                             Document,Content,Selection,Num,n_table);

% 参数计算及数据拟合
% -------------------------------------------------------------------------
%规范里的
[A_joint_code,beta_joint_code,alpha_joint,R2_joint_beta_code,R2_joint_alph,Document,Content,Selection,Num,n_table,A_average_code,average_beta_code,average_alph,R2_average_beta_code,R2_average_alph,n_title2,n_title3]=fit_data_figures_with_alpha_beta(fileadress,filename,I,Document,Content,Selection,Num,n_table,n_title2,n_title3);


Document.Save; % 保存文档
Document.Close; % 关闭文档
Word.Quit; % 退出word服务器

toc;
end

