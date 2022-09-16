function [x,y,strain_c,alpha,beta,R2_beta,R2_alpha]=curve_fiting_alpha_beta(a,constants,X,Y)
strain_c=constants;
%a为拟合参数，c为可变常数 
f=@(a1,x)a1(1)*(x./strain_c)./(a1(1)-1+power(x./strain_c,a1(1)));%设定函数变量及其参数.
[~,index]=max(Y);
X1=X(1:index);
Y1=Y(1:index);

a = nlinfit(X1,Y1,f,a);
beta=a(1);
%拟合数据
x.x1=X1;
y.y1=a(1)*(X1./strain_c)./(a(1)-1+power(X1./strain_c,a(1)));%得到的拟合函数
%计算误差
R2_beta=1-sum((y.y1(1:end-1)-Y1(1:end-1)).^2)/sum((Y1(1:end-1)-mean(Y1(1:end-1))).^2);


%利用相应函数提取参数
f1=@(a1,x)(x./strain_c)./(a1*(x./strain_c-1).^2+x./strain_c);%设定函数变量及其参数.
X2=X(index:end);
Y2=Y(index:end);

alpha= nlinfit(X2,Y2,f1,a);
%拟合数据
x.x2=X2;
y.y2=(X2./strain_c)./(alpha*(X2./strain_c-1).^2+X2./strain_c);%得到的拟合函数
%计算误差
R2_alpha=1-sum((y.y2(1:end-1)-Y2(1:end-1)).^2)/sum((Y2(1:end-1)-mean(Y2(1:end-1))).^2);