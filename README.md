# TFG_CarratalaRizzo-Valderico
 
# SLAM para robots domésticos

## Introducción

La finalidad inicial de este proyecto es crear un sistema de generación de mapas 2D y 3D, el cual sea capaz de incluir información de los objetos de la escena, mediante la modificación para ello del paquete de ROS Gmapping (Grisetti y cols., 2007), y la inclusion de sistemas de inteligencia artificial para la detección de objetos. Se planeo también implementar este sistema de auto navegación en un robot móvil, en este caso el robot Pepper de Aldebaran and Softbank Robotics, pero sin embargo, debido a las restricciones a raíz del COVID, se procedió a realizar el proyecto enteramente en simulación, mediante el robot Turtlebot3 de Open Source Robotics Foundation, y a basarse más en la implementación del sistema generador del mapa.

Para el desarrollo de este proyecto utilizaremos el entorno de simulación de Gazebo y Rviz, y el sistema de control de robots ROS.

## Contenido del repositorio

En este repositorio podemos encontrar 4 carpetas, cuyo contenido es el siguiente:
- **Enviroments**: en esta carpeta se encuentran los diferentes ejecutables de los entornos, dentro de cada uno encontramos tres opciones:
        - Camera\_Agent: Entorno con el modelo de RL implementado y la cámara general habilitada.
        - Camera\_Normal: Entorno con el modelo de RL implementado y la cámara del agente habilitada.
        - Heuristic: Entorno en modo de control manual (sin el modelo de RL implementado) y la cámara del agente habilitada.
- **Examples**: en esta carpeta se encuentran los diferentes códigos y escenas de Unity utilizadas para cada uno de los entornos, así como los elementos necesarios para su funcionamiento.
	- Final Environments: aquí se encuentran cada uno de los entornos finales descritos en el apartado de experimentación.
	- Previous Environments: aquí se encuentran cada uno de los entornos de prueba realizados previamente a los entornos finales. 
- **config**: en esta carpeta se encuentran todos los ficheros de configuración YAML utilizados para el desarrollo de este proyecto.
- **TFM_Examples_rar**: En esta carpeta se encuentran los rar con los diferentes códigos y escenas de Unity utilizadas para cada uno de los entornos, así como los elementos necesarios para su funcionamiento.
	
