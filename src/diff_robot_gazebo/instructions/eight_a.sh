# add rviz to your gazebo launch file to both can run at once
# example one shows this

# in rviz, add relevant displays:
#   1) robotmodel, to see the urdf
#   2) tf, to see all frames
#   3) laserscan or pointcloud2, if you have sensors
#   4) odometry, to see where the robot thinks it is 
#   5) map, if you are doing SLAM

# tf has two topics:
#   1) /tf: transforms that change over time. Every time a joint moves, its transform updates here. Continuously
#      broadcasting.
#   2) /tf_static: transforms that never change. Fixed joints publish here once and never again.

# verify topics are flowing from gazebo into rviz
ros2 topic list
# you should see /odom, /tf, /scan or /camera topics depending on your sensors