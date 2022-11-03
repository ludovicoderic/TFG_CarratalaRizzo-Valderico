;; Auto-generated. Do not edit!


(when (boundp 'tfg_valderico::pointVector)
  (if (not (find-package "TFG_VALDERICO"))
    (make-package "TFG_VALDERICO"))
  (shadow 'pointVector (find-package "TFG_VALDERICO")))
(unless (find-package "TFG_VALDERICO::POINTVECTOR")
  (make-package "TFG_VALDERICO::POINTVECTOR"))

(in-package "ROS")
;;//! \htmlinclude pointVector.msg.html


(defclass tfg_valderico::pointVector
  :super ros::object
  :slots (_point_vector ))

(defmethod tfg_valderico::pointVector
  (:init
   (&key
    ((:point_vector __point_vector) (let (r) (dotimes (i 0) (push (instance tfg_valderico::pointCoordinates :init) r)) r))
    )
   (send-super :init)
   (setq _point_vector __point_vector)
   self)
  (:point_vector
   (&rest __point_vector)
   (if (keywordp (car __point_vector))
       (send* _point_vector __point_vector)
     (progn
       (if __point_vector (setq _point_vector (car __point_vector)))
       _point_vector)))
  (:serialization-length
   ()
   (+
    ;; tfg_valderico/pointCoordinates[] _point_vector
    (apply #'+ (send-all _point_vector :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; tfg_valderico/pointCoordinates[] _point_vector
     (write-long (length _point_vector) s)
     (dolist (elem _point_vector)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; tfg_valderico/pointCoordinates[] _point_vector
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _point_vector (let (r) (dotimes (i n) (push (instance tfg_valderico::pointCoordinates :init) r)) r))
     (dolist (elem- _point_vector)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get tfg_valderico::pointVector :md5sum-) "8339657f514b1575d4ed6e0e08cc15ad")
(setf (get tfg_valderico::pointVector :datatype-) "tfg_valderico/pointVector")
(setf (get tfg_valderico::pointVector :definition-)
      "pointCoordinates[] point_vector

================================================================================
MSG: tfg_valderico/pointCoordinates
float64 x
float64 y
float64 z

")



(provide :tfg_valderico/pointVector "8339657f514b1575d4ed6e0e08cc15ad")


