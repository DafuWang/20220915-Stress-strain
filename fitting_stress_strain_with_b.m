function [A,beta,b,R2,I]=fitting_stress_strain_with_b(filename,save_adress_name,data_legnend,fiting_legend,NUM_joint,beta_c,I)


n_intervals=1;

initial_a12=1;%initial_a(1)为beta值，initial_a(2)为b
% % 
I=I+1;
for i=1:4  
[ultimate_stress(i),index_max]=max(NUM_joint(:,2*i));%极限应力及其相应位置
constants12=[NUM_joint(index_max,2*i-1),beta_c];%极限应变
[x12,r_stress,y12,beta(i),b(i),R2(i),I,II12(i),fig] = strain_stress_fitting_b(filename,NUM_joint,I,n_intervals,ultimate_stress(i),data_legnend,fiting_legend,initial_a12,constants12,i);
A{i,1}=[x12,r_stress,y12];initial_a12=b(i);
end


savefig(strcat(save_adress_name{1,1},'.fig'));
% saveas(figure(I),strcat(save_adress_name{1,1},'.bmp'));
delete(fig);