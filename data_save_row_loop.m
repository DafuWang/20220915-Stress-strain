function [I1]=data_save_row_loop(excel_adress_name,sheet_number,str11,ultimate_value,I1)
for ii=1:size(str11,2)
    xlswrite(excel_adress_name,{str11(ii)},sheet_number,strcat(char(65+I1-1),num2str(2*ii-1+2)));%横向应变列
    xlswrite(excel_adress_name,{ultimate_value(ii)},sheet_number,strcat(char(65+I1-1),num2str(2*ii+2)));%极限横向应变
end
