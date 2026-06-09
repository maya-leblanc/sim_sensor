import os
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch_ros.actions import Node
import xacro

def generate_launch_description():
    # 1. Locate your description package path
    pkg_description = get_package_share_directory('sim_sensor_description')
    
    # 2. Path to your new XACRO file
    xacro_file = os.path.join(pkg_description, 'urdf', 'my_robot.urdf.xacro')
    
    # 3. Process the xacro file into a plain robot description string
    robot_description_config = xacro.process_file(xacro_file)
    robot_desc = robot_description_config.toxml()

    # 4. Configure the Robot State Publisher node
    node_robot_state_publisher = Node(
        package='robot_state_publisher',
        executable='robot_state_publisher',
        name='robot_state_publisher',
        output='screen',
        parameters=[{
            'robot_description': robot_desc,
            'use_sim_time': False
        }]
    )

    # 5. Configure the RViz2 node
    node_rviz = Node(
        package='rviz2',
        executable='rviz2',
        name='rviz2',
        output='screen'
    )

    # Launch both nodes at the same time
    return LaunchDescription([
        node_robot_state_publisher,
        node_rviz
    ])