function L=set_format_for_text_figure(DTI,i,j)
            DTI.Cell(i,j).Range.Font.Size = 10.5;
            DTI.Cell(i,j).Range.Font.Bold = 0;
            DTI.Cell(i,j).Range.Font.ColorIndex = 'wdBlack'; % 设置字体颜色
            DTI.Cell(i,j).Range.ParagraphFormat.Alignment = 'wdAlignParagraphCenter';
            DTI.Cell(i,j).Range.ParagraphFormat.LineSpacingRule = 'wdLineSpaceSingle';
L=1;