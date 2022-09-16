function [II,fig]=figures_plot_alpha_beta(fileadress,ultimate_stress,strian,r_stress,x,y,strain_c,alpha,beta,b,R2_beta,R2_alpha,data_legnend,fitting1_legnend,fitting2_legnend,filename,I,i)
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
plot(x.x1,y.y1,'-r','LineWidth',2);hold on;
plot(x.x2,y.y2,'-g','LineWidth',2);hold on;

% 拟合公式及拟合度的计算：beta未知-------------------------------------------

beta0=num2str(roundn(beta,-2));
alpha0=num2str(roundn(alpha,-2));
b0=num2str(roundn(b,-2));
strain_c0=num2str(roundn(strain_c,-2));
index=strcat(b0,'*',beta0);
R201=strcat('R_1^2=',num2str(R2_beta));
R202=strcat('R_2^2=',num2str(R2_alpha));
strain0=strcat('\varepsilon_c/',strain_c0);
stress0=roundn(ultimate_stress,-2);
str1=strcat('\frac{\sigma_{cf}}{',num2str(stress0),'}=');
str2=strcat('\frac{\sigma_{cl}}{',num2str(stress0),'}=');
eq1=strcat('\frac{',beta0,strain0,'}','{',beta0,'-1+(',strain0,')^{',index,'}}');
eq2=strcat('\frac{(',strain0,')}','{',alpha0,'(',strain0,'-1)^2+',strain0,'}');
% str1='$$r(t)= \left\{\begin{array}{11}\frac{1}{2}\,A{t}^2 \hspace{5mm} & t\geq0\\0,&t<0\end{array}\right.$$';
%  str=strcat('$',str0,'\left\{\begin{array}{cc}',eq1,'&',strain0,'\leqslant 1 \\',eq2 ,'&' ,strain0,'>1 \end{array}\right');
 str1=strcat('$',str1,eq1,'$');
 str2=strcat('$',str2,eq2,'$');

set(gca,'YLim',[0 1.3]);
Xc=max(strian);
Yc=1.3*max(r_stress);
set(text,'string',str1,'Interpreter','latex','position',[13/60*Xc 1.18/1.3*Yc 0],'FontSize',15);
set(text,'string',str2,'Interpreter','latex','position',[13/60*Xc 0.95/1.3*Yc 0],'FontSize',15);

set(text,'string',strcat('$',R201,'$'),'Interpreter','latex','position',[35/60*Xc 0.7/1.2*Yc 0],'FontSize',10)
set(text,'string',strcat('$',R202,'$'),'Interpreter','latex','position',[35/60*Xc 0.6/1.2*Yc 0],'FontSize',10)

% 图片生成及储存------------------------------------------------------------
set(0,'defaultfigurecolor','w');%设定背景颜色为白色
set(gca,'FontSize',10,'Fontname', 'Times New Roman');
xlabel('$\varepsilon_c(\mu\varepsilon)$','Interpreter','latex','FontSize',15);
ylabel('$\sigma_c(MPa)$','Interpreter','latex','FontSize',15);

legend_pastion=[0.071 0.588 0.187 0.0911;
                0.559 0.586 0.198 0.088;
                0.0656 0.0713 0.191 0.088;
                0.562 0.071 0.186 0.0915];
legend(data_legnend(i),fitting1_legnend(i),fitting2_legnend(i),'Interpreter','latex','Position',legend_pastion(i,:),'FontSize',10);%'Interpreter','latex'
legend('boxoff')
set(text,'String',filename,'Interpreter','latex','Position',[35/60*Xc 0.06/1.2*Yc 0],'FontSize',10);


figure(100)
plot(strian,r_stress,'ob','MarkerSize',3);hold on;
set(0,'defaultfigurecolor','w');%设定背景颜色为白色
set(gca, 'LooseInset', [0,0,0,0]);
%% 拟合数据及参数:beta值未知%%%%%%%%%可修改拟合参数%%%%%%%%%%%%%%%%%%%
plot(x.x1,y.y1,'-r','LineWidth',2);hold on;
plot(x.x2,y.y2,'-g','LineWidth',2);hold on;

% 拟合公式及拟合度的计算：beta未知-------------------------------------------

beta0=num2str(roundn(beta,-2));
alpha0=num2str(roundn(alpha,-2));
b0=num2str(roundn(b,-2));
strain_c0=num2str(roundn(strain_c,-2));
index=strcat(beta0);
R201=strcat('R_1^2=',num2str(R2_beta));
R202=strcat('R_2^2=',num2str(R2_alpha));
strain0=strcat('\varepsilon_c/',strain_c0);
stress0=roundn(ultimate_stress,-2);
str1=strcat('\frac{\sigma_{cf}}{',num2str(stress0),'}=');
str2=strcat('\frac{\sigma_{cl}}{',num2str(stress0),'}=');
eq1=strcat('\frac{',beta0,strain0,'}','{',beta0,'-1+(',strain0,')^{',index,'}}');
eq2=strcat('\frac{',strain0,'}','{',alpha0,'(',strain0,'-1)^2+',strain0,'}');
 str1=strcat('$',str1,eq1,'$');
 str2=strcat('$',str2,eq2,'$');

set(gca,'YLim',[0 1.3]);
Xc=max(strian);
Yc=1.3*max(r_stress);
set(text,'string',str1,'Interpreter','latex','position',[21/70*Xc 1.20 0],'FontSize',20);
set(text,'string',str2,'Interpreter','latex','position',[21/70*Xc 1 0],'FontSize',20);

set(text,'string',strcat('$',R201,'$'),'Interpreter','latex','position',[45/70*Xc 0.8 0],'FontSize',15)
set(text,'string',strcat('$',R202,'$'),'Interpreter','latex','position',[45/70*Xc 0.65 0],'FontSize',15)

% 图片生成及储存------------------------------------------------------------
set(0,'defaultfigurecolor','w');%设定背景颜色为白色
set(gca,'FontSize',10,'Fontname', 'Times New Roman');
xlabel('$\varepsilon_c(\mu\varepsilon)$','Interpreter','latex','FontSize',15);
ylabel('$\sigma_c(MPa)$','Interpreter','latex','FontSize',15);

legend(data_legnend(i),fitting1_legnend(i),fitting2_legnend(i),'Interpreter','latex','Position',[0.06 0.11 0.399 0.130],'FontSize',10);%'Interpreter','latex'
legend('boxoff')
set(text,'String',filename,'Interpreter','latex','Position',[45/70*Xc 0.5 0],'FontSize',15);
savefig(fileadress);
delete(figure(100))



