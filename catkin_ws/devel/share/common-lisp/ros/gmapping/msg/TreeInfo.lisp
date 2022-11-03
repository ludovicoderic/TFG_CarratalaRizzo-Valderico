; Auto-generated. Do not edit!


(cl:in-package gmapping-msg)


;//! \htmlinclude treeInfo.msg.html

(cl:defclass <treeInfo> (roslisp-msg-protocol:ros-message)
  ((treeVariables
    :reader treeVariables
    :initarg :treeVariables
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass treeInfo (<treeInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <treeInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'treeInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gmapping-msg:<treeInfo> is deprecated: use gmapping-msg:treeInfo instead.")))

(cl:ensure-generic-function 'treeVariables-val :lambda-list '(m))
(cl:defmethod treeVariables-val ((m <treeInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gmapping-msg:treeVariables-val is deprecated.  Use gmapping-msg:treeVariables instead.")
  (treeVariables m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <treeInfo>) ostream)
  "Serializes a message object of type '<treeInfo>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'treeVariables))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'treeVariables))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <treeInfo>) istream)
  "Deserializes a message object of type '<treeInfo>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'treeVariables) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'treeVariables)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<treeInfo>)))
  "Returns string type for a message object of type '<treeInfo>"
  "gmapping/treeInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'treeInfo)))
  "Returns string type for a message object of type 'treeInfo"
  "gmapping/treeInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<treeInfo>)))
  "Returns md5sum for a message object of type '<treeInfo>"
  "381c8aedf942d9074ebb838ccb473b35")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'treeInfo)))
  "Returns md5sum for a message object of type 'treeInfo"
  "381c8aedf942d9074ebb838ccb473b35")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<treeInfo>)))
  "Returns full string definition for message of type '<treeInfo>"
  (cl:format cl:nil "float64[] treeVariables~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'treeInfo)))
  "Returns full string definition for message of type 'treeInfo"
  (cl:format cl:nil "float64[] treeVariables~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <treeInfo>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'treeVariables) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <treeInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'treeInfo
    (cl:cons ':treeVariables (treeVariables msg))
))
