# add each new part as a link with visual, collision, and inertial. Connect every new link to an 
# existing link with a joint. every joint needs a parent, a child, an origin, and atype. for revolute 
# joints, always add a limit element. after every addition, run xacro to validate, then check_urdf to 
# validate the three, then relaunch to see it in rviz. build up complexity gradually, one link and joint
# at a time. never add five things at once or debugging becomes impossible. 