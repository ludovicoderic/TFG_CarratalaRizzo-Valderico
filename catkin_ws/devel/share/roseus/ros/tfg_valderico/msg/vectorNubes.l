;; Auto-generated. Do not edit!


(when (boundp 'tfg_valderico::vectorNubes)
  (if (not (find-package "TFG_VALDERICO"))
    (make-package "TFG_VALDERICO"))
  (shadow 'vectorNubes (find-package "TFG_VALDERICO")))
(unless (find-package "TFG_VALDERICO::VECTORNUBES")
  (make-package "TFG_VALDERICO::VECTORNUBES"))

(in-package "ROS")
;;//! \htmlinclude vectorNubes.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass tfg_valderico::vectorNubes
  :super ros::object
  :slots (_nube_objetos _coord_objetos _yaw ))

(defmethod tfg_valderico::vectorNubes
  (:init
   (&key
    ((:nube_objetos __nube_objetos) (instance sensor_msgs::PointCloud2 :init))
    ((:coord_objetos __coord_objetos) (let (r) (dotimes (i 0) (push (instance tfg_valderico::coordObjetos :init) r)) r))
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _nube_objetos __nube_objetos)
   (setq _coord_objetos __coord_objetos)
   (setq _yaw (float __yaw))
   self)
  (:nube_objetos
   (&rest __nube_objetos)
   (if (keywordp (car __nube_objetos))
       (send* _nube_objetos __nube_objetos)
     (progn
       (if __nube_objetos (setq _nube_objetos (car __nube_objetos)))
       _nube_objetos)))
  (:coord_objetos
   (&rest __coord_objetos)
   (if (keywordp (car __coord_objetos))
       (send* _coord_objetos __coord_objetos)
     (progn
       (if __coord_objetos (setq _coord_objetos (car __coord_objetos)))
       _coord_objetos)))
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/PointCloud2 _nube_objetos
    (send _nube_objetos :serialization-length)
    ;; tfg_valderico/coordObjetos[] _coord_objetos
    (apply #'+ (send-all _coord_objetos :serialization-length)) 4
    ;; float64 _yaw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/PointCloud2 _nube_objetos
       (send _nube_objetos :serialize s)
     ;; tfg_valderico/coordObjetos[] _coord_objetos
     (write-long (length _coord_objetos) s)
     (dolist (elem _coord_objetos)
       (send elem :serialize s)
       )
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/PointCloud2 _nube_objetos
     (send _nube_objetos :deserialize buf ptr-) (incf ptr- (send _nube_objetos :serialization-length))
   ;; tfg_valderico/coordObjetos[] _coord_objetos
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _coord_objetos (let (r) (dotimes (i n) (push (instance tfg_valderico::coordObjetos :init) r)) r))
     (dolist (elem- _coord_objetos)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get tfg_valderico::vectorNubes :md5sum-) "da8a0484e6abaf2fddc50498197a2b99")
(setf (get tfg_valderico::vectorNubes :datatype-) "tfg_valderico/vectorNubes")
(setf (get tfg_valderico::vectorNubes :definition-)
      "sensor_msgs/PointCloud2 nube_objetos
coordObjetos[] coord_objetos
float64 yaw

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field

================================================================================
MSG: tfg_valderico/coordObjetos
int64 xmin
int64 xmax
int64 ymin 
int64 ymax
string clase

")



(provide :tfg_valderico/vectorNubes "da8a0484e6abaf2fddc50498197a2b99")


