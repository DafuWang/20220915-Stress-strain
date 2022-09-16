function [ A_joint,beta_joint,R2_joint, Document,Content,Selection,Num,n_table, A_average,beta_average,R2_average,n_title2,n_title3]=fit_data_figures_with_beta(fileadress,filename,I,Document,Content,Selection,Num,n_table,n_title2,n_title3)

fileadress1=strcat(fileadress,'\',filename);
[NUM_first_proces,TXT1,RAW1]=xlsread(fileadress1);%读取excell数据
NUM_strain_GL=NUM_first_proces(:,2:10);%未拼接前横向和纵向应变
NUM_joint=NUM_first_proces(:,12:19);%取拼接应变和应力
NUM_joint_average=NUM_first_proces(:,21:28);%取拼接应变和应力


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%拼接应变数据拟合%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[A_joint,beta_joint,ultimate_stress_joint,ultimate_strain_joint,R2_joint,save_adress_name,figure_name]=fitting_stress_joint_strain_with_beta(fileadress,filename,NUM_joint,I);
%-------------------------------------插入小标题-----------------------------
n_title3=n_title3+1;
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title1 = strcat(num2str(n_title2),'.',num2str(n_title3),'. 单beta参数拟合');n_title4=1;
Selection.Text = Title1;L=set_format_title3(Selection);%格式设定
%-------------------------------------插入公式-----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
str_eq='$\frac{\sigma_{c}}{\sigma_{c}^{\prime}}=\frac{\beta\left(\varepsilon_{c} / \varepsilon_{c}^{\prime}\right)}{\beta-1+\left(\varepsilon_{c} / \varepsilon_{c}^{\prime}\right)^{1\beta}}$';
[n_table,Num.equation]=tables_equation_and_number(Document,Selection,str_eq,n_table,Num.equation);


%-------------------------------------插入小标题-----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title1 = strcat(num2str(n_title2),'.',num2str(n_title3),'.',num2str(n_title4),'. 应力和拼接应变');n_title4=n_title4+1;
Selection.Text = Title1;L=set_format_title4(Selection);%格式设定

%-------------------------------------插入图片-----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=2;n_columns=1;
figure_title='拼接应变数据及其拟合';
[Document,Selection,n_table,Num]=tables_figures_and_name(Document,Selection,save_adress_name,figure_name,figure_title,n_rows,n_columns,Num,n_table);
%-------------------------------------插入表格-----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=6;n_columns=5;
table_name="拼接应变和应力拟合数据";
table_content_t=["\beta","$\sigma_{c}^{'}(MPa)$","$\varepsilon_{c}^{'}(\mu \varepsilon)$" ,"R^2" ];
table_content_v=["S1L1","S2L2","S1L2","S2L1"];
table_data=[beta_joint',ultimate_stress_joint',ultimate_strain_joint',R2_joint'];
[n_table,Content,Num]=tables_Tables_and_name(Document,Content,Selection,n_rows,n_columns,table_data,table_name,table_content_t,table_content_v,Num,n_table);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%平均拼接应变数据拟合%%%%%%%%%%%%%%%%%%%%%%%%%%%
[A_average,beta_average,ultimate_stress_average,ultimate_strain_average,R2_average,save_adress_name,figure_name]=fitting_stress_average_strain_with_beta(fileadress,filename,NUM_joint_average,I);

%-------------------------------------插入小标题-----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title1 = strcat(num2str(n_title2),'.',num2str(n_title3),'.',num2str(n_title4),'. 应力和平均拼接应变');n_title4=n_title4+1;
Selection.Text = Title1;L=set_format_title4(Selection);%格式设定

%-------------------------------------插入图片-----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=2;n_columns=1;
figure_title="平均拼接应变和应力拟合数据";
[Document,Selection,n_table,Num]=tables_figures_and_name(Document,Selection,save_adress_name,figure_name,figure_title,n_rows,n_columns,Num,n_table);

%-------------------------------------插入表格-----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=6;n_columns=5;
table_name="平均拼接应变和应力拟合数据";
table_content_t=["\beta","$\sigma_{c}^{'}(MPa)$","$\varepsilon_{c}^{'}(\mu \varepsilon)$" ,"R^2" ];
table_content_v=["\overline{G1L1+G2L2}","\overline{G1L2+G2L1}","\overline{G1L2+G2L2}","\overline{G1L1+G2L1}"];

table_data=[beta_average',ultimate_stress_average',ultimate_strain_average',R2_average'];
[n_table,Content,Num]=tables_Tables_and_name(Document,Content,Selection,n_rows,n_columns,table_data,table_name,table_content_t,table_content_v,Num,n_table);


