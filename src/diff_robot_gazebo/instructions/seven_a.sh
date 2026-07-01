# install gazebo if not already installed
sudo apt install ros-humble-gazebo-ros-pkgs

# add gazebo material colors to your links (rviz uses material tags, gazebo uses its own)
# example one shows this in seven_b.xml

# add the gazebo ros2 control plugin to your xacro if you want controllable joints
# example two shows this in seven_b.xml

# for a mobile robot, add the differential drive plugin
# example three shows this in seven_b.xml

# create a gazebo launch file
nano ~/ros2_ws/src/my_robot_name/launch/gazebo.launch.py

# write the gazebo launch file
# example one shows this in seven_c.py

# rebuild
cd ~/ros2_ws
colcon build --packages-select my_robot_name
source install/setup.bash

# launch gazebo
ros2 launch my_robot_name gazebo.launch.py

# verify the robot spawned correctly. check for physics instability (robot spinning or 
# exploding) -> that mans your intertia values are wrong. fix inertia values if unstable. 
# for a cylinder: example four shows this in seven_b.xml
# the inertia valyes describe how hard it is to spin a link around each axis. 
# ixx: resistance to spinning around x axis
# iyy: resistance to spinning around y axis
# ixy, ixz, iyz: usually 0 for simple symmetic shapes
# dont calculate these by hand. for basic shapes, use these formulas:
# example five shows this in seven_b.xml
# wrong inertiav values do not break rviz at all. rviz ignores them complete. they only matter
# in gazebo. 