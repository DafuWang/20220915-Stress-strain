function [A_average,beta_average,ultimate_stress_average,ultimate_strain_average,R2_average,save_adress_name,figure_name]=fitting_stress_average_strain_with_beta(fileadress,filename,NUM_joint_average,I)

Max_strain_fitting=30000;%%%%%%%%%%%%%%%%需修改%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_intervals=1;%%%%%%%%%%%%%%%%需修改%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 
data_legnend_joint=["$exp\, \overline{G1L1+G2L2}$","$exp\, \overline{G1L2+G2L1}$","$exp\,\overline{G1L2+G2L2}$","$exp\,\overline{G1L1+G2L1}$"];
fiting_legend_joint=["$fit\, \overline{G1L1+G2L2}$","$fit\, \overline{G1L2+G2L1}$","$fit\,\overline{G1L2+G2L2}$","$fit\,\overline{G1L1+G2L1}$"];



initial_a_joint=[1];%initial_a(1)为beta值，initial_a(2)为b

M_fitting_original_data=NUM_joint_average;
I=I+1;
for i=1:0.5*size(M_fitting_original_data,2)
[ultimate_stress_average(i),index_max]=max(M_fitting_original_data(:,2*i));%极限应力及其相应位置
ultimate_strain_average(i)=M_fitting_original_data(index_max,2*i-1);%极限应变
strian=M_fitting_original_data(:,2*i-1);%取应变
r_stress=M_fitting_original_data(:,2*i)/ultimate_stress_average(i);%取相对应力
strian= strian(1:n_intervals:end);%间隔点取应变
r_stress= r_stress(1:n_intervals:end);%间隔点取应力
[x,y_fitting,beta_average(i),R2_average(i),I,I11(i),fig] = strain_stress_fitting_beta(filename,r_stress,strian,I,data_legnend_joint,fiting_legend_joint,initial_a_joint,ultimate_strain_average(i),i);
A_average{i,1}=[x,r_stress,y_fitting];initial_a_average=[beta_average(i)];
end
figure_name{1,1}='averrage stress strain fitting with beta';
save_adress_name{1,1}=strcat(fileadress,'\',filename,figure_name{1,1},num2str(I));
savefig(strcat(save_adress_name{1,1},'.fig'));
% saveas(figure(I),strcat(save_adress_name{1,1},'.bmp'));

delete(fig);
