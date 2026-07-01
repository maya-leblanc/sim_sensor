# rename file to .xacro
mv ~/ros2_ws/src/my_robot_name/urdf/my_robot_name.urdf \
   ~/ros2_ws/src/my_robot_name/urdf/my_robot_name.urdf.xacro

# add xacro namespace to the robot tag on xml file
# example one shows this in five_b.xml

# def: a namespace is a named contrainer that groups related code, functions or topics
# together to prevent naming conflicts. in c++ you see it as the :: operator, like
# rclcpp::Node or std::string, meaning "Node from rclcpp" and "string from std". In ros2
# it also applied to nodes and topics, prefixing them so multiple robots or components dont 
# clash with each other. 

# replace hard coded values with xacro properties
# example two shows this in five_b.xml

# then use them
# example three shows this in five_b.xml

# update your launch file to process xacro
# example one shows this in five_c.txt

# validate xacro still outputs valid urdf
xacro ~/ros2_ws/src/my_robot_name/urdf/my_robot_name.urdf.xacro
