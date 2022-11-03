; Auto-generated. Do not edit!


(cl:in-package tfg_valderico-msg)


;//! \htmlinclude pointVector.msg.html

(cl:defclass <pointVector> (roslisp-msg-protocol:ros-message)
  ((point_vector
    :reader point_vector
    :initarg :point_vector
    :type (cl:vector tfg_valderico-msg:pointCoordinates)
   :initform (cl:make-array 0 :element-type 'tfg_valderico-msg:pointCoordinates :initial-element (cl:make-instance 'tfg_valderico-msg:pointCoordinates))))
)

(cl:defclass pointVector (<pointVector>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pointVector>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pointVector)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tfg_valderico-msg:<pointVector> is deprecated: use tfg_valderico-msg:pointVector instead.")))

(cl:ensure-generic-function 'point_vector-val :lambda-list '(m))
(cl:defmethod point_vector-val ((m <pointVector>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tfg_valderico-msg:point_vector-val is deprecated.  Use tfg_valderico-msg:point_vector instead.")
  (point_vector m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pointVector>) ostream)
  "Serializes a message object of type '<pointVector>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'point_vector))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'point_vector))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pointVector>) istream)
  "Deserializes a message object of type '<pointVector>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'point_vector) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'point_vector)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'tfg_valderico-msg:pointCoordinates))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pointVector>)))
  "Returns string type for a message object of type '<pointVector>"
  "tfg_valderico/pointVector")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pointVector)))
  "Returns string type for a message object of type 'pointVector"
  "tfg_valderico/pointVector")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pointVector>)))
  "Returns md5sum for a message object of type '<pointVector>"
  "8339657f514b1575d4ed6e0e08cc15ad")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pointVector)))
  "Returns md5sum for a message object of type 'pointVector"
  "8339657f514b1575d4ed6e0e08cc15ad")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pointVector>)))
  "Returns full string definition for message of type '<pointVector>"
  (cl:format cl:nil "pointCoordinates[] point_vector~%~%================================================================================~%MSG: tfg_valderico/pointCoordinates~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pointVector)))
  "Returns full string definition for message of type 'pointVector"
  (cl:format cl:nil "pointCoordinates[] point_vector~%~%================================================================================~%MSG: tfg_valderico/pointCoordinates~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pointVector>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'point_vector) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pointVector>))
  "Converts a ROS message object to a list"
  (cl:list 'pointVector
    (cl:cons ':point_vector (point_vector msg))
))
