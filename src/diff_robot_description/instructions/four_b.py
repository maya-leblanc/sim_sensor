# example one

from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([

        Node(
            package='package_name', # which package the node lives in
            executable='node_name', # the node's name
            parameters=[{'param_name': value}] # any settings to pass it
        ),
    ])

