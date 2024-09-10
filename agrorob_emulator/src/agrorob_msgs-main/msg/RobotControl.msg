int32 ref_left_wheels_direction             #ID21: 0 - STOP wheels; 1 - forward; 2 - backwards
int32 ref_right_wheels_direction            #ID21: 0 - STOP wheels; 1 - forward; 2 - backwards
int32 ref_left_wheels_speed                 #ID21  0 - STOP wheels; 100 - maximum speed
int32 ref_right_wheels_speed                 #ID21  0 - STOP wheels; 100 - maximum speed

float64 ref_left_front_wheel_turn_rad       #ID24 0 - max turn left (-90 degrees); 900 - wheel straight ahead (0 degrees); 1800 - max turn right (90 degrees); a double-byte variable WORD type; B0 - LSB (low byte); B1 - MSB (high byte)
float64 ref_right_front_wheel_turn_rad      #ID24
float64 ref_left_rear_wheel_turn_rad        #ID24
float64 ref_right_rear_wheel_turn_rad       #ID24

#ID25 Wheels turning mode; 0 - inactive; 1 - each wheel turns independently; 2 - car mode
#	(front swivel wheels); 3 - machine mode (swivel front and rear wheels to the opposite
#	page); 4 - parallel mode (all wheels turn in parallel); 5 - winding mode w
#	place (the wheels adjust automatically, allowing the robot to rotate in place) (fig. 1)
int32 wheels_turning_mode

#Steering angle of the wheels (works in the following steering modes: 2, 3 and 4); 0 - max turn left (-90 degrees); 90 - circle on
#         straight (0 degrees); 180 - maximal turn to the right (90 degrees) (in mode 2 the angle is limited 
#in the range of 40-140 degrees, and in mode 3 in the range of 50-130 degrees)
int32 wheels_steering_angle

#Driving direction (works in modes 2, 3, 4, 5); 0 - the robot is not moving; 1 - forward drive (or
#	around to the right in 5); 2 - driving backwards (or around to the left in mode 5)
int32 driving_direction

float64 ref_speed_robot            # - the robot is not moving; 100 - the maximum speed of the wheels

int32 distance_between_seeds       #1-250 - a value that determines the distance between seeds during seeding (mm)

int32 ref_holes_count_seeder_disc  # 1-30 - a value specifying the number of holes in the seeder's disc

int32 robot_wheel_track            # 124-188 - track width range (cm)