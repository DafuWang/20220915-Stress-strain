function [x1,y1,strain_c,beta,R2]=curve_fiting_beta_parameter(a,constants,X,Y)
strain_c=constants;
%a为拟合参数，c为可变常数 
f=@(a1,x)a1(1)*(x./strain_c)./(a1(1)-1+power(x./strain_c,a1(1)));%设定函数变量及其参数.
%利用相应函数提取参数
% plot(X,Y);
% a=lsqcurvefit(f,a,X,Y); 
a = nlinfit(X,Y,f,a);
beta=a(1);
%拟合数据
x1=X;
y1=a(1)*(x1./strain_c)./(a(1)-1+power(x1./strain_c,a(1)));%得到的拟合函数
%计算误差
R2=1-sum((y1(1:end-1)-Y(1:end-1)).^2)/sum((Y(1:end-1)-mean(Y(1:end-1))).^2);
