function [x,y,beta,alpha,R2_beta,R2_alpha,I,II,fig] = strain_stress_fitting_alpha_beta(fileadress,filename,r_stress,strian,I,dat_legnend,fitting1_legnend,fitting2_legnend,a_fitting,ultimate_strain,ultimate_stress,i)
%% 取数据

[x,y,strain_c,alpha,beta,R2_beta,R2_alpha]=curve_fiting_alpha_beta(a_fitting,ultimate_strain,strian,r_stress);
b=1;
[II,fig]=figures_plot_alpha_beta(fileadress,ultimate_stress,strian,r_stress,x,y,strain_c,alpha,beta,b,R2_beta,R2_alpha,dat_legnend,fitting1_legnend,fitting2_legnend,filename,I,i);
