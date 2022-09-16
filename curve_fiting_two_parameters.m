function [x1,y1,strain_c,beta,b,R2]=curve_fiting_two_parameters(a,constants,X,Y)
strain_c=constants;
%a为拟合参数，c为可变常数 
f=@(a1,x)a1(1)*(x./strain_c)./(a1(1)-1+power(x./strain_c,a1(1)*a1(2)));%设定函数变量及其参数.
%利用相应函数提取参数
% plot(X,Y);
% a=lsqcurvefit(f,a,X,Y); 
a = nlinfit(X,Y,f,a);
beta=a(1);
b=a(2);
%拟合数据
x1=X;
y1=a(1)*(x1./strain_c)./(a(1)-1+power(x1./strain_c,a(1)*a(2)));%得到的拟合函数
%计算误差
R2=1-sum((y1(1:end-1)-Y(1:end-1)).^2)/sum((Y(1:end-1)-mean(Y(1:end-1))).^2);
