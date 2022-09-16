function [I2]=fitted_and_original_data_save(A_joint,beta_joint,b_joint,R2_joint,A_average,beta_average,b_average,R2_average,A_joint_beta,beta_joint_beta,R2_joint_beta,A_average_beta,beta_average_beta,R2_average_beta,C_A,C_beta,C_b,C_R2,A_joint_code,beta_joint_code,alpha_joint,R2_joint_beta_code,R2_joint_alph,A_average_code,beta_average_code,alpha_average,R2_average_beta_code,R2_average_alph,fileadress,filename)
 % 原始数据储存，便以用origin画图
excel_adress_name=strcat(fileadress,'\',filename,'(fitted data)','.xlsx');
sheet_number1='sheet1';
sheet_number2='sheet2';
sheet_number3='sheet3';
sheet_number4='sheet4';
sheet_number5='sheet5';
sheet_number6='sheet6';
sheet_number7='sheet7';
sheet_number8='sheet8';
sheet_number9='sheet9';
sheet_number10='sheet10';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2=1;%用于计量表中的列
xlswrite(excel_adress_name,{'拟合方法'},sheet_number1,strcat(char(65+I2-1),'1'));%写入样本
xlswrite(excel_adress_name,{'双参数beta和b拟合'},sheet_number1,strcat(char(65+I2-1),'2'));%样本名
xlswrite(excel_adress_name,{'样品名'},sheet_number1,strcat(char(65+I2-1),'3'));%写入样本
xlswrite(excel_adress_name,{filename},sheet_number1,strcat(char(65+I2-1),'4'));%样本名
I2=I2+1;
name_data=["拼接应变S1L1","实测应力","拟合应力","拼接应变S2L2","实测应力","拟合应力",...
           "拼接应变S1L2","实测应力","拟合应力","拼接应变S2L1","实测应力","拟合应力"];
fitted_and_original_data={A_joint{1,1}(:,1),A_joint{1,1}(:,2),A_joint{1,1}(:,3),...
                          A_joint{2,1}(:,1),A_joint{2,1}(:,2),A_joint{2,1}(:,3),...
                          A_joint{3,1}(:,1),A_joint{3,1}(:,2),A_joint{3,1}(:,3),...
                          A_joint{4,1}(:,1),A_joint{4,1}(:,2),A_joint{4,1}(:,3)};
[I2]=data_save_column_loop(excel_adress_name,sheet_number1,name_data,fitted_and_original_data,I2);

name_data=["beta","b","R2"];
fitted_and_original_data={beta_joint',b_joint',R2_joint'};
[I2]=data_save_column_loop(excel_adress_name,sheet_number1,name_data,fitted_and_original_data,I2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2=1;%用于计量表中的列
xlswrite(excel_adress_name,{'拟合方法'},sheet_number2,strcat(char(65+I2-1),'1'));%写入样本
xlswrite(excel_adress_name,{'双参数beta和b拟合'},sheet_number2,strcat(char(65+I2-1),'2'));%样本名
xlswrite(excel_adress_name,{'样品名'},sheet_number2,strcat(char(65+I2-1),'3'));%写入样本
xlswrite(excel_adress_name,{filename},sheet_number2,strcat(char(65+I2-1),'4'));%样本名
I2=I2+1;
name_data=["平均应变G1L1+G2L2","实测应力","拟合应力","平均应变G1L2+G2L1","实测应力","拟合应力",...
           "平均应变G1L2+G2L2","实测应力","拟合应力","平均应变G1L1+G2L1","实测应力","拟合应力"];
fitted_and_original_data={A_average{1,1}(:,1),A_average{1,1}(:,2),A_average{1,1}(:,3),...
                          A_average{2,1}(:,1),A_average{2,1}(:,2),A_average{2,1}(:,3),...
                          A_average{3,1}(:,1),A_average{3,1}(:,2),A_average{3,1}(:,3),...
                          A_average{4,1}(:,1),A_average{4,1}(:,2),A_average{4,1}(:,3)};
[I2]=data_save_column_loop(excel_adress_name,sheet_number2,name_data,fitted_and_original_data,I2);

name_data=["beta","b","R2"];
fitted_and_original_data={beta_average',b_average',R2_average'};
[I2]=data_save_column_loop(excel_adress_name,sheet_number2,name_data,fitted_and_original_data,I2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2=1;%用于计量表中的列
xlswrite(excel_adress_name,{'拟合方法'},sheet_number3,strcat(char(65+I2-1),'1'));%写入样本
xlswrite(excel_adress_name,{'单参数beta拟合'},sheet_number3,strcat(char(65+I2-1),'2'));%样本名
xlswrite(excel_adress_name,{'样品名'},sheet_number3,strcat(char(65+I2-1),'3'));%写入样本
xlswrite(excel_adress_name,{filename},sheet_number3,strcat(char(65+I2-1),'4'));%样本名
I2=I2+1;
name_data=["拼接应变S1L1","实测应力","拟合应力","拼接应变S2L2","实测应力","拟合应力",...
           "拼接应变S1L2","实测应力","拟合应力","拼接应变S2L1","实测应力","拟合应力"];
fitted_and_original_data={A_joint_beta{1,1}(:,1),A_joint_beta{1,1}(:,2),A_joint_beta{1,1}(:,3),...
                          A_joint_beta{2,1}(:,1),A_joint_beta{2,1}(:,2),A_joint_beta{2,1}(:,3),...
                          A_joint_beta{3,1}(:,1),A_joint_beta{3,1}(:,2),A_joint_beta{3,1}(:,3),...
                          A_joint_beta{4,1}(:,1),A_joint_beta{4,1}(:,2),A_joint_beta{4,1}(:,3)};
[I2]=data_save_column_loop(excel_adress_name,sheet_number3,name_data,fitted_and_original_data,I2);

name_data=["beta","R2"];
fitted_and_original_data={beta_joint_beta',R2_joint_beta'};
[I2]=data_save_column_loop(excel_adress_name,sheet_number3,name_data,fitted_and_original_data,I2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2=1;%用于计量表中的列
xlswrite(excel_adress_name,{'拟合方法'},sheet_number4,strcat(char(65+I2-1),'1'));%写入样本
xlswrite(excel_adress_name,{'单参数beta拟合'},sheet_number4,strcat(char(65+I2-1),'2'));%样本名
xlswrite(excel_adress_name,{'样品名'},sheet_number4,strcat(char(65+I2-1),'3'));%写入样本
xlswrite(excel_adress_name,{filename},sheet_number4,strcat(char(65+I2-1),'4'));%样本名
I2=I2+1;
name_data=["平均应变G1L1+G2L2","实测应力","拟合应力","平均应变G1L2+G2L1","实测应力","拟合应力",...
           "平均应变G1L2+G2L2","实测应力","拟合应力","平均应变G1L1+G2L1","实测应力","拟合应力"];
fitted_and_original_data={A_average_beta{1,1}(:,1),A_average_beta{1,1}(:,2),A_average_beta{1,1}(:,3),...
                          A_average_beta{2,1}(:,1),A_average_beta{2,1}(:,2),A_average_beta{2,1}(:,3),...
                          A_average_beta{3,1}(:,1),A_average_beta{3,1}(:,2),A_average_beta{3,1}(:,3),...
                          A_average_beta{4,1}(:,1),A_average_beta{4,1}(:,2),A_average_beta{4,1}(:,3)};
[I2]=data_save_column_loop(excel_adress_name,sheet_number4,name_data,fitted_and_original_data,I2);

name_data=["beta","R2"];
fitted_and_original_data={beta_average_beta',R2_average_beta'};
[I2]=data_save_column_loop(excel_adress_name,sheet_number4,name_data,fitted_and_original_data,I2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2=1;%用于计量表中的列
xlswrite(excel_adress_name,{'拟合方法'},sheet_number5,strcat(char(65+I2-1),'1'));%写入样本
xlswrite(excel_adress_name,{'单参数b拟合1'},sheet_number5,strcat(char(65+I2-1),'2'));%样本名
xlswrite(excel_adress_name,{'样品名'},sheet_number5,strcat(char(65+I2-1),'3'));%写入样本
xlswrite(excel_adress_name,{filename},sheet_number5,strcat(char(65+I2-1),'4'));%样本名
I2=I2+1;
name_data=["拼接应变S1L1-beta1","实测应力","拟合应力","拼接应变S2L2-beta1","实测应力","拟合应力",...
           "拼接应变S1L2-beta1","实测应力","拟合应力","拼接应变S2L1-beta1","实测应力","拟合应力"];
fitted_and_original_data={C_A.joint_c1{1,1}(:,1),C_A.joint_c1{1,1}(:,2),C_A.joint_c1{1,1}(:,3),...
                          C_A.joint_c1{2,1}(:,1),C_A.joint_c1{2,1}(:,2),C_A.joint_c1{2,1}(:,3),...
                          C_A.joint_c1{3,1}(:,1),C_A.joint_c1{3,1}(:,2),C_A.joint_c1{3,1}(:,3),...
                          C_A.joint_c1{4,1}(:,1),C_A.joint_c1{4,1}(:,2),C_A.joint_c1{4,1}(:,3)};
[I2]=data_save_column_loop(excel_adress_name,sheet_number5,name_data,fitted_and_original_data,I2);
I2=I2+1;
name_data=["beta","b","R2"];
fitted_and_original_data={C_beta.joint_c1',C_b.joint_c1',C_R2.joint_c1'};
[I2]=data_save_column_loop(excel_adress_name,sheet_number5,name_data,fitted_and_original_data,I2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2=1;%用于计量表中的列
xlswrite(excel_adress_name,{'拟合方法'},sheet_number6,strcat(char(65+I2-1),'1'));%写入样本
xlswrite(excel_adress_name,{'单参数b拟合1'},sheet_number6,strcat(char(65+I2-1),'2'));%样本名
xlswrite(excel_adress_name,{'样品名'},sheet_number6,strcat(char(65+I2-1),'3'));%写入样本
xlswrite(excel_adress_name,{filename},sheet_number6,strcat(char(65+I2-1),'4'));%样本名
I2=I2+1;
name_data=["拼接应变S1L1-beta2","实测应力","拟合应力","拼接应变S2L2-beta2","实测应力","拟合应力",...
           "拼接应变S1L2-beta2","实测应力","拟合应力","拼接应变S2L1-beta2","实测应力","拟合应力"];
fitted_and_original_data={C_A.joint_c2{1,1}(:,1),C_A.joint_c2{1,1}(:,2),C_A.joint_c2{1,1}(:,3),...
                          C_A.joint_c2{2,1}(:,1),C_A.joint_c2{2,1}(:,2),C_A.joint_c2{2,1}(:,3),...
                          C_A.joint_c2{3,1}(:,1),C_A.joint_c2{3,1}(:,2),C_A.joint_c2{3,1}(:,3),...
                          C_A.joint_c2{4,1}(:,1),C_A.joint_c2{4,1}(:,2),C_A.joint_c2{4,1}(:,3)};
[I2]=data_save_column_loop(excel_adress_name,sheet_number6,name_data,fitted_and_original_data,I2);

name_data=["beta","b","R2"];
fitted_and_original_data={C_beta.joint_c2',C_b.joint_c2',C_R2.joint_c2'};
[I2]=data_save_column_loop(excel_adress_name,sheet_number6,name_data,fitted_and_original_data,I2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2=1;%用于计量表中的列
xlswrite(excel_adress_name,{'拟合方法'},sheet_number7,strcat(char(65+I2-1),'1'));%写入样本
xlswrite(excel_adress_name,{'单参数b拟合2'},sheet_number7,strcat(char(65+I2-1),'2'));%样本名
xlswrite(excel_adress_name,{'样品名'},sheet_number7,strcat(char(65+I2-1),'3'));%写入样本
xlswrite(excel_adress_name,{filename},sheet_number7,strcat(char(65+I2-1),'4'));%样本名
I2=I2+1;
name_data=["平均应变G1L1+G2L2(beta1)","实测应力","拟合应力","平均应变G1L2+G2L1(beta1)","实测应力","拟合应力",...
           "平均应变G1L2+G2L2(beta1)","实测应力","拟合应力","平均应变G1L1+G2L1(beta1)","实测应力","拟合应力"];


fitted_and_original_data={C_A.average_c1{1,1}(:,1),C_A.average_c1{1,1}(:,2),C_A.average_c1{1,1}(:,3),...
                          C_A.average_c1{2,1}(:,1),C_A.average_c1{2,1}(:,2),C_A.average_c1{2,1}(:,3),...
                          C_A.average_c1{3,1}(:,1),C_A.average_c1{3,1}(:,2),C_A.average_c1{3,1}(:,3),...
                          C_A.average_c1{4,1}(:,1),C_A.average_c1{4,1}(:,2),C_A.average_c1{4,1}(:,3)};
[I2]=data_save_column_loop(excel_adress_name,sheet_number7,name_data,fitted_and_original_data,I2);

name_data=["beta","b","R2"];
fitted_and_original_data={C_beta.average_c1',C_b.average_c1',C_R2.average_c1'};
[I2]=data_save_column_loop(excel_adress_name,sheet_number7,name_data,fitted_and_original_data,I2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2=1;%用于计量表中的列
xlswrite(excel_adress_name,{'拟合方法'},sheet_number8,strcat(char(65+I2-1),'1'));%写入样本
xlswrite(excel_adress_name,{'单参数b拟合2'},sheet_number8,strcat(char(65+I2-1),'2'));%样本名
xlswrite(excel_adress_name,{'样品名'},sheet_number8,strcat(char(65+I2-1),'3'));%写入样本
xlswrite(excel_adress_name,{filename},sheet_number8,strcat(char(65+I2-1),'4'));%样本名
I2=I2+1;
name_data=["平均应变G1L1+G2L2(beta2)","实测应力","拟合应力","平均应变G1L2+G2L1(beta2)","实测应力","拟合应力",...
           "平均应变G1L2+G2L2(beta2)","实测应力","拟合应力","平均应变G1L1+G2L1(beta2)","实测应力","拟合应力"];
fitted_and_original_data={C_A.average_c2{1,1}(:,1),C_A.average_c2{1,1}(:,2),C_A.average_c2{1,1}(:,3),...
                          C_A.average_c2{2,1}(:,1),C_A.average_c2{2,1}(:,2),C_A.average_c2{2,1}(:,3),...
                          C_A.average_c2{3,1}(:,1),C_A.average_c2{3,1}(:,2),C_A.average_c2{3,1}(:,3),...
                          C_A.average_c2{4,1}(:,1),C_A.average_c2{4,1}(:,2),C_A.average_c2{4,1}(:,3)};
[I2]=data_save_column_loop(excel_adress_name,sheet_number8,name_data,fitted_and_original_data,I2);

name_data=["beta","b","R2"];
fitted_and_original_data={C_beta.average_c2',C_b.average_c2',C_R2.average_c2'};
[I2]=data_save_column_loop(excel_adress_name,sheet_number8,name_data,fitted_and_original_data,I2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A_joint_code,beta_joint_code,alpha_joint,R2_joint_beta_code,R2_joint_alph
I2=1;%用于计量表中的列
xlswrite(excel_adress_name,{'拟合方法'},sheet_number9,strcat(char(65+I2-1),'1'));%写入样本
xlswrite(excel_adress_name,{'规范分段拟合法'},sheet_number9,strcat(char(65+I2-1),'2'));%样本名
xlswrite(excel_adress_name,{'样品名'},sheet_number9,strcat(char(65+I2-1),'3'));%写入样本
xlswrite(excel_adress_name,{filename},sheet_number9,strcat(char(65+I2-1),'4'));%样本名
I2=I2+1;

name_data=["拼接应变G1L1+G2L2(1)","实测应力","拟合应力","拼接应变G1L1+G2L2(2)","实测应力","拟合应力",...
           "拼接应变G1L2+G2L1(1)","实测应力","拟合应力","拼接应变G1L2+G2L1(2)","实测应力","拟合应力",...
           "拼接应变G1L2+G2L2(1)","实测应力","拟合应力","拼接应变G1L2+G2L2(2)","实测应力","拟合应力",...
           "拼接应变G1L1+G2L1(1)","实测应力","拟合应力","拼接应变G1L1+G2L1(2)","实测应力","拟合应力"];
fitted_and_original_data={A_joint_code{1,1}(:,1),A_joint_code{1,1}(:,2),A_joint_code{1,1}(:,3),  A_joint_code{1,2}(:,1),A_joint_code{1,2}(:,2),A_joint_code{1,2}(:,3),...
                          A_joint_code{2,1}(:,1),A_joint_code{2,1}(:,2),A_joint_code{2,1}(:,3),  A_joint_code{2,2}(:,1),A_joint_code{2,2}(:,2),A_joint_code{2,2}(:,3),...
                          A_joint_code{3,1}(:,1),A_joint_code{3,1}(:,2),A_joint_code{3,1}(:,3),  A_joint_code{3,2}(:,1),A_joint_code{3,2}(:,2),A_joint_code{3,2}(:,3),...
                          A_joint_code{4,1}(:,1),A_joint_code{4,1}(:,2),A_joint_code{4,1}(:,3),  A_joint_code{4,2}(:,1),A_joint_code{4,2}(:,2),A_joint_code{4,2}(:,3)};
[I2]=data_save_column_loop(excel_adress_name,sheet_number9,name_data,fitted_and_original_data,I2);

name_data=["beta","alpha","R(1)","R2(2)"];
fitted_and_original_data={beta_joint_code',alpha_joint',R2_joint_beta_code',R2_joint_alph'};
[I2]=data_save_column_loop(excel_adress_name,sheet_number9,name_data,fitted_and_original_data,I2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2=1;%用于计量表中的列
xlswrite(excel_adress_name,{'拟合方法'},sheet_number10,strcat(char(65+I2-1),'1'));%写入样本
xlswrite(excel_adress_name,{'规范分段拟合法'},sheet_number10,strcat(char(65+I2-1),'2'));%样本名
xlswrite(excel_adress_name,{'样品名'},sheet_number10,strcat(char(65+I2-1),'3'));%写入样本
xlswrite(excel_adress_name,{filename},sheet_number10,strcat(char(65+I2-1),'4'));%样本名
I2=I2+1;
name_data=["平均应变G1L1+G2L2(1)","实测应力","拟合应力","平均应变G1L1+G2L2(2)","实测应力","拟合应力",...
           "平均应变G1L2+G2L1(1)","实测应力","拟合应力","平均应变G1L2+G2L1(2)","实测应力","拟合应力",...
           "平均应变G1L2+G2L2(1)","实测应力","拟合应力","平均应变G1L2+G2L2(2)","实测应力","拟合应力",...
           "平均应变G1L1+G2L1(1)","实测应力","拟合应力","平均应变G1L1+G2L1(2)","实测应力","拟合应力"];
fitted_and_original_data={A_average_code{1,1}(:,1),A_average_code{1,1}(:,2),A_average_code{1,1}(:,3),  A_average_code{1,2}(:,1),A_average_code{1,2}(:,2),A_average_code{1,2}(:,3),...
                          A_average_code{2,1}(:,1),A_average_code{2,1}(:,2),A_average_code{2,1}(:,3),  A_average_code{2,2}(:,1),A_average_code{2,2}(:,2),A_average_code{2,2}(:,3),...
                          A_average_code{3,1}(:,1),A_average_code{3,1}(:,2),A_average_code{3,1}(:,3),  A_average_code{3,2}(:,1),A_average_code{3,2}(:,2),A_average_code{3,2}(:,3),...
                          A_average_code{4,1}(:,1),A_average_code{4,1}(:,2),A_average_code{4,1}(:,3),  A_average_code{4,2}(:,1),A_average_code{4,2}(:,2),A_average_code{4,2}(:,3)};
[I2]=data_save_column_loop(excel_adress_name,sheet_number10,name_data,fitted_and_original_data,I2);

name_data=["beta","alpha","R(1)","R2(2)"];
fitted_and_original_data={beta_average_code',alpha_average',R2_average_beta_code',R2_average_alph'};
[I2]=data_save_column_loop(excel_adress_name,sheet_number10,name_data,fitted_and_original_data,I2);

