function [II,I,save_adress_name,save_fig_name]=figure_stress_and_strain_of_gauge_lvdt(M_stress_strain_gauge_lvdt,fileadress,filename,I);

N_intervals=200;
marks=["-s","-o","-^","-v","-*","-p"];
colors=["k","r","b","g","m","c"];

Asix=[0,60000,0,90];
legend_content=["$strain\, G1>>L1$","$strain\, G2>>L2$","$strain\,G1>>L2$","$strain\,G2>>L1$"];
legend_position=[0.69 0.79 0.28 0.15];
text_content1=filename;
text_content2="$splicing\, of\, strain\, between\, gauge\, and\, lvdt$";
text_content=[text_content1;text_content2];
text_position=[42/60*Asix(2),50/70*Asix(4),0;2/60*Asix(2),5/70*Asix(4),0];
save_fig_name='stress and strain of splicing';save_adress_name=strcat(fileadress,'\',filename,save_fig_name);
label_content=["$Strain(\mu\varepsilon)$","$Stress(MPa)$"];
[II,I]=figure_plot(M_stress_strain_gauge_lvdt,N_intervals,legend_content,legend_position,text_content,text_position,marks,colors,Asix,label_content,save_adress_name,I);
