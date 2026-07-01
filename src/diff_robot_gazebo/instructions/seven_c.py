# example one

import os
from ament_index_python.packages import get_package_share_directory from launch import LaunchDescription
from launch.actions import ExecuteProcess, Include LaunchDescription
from launch.launch_description_sources import Python LaunchDescriptionSource from launch_ros.actions import Node
import xacro
def generate_launch_description():
    pkg = get_package_share_directory("my_robot_name')
    xacro_path = os.path.join(pkg, 'urdf', 'my_robot.urdf.xacro") robot_description = xacro.process_file(xacro_path).toxml()
    return LaunchDescription([
    # Start Gazebo with an empty world
        ExecuteProcess(
            cmd=['gazebo', '--verbose', '-s',
                'libgazebo_ros_factory.so'],
            output='screen'
        ),
        # Publish robot description
        Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            parameters=[{"robot_description': robot_description}]
        ),
        # Spawn the robot into Gazebo
        Node(
        package= 'gazebo_ros',
        executable='spawn_entity.py",
        arguments=[
            '-topic', 'robot_description",
            '-entity', 'my_robot',
            '-x', '0', 'y', '0', '-z', '0.5'
        ],
        output='screen'
    ),
])

