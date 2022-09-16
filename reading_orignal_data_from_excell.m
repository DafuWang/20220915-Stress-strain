function [maximum,joint_point,stress,full_strain_gauge0,full_strain_gauge1,full_strain_gauge2,strain_lvdt1,strain_lvdt2,...
 ultimate_stress,index_for_stress,strain_gauge0,strain_gauge1,strain_gauge2,strain_gauge_average,...
 ultimate_strain_gauge0,ultimate_strain_gauge1,ultimate_strain_gauge2,ultimate_strain_lvdt1,ultimate_strain_lvdt2]=reading_orignal_data_from_excell(fileadress,Chan_name,joint_point)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 应力应变数据处理程序
% 3-横向（微应变）；4-纵向1（微应变）；5-纵向2（微应变）；6-位移计1（毫米）；7-位移计2（毫米）；8-力（千牛）
%读取完之后就转化为应力和应变了
for i=1:6
NUM0=readtable(strcat(fileadress,'\',num2str(i+2),'.xlsx'));%读取excell数据
NUM=table2array(NUM0(:,2));

if(i+2==Chan_name.LVDT_1||i+2==Chan_name.LVDT_2)%前五个只需要清零   
    data(:,i+2)=abs(NUM(2:end)-NUM(1,1))/60*1000000;%60代表标距，应变=变形/标距    
else%最后两个是位移，还需要转换
    data(:,i+2)=abs(NUM(2:end)-NUM(1,1)); 
end

end





full_strain_gauge0=data(:,Chan_name.transverse);%横向应变
full_strain_gauge1=data(:,Chan_name.vertical_1);%纵向应变应变片1
full_strain_gauge2=data(:,Chan_name.vertical_2);%纵向应变应变片2

strain_lvdt1=data(:,Chan_name.LVDT_1);%纵向应变位移计1
strain_lvdt2=data(:,Chan_name.LVDT_2);%纵向应变位移计2

stress=data(:,Chan_name.load)/10;%应力

[ultimate_stress,index_max0]=max(stress);%极限压应力
strain_gauge0=data(1:index_max0,Chan_name.transverse);%横向应变



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%这是非常关键的数据%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% stress_ratio_joint_point(1)=56/60;%应变片1对应的应力拼接点
% stress_ratio_joint_point(2)=60/60;%应变片2对应的应力拼接点
index_for_stress(1)=find(stress>=joint_point.ratio(1)*ultimate_stress,1);%拼接的行数
index_for_stress(2)=find(stress>=joint_point.ratio(2)*ultimate_stress,1);

joint_point.stress(1)=joint_point.ratio(1)*ultimate_stress;
joint_point.stress(2)=joint_point.ratio(2)*ultimate_stress;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
strain_gauge1=data(1:index_for_stress(1),Chan_name.vertical_1);%纵向应变应变片1
strain_gauge2=data(1:index_for_stress(2),Chan_name.vertical_2);%纵向应变应变片2

N_all=min(size(strain_gauge1,1),size(strain_gauge2,1));
strain_gauge_average=1/2*(strain_gauge1(1:N_all)+strain_gauge2(1:N_all));
index_for_stress(3)=min(index_for_stress(1),index_for_stress(2));

joint_point.strainG(1)=strain_gauge1(end,1);
joint_point.strainG(2)=strain_gauge2(end,1);

joint_point.index(1)=index_for_stress(1);
joint_point.index(2)=index_for_stress(2);

joint_point.lvdt(1)=strain_lvdt1(index_for_stress(1));
joint_point.lvdt(2)=strain_lvdt1(index_for_stress(2));

ultimate_strain_gauge0=data(index_max0,Chan_name.transverse);%极限横向应变（应变片1）
ultimate_strain_gauge1=data(index_max0,Chan_name.vertical_1);%极限压应变（应变片1）
ultimate_strain_gauge2=data(index_max0,Chan_name.vertical_2);%极限压应变（应变片2）
ultimate_strain_lvdt1=data(index_max0,Chan_name.LVDT_1);%极限压应变（LVDT1）
ultimate_strain_lvdt2=data(index_max0,Chan_name.LVDT_2);%极限压应变（LVDT2）

maximum.ultimate_strain_gauge0=ultimate_strain_gauge0;
maximum.ultimate_strain_gauge1=ultimate_strain_gauge1;
maximum.ultimate_strain_gauge2=ultimate_strain_gauge2;
maximum.ultimate_strain_lvdt1=ultimate_strain_lvdt1;
maximum.ultimate_strain_lvdt2=ultimate_strain_lvdt2;
maximum.ultimate_stress=ultimate_stress;

