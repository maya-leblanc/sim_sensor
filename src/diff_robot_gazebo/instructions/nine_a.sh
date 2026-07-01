# send a velocity command to make the robot move
# example one shows this

# watch it move in gazebo and the tf update in rviz. another thing to do is
# to use teleop to drive with keyboard
sudo apt install ros-humble-teleop-twist-keyboard
ros2 run teleop_twist_keyboard teleop_twist_keyboard

