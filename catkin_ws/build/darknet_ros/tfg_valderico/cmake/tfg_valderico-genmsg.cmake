# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "tfg_valderico: 4 messages, 0 services")

set(MSG_I_FLAGS "-Itfg_valderico:/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(tfg_valderico_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg" NAME_WE)
add_custom_target(_tfg_valderico_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tfg_valderico" "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg" ""
)

get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointVector.msg" NAME_WE)
add_custom_target(_tfg_valderico_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tfg_valderico" "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointVector.msg" "tfg_valderico/pointCoordinates"
)

get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg" NAME_WE)
add_custom_target(_tfg_valderico_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tfg_valderico" "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg" ""
)

get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/vectorNubes.msg" NAME_WE)
add_custom_target(_tfg_valderico_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tfg_valderico" "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/vectorNubes.msg" "sensor_msgs/PointCloud2:sensor_msgs/PointField:tfg_valderico/coordObjetos:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tfg_valderico
)
_generate_msg_cpp(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointVector.msg"
  "${MSG_I_FLAGS}"
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tfg_valderico
)
_generate_msg_cpp(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tfg_valderico
)
_generate_msg_cpp(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/vectorNubes.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tfg_valderico
)

### Generating Services

### Generating Module File
_generate_module_cpp(tfg_valderico
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tfg_valderico
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(tfg_valderico_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(tfg_valderico_generate_messages tfg_valderico_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_cpp _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointVector.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_cpp _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_cpp _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/vectorNubes.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_cpp _tfg_valderico_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tfg_valderico_gencpp)
add_dependencies(tfg_valderico_gencpp tfg_valderico_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tfg_valderico_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tfg_valderico
)
_generate_msg_eus(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointVector.msg"
  "${MSG_I_FLAGS}"
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tfg_valderico
)
_generate_msg_eus(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tfg_valderico
)
_generate_msg_eus(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/vectorNubes.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tfg_valderico
)

### Generating Services

### Generating Module File
_generate_module_eus(tfg_valderico
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tfg_valderico
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(tfg_valderico_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(tfg_valderico_generate_messages tfg_valderico_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_eus _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointVector.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_eus _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_eus _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/vectorNubes.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_eus _tfg_valderico_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tfg_valderico_geneus)
add_dependencies(tfg_valderico_geneus tfg_valderico_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tfg_valderico_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tfg_valderico
)
_generate_msg_lisp(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointVector.msg"
  "${MSG_I_FLAGS}"
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tfg_valderico
)
_generate_msg_lisp(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tfg_valderico
)
_generate_msg_lisp(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/vectorNubes.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tfg_valderico
)

### Generating Services

### Generating Module File
_generate_module_lisp(tfg_valderico
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tfg_valderico
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(tfg_valderico_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(tfg_valderico_generate_messages tfg_valderico_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_lisp _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointVector.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_lisp _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_lisp _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/vectorNubes.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_lisp _tfg_valderico_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tfg_valderico_genlisp)
add_dependencies(tfg_valderico_genlisp tfg_valderico_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tfg_valderico_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tfg_valderico
)
_generate_msg_nodejs(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointVector.msg"
  "${MSG_I_FLAGS}"
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tfg_valderico
)
_generate_msg_nodejs(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tfg_valderico
)
_generate_msg_nodejs(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/vectorNubes.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tfg_valderico
)

### Generating Services

### Generating Module File
_generate_module_nodejs(tfg_valderico
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tfg_valderico
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(tfg_valderico_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(tfg_valderico_generate_messages tfg_valderico_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_nodejs _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointVector.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_nodejs _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_nodejs _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/vectorNubes.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_nodejs _tfg_valderico_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tfg_valderico_gennodejs)
add_dependencies(tfg_valderico_gennodejs tfg_valderico_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tfg_valderico_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfg_valderico
)
_generate_msg_py(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointVector.msg"
  "${MSG_I_FLAGS}"
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfg_valderico
)
_generate_msg_py(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfg_valderico
)
_generate_msg_py(tfg_valderico
  "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/vectorNubes.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfg_valderico
)

### Generating Services

### Generating Module File
_generate_module_py(tfg_valderico
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfg_valderico
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(tfg_valderico_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(tfg_valderico_generate_messages tfg_valderico_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/coordObjetos.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_py _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointVector.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_py _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/pointCoordinates.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_py _tfg_valderico_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ludo/catkin_ws/src/darknet_ros/tfg_valderico/msg/vectorNubes.msg" NAME_WE)
add_dependencies(tfg_valderico_generate_messages_py _tfg_valderico_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tfg_valderico_genpy)
add_dependencies(tfg_valderico_genpy tfg_valderico_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tfg_valderico_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tfg_valderico)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tfg_valderico
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(tfg_valderico_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(tfg_valderico_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tfg_valderico)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tfg_valderico
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(tfg_valderico_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(tfg_valderico_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tfg_valderico)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tfg_valderico
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(tfg_valderico_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(tfg_valderico_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tfg_valderico)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tfg_valderico
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(tfg_valderico_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(tfg_valderico_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfg_valderico)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfg_valderico\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfg_valderico
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(tfg_valderico_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(tfg_valderico_generate_messages_py sensor_msgs_generate_messages_py)
endif()
