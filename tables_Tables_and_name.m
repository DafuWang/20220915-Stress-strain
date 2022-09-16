function [n_table,Content,Num]=tables_Tables_and_name(Document,Content,Selection,n_rows,n_columns,table_data,table_name,table_content_t,table_content_v,Num,n_table)

N_Tables=Num.Table;
Tables = Document.Tables.Add(Selection.Range,n_rows,n_columns);%建立一个2*2的表格
DTI = Document.Tables.Item(n_table); % 或DTI = Tables;

for j=2:n_columns%合并单元格
DTI.Cell(1, 1).Merge(DTI.Cell(1, 2));
end

DTI.Rows.Item(1).Borders.Item(1).LineStyle = 'wdLineStyleNone';% 设置第8行上边界线型，1，2，3，4分别对应单元格的上、左、下、右边界
DTI.Rows.Item(1).Borders.Item(3).LineStyle = 'wdLineStyleSingle';% 设置第8行上边界线型，1，2，3，4分别对应单元格的上、左、下、右边界
DTI.Rows.Item(1).Borders.Item(3).LineWidth = 'wdLineWidth150pt';% 设置线宽，有025，050，075，100，150，225，300，450，600pt等
DTI.Rows.Item(2).Borders.Item(3).LineStyle = 'wdLineStyleSingle';% 设置第8行上边界线型，1，2，3，4分别对应单元格的上、左、下、右边界
DTI.Rows.Item(n_rows).Borders.Item(3).LineStyle = 'wdLineStyleSingle';% 设置第8行上边界线型，1，2，3，4分别对应单元格的上、左、下、右边界
DTI.Rows.Item(n_rows).Borders.Item(3).LineWidth = 'wdLineWidth150pt';% 设置线宽，有025，050，075，100，150，225，300，450，600pt等

L=set_format_for_text_figure(DTI,1,1);

DTI.Cell(1,1).Range.Font.Bold=4;
Table_name=strcat("Table ",num2str(N_Tables),table_name);% Figure_name=[strcat("Fig. ",num2str(n_figures)),strcat("Fig. ",num2str(n_figures+1))];
DTI.Cell(1,1).Range.Text=Table_name;


L=set_format_for_text_figure(DTI,2,1);

%%%%%%%%%%%%%%%%%写横向小标题%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=2:n_columns

       objRange=DTI.Cell(2,j).Range;
       objRange.Text=table_content_t(j-1);
       objRange=Selection.OMaths.Add(objRange);
       objEq=objRange.OMaths(1);
       objEq.BuildUp;
       Selection.EndKey;

       L=set_format_for_text_figure(DTI,2,j);   
end


%%%%%%%%%%%%%%%%%写竖向小标题%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=3:n_rows
       objRange=DTI.Cell(i,1).Range;
       objRange.Text=table_content_v(i-2);
       objRange=Selection.OMaths.Add(objRange);
       objEq=objRange.OMaths(1);
       objEq.BuildUp;
       Selection.EndKey;

       L=set_format_for_text_figure(DTI,i,1);   
end


%%%%%%%%%%%%%%%%%写数据内容%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=3:n_rows
    for j=2:n_columns     
        DTI.Cell(i,j).Range.Text =num2str(table_data(i-2,j-1));
        L=set_format_for_text_figure(DTI,i,j);
    end
end


n_table=n_table+1;
Num.Table=N_Tables+1;