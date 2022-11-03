;; Auto-generated. Do not edit!


(when (boundp 'gmapping::treeInfo)
  (if (not (find-package "GMAPPING"))
    (make-package "GMAPPING"))
  (shadow 'treeInfo (find-package "GMAPPING")))
(unless (find-package "GMAPPING::TREEINFO")
  (make-package "GMAPPING::TREEINFO"))

(in-package "ROS")
;;//! \htmlinclude treeInfo.msg.html


(defclass gmapping::treeInfo
  :super ros::object
  :slots (_treeVariables ))

(defmethod gmapping::treeInfo
  (:init
   (&key
    ((:treeVariables __treeVariables) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _treeVariables __treeVariables)
   self)
  (:treeVariables
   (&optional __treeVariables)
   (if __treeVariables (setq _treeVariables __treeVariables)) _treeVariables)
  (:serialization-length
   ()
   (+
    ;; float64[] _treeVariables
    (* 8    (length _treeVariables)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _treeVariables
     (write-long (length _treeVariables) s)
     (dotimes (i (length _treeVariables))
       (sys::poke (elt _treeVariables i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _treeVariables
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _treeVariables (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _treeVariables i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get gmapping::treeInfo :md5sum-) "381c8aedf942d9074ebb838ccb473b35")
(setf (get gmapping::treeInfo :datatype-) "gmapping/treeInfo")
(setf (get gmapping::treeInfo :definition-)
      "float64[] treeVariables

")



(provide :gmapping/treeInfo "381c8aedf942d9074ebb838ccb473b35")


