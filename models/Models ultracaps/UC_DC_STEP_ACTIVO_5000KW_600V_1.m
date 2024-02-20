%%exportacion de datos de SMES
    %creacion de tabla
p_ref = eval('PREF');  %V de carga
v_dc = eval('VDC');  %V de carga
i_dc = eval('IDC');  % I de carga
p_dc = eval('PDC');  %Potencia carga
v_uc = eval('V_UC');  %Potencia de referencia 
i_uc = eval('I_UC');  %Potencia carga
p_uc = eval('PUC');  %Potencia de referencia 

dataTableUC = table(v_dc.time,...ç
p_ref.signals.values(:, 1),...
v_dc.signals.values(:, 1),... 
i_dc.signals.values(:, 1),...
p_dc.signals.values(:, 1),...
v_uc.signals.values(:, 1),...
i_uc.signals.values(:, 1),...
p_uc.signals.values(:, 1),...
'VariableNames', {'Time',... 
'Power_reference_[w]',...
'Voltage_load_[v]',... 
'Current_load_[a]' ,...
'Power_load_[w]',... 
'Voltage_UC_[v]',... 
'Current_UC_[a]',... 
'Power_UC_[w]',... 
});

maximo_power_ref=max(p_ref.signals.values(:, 1))
maximo_voltaje_carga=max(v_dc.signals.values(:, 1))
maximo_intensidad_carga=max(i_dc.signals.values(:, 1))
maximo_potencia_carga=max(p_dc.signals.values(:, 1))
maximo_voltaje_uc=max(v_uc.signals.values(:, 1))
maximo_intensidad_uc=max(i_uc.signals.values(:, 1))
maximo_potencia_uc=max(p_uc.signals.values(:, 1))

minimo_power_ref=min(p_ref.signals.values(:, 1))
minimo_voltaje_carga=min(v_dc.signals.values(:, 1))
minimo_intensidad_carga=min(i_dc.signals.values(:, 1))
minimo_potencia_carga=min(p_dc.signals.values(:, 1))
minimo_voltaje_uc=min(v_uc.signals.values(:, 1))
minimo_intensidad_uc=min(i_uc.signals.values(:, 1))
minimo_potencia_uc=min(p_uc.signals.values(:, 1))


encabezados={'Variable','Rango_inferior', 'Rango_superior', 'Precision','I/O'};
datos = {'Power_Reference', minimo_power_ref,maximo_power_ref,'+/-1W', 'I';
         'Voltage_Load', minimo_voltaje_carga,maximo_voltaje_carga,'+/-0.01V', 'O';
         'Intensidad_Load', minimo_intensidad_carga,maximo_intensidad_carga,'+/-0.01A', 'O';
         'Potencia_Load', minimo_potencia_carga,maximo_potencia_carga,'+/-1W', 'O';
          'Voltage_UC', minimo_voltaje_uc,maximo_voltaje_uc,'+/-0.01V', 'O';
         'Intensidad_UC', minimo_intensidad_uc,maximo_intensidad_uc,'+/-0.01A', 'O';
         'Potencia_UC', minimo_potencia_uc,maximo_potencia_uc,'+/-1W', 'O';
         };
     
tablaUC = cell2table(datos, 'VariableNames', encabezados); 

       %creacion de archivo de excel 
writetable(dataTableUC, 'UC_DC_STEP_ACTIVO_5000KW_600V_2.xlsx', 'Sheet', 'UC');
writetable(tablaUC, 'UC_DC_STEP_ACTIVO_5000KW_600V_3.xlsx', 'Sheet', 'UC_1');
    %write(dataTable, 'VandI_offgrid.csv');
    %creacion de archivo parquet 
parquetwrite('UC_DC_STEP_ACTIVO_5000KW_600V_4', dataTableUC);
parquetwrite('UC_DC_STEP_ACTIVO_5000KW_600V_5', tablaUC);


