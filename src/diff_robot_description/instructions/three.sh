# quick test without package, just launch directly
ros2 launch joint_state_publisher_gui demo.launch.py model:=/home/your_username/ros2_ws/my_robot/urdf/my_robot_name.urdf

# uses the built-in urdf_tutorial or joint_state_publisher_gui helper codes
# two windows will automatically open
# gui sliders window: small control panel listing robot's joints
# rviz2 window: the main visualization environment

# fix global frame under global options from map to base_link (or whatever your URDF's root link name is)
# add the robotmodel by clicking add button at bottom left, click OK
# add transforms by clicking add button again, select TF, click OK

# defs
# rviz (ros visualization) is a 3d visualization tool for ros2. a 3d window
# into robot's mind. rviz does not simulate physical reality, but shows what 
# the robot thinks is happening based on its sensors and code. 
# you view in rviz the robot blueprint (urdf visual and collision shapes), sensor
# data (live streams from webcams, laser scans from liDAR shown as point clouds and 
# distance sensors), and navigation plans (black lines showing the path the robot plans
# to drive, and maps created by SLAM algorithms).

# transform library (tf) is a core tracking system in ros2 that manage coordinate frames.
# every part of the robot has its own local 3d coordinate frame (x y z). as the robot moves, 
# these parts constantly shift relative to each other. tf is the mathemaical engine that 
# calculates exactly where every part is in relation to everything else at any exact 
# microsecond. tf organizes a robot into a tree struture of parents and children. without tf,
# your robot's sensors, wheels, and arms would all speak different positional languages
# and could never coordinate.