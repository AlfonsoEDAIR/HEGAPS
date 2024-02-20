%%exportacion de datos de SMES
    %creacion de tabla
v_d = eval('VD');  %V de carga
i_load = eval('ILOAD');  % I de carga
power = eval('POWER');  %Potencia carga
p_ref = eval('PREF');  %Potencia de referencia 

dataTable = table(v_d.time,...
v_d.signals.values(:, 1),... 
i_load.signals.values(:, 1),...
power.signals.values(:, 1),...
p_ref.signals.values(:, 1),...
'VariableNames', {'Time',... 
'Voltage_load[v]',... 
'Current_load[A]',...
'Power_load[w]',... 
'Power_reference[w]',... 
});


maximo_voltaje_carga=max(v_d.signals.values(:, 1))
maximo_intensidad_carga=max(i_load.signals.values(:, 1))
maximo_potencia_carga=max(power.signals.values(:, 1))
maximo_potencia_ref=max(p_ref.signals.values(:, 1))


minimo_voltaje_carga=min(v_d.signals.values(:, 1))
minimo_intensidad_carga=min(i_load.signals.values(:, 1))
minimo_potencia_carga=min(power.signals.values(:, 1))
minimo_potencia_ref=min(p_ref.signals.values(:, 1))



encabezados={'Variable','Rango_inferior', 'Rango_superior', 'Precision','I/O'};
datos = {'Potencia_Reference', minimo_potencia_ref,maximo_potencia_ref,'+/-1W', 'I';
         'Voltage_Load', minimo_voltaje_carga,maximo_voltaje_carga,'+/-0.01V', 'O';
         'Intensidad_Load', minimo_intensidad_carga,maximo_intensidad_carga,'+/-0.01A', 'O';
         'Potencia_Load', minimo_potencia_carga,maximo_potencia_carga,'+/-1W', 'O';
         };
     
tabla = cell2table(datos, 'VariableNames', encabezados); 

    %creacion de archivo de excel 
writetable(dataTable, ['SMES_DC_STEP_1170KW_600V.xlsx'], 'Sheet', 'SMES');
writetable(tabla, 'SMES_DC_STEP_1170KW_600V_2.xlsx', 'Sheet', 'SMES_1');
    %write(dataTable, 'VandI_offgrid.csv');
    %creacion de archivo parquet 
parquetwrite('SMES_DC_STEP_1170KW_600V_1', dataTable);
parquetwrite('SMES_DC_STEP_1170KW_600V_2_1', tabla);


