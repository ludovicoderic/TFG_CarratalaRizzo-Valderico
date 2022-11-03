
(cl:in-package :asdf)

(defsystem "tfg_valderico-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "coordObjetos" :depends-on ("_package_coordObjetos"))
    (:file "_package_coordObjetos" :depends-on ("_package"))
    (:file "pointCoordinates" :depends-on ("_package_pointCoordinates"))
    (:file "_package_pointCoordinates" :depends-on ("_package"))
    (:file "pointVector" :depends-on ("_package_pointVector"))
    (:file "_package_pointVector" :depends-on ("_package"))
    (:file "vectorNubes" :depends-on ("_package_vectorNubes"))
    (:file "_package_vectorNubes" :depends-on ("_package"))
  ))