function [A_joint,beta_joint,alpha_joint,ultimate_stress,ultimate_strain,R2_joint_beta,R2_joint_alpha,save_adress_name,figure_name]=fitting_stress_joint_strain_with_alpha_beta(fileadress,filename,NUM_joint,I)

% Max_strain_fitting=30000;%%%%%%%%%%%%%%%%需修改%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_intervals=1;%%%%%%%%%%%%%%%%需修改%%%%%%%%%%%%%%%%%%%%%%%%%%%%


data_legnend_joint=["$test\,G1L1$","$test\,G2L2$","$test\,G1L2$","$test\,G2L1$"];
fiting1_legend_joint=["$fit\,G1L1\,with\,\beta$","$fit\,G2L2\,with\,\beta$","$fit\,G1L2\,with\,\beta$","$fit\,G2L1\,with\,\beta$"];
fiting2_legend_joint=["$fit\,G1L1\,with\,\alpha$","$fit\,G2L2\,with\,\alpha$","$fit\,G1L2\,with\,\alpha$","$fit\,G2L1\,with\,\alpha$"];

initial_a_joint=[1];%initial_a(1)为beta值，initial_a(2)为b


M_fitting_original_data=NUM_joint;


I=I+1;
for i=1:0.5*size(M_fitting_original_data,2)
[ultimate_stress(i),index_max]=max(M_fitting_original_data(:,2*i));%极限应力及其相应位置
ultimate_strain(i)=M_fitting_original_data(index_max,2*i-1);%极限应变

strian=M_fitting_original_data(:,2*i-1);%取应变
r_stress=M_fitting_original_data(:,2*i)/ultimate_stress(i);%取相对应力



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%第一次运行时打开%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
strian_max_R=find(strian==max(strian));
% %%%%%%%%%%%%%%%%%%%%%%%%%%用于第二次取出多余得%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 用于去除往回走得部分，首先都知道运行第一次，知道从多少应变处断
% critical_value=[24300,22000,23000,23000];
% strian_max_R=find(strian>critical_value(i));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


strian=strian(1:strian_max_R(1,1),1);
r_stress=r_stress(1:strian_max_R(1,1),1);

strian= strian(1:n_intervals:end);%间隔点取应变
r_stress= r_stress(1:n_intervals:end);%间隔点取应力
fileadress0=strcat(fileadress,'\',filename,'stress joint-strain with alpha beta',num2str(i),'.fig');
[x,y_fitting,beta_joint(i),alpha_joint(i),R2_joint_alpha(i),R2_joint_beta(i),I,I11(i),fig] = strain_stress_fitting_alpha_beta(fileadress0,filename,r_stress,strian,I,data_legnend_joint,fiting1_legend_joint,fiting2_legend_joint,initial_a_joint,ultimate_strain(i),ultimate_stress(i),i);
A_joint{i,1}=[x.x1,r_stress(1:index_max),y_fitting.y1];
A_joint{i,2}=[x.x2,r_stress(index_max:end),y_fitting.y2];
initial_a_joint=[beta_joint(i)];
end

figure_name{1,1}=' stress-joint strain fitting with alpha beta';
save_adress_name{1,1}=strcat(fileadress,'\',filename,figure_name{1,1},num2str(I));
savefig(strcat(save_adress_name{1,1},'.fig'));
% saveas(figure(I),strcat(save_adress_name{1,1},'.bmp'));

delete(fig);