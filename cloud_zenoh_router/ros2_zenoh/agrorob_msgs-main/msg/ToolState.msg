int32 vertical_actuator_pos             #ID33: 0 - maximum lowering of tools; 100 - maximum lifting of tools
int32 horizental_actuator_pos           #ID33: 0 - maximum lowering of tools; 100 - maximum lifting of tools
bool    tiller_left_limit_enabled            #ID33: 0 - limit switch is not enabled; 1 - the tiller is located at the end
bool    tiller_right_limit_enabled           #ID33: 0 - limit switch is not enabled; 1 - the tiller is located at the end
int32 sowing_shaft_rotational_speed_rpm #ID33: 0 - shaft does not rotate; 0-50 - value specifying
int32 fertilizer_tank1_level            #ID33: 0-100 - value specifying% of tank filling
int32 fertilizer_tank2_level            #ID33: 0-100 - value specifying% of tank filling

float64 tool_level_rad          #ID34: value specifying the tool level in degrees minus 60 (e.g. 65 means 65-60 = 5 degrees)
int32 hydraulic_oil_tem_celsius  #ID34: 0-100 - value specifying temperature ( o C )
int32 hydraulic_oil_pressure     #ID34: 0-250 - value determining pressure (bar)
bool hydraulic_oil_under_min_level #ID34: 
bool hydraulic_oil_above_max_level #ID34: 
int32 wheels_average_rotational_speed_rpm  #ID34: 
