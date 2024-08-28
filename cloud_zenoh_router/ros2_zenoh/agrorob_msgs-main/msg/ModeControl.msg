bool stop_drivers                  # ID100/1 - 0-inactive; 1-STOP of all drives active
bool stop_engine                   # ID100/1 - 0 - the internal combustion engine can work; 1 - engine shutdown
bool auto_mode_enabled             # ID100/1 - 0 - manual mode; 1 - automatic mode

float64 ref_engine_idle_speed_rpm       # ID1: 0 - 255 (255 means 2550 rpm)
bool engine_commissioning               # ID1: 0 - inactive; 1 - ignition of the internal combustion engine
bool enable_brake                       # ID1: 0 - brake active; 1 - brake off
bool enable_gear                        # ID1: 0 - manifolds not active; 1 – manifolds ready to go
bool enable_emergency_mode              # ID1: 0 - inactive; 1 - emergency mode active

bool enable_mixing_sprayer_valve          #ID26: 0 - off; 1 - enabled
bool enable_opening_sprayer_valve         #ID26: 0 - off; 1 - enabled
bool enable_venting_soil_sprayer_valve    #ID26: 0 - off; 1 - enabled
bool enable_venting_foliar_sprayer_valve  #ID26: 0 - off; 1 - enabled

