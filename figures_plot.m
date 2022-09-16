function [II,fig]=figures_plot(strian,r_stress,x,y,strain_c,beta,b,R2,data_legnend,fitting_legnend,filename,I,i)
II=I;
fig=figure(I);
set(gcf,'position',[360,200,760,600]);%设置图创大小
positionVector = [0.065 0.59 0.42 0.4;%第（2，1）
                 0.56, 0.59, 0.42, 0.4;%（2，2）
                 0.065 0.075 0.42 0.4;%（1，1）
                 0.56 0.075 0.42 0.4;]; %（1，2） %[left,bottom,width,height]                  
subplot(2,2,i)
set(gca,'Position',positionVector(i,:))
plot(strian,r_stress,'ob','MarkerSize',3);hold on;
set(0,'defaultfigurecolor','w');%设定背景颜色为白色
%% 拟合数据及参数:beta值未知%%%%%%%%%可修改拟合参数%%%%%%%%%%%%%%%%%%%
plot(x,y,'-b','LineWidth',2);
% 拟合公式及拟合度的计算：beta未知-------------------------------------------

beta0=num2str(roundn(beta,-2));
b0=num2str(roundn(b,-2));
strain_c0=num2str(roundn(strain_c,-2));
index=strcat(b0,'*',beta0);
R201=strcat('R^2=',num2str(R2));
str1=strcat('$','\frac{\sigma_{c}}{\sigma_c^\prime}=','\frac{',beta0,'(\varepsilon_c/',strain_c0,')}',...
     '{',beta0,'-1+(\varepsilon_c/',strain_c0,')^{',index,'}}','$');
set(gca,'YLim',[0 1.3]);
Xc=max(strian);
Yc=1.3*max(r_stress);
set(text,'string',str1,'Interpreter','latex','position',[15/60*Xc 1.18/1.3*Yc 0],'FontSize',15);
set(text,'string',strcat('$',R201,'$'),'Interpreter','latex','position',[35/60*Xc 0.9/1.2*Yc 0],'FontSize',10)

% 图片生成及储存------------------------------------------------------------
set(0,'defaultfigurecolor','w');%设定背景颜色为白色
set(gca,'FontSize',10,'Fontname', 'Times New Roman');
xlabel('$\varepsilon_c(\mu\varepsilon)$','Interpreter','latex','FontSize',15);
ylabel('$\sigma_c(MPa)$','Interpreter','latex','FontSize',15);

legend_pastion=[0.065 0.59 0.269 0.0608;
0.56 0.59 0.269 0.0608;
0.065 0.076 0.269 0.0608;
0.56 0.076 0.269 0.0608];
legend(data_legnend(i),fitting_legnend(i),'Interpreter','latex','Position',legend_pastion(i,:),'FontSize',10);%'Interpreter','latex'
legend('boxoff')
set(text,'String',filename,'Interpreter','latex','Position',[35/60*Xc 0.8/1.2*Yc 0],'FontSize',10);


