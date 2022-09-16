function [C_A,C_beta,C_b,C_R2,Document,Content,Selection,Num,n_table,n_title2,n_title3]=fit_data_figures_with_b(fileadress,filename,I,Document,Content,Selection,Num,n_table,n_title2,n_title3,...
                                                 beta_c1,beta_c2)


fileadress1=strcat(fileadress,'\',filename);
[NUM_first_proces,TXT1,RAW1]=xlsread(fileadress1);%读取excell数据
NUM_joint=NUM_first_proces(:,12:19);%取拼接应变和应力
NUM_joint_average=NUM_first_proces(:,21:28);%取拼接应变和应力

save_adress_name1{1,1}=strcat(fileadress,'\',filename,' stress strain fitting with b','joint_c1');
save_adress_name2{1,1}=strcat(fileadress,'\',filename,' stress strain fitting with b','joint_c2');
save_adress_name3{1,1}=strcat(fileadress,'\',filename,' stress strain fitting with b','average_c1');
save_adress_name4{1,1}=strcat(fileadress,'\',filename,' stress strain fitting with b','average_c2');

data_legnend1=["$experiment\,strain\,S1L1$","$experiment\,strain\,S2L2$","$experiment\,strain\,S1L2$","$experiment\,strain\,S2L1$"];
data_legnend2=data_legnend1;
data_legnend3=["$exp\, \overline{G1L1+G2L2}$","$exp\, \overline{G1L2+G2L1}$","$exp\,\overline{G1L2+G2L2}$","$exp\,\overline{G1L1+G2L1}$"];
data_legnend4=data_legnend3;

fiting_legend1=["$fit\,S1L1\,with\,b$","$fit\,S2L2\,with\,b$","$fit\,S1L2\,with\,b$","$fit\,S2L1\,with\,b$"];
fiting_legend2=fiting_legend1;
fiting_legend3=["$fit\, \overline{G1L1+G2L2}$","$fit\, \overline{G1L2+G2L1}$","$fit\,\overline{G1L2+G2L2}$","$fit\,\overline{G1L1+G2L1}$"];
fiting_legend4=fiting_legend3;

 
figure_name1='fitting\,for\,stress\,and\,strain\,of\,joint\,with\,b\,\beta\,1';
figure_name2='fitting\,for\,stress\,and\,strain\,of\,joint\,with\,b\,\beta\,2';
figure_name3='fitting\,for\,stress\,and\,strain\,of\,average\,with\,b\,\beta\,1';
figure_name4='fitting\,for\,stress\,and\,strain\,of\,average\,with\,b\,\beta\,2';

%--------------------------------------插入标题----------------------------
n_title3=n_title3+1;
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title1 = strcat(num2str(n_title2),'.',num2str(n_title3),'. 单b参数拟合');n_title4=1;
Selection.Text = Title1;L=set_format_title3(Selection);%格式设定
%--------------------------------------插入公式----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
str_eq=strcat('$\beta=\frac{1}{1-\frac{\sigma_{c}^{\prime}}{\varepsilon_{c}^{\prime} E_{i}}}$');
[n_table,Num.equation]=tables_equation_and_number(Document,Selection,str_eq,n_table,Num.equation);
%--------------------------------------插入公式----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
str_eq=strcat('$\left(0.4 \frac{\sigma_{c}^{\prime}}{E_{c} \varepsilon_{c}^{\prime}}\right)^{\beta}-\beta\left(\frac{\sigma_{c}^{\prime}}{E_{c} \varepsilon_{c}^{\prime}}-1\right)-1=0$');
[n_table,Num.equation]=tables_equation_and_number(Document,Selection,str_eq,n_table,Num.equation);
%--------------------------------------插入标题----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title1 = strcat(num2str(n_title2),'.',num2str(n_title3),'.',num2str(n_title4),'. 应力和拼接应变');n_title4=n_title4+1;
Selection.Text = Title1;L=set_format_title4(Selection);%格式设定





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%拼接应变+beta1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[C_A.joint_c1,C_beta.joint_c1,C_b.joint_c1,C_R2.joint_c1,I]=fitting_stress_strain_with_b(filename,save_adress_name1,data_legnend1,fiting_legend1,NUM_joint,beta_c1,I);
%-------------------------------------插入图片-----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=2;n_columns=1;
figure_title='采用公式3计算的beta拟合拼接应变和应力';
[Document,Selection,n_table,Num]=tables_figures_and_name(Document,Selection,save_adress_name1,figure_name1,figure_title,n_rows,n_columns,Num,n_table);
%-------------------------------------插入表格-----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=6;n_columns=4;
table_name="采用公式3计算的beta拼接应变和应力拟合数据";
table_content_t=["\beta","b","R^2" ];
table_content_v=["S1L1","S2L2","S1L2","S2L1"];
table_data=[C_beta.joint_c1',C_b.joint_c1',C_R2.joint_c1'];
[n_table,Content,Num]=tables_Tables_and_name(Document,Content,Selection,n_rows,n_columns,table_data,table_name,table_content_t,table_content_v,Num,n_table);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%拼接应变+beta2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[C_A.joint_c2,C_beta.joint_c2,C_b.joint_c2,C_R2.joint_c2,I]=fitting_stress_strain_with_b(filename,save_adress_name2,data_legnend2,fiting_legend2,NUM_joint,beta_c2,I);
%-------------------------------------插入图片-----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=2;n_columns=1;
figure_title='采用公式4计算的beta拟合拼接应变和应力';
[Document,Selection,n_table,Num]=tables_figures_and_name(Document,Selection,save_adress_name1,figure_name1,figure_title,n_rows,n_columns,Num,n_table);

Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=6;n_columns=4;
table_name="采用公式4计算的beta拼接应变和应力拟合数据";
table_content_t=["\beta","b","R^2" ];
table_content_v=["S1L1","S2L2","S1L2","S2L1"];
table_data=[C_beta.joint_c2',C_b.joint_c2',C_R2.joint_c2'];
[n_table,Content,Num]=tables_Tables_and_name(Document,Content,Selection,n_rows,n_columns,table_data,table_name,table_content_t,table_content_v,Num,n_table);

Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title1 = strcat(num2str(n_title2),'.',num2str(n_title3),'.',num2str(n_title4),'. 应力和平均拼接应变');n_title4=n_title4+1;
Selection.Text = Title1;L=set_format_title4(Selection);%格式设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%平均应变+beta1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[C_A.average_c1,C_beta.average_c1,C_b.average_c1,C_R2.average_c1,I]=fitting_stress_strain_with_b(filename,save_adress_name3,data_legnend3,fiting_legend3,NUM_joint_average,beta_c1,I);
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=2;n_columns=1;
figure_title='采用公式3计算的beta拟合平均应变和应力';
[Document,Selection,n_table,Num]=tables_figures_and_name(Document,Selection,save_adress_name1,figure_name1,figure_title,n_rows,n_columns,Num,n_table);

Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=6;n_columns=4;
table_name="采用公式3计算的beta平均应变和应力拟合数据";
table_content_t=["\beta","b","R^2" ];
table_content_v=["\overline{G1L1+G2L2}","\overline{G1L2+G2L1}","\overline{G1L2+G2L2}","\overline{G1L1+G2L1}"];
table_data=[C_beta.average_c1',C_b.average_c1',C_R2.average_c1'];
[n_table,Content,Num]=tables_Tables_and_name(Document,Content,Selection,n_rows,n_columns,table_data,table_name,table_content_t,table_content_v,Num,n_table);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%平均应变+beta2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[C_A.average_c2,C_beta.average_c2,C_b.average_c2,C_R2.average_c2,I]=fitting_stress_strain_with_b(filename,save_adress_name4,data_legnend4,fiting_legend4,NUM_joint_average,beta_c2,I);
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=2;n_columns=1;
figure_title='采用公式4计算的beta拟合平均应变和应力';
[Document,Selection,n_table,Num]=tables_figures_and_name(Document,Selection,save_adress_name1,figure_name1,figure_title,n_rows,n_columns,Num,n_table);

Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=6;n_columns=4;
table_name="采用公式4计算的beta平均应变和应力拟合数据";
table_content_t=["\beta","b","R^2" ];
table_content_v=["\overline{G1L1+G2L2}","\overline{G1L2+G2L1}","\overline{G1L2+G2L2}","\overline{G1L1+G2L1}"];
table_data=[C_beta.average_c2',C_b.average_c2',C_R2.average_c2'];
[n_table,Content,Num]=tables_Tables_and_name(Document,Content,Selection,n_rows,n_columns,table_data,table_name,table_content_t,table_content_v,Num,n_table);

 



