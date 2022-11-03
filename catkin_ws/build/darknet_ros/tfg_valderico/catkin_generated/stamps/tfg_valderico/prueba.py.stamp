#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from gmapping.msg import TreeInfo
from gmapping.msg import TreeVariables
import numpy as np

def callback(data):
    rospy.loginfo(rospy.get_caller_id())
    #print(len(data))
    #print(type(data))
    #print(type(data.tree_info)) # list

    #print(len(data.tree_info)) 

    for i in range(len(data.tree_info)):
        print( str(i+1) + "- (x,y,theta): [" + str(data.tree_info[i].x) + " , " + str(data.tree_info[i].y) + " , " + str(data.tree_info[i].theta) +"]")


def listener():

    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("tree_vector", TreeInfo, callback)

    rospy.spin()

if __name__ == '__main__':
    listener()