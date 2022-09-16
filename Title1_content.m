function [paragraph] =Title1_content(Chan_name)

paragraph{1,1}=strcat('首先绘制了测试得到的原始数据，包括横向应变（横向应变片',num2str(Chan_name.transverse),'）和纵向应变关系，由应变片得到应变（竖向应变片',num2str(Chan_name.vertical_1),'及',num2str(Chan_name.vertical_2),'）与应力（力传感器',num2str(Chan_name.load),'）关系', ...
    '，及由位移计得到的应变（竖向位移计',num2str(Chan_name.LVDT_1),'及',num2str(Chan_name.LVDT_2),'）和应力的关系。');

