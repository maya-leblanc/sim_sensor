# create your own launch file, which should be inside your package's launch folder
# ~/ros2_ws/src/my_robot_name/launch/display.launch.py

#

# a display.launch.py file is a specialized ros2 python script designed to spin up all 
# the ncessesary background programs (nodes) required to calculate your robot's math and 
# visualized its urdf model inside rviz2 simultaneously with a single command. instead of 
# opening four different terminal windows to start your system piece-by-piece, this one 
# script handles it all at once.
# excecuting a standard display.launch.py file launches three or four critical components 
# that must run together to make the visualization work
#   1) robot_state_publisher: reads raw xml .urdf file, parses the structural relationship
#   between your links and joints, and calculates the live 3d coordinate system (tf transforms).
#   without this node, rviz would not understand how your robot's parts stack together, and your
#   robot would display as an unrecognizable block of white shapes stuck at the absolute origin.
#   2) joint_state_publisher or joint_state_publisher_gui: monitors or cretes a stream of data
#   regarding the position of your robot's movable joint axes. if you use the _gui variant, it 
#   spins up the small control panel with slides. moving the sliders tells the system, "the wheel
#   rotated 10 degrees," passing that information straight to the system to update your 3d view
#   3) rvis2: opens the primary 3d graphic visualization environment. it automatically maps our your
#   robot's structure, loading a preconfigured .rviz configuration file so you dont have to manually
#   add the robotmodel and tf displays from scratch every time you launch.

# 