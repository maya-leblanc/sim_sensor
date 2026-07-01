# a unified robot description format, or URDF file, is an XML document used 
# in ros2 to define the complete physcial and visual structure of a robot. it
# is viewed as a (digital) blueprint that tells ros2 exactly what your robot 
# looks like, how its parts are connected, and how those parts move. 

# create your urdf file
nano ~/ros2_ws/src/my_robot_name/urdf/my_robot_name.urdf

# write the minimum valid urdf structure
# example one in file two_b.xml shows and explains this. 

# validate your urdf parses correctly
xacro ~/ros2_ws/src/my_robot_name/urdf/my_robot_name.urdf

# xacro stands for xml macros. it is a tool that adds macro/programming features
# to xml, specifically to urdf files. 
# the problem it solves is that plain urdf xml is very repetitive. if your robot
# has two heels that are identical except for position, you would have to copy-paste
# the whole link and joint definition twice. with xacro you define it once as a macro
# and reuse it. when you run xacro it processes all the macros and outputs a plain urdf
# xml file that ros2 can read. ros2 tiself never sees the xacro, only the final expanded
# xml. 

# example two in file two_b.xml shows this.

# check it with the urdf parser
check_urdf ~/ros2_ws/src/my_robot_name/urdf/my_robot_name.urdf

# check_urdf runs a tool that reads urdf file to check if robot structure makes sense
# specifically that the kinematic tree is valid. xacro only checks that your xml is 
# well-formed (tags match, no syntax errors). check_urdf goes one step further and checks
# the robot logic:
#   1) does every joint have a valid parent and child link?
#   2) is there a single root link?
#   3) are there any loops in the tree (not allowed)?
#   4) does the kinematic chain make sense?
