
(cl:in-package :asdf)

(defsystem "gmapping-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "TreeInfo" :depends-on ("_package_TreeInfo"))
    (:file "_package_TreeInfo" :depends-on ("_package"))
    (:file "TreeVariables" :depends-on ("_package_TreeVariables"))
    (:file "_package_TreeVariables" :depends-on ("_package"))
  ))