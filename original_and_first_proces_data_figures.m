function [I,II,Document,Content,Selection,Num,n_table]=original_and_first_proces_data_figures(maximum,stress,full_strain_gauge_t,full_strain_gauge_v1,full_strain_gauge_v2,strain_lvdt1,strain_lvdt2,...
                                                    joint_point,index1,index_for_joint,index_for_joint_average,strain_gauge1,strain_gauge2,strain_gauge_average,...
                                                    strain_joint11,strain_joint22,strain_joint12,strain_joint21,...
                                                    strain_joint11_22,strain_joint12_21,strain_joint12_22,strain_joint11_21,...
                                                    fileadress,filename,I,...
                                                    Document,Content,Selection,Num,n_table)

%%%%%%%%%%%%%%%%%%%%%%%%%%%横向和纵向应变关系%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M_strain_gauge={full_strain_gauge_v1,full_strain_gauge_t,full_strain_gauge_v2,full_strain_gauge_t,(full_strain_gauge_v1+full_strain_gauge_v2)/2,full_strain_gauge_t};              
 [II(I),I,save_adress_name{1,1},figure_name{1,1}]=figure_transverse_vertical_strain_of_gauge(M_strain_gauge,fileadress,filename,I);

 %% %%%%%%%%%%%%%%%%%%%%%%%%%应力和全部纵向应变关系%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 M_stress_strain_full_gauge={full_strain_gauge_v1,stress,full_strain_gauge_v2,stress,(full_strain_gauge_v2+full_strain_gauge_v1)/2,stress};
  [II(I),I,save_adress_name{2,1},figure_name{2,1}]=figure_stress_and_strain_of_full_gauge(M_stress_strain_full_gauge,fileadress,filename,I);

 %  %%%%%%%%%%%%%%%%%%%%%%%%%%%应力极值点之前的应力和应变片应变关系%%%%%%%%%%%%%%% 
 M_stress_strain_partial_gauge={strain_gauge1,stress(1:index1(1)),strain_gauge2,stress(1:index1(2)),strain_gauge_average,stress(1:index1(3))};
 [II(I),I,save_adress_name{3,1},figure_name{3,1}]=figure_stress_and_strain_of_partial_gauge(M_stress_strain_partial_gauge,fileadress,filename,I);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%应力和位移计应变关系%%%%%%%%%%%%%%%%%%%%%%%%%%%
M_stress_strain_lvdt={strain_lvdt1,stress,strain_lvdt2,stress,(strain_lvdt2+strain_lvdt1)/2,stress};
[II(I),I,save_adress_name{4,1},figure_name{4,1}]=figure_stress_and_strain_of_lvdt(M_stress_strain_lvdt,fileadress,filename,I);

%----------------------------------插入图片--------------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=5;n_columns=2;
figure_title='应变片、位移计和力传感器初次处理后的原始数据';
[Document,Selection,n_table,Num]=tables_figures_and_name(Document,Selection,save_adress_name,figure_name,figure_title,n_rows,n_columns,Num,n_table);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%拼接应变%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
M_stress_strain_gauge_lvdt={strain_joint11,stress(1:index_for_joint(1)),strain_joint22,stress(1:index_for_joint(2)),strain_joint12(1:index_for_joint(3)),stress,strain_joint21,stress(1:index_for_joint(4))};
[II(I),I,save_adress_name{1,1},figure_name{1,1}]=figure_stress_and_strain_of_gauge_lvdt(M_stress_strain_gauge_lvdt,fileadress,filename,I);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%平均值%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M_average_stress_strain_gauge_lvdt={strain_joint11_22,stress(1:index_for_joint_average(1)),strain_joint12_21,stress(1:index_for_joint_average(2)),strain_joint12_22,stress(1:index_for_joint_average(3)),strain_joint11_21,stress(1:index_for_joint_average(4))};
[II(I),I,save_adress_name{2,1},figure_name{2,1}]=figure_stress_and_average_strain_of_gauge_lvdt(M_average_stress_strain_gauge_lvdt,fileadress,filename,I);


%---------------------------------插入表格---------------------------------

Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=3;n_columns=4;
table_name="原始数据极限值";
table_content_t=["transverse\,gauge(\mu \varepsilon)","vertical\,gauge1(\mu \varepsilon)","vertical\,gauge2(\mu \varepsilon)"];
table_content_v="Maximum";

table_data=[maximum.ultimate_strain_gauge0,maximum.ultimate_strain_gauge1,maximum.ultimate_strain_gauge2];
[n_table,Content,Num]=tables_Tables_and_name(Document,Content,Selection,n_rows,n_columns,table_data,table_name,table_content_t,table_content_v,Num,n_table);

%---------------------------------插入表格---------------------------------

Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=3;n_columns=4;
table_name="原始数据极限值";
table_content_t=["LVDT1(\mu \varepsilon)" ,"LVDT2(\mu \varepsilon)", "stress(MPa)"];
table_content_v="Maximum";

table_data=[maximum.ultimate_strain_lvdt1,maximum.ultimate_strain_lvdt2,maximum.ultimate_stress];
[n_table,Content,Num]=tables_Tables_and_name(Document,Content,Selection,n_rows,n_columns,table_data,table_name,table_content_t,table_content_v,Num,n_table);

%-------------------------------------插入表格-----------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
str_eq=strcat('$\varepsilon_c=\varepsilon_G\,(before\, joint)\,>>\,\varepsilon_L\,(after\,joint)-\varepsilon_L\,(joint\, point)+\varepsilon_G\,(joint\, point)$');
[n_table,Num.equation]=tables_equation_and_number(Document,Selection,str_eq,n_table,Num.equation);

Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=3;n_columns=2;
figure_title='应变片、位移计拼接后的数据';
[Document,Selection,n_table,Num]=tables_figures_and_name(Document,Selection,save_adress_name,figure_name,figure_title,n_rows,n_columns,Num,n_table);



Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=4;n_columns=6;
table_name="应变片和位移计应变拼接与平均后的数据";
table_content_t=["ratio\,of\sigma","rows\,of\,joint" ,"\varepsilon_{G(joint)}(\mu \varepsilon)","\varepsilon_{L(joint)}(\mu \varepsilon)", "\sigma_{jiont}(MPa)"];
table_content_v=["joint1","joint2"];
table_data=[joint_point.ratio',joint_point.index',joint_point.strainG',joint_point.lvdt',joint_point.stress'];
[n_table,Content,Num]=tables_Tables_and_name(Document,Content,Selection,n_rows,n_columns,table_data,table_name,table_content_t,table_content_v,Num,n_table);



