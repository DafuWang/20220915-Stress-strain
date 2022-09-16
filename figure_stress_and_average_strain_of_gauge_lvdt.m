function [II,I,save_adress_name,save_fig_name]=figure_stress_and_average_strain_of_gauge_lvdt(M_average_stress_strain_gauge_lvdt,fileadress,filename,I)
N_intervals=200;
marks=["-s","-o","-^","-v","-*","-p"];
colors=["k","r","b","g","m","c"]; 

Asix=[0,60000,0,90];
legend_content=["$strain\, \overline{G1L1+G2L2}$","$strain\, \overline{G1L2+G2L1}$","$strain\,\overline{G1L2+G2L2}$","$strain\,\overline{G1L1+G2L1}$"];
legend_position=[0.63 0.761 0.35 0.208];
text_content1=filename;
text_content2="$combination\, between\, average\, stress\, and\, strain$";
text_content=[text_content1;text_content2];
text_position=[42/60*Asix(2),50/70*Asix(4),0;2/60*Asix(2),5/70*Asix(4),0];
save_fig_name='average stress strain';save_adress_name=strcat(fileadress,'\',filename,save_fig_name);
label_content=["$Strain(\mu\varepsilon)$","$Stress(MPa)$"];

[II,I]=figure_plot(M_average_stress_strain_gauge_lvdt,N_intervals,legend_content,legend_position,text_content,text_position,marks,colors,Asix,label_content,save_adress_name,I);
