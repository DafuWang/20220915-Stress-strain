function [x1,y1,strain_c,beta,b,R2]=curve_fiting_one_parameter(a,constants,X,Y)

strain_c=constants(1);%从为极限应变
beta=constants(2);%为计算已知的beta
f=@(a1,x)beta*(x./strain_c)./(beta-1+power(x./strain_c,beta*a1));%设定函数变量及其参数.
%利用相应函数提取参数. 
% a=lsqcurvefit(f,a,X,Y); 
a = nlinfit(X,Y,f,a);
b=a;
%拟合数据
x1=X;
y1=beta*(x1./strain_c)./(beta-1+power(x1./strain_c,beta*a));%得到的拟合函数
%计算误差
R2=1-sum((y1(1:end-1)-Y(1:end-1)).^2)/sum((Y(1:end-1)-mean(Y(1:end-1))).^2);

