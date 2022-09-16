function [I1]=data_save_column_loop(excel_adress_name,sheet_number,column_name,column_content,I1)

for ii=1:size(column_name,2)
    if 64+I1<=90
        xlswrite(excel_adress_name,{column_name(ii)},sheet_number,strcat(char(64+I1),'1'));%横向应变列
        xlswrite(excel_adress_name,column_content{1,ii},sheet_number,strcat(char(64+I1),'2'));%极限横向应变

    else
        j=floor(I1/26)-1;
        if mod((I1),26)==0
            xlswrite(excel_adress_name,{column_name(ii)},sheet_number,strcat(char(64+j),char(90),'1'));%横向应变列
            xlswrite(excel_adress_name,column_content{1,ii},sheet_number,strcat(char(64+j),char(90),'2'));%极限横向应变
        else
            xlswrite(excel_adress_name,{column_name(ii)},sheet_number,strcat(char(65+j),char(64+mod(I1,26)),'1'));%横向应变列
            xlswrite(excel_adress_name,column_content{1,ii},sheet_number,strcat(char(65+j),char(64+mod(I1,26)),'2'));%极限横向应变
        end
    end
    I1=I1+1;
end
