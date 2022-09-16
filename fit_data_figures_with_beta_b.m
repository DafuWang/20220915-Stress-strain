function [I,Ei,E13,Ep,beta_c1,beta_c2,        A_joint,beta_joint,b_joint,R2_joint,...
 Document,Content,Selection,Num,n_table,      A_average,beta_average,b_average,R2_average,n_title2,n_title3]=fit_data_figures_with_beta_b(fileadress,filename,I,Document,Content,Selection,Num,n_table,n_title2)

fileadress1=strcat(fileadress,'\',filename);
[NUM_first_proces,TXT1,RAW1]=xlsread(fileadress1);%读取excell数据
NUM_strain_GL=NUM_first_proces(:,2:10);%未拼接前横向和纵向应变
NUM_joint=NUM_first_proces(:,12:19);%取拼接应变和应力
NUM_joint_average=NUM_first_proces(:,21:28);%取平均拼接应变和应力


% Ei-初始弹性模量,E13-1/3应力对应的割线模量,Ep-顶点割线模量,beta_c,beta_c1为两种不同方法计算的beta,nu为泊松比
[Ei,E13,Ep,beta_c1,beta_c2,nu,I,save_adress_name,figure_name] = E_nu_beta(fileadress,filename,NUM_strain_GL,NUM_joint,I);
%-------------------------------------插入标题----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title1 = strcat(num2str(n_title2),'. 泊松比的计算');n_title2=n_title2+1;
Selection.Text = Title1;L=set_format_title2(Selection);%格式设定
%-------------------------------------插入图片----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=3;n_columns=2;
figure_title='横向和纵向应变及其拟合';
[Document,Selection,n_table,Num]=tables_figures_and_name(Document,Selection,save_adress_name,figure_name,figure_title,n_rows,n_columns,Num,n_table);
%-------------------------------------插入表格----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=6;n_columns=7;
table_name="弹性模量及泊松比";
table_content_t=["Ei(GPa)","E13(GPa)","Ep(GPa)","\beta 1" ,"\beta 2" ,"\nu"];
table_content_v=["1","2","3","4"];
table_data=[Ei',E13',Ep',beta_c1',beta_c2',nu'];
[n_table,Content,Num]=tables_Tables_and_name(Document,Content,Selection,n_rows,n_columns,table_data,table_name,table_content_t,table_content_v,Num,n_table);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%拼接应变数据拟合%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[A_joint,beta_joint,b_joint,ultimate_stress_joint,ultimate_strain_joint,R2_joint,save_adress_name,figure_name]=fitting_stress_joint_strain_with_b_beta(fileadress,filename,NUM_joint,I);
%-------------------------------------插入小标题-----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title1 = strcat(num2str(n_title2),'. 应力应变数据拟合');n_title3=1;
Selection.Text = Title1;L=set_format_title2(Selection);%格式设定
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title1 = strcat(num2str(n_title2),'.',num2str(n_title3),'. 双参数拟合');n_title4=1;
Selection.Text = Title1;L=set_format_title3(Selection);%格式设定
%-------------------------------------插入公式-----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
str_eq='$\frac{\sigma_{c}}{\sigma_{c}^{\prime}}=\frac{\beta\left(\varepsilon_{c} / \varepsilon_{c}^{\prime}\right)}{\beta-1+\left(\varepsilon_{c} / \varepsilon_{c}^{\prime}\right)^{b \beta}}$';
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
n_rows=6;n_columns=6;
table_name="拼接应变和应力拟合数据";
table_content_t=["\beta","b","$\sigma_{c}^{'}(MPa)$","$\varepsilon_{c}^{'}(\mu \varepsilon)$" ,"R^2" ];
table_content_v=["S1L1","S2L2","S1L2","S2L1"];
table_data=[beta_joint',b_joint',ultimate_stress_joint',ultimate_strain_joint',R2_joint'];
[n_table,Content,Num]=tables_Tables_and_name(Document,Content,Selection,n_rows,n_columns,table_data,table_name,table_content_t,table_content_v,Num,n_table);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%平均拼接应变数据拟合%%%%%%%%%%%%%%%%%%%%%%%%%%%
[A_average,beta_average,b_average,ultimate_stress_average,ultimate_strain_average,R2_average,save_adress_name,figure_name]=fitting_stress_average_strain_with_b_beta(fileadress,filename,NUM_joint_average,I);

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
n_rows=6;n_columns=6;
table_name="平均拼接应变和应力拟合数据";
table_content_t=["\beta","b","$\sigma_{c}^{'}(MPa)$","$\varepsilon_{c}^{'}(\mu \varepsilon)$" ,"R^2" ];
table_content_v=["\overline{G1L1+G2L2}","\overline{G1L2+G2L1}","\overline{G1L2+G2L2}","\overline{G1L1+G2L1}"];

table_data=[beta_average',b_average',ultimate_stress_average',ultimate_strain_average',R2_average'];
[n_table,Content,Num]=tables_Tables_and_name(Document,Content,Selection,n_rows,n_columns,table_data,table_name,table_content_t,table_content_v,Num,n_table);


