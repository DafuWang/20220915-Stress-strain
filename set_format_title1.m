function L=set_format_title1(Content)
Content.Font.Size = 22 ;%三号字
Content.Font.Bold = 4 ;%加粗
Content.Font.ColorIndex = 'wdBlack'; % 设置字体颜色
Content.Paragraphs.Alignment = 'wdAlignParagraphCenter';% 设定段落格式
Content.Paragraphs.LineSpacingRule = 'wdLineSpace1pt5'; % 设置行间距为1.5倍行距，第1段 
Content.Paragraphs.FirstLineIndent = 0; % 首行缩进28磅，也就是当前14磅字符的2个字符，第二段
L=1;