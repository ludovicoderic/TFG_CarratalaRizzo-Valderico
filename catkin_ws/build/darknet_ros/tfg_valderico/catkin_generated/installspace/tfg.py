#!/usr/bin/env python2
# coding: utf-8

# falta añadirle lo del booleano en una clase para que se espere a que se complete la percepcion,
# y que cuando se llame al callback modificar esa variable de clase, para así no acumular callbacks

import sys
import rospy
import math
import message_filters	# para que funcione el time sinchronizer	
import cv2
import actionlib
import darknet_ros_msgs.msg 
import numpy as np
import ros_numpy
import actionlib_msgs.msg
import genpy
import sensor_msgs.msg
import std_msgs.msg
import sensor_msgs.point_cloud2 as pcl2

#nube de puntos
#import pcl 
#import pcl.pcl_visualization as viewer #Introduce visualization library

# PROBAR 
## para sacar la orientacion del turtle
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion, quaternion_from_euler

from std_msgs.msg import Header
from std_msgs.msg import String
from sensor_msgs.msg import Image, PointCloud2, PointField, PointCloud
from geometry_msgs.msg import Point32
from darknet_ros_msgs.msg import BoundingBoxes 
from darknet_ros_msgs.msg import CheckForObjectsAction
from darknet_ros_msgs.msg import CheckForObjectsActionGoal

from tfg_valderico.msg import coordObjetos
from tfg_valderico.msg import vectorNubes

#from geometry_msgs.msg import Twist

# Definimos los angulos (roll,pitch,yaw) y guardamos el angulo inicial (theta) iniciales
roll = pitch = yaw = 0.0
theta0 = 0
#thetha_tree = 0
first1 = True
#first2 = True

class coordenadasObjeto:
  def __init__(self, xmn, ymn, xmx, ymx, clas):
    self.xmin = xmn
    self.ymin = ymn
    self.xmax = xmx
    self.ymax = ymx
    self.clase = clas


rospy.init_node('darknet_yolo_client')

# PROBAR 

def arbol (data):
    rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)


def get_rotation (msg):
    global roll, pitch, yaw
    global theta0, first1
    orientation_q = msg.pose.pose.orientation
    orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
    (roll, pitch, yaw) = euler_from_quaternion (orientation_list)
    if(first1):
        theta0 = yaw
        first1 = False
    #print yaw

def rotar_vector_z (vector, angulo):
    vector_aux = [0,0,0]
    vector_aux[1] = vector_aux[1]*math.cos(angulo) - vector_aux[2]*math.sin(angulo) # x' = x*cosº - y*sinº
    vector_aux[2] = vector_aux[1]*math.sin(angulo) + vector_aux[2]*math.cos(angulo) # y' = x*sinº + y*cosº
    vector_aux[3] = vector[3]                                                       # z' = z

    return vector_aux


def darknet_client(image):
    # Creamos el SimpleActionClient, pasando CheckForObjectsAction al constructor
    client = actionlib.SimpleActionClient('/darknet_ros/check_for_objects', CheckForObjectsAction)	# probablemente los nombres estan mal
    
    # Esperamos hasta que el action server este iniciado, y 
    # comience a escuchar por goals
    client.wait_for_server()

    # Creamos e inicializamos el goal antes de enviarlo
    goal = darknet_ros_msgs.msg.CheckForObjectsGoal()
    goal.id = 0
    goal.image = image
    
    # Enviamos el goal al action server.
    client.send_goal(goal)

    # Esperamos a que el servidor termine de realizar la acción. 
    client.wait_for_result()

    # Devolvemos el resultado de ejecutar la acción. 
    return client.get_result() 

