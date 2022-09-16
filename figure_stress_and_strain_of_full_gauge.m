 function [II,I,save_adress_name,save_fig_name]=figure_stress_and_strain_of_full_gauge(XY,fileadress,filename,I)
% function [II,I,save_adress_name]=figure_tstress_and_strain_of_full_gauge(XY,fileadress,filename,I)

N_intervals=200;
marks=["-s","-o","-^","-v","-*","-p"];
colors=["k","r","b","g","m","c"];

 Asix=[0,4000,0,90];
legend_content=["$strain\,gauge1$",  "$strain\,gauge2$", "$strain\, \overline{gauge1+gauge2}$"];
legend_position=[0.56 0.131 0.397 0.15];
text_content1=filename;
text_content2="$stress\, and\,full\, strain\, of\, gauge$";
text_content=[text_content1;text_content2];
text_position=[25/40*Asix(2),18/70*Asix(4),0;
               2/60*Asix(2),65/70*Asix(4),0];

save_fig_name='stress and full strain of gauge';save_adress_name=strcat(fileadress,'\',filename,save_fig_name);
label_content=["$Strain(\mu\varepsilon)$","$Stress(MPa)$"];
[II,I]=figure_plot_seen(XY,N_intervals,legend_content,legend_position,text_content,text_position,marks,colors,Asix,label_content,save_adress_name,I);
