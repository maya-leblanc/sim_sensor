# This section describes how to set up a ROS2 workspace. 

# A ROS2 workspace is a centralized directory where you organize, build, and store
# custom packages, source code, and configuration files for your robotics projects.

# Firstly, source ROS2 in every terminal you open. This is assuming you have already 
# installed ROS2 and Linux Ubuntu-Humble, the most sought after distribution for Linux 
# and ROS2 for robotics. 

source /opt/ros/humble/setup.bash

# create ros2 workspace
mkdir -p ~/ros2_ws/src # where you want to make the workspace name and source code folder simultaneously
# mkdir -p represents two things:
#   1) "make directory": creates a new folder
#   2) -p flag: create parent directories too, if the folders in the path do not exist yet,
#   create all fo them at once. without -p, it would fail if a parent folder is missing
cd ~/ros2_ws 
colcon build
# colcon def: 
# colcon is the build tool for ros2. when your write a ros2 package in c++ or python, colcon
# processes everything up so ros2 can find and run it. colcon looks inside your src/ folder, 
# finds all your packages, and reads their package.xml files to determine dependencies
# and build order. colcon then builds c++ packages and installs python scripts into the install/
# folder. ultimately, colcon translates your workspace into a runnable state.

source install/setup.bash
# after every build you have to source it. colcon is the reason why your packages are available 
# in the terminal. without sourcing, ros2 has no idea that your package exists even if built successfully. 

# create robot package
cd ~/ros2_ws/src
ros2 pkg create --build-type ament_cmake my_robot_name # c++ build system
ros2 pkg create --build-type ament_python my_robot_name # python build system
# this command creates a brand new, empty ros2 package using the c++ or python build system inside
# your current directory. choose one.

# defs:

# ros2 pkg create: the core ros2 tool used to generate the boilderplate template
# required for a new package
# --build-type ament_cmake: specifies that you want to write nodes in c++. it sets up a
# CMakeLists.txt file to handle complication. 
# my_robot_name: the actual name of your package. this will create a folder named my_robot_name/ 
# containing all your starter files. 

# package.xml: a manifest file containing metadata like the package name, version, author, licenses,
# and dependencies on other ros2 packages.
# CMakeLists.txt: the configuration file for the ament_cmake build system. this is where you specify
# how to compile your c++ source code into executable ros2 nodes. 
# src/: an empty folder where you will place all your c++ source code files (.cpp)
# include/my_robot_name/: a folder where you will place your c++ header files (.hpp)

# you must run this command while your terminal is inside the src/directory of your ros2
# workspace. if you run it anywhere else, the colcon build tool will not be able to find or compile
# it correctly later.

# create folders inside your package
cd my_robot_name
mkdir urdf meshes launch config worlds rviz # all folder names side-by-side

# rebuild so ros2 knows the package exists
cd ~/ros2_ws
colcon build --packages-select my_robot_name
source install/setup.bash

# you must rebuild and source (this process above) every single time you change code
# it is like saving your ros2 workspace onto the terminal every time
# if for python, no, you do not need to rebuild for every code change if you use a 
# special flag: colcon build --symlink-install. saves automatically. 
# all due to c++ = machine language binary files vs. python = interpreted language

