; Auto-generated. Do not edit!


(cl:in-package tfg_valderico-msg)


;//! \htmlinclude vectorNubes.msg.html

(cl:defclass <vectorNubes> (roslisp-msg-protocol:ros-message)
  ((nube_objetos
    :reader nube_objetos
    :initarg :nube_objetos
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (coord_objetos
    :reader coord_objetos
    :initarg :coord_objetos
    :type (cl:vector tfg_valderico-msg:coordObjetos)
   :initform (cl:make-array 0 :element-type 'tfg_valderico-msg:coordObjetos :initial-element (cl:make-instance 'tfg_valderico-msg:coordObjetos)))
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass vectorNubes (<vectorNubes>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <vectorNubes>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'vectorNubes)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tfg_valderico-msg:<vectorNubes> is deprecated: use tfg_valderico-msg:vectorNubes instead.")))

(cl:ensure-generic-function 'nube_objetos-val :lambda-list '(m))
(cl:defmethod nube_objetos-val ((m <vectorNubes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tfg_valderico-msg:nube_objetos-val is deprecated.  Use tfg_valderico-msg:nube_objetos instead.")
  (nube_objetos m))

(cl:ensure-generic-function 'coord_objetos-val :lambda-list '(m))
(cl:defmethod coord_objetos-val ((m <vectorNubes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tfg_valderico-msg:coord_objetos-val is deprecated.  Use tfg_valderico-msg:coord_objetos instead.")
  (coord_objetos m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <vectorNubes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tfg_valderico-msg:yaw-val is deprecated.  Use tfg_valderico-msg:yaw instead.")
  (yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <vectorNubes>) ostream)
  "Serializes a message object of type '<vectorNubes>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'nube_objetos) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'coord_objetos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'coord_objetos))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <vectorNubes>) istream)
  "Deserializes a message object of type '<vectorNubes>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'nube_objetos) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'coord_objetos) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'coord_objetos)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'tfg_valderico-msg:coordObjetos))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<vectorNubes>)))
  "Returns string type for a message object of type '<vectorNubes>"
  "tfg_valderico/vectorNubes")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'vectorNubes)))
  "Returns string type for a message object of type 'vectorNubes"
  "tfg_valderico/vectorNubes")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<vectorNubes>)))
  "Returns md5sum for a message object of type '<vectorNubes>"
  "da8a0484e6abaf2fddc50498197a2b99")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'vectorNubes)))
  "Returns md5sum for a message object of type 'vectorNubes"
  "da8a0484e6abaf2fddc50498197a2b99")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<vectorNubes>)))
  "Returns full string definition for message of type '<vectorNubes>"
  (cl:format cl:nil "sensor_msgs/PointCloud2 nube_objetos~%coordObjetos[] coord_objetos~%float64 yaw~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: tfg_valderico/coordObjetos~%int64 xmin~%int64 xmax~%int64 ymin ~%int64 ymax~%string clase~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'vectorNubes)))
  "Returns full string definition for message of type 'vectorNubes"
  (cl:format cl:nil "sensor_msgs/PointCloud2 nube_objetos~%coordObjetos[] coord_objetos~%float64 yaw~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: tfg_valderico/coordObjetos~%int64 xmin~%int64 xmax~%int64 ymin ~%int64 ymax~%string clase~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <vectorNubes>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'nube_objetos))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'coord_objetos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <vectorNubes>))
  "Converts a ROS message object to a list"
  (cl:list 'vectorNubes
    (cl:cons ':nube_objetos (nube_objetos msg))
    (cl:cons ':coord_objetos (coord_objetos msg))
    (cl:cons ':yaw (yaw msg))
))
