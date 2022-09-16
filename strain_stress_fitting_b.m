function [x,r_stress,y,beta,b,R2,I,II,fig] = strain_stress_fitting_b(filename,NUM_strain_stress,I,n_intervals,ultimate_stress,dat_legnend,fitting_legnend,a_fitting,constants,i)
%% 取数据

    %% 原始数据
% N=find(NUM_strain_stress(:,2*i-1)>Max_strain_fitting,1);%找到设定应变对应的行数
% strian=NUM_strain_stress(1:N,2*i-1);%取应变
% r_stress=NUM_strain_stress(1:N,2*i)/ultimate_stress;%取相对应力
% strian= strian(1:n_intervals:end);%间隔点取应变
% r_stress= r_stress(1:n_intervals:end);%间隔点取应力

strian=NUM_strain_stress(:,2*i-1);%取应变
r_stress=NUM_strain_stress(:,2*i)/ultimate_stress;%取相对应力
strian= strian(1:n_intervals:end);%间隔点取应变
r_stress= r_stress(1:n_intervals:end);%间隔点取应力


[x,y,strain_c,beta,b,R2]=curve_fiting_one_parameter(a_fitting,constants,strian,r_stress);

[II,fig]=figures_plot(strian,r_stress,x,y,strain_c,beta,b,R2,dat_legnend,fitting_legnend,filename,I,i);