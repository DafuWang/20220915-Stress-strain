function [A_joint,beta_joint,b_joint,ultimate_stress,ultimate_strain,R2_joint,save_adress_name,figure_name]=fitting_stress_joint_strain_with_b_beta(fileadress,filename,NUM_joint,I)

Max_strain_fitting=30000;%%%%%%%%%%%%%%%%需修改%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_intervals=1;%%%%%%%%%%%%%%%%需修改%%%%%%%%%%%%%%%%%%%%%%%%%%%%


data_legnend_joint=["$experiment\,strain\,S1L1$","$experiment\,strain\,S2L2$","$experiment\,strain\,S1L2$","$experiment\,strain\,S2L1$"];
fiting_legend_joint=["$fit\,S1L1\,with\,\beta\,and\,b$","$fit\,S2L2\,with\,\beta\,and\,b$","$fit\,S1L2\,with\,\beta\,and\,b$","$fit\,S2L1\,with\,\beta\,and\,b$"];
initial_a_joint=[1,1];%initial_a(1)为beta值，initial_a(2)为b


M_fitting_original_data=NUM_joint;


I=I+1;
for i=1:0.5*size(M_fitting_original_data,2)
[ultimate_stress(i),index_max]=max(M_fitting_original_data(:,2*i));%极限应力及其相应位置
ultimate_strain(i)=M_fitting_original_data(index_max,2*i-1);%极限应变
strian=M_fitting_original_data(:,2*i-1);%取应变
r_stress=M_fitting_original_data(:,2*i)/ultimate_stress(i);%取相对应力

strian= strian(1:n_intervals:end);%间隔点取应变
r_stress= r_stress(1:n_intervals:end);%间隔点取应力

[x,y_fitting,beta_joint(i),b_joint(i),R2_joint(i),I,I11(i),fig] = strain_stress_fitting_b_beta(filename,r_stress,strian,I,data_legnend_joint,fiting_legend_joint,initial_a_joint,ultimate_strain(i),i);
A_joint{i,1}=[x,r_stress,y_fitting];initial_a_joint=[beta_joint(i),b_joint(i)];
end
figure_name{1,1}=' stress strain fitting with b-beta';
save_adress_name{1,1}=strcat(fileadress,'\',filename,figure_name{1,1},num2str(I));
savefig(strcat(save_adress_name{1,1},'.fig'));
% saveas(figure(I),strcat(save_adress_name{1,1},'.bmp'));

delete(fig);