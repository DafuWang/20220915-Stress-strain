function [II,I,save_adress_name,save_fig_name]=figure_stress_and_strain_of_partial_gauge(XYs,fileadress,filename,I)
N_intervals=200;
marks=["-s","-o","-^","-v","-*","-p"];
colors=["k","r","b","g","m","c"];
 
Asix=[0,6000,0,90];
legend_content=["$strain\,partial\, gauge1$",  "$strain\,partial\, gauge2$", "$partial\,\overline{gauge1+gauge2}$"];
legend_position=[0.50 0.817 0.45 0.15];

[ultimate_stress,index_max]=max(XYs{1,2});%极限压应力

ultimate_strain_gauge1=max(XYs{1,1});%极限压应变（应变片1）
ultimate_strain_gauge2=max(XYs{1,3});%极限压应变（应变片2）


text_content1=filename;
text_content2="$stress\, and\,partial\, strain\, of\, gauge$";
text_content3=strcat('$ultimate\, stress=',num2str(ultimate_stress),'MPa$');
text_content4=strcat('$ultimate\, strain\, gauge1=',num2str(ultimate_strain_gauge1),'(\mu\varepsilon)$');
text_content5=strcat('$ultimate\, strain\, gauge2=',num2str(ultimate_strain_gauge2),'(\mu\varepsilon)$');
text_content=[text_content1;text_content2;text_content3;text_content4;text_content5];

text_position=[40/60*Asix(2),50/70*Asix(4),0;
               2/60*Asix(2),5/70*Asix(4),0;
               20/60*Asix(2),10/70*Asix(4),0;
               20/60*Asix(2),15/70*Asix(4),0;
               20/60*Asix(2),20/70*Asix(4),0];

save_fig_name='stress and partial strain of gauge';save_adress_name=strcat(fileadress,'\',filename,save_fig_name);
label_content=["$Strain(\mu\varepsilon)$","$Stress(MPa)$"];
[II,I]=figure_plot(XYs,N_intervals,legend_content,legend_position,text_content,text_position,marks,colors,Asix,label_content,save_adress_name,I);
