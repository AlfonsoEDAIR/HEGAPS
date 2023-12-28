%%%% HEGAPS DATA INFORMATION %%%
%This module collect all the Energy Storage Systems parameters that will be
%used by the Simulink models for simulations

%% Battery

%parameters
Battery.Nominal_voltage = 512; %V 
Battery.Rated_capacity =102400/512;
Battery.inicial_state_of_charge = 90; %V
Battery.response_time= 30; %V

%discharge
Battery.Maximum_capacity =200;
Battery_cut_off_voltaje=384;
Battery_fully_charged_voltage=595.9614;
Battery_nominal_discharge_current=86.9565;
Battery_internal_resistance=0.0256;
Battery_capacity_nominal_voltage=180.8696;

%Temperature
Battery_initial_cell_temperature=20;
Battery_nominal_ambient_temperature=20;
Battery_second_ambient_temperature=-30;


%% Supercapacitor 

UC.Rated_capacitance = 5.5; %F
UC.Equivalent_resistance = 1.86e-3; %Ohm
UC.Rated_voltage = 400; %V
UC.Series_capacitors = 6; 
UC.Parallel_capacitors = 1;
UC.Initial_voltage=360;
UC.Operating_temperature=25;

%% Panel Solar
PS.Parallel_strings = 35; 
PS.Series_connected_modules =8; 
PS.Maximum_Power=285.12;


