 function [II,I,save_adress_name,save_fig_name]=figure_transverse_vertical_strain_of_gauge(M_strain_gauge,fileadress,filename,I)
% function [II,I,save_adress_name]=figure_transverse_vertical_strain_of_gauge(M_strain_gauge,fileadress,filename,I)

N_intervals=200;
marks=["-s","-o","-^","-v","-*","-p"];
colors=["k","r","b","g","m","c"];

Asix=[0,3000,0,1500];
legend_content=["$strain\,gauge1$",  "$strain\,gauge2$", "$strain\, \overline{gauge1+gauge2}$"];
legend_position=[0.56 0.140 0.397 0.15];
text_content1=filename;
text_content2="$transverse\, and\, vertical\, strain\, of\, gauge$";
text_content=[text_content1;text_content2];
text_position=[25/40*Asix(2),18/70*Asix(4),0;
               10/30*Asix(2),25/70*Asix(4),0];

save_fig_name='transverse and vertical strain of gauge';save_adress_name=strcat(fileadress,'\',filename,save_fig_name);
label_content=["$Vertical\,strain(\mu\varepsilon)$","$Transverse\,strain(\mu\varepsilon)$"];

[II,I]=figure_plot(M_strain_gauge,N_intervals,legend_content,legend_position,text_content,text_position,marks,colors,Asix,label_content,save_adress_name,I);


