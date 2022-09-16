function [II,I]=figure_plot_seen(M,N_intervals,legend_content,legend_position,text_content,text_position,marks,colors,Asix,label_content,save_adress_name,I)

I=I+1;
II=I;
legend10=[];%用于legned的拼接
N=size(M,2)/2;%确定能画多少条曲线，X和Y是一起的
%% 画图
n_fg=figure(I);
for i=1:N
    maker_idx=1:N_intervals:size(M{1,2*i-1},1);%设置标记位置
    plot(M{1,2*i-1},M{1,2*i},marks(i),'color',colors(i),'MarkerIndices',maker_idx);hold on %'visible','off'
   
    xlabel(label_content(1),'Interpreter','latex','FontSize',20);
    ylabel(label_content(2),'Interpreter','latex','FontSize',20);
    set(gca,'FontSize',20,'Fontname', 'Times New Roman');
    axis(Asix);
    legend10=[legend10,legend_content(i)];
    legend(legend10,'Interpreter','latex','Position',legend_position)
end
set(gcf,'position',[360,200,760,600]);%设置图创大小
set(gca,'looseInset',[0 0 0 0]);
set(0,'defaultfigurecolor','w');%设定背景颜色为白色
%% 文本输出
n=size(text_content,1);
for i=1:n
    set(text,'String',text_content(i),'Interpreter','latex','Position',text_position(i,:),'FontSize',18);
end
%% 加边框
ax2 = axes('Position',get(gca,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','k','YColor','k');
set(ax2,'YTick', []);
set(ax2,'XTick', []);
%% 保存文件
savefig(figure(I),strcat(save_adress_name,'.fig'));
% saveas(figure(I),strcat(save_adress_name,'.bmp'));
delete(n_fg);
