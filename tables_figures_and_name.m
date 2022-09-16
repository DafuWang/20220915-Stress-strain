 function [Document,Selection,n_table,Num]=tables_figures_and_name(Document,Selection,save_adress_name,figure_name,figure_title,n_rows,n_columns,Num,n_table)

Tables = Document.Tables.Add(Selection.Range,n_rows,n_columns);%建立一个2*2的表格
DTI = Document.Tables.Item(n_table); % 或DTI = Tables;


for j=2:n_columns
DTI.Cell(n_rows, 1).Merge(DTI.Cell(n_rows, 2));
end

Figure_name=[strcat("Fig. ",num2str(Num.figures),figure_title)];% 

n_columns_test=size(Figure_name,2);
L=set_format_for_text_figure(DTI,n_rows,1);DTI.Cell(n_rows,1).Range.Font.Bold=4;%加粗
DTI.Cell(n_rows,1).Range.Text = Figure_name(1);%粘贴文字


DTI.Rows.Alignment = 'wdAlignRowCenter';%设置行对齐方式
DTI.Cell(2,1).VerticalAlignment = 'wdCellAlignVerticalCenter';% 设定单元格对齐方式


n=0;
for i=1:2:n_rows-1
    for j=1:n_columns
        n=n+1;
        L=set_format_for_text_figure(DTI,i,j);
        try

            hFigure=open(strcat(save_adress_name{n,1},'.fig'));   %读取图片
            print(hFigure,'-clipboard','-dbitmap');    %将图片发到剪切板
            DTI.Cell(i,j).Range.Paragraphs.Item(1).Range.Paste;%Selection.Range.Paste;%在当前光标的位置插入图片

             if n_rows>2
                L=set_format_for_text_figure(DTI,i+1,j);
                  DTI.Cell(i+1,j).Range.Text = strcat("(",char(96+n),") ",figure_name{n,1});%粘贴文
%                  DTI.Cell(i+1,j).Range.Text = strcat('(',char(96+n),')');%粘贴文

             end


        catch
            disp('画图失败');
        end
         delete(hFigure); % 删除图形句柄
    end
end

n_table=n_table+1;
Num.figures=Num.figures+1;