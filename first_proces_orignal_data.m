function [strain_jiont11,strain_jiont22,strain_jiont12,strain_jiont21,...
 strain_jiont11_22,strain_jiont12_21,strain_jiont12_22,strain_jiont11_21,index_for_joint,index_for_joint_average]...
 =first_proces_orignal_data(index_for_stress,strain_gauge1,strain_lvdt1,strain_gauge2,strain_lvdt2)


%% 应变偏应变和位移计应变拼接
strain_jiont11=[strain_gauge1;strain_lvdt1(index_for_stress(1)+1:end,1)-strain_lvdt1(index_for_stress(1))+strain_gauge1(index_for_stress(1))];%纵向应变位移计1
index_for_joint(1)=size(strain_jiont11,1);
strain_jiont22=[strain_gauge2;strain_lvdt2(index_for_stress(2)+1:end,1)-strain_lvdt2(index_for_stress(2))+strain_gauge2(index_for_stress(2))];%纵向应变位移计2
index_for_joint(2)=size(strain_jiont22,1);
strain_jiont12=[strain_gauge1;strain_lvdt2(index_for_stress(1)+1:end,1)-strain_lvdt2(index_for_stress(1))+strain_gauge1(index_for_stress(1))];%纵向应变位移计1
index_for_joint(3)=size(strain_jiont12,1);
strain_jiont21=[strain_gauge2;strain_lvdt1(index_for_stress(2)+1:end,1)-strain_lvdt1(index_for_stress(2))+strain_gauge2(index_for_stress(2))];%纵向应变位移计2
index_for_joint(4)=size(strain_jiont21,1);
%% 拼接后再平均

N_all=min(size(strain_jiont11,1),size(strain_jiont22,1));
strain_jiont11_22=[1/2*(strain_jiont11(1:N_all)+strain_jiont22(1:N_all))];
index_for_joint_average(1)=N_all;

%
N_all=min(size(strain_jiont12,1),size(strain_jiont21,1));
strain_jiont12_21=[1/2*(strain_jiont12(1:N_all)+strain_jiont21(1:N_all))];
index_for_joint_average(2)=N_all;
%
N_all=min(size(strain_jiont12,1),size(strain_jiont22,1));
strain_jiont12_22=[1/2*(strain_jiont12(1:N_all)+strain_jiont22(1:N_all))];
index_for_joint_average(3)=N_all;
%
N_all=min(size(strain_jiont11,1),size(strain_jiont21,1));
strain_jiont11_21=[1/2*(strain_jiont11(1:N_all)+strain_jiont21(1:N_all))];
index_for_joint_average(4)=N_all;











