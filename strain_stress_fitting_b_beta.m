function [x,y,beta,b,R2,I,II,fig] = strain_stress_fitting_b_beta(filename,r_stress,strian,I,dat_legnend,fitting_legnend,a_fitting,constants,i)
%% 取数据

%% 原始数据
% N=find(NUM_strain_stress(:,2*i-1)>Max_strain_fitting,1);%找到设定应变对应的行数
% N=Max_strain_fitting;
% strian=NUM_strain_stress(1:N,2*i-1);%取应变
% r_stress=NUM_strain_stress(1:N,2*i)/ultimate_stress;%取相对应力



[x,y,strain_c,beta,b,R2]=curve_fiting_two_parameters(a_fitting,constants,strian,r_stress);

[II,fig]=figures_plot(strian,r_stress,x,y,strain_c,beta,b,R2,dat_legnend,fitting_legnend,filename,I,i);
