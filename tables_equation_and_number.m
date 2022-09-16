function [n_table,N_equation]=tables_equation_and_number(Document,Selection,str1,n_table,N_equation)


Tables = Document.Tables.Add(Selection.Range,1,2);%建立一个1*2的表格
DTI = Document.Tables.Item(n_table);
DTI.Columns.Item(1).Width = 470;%循环设置列宽
DTI.Columns.Item(2).Width = 30;
% DTI.Rows.Item(i).Height = row_height(i);%循环设置行高
L=set_format_for_text_figure(DTI,1,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%公式的输入%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
objRange=Selection.Range;
Selection.Font.Bold = 0; Selection.Font.Size = 12;
objRange.Text=str1;%输入latex
objRange=Selection.OMaths.Add(objRange);
objEq=objRange.OMaths(1);
objEq.BuildUp;
Selection.EndKey;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%公式的输入%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% DTI.Cell(1,1).Range.Text = str1;%粘贴文

DTI.Cell(1,1).Range.ParagraphFormat.Alignment = 'wdAlignParagraphLeft';
L=set_format_for_text_figure(DTI,1,2);DTI.Cell(1,2).Range.Font.Bold=4;
DTI.Cell(1,2).Range.Text = strcat('(',num2str(N_equation),')');%粘贴文
DTI.Cell(1,2).Range.ParagraphFormat.Alignment = 'wdAlignParagraphRight';
DTI.Cell(1,2).VerticalAlignment = 'wdCellAlignVerticalCenter';
n_table=n_table+1;N_equation=N_equation+1;



