%利用MATLAB生成Word文档
I=I+1;
filespec_user = (strcat('D:\大论文\大论文\第七章\matlab 程序\matlab 处理应力应变数据程序20220526\2\',num2str(I),'.doc'));% 设定测试Word文件名和路径
% 判断Word是否已经打开，若已打开，就在打开的Word中进行操作，否则就打开Word
try
    Word = actxGetRunningServer('Word.Application'); % 若Word服务器已经打开，返回其句柄Word
catch
    Word = actxserver('Word.Application');% 否则，创建一个Microsoft Word服务器，返回句柄Word
end
Word.Visible = 1; % 或set(Word, 'Visible', 1);%若测试文件存在，打开该测试文件，否则，新建一个文件，并保存，文件名为测试.doc

if exist(filespec_user,'file')
    Document = Word.Documents.Open(filespec_user); % Document = invoke(Word.Documents,'Open',filespec_user);
else
    Document = Word.Documents.Add;% Document = invoke(Word.Documents, 'Add');
    Document.SaveAs2(filespec_user);
end
Selection=Word.Selection;
Content = Document.Content;

set(Content, 'Start',0);    %设置文档内容的起始位置
title='试  卷  分  析';
set(Content, 'Text',title); %输入文字内容
Content.Font.Size=16;      %设置字号16
Content.Font.Bold=4;       %字体加粗
Content.Paragraphs.Alignment='wdAlignParagraphCenter';%居中

set(Content, 'Start',1);
title='123';
set(Content, 'Text',title); %输入文字内容

% 
% selection.TypeParagraph; 
% Selection.Text = 'Cloakroom1';
% selection.TypeParagraph; 
% Selection.Text = 'Cloakroom2';
% selection.TypeParagraph; 
%插入新的页面
% selection.InsertNewPage;

% x=0:0.1:2*pi;
% y(:,1)=sin(x);
% y(:,2)=cos(x);
% 
% for i=1:2
%     zft=figure(1);
%     plot(x,y(:,i));
%     set(0,'defaultfigurecolor','w');%设定背景颜色为白色
%     set(gcf,'position',[360,200,560,400]);%设置图创大小
%     set(gca,'looseInset',[0 0 0 0]);
%     try
%         % 将图形复制到粘贴板
%         hgexport(zft, '-clipboard');%figure的句柄为“zft”
%        
%         Selection.Range.Paste;%在当前光标的位置插入图片
%     catch
%         disp('画图失败');
%     end
% end
% delete(zft); % 删除图形句柄
% 
% 
% 
% 
% Total_Tab = Document.Tables.Add(Selection.Range,5,4);
% Total_Tab.Rows.Alignment = 'wdAlignRowCenter';
% Total_Tab.Borders.OutsideLineStyle='wdLineStyleSingle';
% Total_Tab.Borders.OutsideLineWidth='wdLineWidth150pt';
% Total_Tab.Borders.InsideLineStyle='wdLineStyleSingle';
% Total_Tab.Borders.InsideLineWidth='wdLineWidth150pt';
% Total_Tab.Rows.Alignment='wdAlignRowCenter';
% 
% Total_Tab.Cell(1, 1).Range.Text = '项目';
% Total_Tab.Cell(1, 2).Range.Text = '最小值';
% Total_Tab.Cell(1, 3).Range.Text = '最大值';
% Total_Tab.Cell(1, 4).Range.Text = '均值±标准差';
% 
% Total_Tab.Cell(2, 1).Range.Text = num2str(1);
% Total_Tab.Cell(2, 2).Range.Text = num2str(2);
% Total_Tab.Cell(2, 3).Range.Text = num2str(3);
% Total_Tab.Cell(2, 4).Range.Text = num2str(4);

% 
% Document.ActiveWindow.ActivePane.View.Type = 'wdPrintView'; % 设置视图方式为页面
% Document.Save; % 保存文档
% Document.Close; % 关闭文档
% Word.Quit; % 退出word服务器

