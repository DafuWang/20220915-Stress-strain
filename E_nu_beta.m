function [Ei,E1n,Ep,beta_c1,beta_c2,nu,I,save_adress_name,figure_name] = E_nu_beta(fileadress,filename,NUM_strain,NUM_strain_stress,I)
%%可能需修改                                         
Max_strain_E=50;  
Max_strain_v=2000;  
ratio_1n=1/3;


[Ultimate_stress,index_max]=max(NUM_strain_stress(:,2));%取极限应力及其相应位置
index_stress_1n=find(NUM_strain_stress(:,2)>ratio_1n*Ultimate_stress,1);%取用于计算顶点弹性模量的行数

for i=1:4
%% 弹性模量及beta计算
N1=find(NUM_strain_stress(:,2*i-1)>Max_strain_E,1);%找到设定应变对应的位置
strian0=NUM_strain_stress(1:N1,2*i-1);%取应变
stress0=NUM_strain_stress(1:N1,2*i);%取应力
a0=[1]; 
%构建函数 
f0=@(a0,x)a0(1)*x;%设定函数变量及其参数.
%利用相应函数提取参数. 
a0=lsqcurvefit(f0,a0,strian0,stress0); 
Ei(i)=1E3*a0;%圆点切线模量
strain_c=NUM_strain_stress(index_max,2*i-1);%极限应变
strain_13(i)=NUM_strain_stress(index_stress_1n,2*i-1);%1/3极限应变
E1n(i)=1/3*Ultimate_stress/strain_13(i)*1E3;%1/3割线模量单位为GPa
Ep(i)=Ultimate_stress/strain_c*1E3;%极限割线模量

beta_c1(i)=1/(1-Ep(i)/Ei(i));
fu=@(x)(0.4*Ep(i)/E1n(i))^x-x*(Ep(i)/E1n(i)-1)-1;
beta_c2(i)=fzero(fu,2);
end

%% 泊松比计算---------------------------------------------------------------
lateral_strain=NUM_strain(2:Max_strain_v,1);%取横应变
axial_strain01=NUM_strain(2:Max_strain_v,2);%取纵向应变1
axial_strain02=NUM_strain(2:Max_strain_v,4);%取纵向应变2
axial_strain03=0.5*(NUM_strain(2:Max_strain_v,4)+NUM_strain(2:Max_strain_v,2));%取纵向应变2
axial_strain04=0.4*NUM_strain(2:Max_strain_v,4)+0.6*NUM_strain(2:Max_strain_v,2);%取纵向应变2


for j=1:4
eval(['axial_strain',num2str(j),'=','axial_strain0',num2str(j),';']);%自动命名的变量并赋值
I=I+1;
fig=figure(I);
plot(eval(['axial_strain',num2str(j)]),lateral_strain,'ob','MarkerSize',3);hold on;%自动命名的变量调用
%% 拟合参数
a3=[1];
%构建函数
f3=@(a3,x)a3(1)*x;%设定函数变量及其参数
%利用相应函数提取参数
nu(j)=lsqcurvefit(f3,a3,eval(['axial_strain',num2str(j)]),lateral_strain);
f30(:,j)=nu(j)*eval(['axial_strain',num2str(j)]);
plot(eval(['axial_strain',num2str(j)]),f30(:,j),'-b','LineWidth',2);hold on;
set(0,'defaultfigurecolor','w');%设定背景颜色为白色

xlabel('$axial\;strain(\mu\varepsilon)$','Interpreter','latex','FontSize',20);
ylabel('$lateral\;strain(\mu\varepsilon)$','Interpreter','latex','FontSize',20);
set(gca,'FontSize',15,'Fontname', 'Times New Roman');
set(gcf,'position',[360,198,560,420]);set(gca,'looseInset',[0 0 0 0]);
Xc=max(eval(['axial_strain',num2str(j)]));
Yc=max(lateral_strain);
set(text,'string',strcat('$\nu_',num2str(j),'=',num2str(nu(j)),'$'),'Interpreter','latex','position',[4/5*Xc 1/7*Yc 0],'FontSize',15);
set(text,'String',filename,'Interpreter','latex','Position',[27/40*Xc 2/7*Yc 0],'FontSize',15);
figure_name{j,1}=strcat('Pons ratio',num2str(j));
save_adress_name{j,1}=strcat(fileadress,'\',filename,'Pons ratio',num2str(j));
savefig(strcat(save_adress_name{j,1},'.fig'));
% saveas(figure(I),strcat(fileadress,'\',filename,'Pons ratio',num2str(j),'.bmp'));
delete(fig);
end


