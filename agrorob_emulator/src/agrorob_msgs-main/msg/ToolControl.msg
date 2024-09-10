int32 vertical_tool_control_mode        #ID22: 0 - disabled; 1 - manual correction; 2 - automatic correction (dependent on tool level sensors)
int32 horizontal_tool_control_mode      #ID22: 0 - disabled; 1 - manual correction

int32 ref_vertical_tool_actuator        #ID22:    0 - maximum lowering of tools; 100 - maximum lifting of tools
int32 ref_horizontal_tool_actuator      #ID22:  0 - maximum lowering of tools; 100 - maximum lifting of tools
int32 rotary_cultivator_conversion      #ID22: 0 - no reaction; 1 - move to the left; 2 - move to the right
int32 tiller_drive_mode                 #ID22: 0 - disabled; 1 - anti-clockwise rotation; 2 - clockwise rotation
int32 enable_oil_cooler_manual_drive    #ID22: 0 - disabled; 1 - radiator engine on
int32 enable_suction_fan_active         #ID22: 0 - off; 1 - enabled

int32 seeding_shaft_drive_mode          #ID23  0 - shaft does not rotate; 1 - automatic settings according to the algorithm; 2 - manual seeding control;
int32 ref_sowing_shaft_rotation_rpm     #ID23 -32 - value specifying the quantity of rpm
int32 sprayer_hydraulic_driver_activate #ID23 0 - off; 1 - drive enabled

bool enable_sprayer_electric_driver    #ID23   0 - off; 1 - drive enabled
bool light1_on                         #ID23   0 - disabled; 1 - enabled
bool light2_on                         #ID23   0 - disabled; 1 - enabled

int32 ref_optional_tool_1              #ID23 - Additional tool 1 (optional element); 0 - disabled; 255 - maximum value of the setting
int32 ref_optional_tool_2              #ID23 - Additional tool 2 (optional element); 0 - disabled; 255 - maximum value of the setting