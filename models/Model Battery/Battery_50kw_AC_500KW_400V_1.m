
%%exportacion de datos de voltajes
    %creacion de tabla
v_ind = eval('VABCS');  %Vabc de bateria _convetidor
i_ind = eval('IabcL');  % Iabc de bateria_convertidor 

p_out = eval('Pw3');  %potencia_activa_conjunto
s_out = eval('Sva3');  % potencia_aparente_conjunto  

p_in = eval('POWER');  % potencia_de entrada  

dataTable = table(v_ind.time,...
p_in.signals.values(:, 1),...
v_ind.signals.values(:, 1), v_ind.signals.values(:, 2),v_ind.signals.values(:, 3),...
i_ind.signals.values(:, 1), i_ind.signals.values(:, 2),i_ind.signals.values(:, 3),...
p_out.signals.values(:, 1),...
s_out.signals.values(:, 1),...
'VariableNames', {'Time',... 
'Perfile_Power_[W]',...
'Voltage_A[V]', 'Voltage_B[V]', 'Voltage_C[V]',... 
'Current_A[A]', 'Current_B[A]', 'Current_C[A]',...
'P_Power_active[W]',... 
'S_Power_apparent[VA]',...
});


maximo_voltaje_a=max(v_ind.signals.values(:, 1))
maximo_voltaje_b=max(v_ind.signals.values(:, 2))
maximo_voltaje_c=max(v_ind.signals.values(:, 3))
maximo_corriente_a=max(i_ind.signals.values(:, 1))
maximo_corriente_b=max(i_ind.signals.values(:, 2))
maximo_corriente_c=max(i_ind.signals.values(:, 3))
maxima_potencia_activa=max(p_out.signals.values(:, 1))
maxima_potencia_aparente=max(s_out.signals.values(:, 1))

minimo_voltaje_a=min(v_ind.signals.values(:, 1))
minimo_voltaje_b=min(v_ind.signals.values(:, 2))
minimo_voltaje_c=min(v_ind.signals.values(:, 3))
minimo_corriente_a=min(i_ind.signals.values(:, 1))
minimo_corriente_b=min(i_ind.signals.values(:, 2))
minimo_corriente_c=min(i_ind.signals.values(:, 3))
minimo_potencia_activa=min(p_out.signals.values(:, 1))
minimo_potencia_aparente=min(s_out.signals.values(:, 1))


encabezados={'Variable','Rango_inferior', 'Rango_superior', 'Precision','I/O'};
datos = {'Power profile', 50000,50000,'+/-1W', 'I';
         'Voltage_A', minimo_voltaje_a,maximo_voltaje_a,'+/-0,01V', 'O';
         'Voltage_B', minimo_voltaje_b,maximo_voltaje_b,'+/-0,01V', 'O';
         'Voltage_C', minimo_voltaje_c,maximo_voltaje_c,'+/-0,01V', 'O';
         'Current_A', minimo_corriente_a,maximo_corriente_a,'+/-0,01A', 'O';
         'Current_B', minimo_corriente_b,maximo_corriente_b,'+/-0,01A', 'O';
         'Current_C', minimo_corriente_c,maximo_corriente_c,'+/-0,01A', 'O';
         'P_Power_active', minimo_potencia_activa,maxima_potencia_activa,'+/-1W', 'O';
         'S_Power_apparent', minimo_potencia_aparente,maxima_potencia_aparente,'+/-1VA', 'O';
         };
     
tabla = cell2table(datos, 'VariableNames', encabezados);  

%creacion de archivo de excel 
writetable(dataTable, '50_KW_BATTERY_AC_500KW_400V_part1.xlsx', 'Sheet', 'VandI_Sheet');
writetable(tabla, '50_KW_BATTERY_AC_500KW_400V_part2.xlsx', 'Sheet', 'VandI_Sheet');
%write(dataTable, 'VandI_offgrid233.csv');
%write(tabla, 'Van.csv');
parquetwrite('50_KW_BATTERY_AC_500KW_400V_part1', dataTable);
parquetwrite('50_KW_BATTERY_AC_500KW_400V_part2', tabla);
%%exportacion de datos de voltajes
    %creacion de tabla
% 
% dataTable = table(V_I_CON.time,...
% V_I_CON.signals(1).values(:, 1),V_I_CON.signals(1).values(:, 2),V_I_CON.signals(1).values(:, 3),...
% V_I_CON.signals(2).values(:, 1),V_I_CON.signals(2).values(:, 2),V_I_CON.signals(2).values(:, 3),...
% V_I_CON.signals(3).values(:, 1),V_I_CON.signals(3).values(:, 2),V_I_CON.signals(3).values(:, 3),...
% V_I_CON.signals(4).values(:, 1),V_I_CON.signals(4).values(:, 2),V_I_CON.signals(4).values(:, 3),...
% V_I_CON.signals(5).values(:, 1),...
% V_I_CON.signals(7).values(:, 1),...
% 'VariableNames', {'Time',... 
% 'Voltage_A_Ind', 'Voltage_B_Ind', 'Voltage_C_Ind',... 
% 'Current_A_Ind', 'Current_B_Ind', 'Current_C_Ind',...
% 'Voltage_A_Con', 'Voltage_B_Con', 'Voltage_C_Con',... 
% 'Current_A_Con', 'Current_B_Con', 'Current_C_Con',...
% 'P_Potencia_activa',... 
% 'S_Potencia_aparente',...
% });
%     %creacion de archivo de excel 
% writetable(dataTable, 'VandI_offgrid.xlsx', 'Sheet', 'VandI_Sheet');

