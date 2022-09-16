x=1:0.1:2;         %此程序仅为展示偏导数的写法，所以随便取的数值。
y=1;
plot(x,y);
latexf= '\left(\begin{array}{cc} \frac{1}{3} & x\\ {\mathrm{e}}^x & x^2 \end{array}\right)';
lgh=legend(latexf);
set(lgh,'interpreter','LaTex');
