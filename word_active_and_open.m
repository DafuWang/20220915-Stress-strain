function [Word,Document,Content,Selection]=word_active_and_open(filespec_user)
try% 判断Word是否已经打开，若已打开，就在打开的Word中进行操作，否则就打开Word
    Word = actxGetRunningServer('Word.Application');% 若Word服务器已经打开，返回其句柄Word
catch
    Word = actxserver('Word.Application');% 否则，创建一个Microsoft Word服务器，返回句柄Word
end

Word.Visible = 1; % 或set(Word, 'Visible', 1);

if exist(filespec_user,'file')% 若测试文件存在，打开该测试文件，否则，新建一个文件，并保存，文件名为测试.doc
    Document = Word.Documents.Open(filespec_user);% Document = invoke(Word.Documents,'Open',filespec_user);
else
    Document = Word.Documents.Add;% Document = invoke(Word.Documents, 'Add');
    Document.SaveAs2(filespec_user);
end

Content = Document.Content;% 设定光标位置从头开始% Content.InsertParagraphAfter;% 接着插入% Content.Collapse=0; % 0为不覆盖
Selection = Word.Selection;