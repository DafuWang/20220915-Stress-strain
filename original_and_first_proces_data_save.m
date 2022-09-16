function [I1,I_strain,I_strain_jiont,I_strain_jiont_average]=original_and_first_proces_data_save(full_strain_gauge_t,full_strain_gauge_v1,full_strain_gauge_v2,stress,strain_lvdt1,strain_lvdt2,...
                                         ultimate_stress,strain_gauge0,strain_gauge1,strain_gauge2,...
                                         ultimate_strain_gauge0,ultimate_strain_gauge1,ultimate_strain_gauge2,ultimate_strain_lvdt1,ultimate_strain_lvdt2,...
                                         strain_joint11,strain_joint22,strain_joint12,strain_joint21,...
                                         strain_joint11_22,strain_joint12_21,strain_joint12_22,strain_joint11_21,...
                                         index_take_strain,index_for_joint,index_for_joint_average,...
                                         fileadress,filename)

 % 原始数据储存，便以用origin画图
excel_adress_name=strcat(fileadress,'\',filename,'.xlsx');
sheet_number1='sheet1';
sheet_number2='sheet2';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2=1;%用于计量表中的列
xlswrite(excel_adress_name,{'样本名'},sheet_number2,strcat(char(65+I2-1),'1'));%写入样本
xlswrite(excel_adress_name,{filename},sheet_number2,strcat(char(65+I2-1),'2'));%样本名
name_original_data=["全横向应变","全纵向应变片1","全纵向应变片2",'应力','全纵向位移计1','全纵向位移计2'];
data_original_stress_strain={full_strain_gauge_t,full_strain_gauge_v1,full_strain_gauge_v2,stress,strain_lvdt1,strain_lvdt2};
[I0]=data_save_column_loop(excel_adress_name,sheet_number2,name_original_data,data_original_stress_strain,I2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
I1=1;%用于计量表中的列
xlswrite(excel_adress_name,{'样本名'},sheet_number1,strcat(char(65+I1-1),'1'));%写入样本
xlswrite(excel_adress_name,{filename},sheet_number1,strcat(char(65+I1-1),'2'));%样本名

name_ultimate_stress_strain=["极限横向应变","极限纵向应变片1","极限纵向应变片2",'极限应力','极限纵向位移计1','极限纵向位移计2'];
data_ultimate_stress_strain=[ultimate_strain_gauge0,ultimate_strain_gauge1,ultimate_strain_gauge2,ultimate_stress,ultimate_strain_lvdt1,ultimate_strain_lvdt2];
[I1]=data_save_row_loop(excel_adress_name,sheet_number1,name_ultimate_stress_strain,data_ultimate_stress_strain,I1);
%% 未拼接前应变
I1=I1+1;%隔一列
I_strain(1)=I1;
name_original_data=["横向应变","纵向应变片1","应力","纵向应变片2",'应力','纵向位移计1','应力','纵向位移计2','应力'];
data_original_stress_strain={strain_gauge0,strain_gauge1,stress(1:index_take_strain(1)),strain_gauge2,stress(1:index_take_strain(2)),strain_lvdt1,stress,strain_lvdt2,stress};
[I1]=data_save_column_loop(excel_adress_name,sheet_number1,name_original_data,data_original_stress_strain,I1);
I_strain(2)=I1-1;
%% 拼接应变
I1=I1+1;%隔一列
I_strain_jiont(1)=I1;
name_strain_jiont_stress=["拼接应变11","应力","拼接应变22","应力","拼接应变12","应力","拼接应变21","应力"];
data_strain_jiont_stress={strain_joint11,stress(1:index_for_joint(1)),strain_joint22,stress(1:index_for_joint(2)),strain_joint12,stress(1:index_for_joint(3)),strain_joint21,stress(1:index_for_joint(4))};
[I1]=data_save_column_loop(excel_adress_name,sheet_number1,name_strain_jiont_stress,data_strain_jiont_stress,I1);
I_strain_jiont(2)=I1-1;
%% 拼接应变平均
I1=I1+1;%隔一列
I_strain_jiont_average(1)=I1;
name_stress_average_strain=["平均拼接应变11-22","应力","平均拼接应变12-21","应力","平均拼接应变12-22","应力","平均拼接应变11-21","应力"];
dat_average_stress_strain_gauge_lvdt={strain_joint11_22,stress(1:index_for_joint_average(1)),strain_joint12_21,stress(1:index_for_joint_average(2)),strain_joint12_22,stress(1:index_for_joint_average(3)),strain_joint11_21,stress(1:index_for_joint_average(4))};
[I1]=data_save_column_loop(excel_adress_name,sheet_number1,name_stress_average_strain,dat_average_stress_strain_gauge_lvdt,I1);

I_strain_jiont_average(2)=I1-1;


%% 拼接点的储存
I0=14;
xlswrite(excel_adress_name,{'I_strain'},sheet_number1,strcat(char(65+I2-1),num2str(I0+1)));%写入样本
xlswrite(excel_adress_name,{I_strain(1)},sheet_number1,strcat(char(65+I2-1),num2str(I0+2)));%样本名
xlswrite(excel_adress_name,{I_strain(2)},sheet_number1,strcat(char(65+I2-1),num2str(I0+3)));%样本名

xlswrite(excel_adress_name,{'I_strain_jiont'},sheet_number1,strcat(char(65+I2-1),num2str(I0+4)));%写入样本
xlswrite(excel_adress_name,{I_strain_jiont(1)},sheet_number1,strcat(char(65+I2-1),num2str(I0+5)));%样本名
xlswrite(excel_adress_name,{I_strain_jiont(2)},sheet_number1,strcat(char(65+I2-1),num2str(I0+6)));%样本名

xlswrite(excel_adress_name,{'I_strain_jiont_average'},sheet_number1,strcat(char(65+I2-1),num2str(I0+7)));%写入样本
xlswrite(excel_adress_name,{I_strain_jiont_average(1)},sheet_number1,strcat(char(65+I2-1),num2str(I0+8)));%样本名
xlswrite(excel_adress_name,{I_strain_jiont_average(2)},sheet_number1,strcat(char(65+I2-1),num2str(I0+9)));%样本名


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