#def callback(image, point_cloud, datos_tree):	
def callback(image, point_cloud):	
    
    try:
        # Recibimos los bounding boxes de los objetos detectados en la imagen  
        bounding_boxes_result = darknet_client(image)
    
        # Guardamos el nº de bounding boxes que devuelva la imagen 
        tamanyo = np.size(bounding_boxes_result.bounding_boxes.bounding_boxes)

        # inicializamos el array donde guardaremos las coordenadas de los bounding boxes  
        boundingBoxesFinal = [coordenadasObjeto(0, 0, 0, 0, 0)] 

        # obtener xmin, ymin, xmax, ymax y clase si la probability es mayor a un indice determinado
        n = 0
        tam = 0
        for n in range(tamanyo):
            if (bounding_boxes_result.bounding_boxes.bounding_boxes[n].probability > 0.35) :
                xmin = bounding_boxes_result.bounding_boxes.bounding_boxes[n].xmin
                ymin = bounding_boxes_result.bounding_boxes.bounding_boxes[n].ymin
                xmax = bounding_boxes_result.bounding_boxes.bounding_boxes[n].xmax
                ymax = bounding_boxes_result.bounding_boxes.bounding_boxes[n].ymax
                clase = bounding_boxes_result.bounding_boxes.bounding_boxes[n].Class

                if(tam != 0) :
                    boundingBoxesFinal.append(coordenadasObjeto(xmin, ymin, xmax, ymax, clase))
                else :
                    boundingBoxesFinal[0] = coordenadasObjeto(xmin, ymin, xmax, ymax, clase) 
                    tam += 1
                    

        # Con los bounding boxes finales, accedemos a la nube de puntos y nos creamos una nube de puntos
        # por cada objeto, con las dimensiones de cada uno de dichos objetos.
        # Una vez hecho esto, las enviamos a otro archivo (tfg_2.cpp) para crear el mapa

        vector_nubes = vectorNubes()
        vector_nubes.nube_objetos = point_cloud
        vector_nubes.yaw = yaw
        

        i = 0
        tamanyo2 = np.size(boundingBoxesFinal)

        # Si hay al menos un objeto en la escena, creamos un dato de tipo tfg_valderico coordObjetos
        # y metemos las coordenadas del bounding_box y la clase del objeto dentro del vector_nubes
        if(tamanyo2>0):

            
        
            objetos = []
            objetos_nube = []
            for i in range(tamanyo2):
                
                # creacion nube de puntos
                objClass = boundingBoxesFinal[i].clase
                xmn = boundingBoxesFinal[i].xmin
                ymn = boundingBoxesFinal[i].ymin
                xmx = boundingBoxesFinal[i].xmax
                ymx = boundingBoxesFinal[i].ymax

                #print("clase: " + str(objClass))

                xmed = (xmx - xmn)/2
                ymed = (ymx - ymn)/2

                if(ymed>=1080):
                    ymed = 1079
                if(xmed>=1920):
                    xmed = 1919

                # Creamos un dato de tipo tfg_valderico::coordObjetos , el cual contiene las 
                # coordenadas del objeto dentro de la nube de puntos, asi como su clase:
                # xmax, xmin, ymax, ymin, clase
                coordenadas_objetos = coordObjetos()

                coordenadas_objetos.clase = str(objClass)
                coordenadas_objetos.xmax = xmx
                coordenadas_objetos.xmin = xmn
                coordenadas_objetos.ymax = ymx
                coordenadas_objetos.ymin = ymn
                
                #print("xmn: "+str(xmn)+", xmax: "+str(xmx)+"\nymn: "+str(ymn)+", ymx: "+str(ymx))
                #print("xmn: "+str(coordenadas_objetos.xmin)+", xmax: "+str(coordenadas_objetos.xmax)+"\nymn: "+str(coordenadas_objetos.ymin)+", ymx: "+str(coordenadas_objetos.ymax))
                # GUARDA PARA TODOS LOS OBJETOS LAS MISMAS COORDENADAS
                vector_nubes.coord_objetos.append(coordenadas_objetos)

                """
                # Sacamos el centro del objeto asi como la distancia de dicho objeto respecto al robot, y la rotacion del robot
                print("coordenadas del objeto "+ str(i) + " en la imagen (x,y): ("+ str(xmed) + "," + str(ymed) + ")")
                print("angulo del robot (euler):  " + str(yaw))  #Devuelve valores entre -pi y pi, siendo 0º=-pi/2 y 90ª= 0 180ª=pi/2

                # Dependiendo de los cuadrantes, usaremos la ecuacion de una recta, u otra, para pasar de grados de euler a grados normales
                # y poder usar asi las funciones seno y coseno para calcular las posiciones del objeto respecto al robot
                if( -(math.pi/2) < yaw <= math.pi):
                    angulo = (180/math.pi)*yaw + 90
                elif( -math.pi < yaw <= -(math.pi/2)):
                    angulo = (180/math.pi)*yaw + 450

                print("angulo del robot (grados): " + str(angulo))
                # print("distancia robot-objeto (x,y): (" + str(math.cos(math.radians(angulo))) + ", "+ str(math.sin(math.radians(angulo))) + ")") # esto no se calcula asi
    
                # Creamos una nube de puntos auxiliar
                #my_awesome_pointcloud = PointCloud()
                
                #my_awesome_pointcloud.header = header
                
        
                nube_array = ros_numpy.point_cloud2.pointcloud2_to_array(point_cloud)   # devuelve un array con los datos de una FILA de la nube (y) -> len(nube_array) = 1080
                #points = np.zeros(nube_array.shape + (3,))  #nube_array.shape -> (1080, 1920) -> (i,j)
                points2 = np.zeros(1080*1920 , dtype=[('x', 'float'), ('y', 'float'), ('z', 'float')])


                xyz_array = ros_numpy.point_cloud2.get_xyz_points(nube_array[ymed], remove_nans=False)   # guarda todos los puntos de una fila -> con este funciona
                
                

                # Nos quedamos con las coordenadas del objeto si no tiene una distancia NaN
                if(not math.isnan( xyz_array[ymed][2])): 
                    objeto = [xyz_array[ymed][0], xyz_array[ymed][2], xyz_array[ymed][2]]
                    objetos.append(objeto)
                    print("coord objeto en la nube de puntos (x,y,z) = (" + str(xyz_array[ymed][0]) + "," + str(xyz_array[ymed][2]) + "," + str(xyz_array[ymed][2]) + ")")
                    # calculamos distancia teniando el angulo y la distancia al objeto (hipotenusa) -> x=cont=cos(x)*h , y=op=sen(x)*h
                    print("distancia robot-objeto (x,y): (" + str( math.cos(math.radians(angulo))*xyz_array[ymed][2] ) + ", "+ str(math.sin(math.radians(angulo)) * xyz_array[ymed][2]) + ")")

                else:
                    print("coord objeto en la nube de puntos (x,y,z) = (" + str(xyz_array[ymed][0]) + "," + str(xyz_array[ymed][2]) + "," + str(xyz_array[ymed][2]) + ")")
                    print("distancia robot-objeto (x,y): -- no disponible --")

                print("")
                print("")
                """

                # Bucle para obtener la nube del objeto y guardarla
                # xyz_array_size = len(xyz_array) 
                # for i in range(len(nube_array)): 
                """
                for i in range(ymn, ymx):

                    xyz_array = ros_numpy.point_cloud2.get_xyz_points(nube_array[i], remove_nans=False)   # guarda todos los puntos de una fila -> con este funciona
                    xyz_array_size = len(xyz_array) # cuando hay puntos depende, NO SIEMPRE DEVUELVE EL TAM DE LA COLUMNA COMPLETA (max = 1920), si hay es 0
                    
                    #print("tam (x): " + str(xyz_array_size))# + ", Xmin:" + str(xmn) +", Xmax:" + str(xmx) + ", xTotal:" + str(xmx - xmn))
                    
                    if (xyz_array_size > 0):
                        #for j in range(xyz_array_size): # Bucle para obtener toda la nube 1920
                        for j in range(xmn, xmx):
                            # obtenemos los puntos que queremos de la nube de puntos y los guardamos en el vector points
                            # si el valor devuelto por la nube es NaN, se le pone el valor 0 
                            if(math.isnan(xyz_array[j][0])):
                                #points[(i,j)][0] = 0  
                                points2[i+j][0] = 0  
                            else:
                                #points[(i,j)][0] = xyz_array[j][0]
                                points2[i+j][0] = xyz_array[j][0]

                            if(math.isnan(xyz_array[j][1])):
                                #points[(i,j)][1] = 0
                                points2[i+j][1] = 0
                            else:
                                #points[(i,j)][1] = xyz_array[j][1]
                                points2[i+j][1] = xyz_array[j][1]

                            if(math.isnan(xyz_array[j][2])):
                                #points[(i,j)][2] = 0  
                                points2[i+j][2] = 0       
                            else:
                                #points[(i,j)][2] = xyz_array[j][2]  
                                points2[i+j][2] = xyz_array[j][2]  

                """
                #filling pointcloud header
                #header = std_msgs.msg.Header()
                #header.stamp = rospy.Time.now()
                #header.frame_id = 'map'

                #create pcl from points
                #nube_puntos = pcl2.create_cloud_xyz32(header, points2)
                #objetos_nube.append(nube_puntos)
                
                """
                cloud1 = pcl.PointCloud(points2) #creamos nube de puntos con pcl
                visualcolor1 = pcl.pcl_visualization.PointCloudColorHandleringCustom(cloud1, 0, 255, 0)
                vs = pcl.pcl_visualization.PCLVisualizering
                vss1 = pcl.pcl_visualization.PCLVisualizering()#Initialize an object, here is a very important step
                vs.AddPointCloud_ColorHandler(vss1, cloud1, visualcolor1, id=b'cloud', viewport=0)
                v = True
                while not vs.WasStopped(vss1):
                    vs.Spin(vss1)
                """
                #print('anchura nube: '+ str(nube_puntos.width))
                #print('altura nube:  '+ str(nube_puntos.height))

                # Copiamos los puntos detectados a una nueva nube

                # PROBAR             
                #cloud_msg = PointCloud2()

                #if point_cloud.header.stamp is not None:
                #    cloud_msg.header.stamp = point_cloud.header.stamp
                #if point_cloud.header.frame_id is not None:
                #    cloud_msg.header.frame_id = point_cloud.header.frame_id
                #cloud_msg.height = points.shape[0]
                #cloud_msg.width = points.shape[1]
                #cloud_msg.fields = dtype_to_fields(points.dtype)
                #cloud_msg.is_bigendian = False # assumption
                #cloud_msg.point_step = points.dtype.itemsize
                #cloud_msg.row_step = cloud_msg.point_step*points.shape[1]
                #cloud_msg.is_dense = all([np.isfinite(points[fname]).all() for fname in points.dtype.names])
                #cloud_msg.data = points.tostring()
                
                #nubeObjeto = PointCloud2() 

                #for l in range(ymn, ymx):
                #    for k in range(xmn, xmx):
                #        print("[" + str(l) + ", " + str(k) + "]: " + "[" + str(points[(l,k)][0]) + ", " + str(points[(l,k)][1]) + ", " + str(points[(l,k)][2]) + "]")

                # nube.points.push_back(newPoint)
                ## PASA AL SIGUIENTE OBJETO ##
        
            # Cuando termina de juntar las coord de todos los objetos, se publica
  
            coordObjetos_pub.publish(vector_nubes)

    
        # tamaño nube puntos 1920 * 1080 
        # print('anchura nube: '+ str(point_cloud.width))
        # print('altura nube:  '+ str(point_cloud.height))
        
        # print("\nResultado: \n" + str(bounding_boxes_result))
        
        #rospy.loginfo(rospy.get_caller_id() , datos_tree.data)
        #rospy.loginfo(rospy.get_caller_id() + "I heard %s", datos_tree.data)
        #print(np.size(datos_tree.data))

    except rospy.ROSInterruptException:
        print("program interrupted before completion")
	


# Inicializamos un subscriptor encargado de leer mensajes de un topic 
# determinado, en este caso Image, PointCloud2 y BoundingBoxes
image_sub = message_filters.Subscriber('/camera/rgb/image_raw', Image)
point_cloud_sub = message_filters.Subscriber('/camera/depth/points', PointCloud2)
orientation_sub = rospy.Subscriber ('/odom', Odometry, get_rotation) # creo que no es necesario
#rospy.Subscriber("chatter", String, arbol) #cambiar nombre del topic al cual se suscribe
coordObjetos_pub = rospy.Publisher('vector_nube', vectorNubes, queue_size=100)
# sincroniza los canales entrantes y los envía en forma de una única devolución de llamada 
ts = message_filters.TimeSynchronizer([image_sub, point_cloud_sub], 100)
# PROBAR 
#ts = message_filters.TimeSynchronizer([image_sub, point_cloud_sub, orientation_sub, datos_tree], 100)
#ts = message_filters.TimeSynchronizer([image_sub, point_cloud_sub, orientation_sub], 100)

ts.registerCallback(callback)

#Nos ponemos a escuchar y cedemos el control a ROS.
# spin() simply keeps python from exiting until this node is stopped
rospy.spin()




