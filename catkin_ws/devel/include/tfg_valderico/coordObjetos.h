// Generated by gencpp from file tfg_valderico/coordObjetos.msg
// DO NOT EDIT!


#ifndef TFG_VALDERICO_MESSAGE_COORDOBJETOS_H
#define TFG_VALDERICO_MESSAGE_COORDOBJETOS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace tfg_valderico
{
template <class ContainerAllocator>
struct coordObjetos_
{
  typedef coordObjetos_<ContainerAllocator> Type;

  coordObjetos_()
    : xmin(0)
    , xmax(0)
    , ymin(0)
    , ymax(0)
    , clase()  {
    }
  coordObjetos_(const ContainerAllocator& _alloc)
    : xmin(0)
    , xmax(0)
    , ymin(0)
    , ymax(0)
    , clase(_alloc)  {
  (void)_alloc;
    }



   typedef int64_t _xmin_type;
  _xmin_type xmin;

   typedef int64_t _xmax_type;
  _xmax_type xmax;

   typedef int64_t _ymin_type;
  _ymin_type ymin;

   typedef int64_t _ymax_type;
  _ymax_type ymax;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _clase_type;
  _clase_type clase;





  typedef boost::shared_ptr< ::tfg_valderico::coordObjetos_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tfg_valderico::coordObjetos_<ContainerAllocator> const> ConstPtr;

}; // struct coordObjetos_

typedef ::tfg_valderico::coordObjetos_<std::allocator<void> > coordObjetos;

typedef boost::shared_ptr< ::tfg_valderico::coordObjetos > coordObjetosPtr;
typedef boost::shared_ptr< ::tfg_valderico::coordObjetos const> coordObjetosConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tfg_valderico::coordObjetos_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tfg_valderico::coordObjetos_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::tfg_valderico::coordObjetos_<ContainerAllocator1> & lhs, const ::tfg_valderico::coordObjetos_<ContainerAllocator2> & rhs)
{
  return lhs.xmin == rhs.xmin &&
    lhs.xmax == rhs.xmax &&
    lhs.ymin == rhs.ymin &&
    lhs.ymax == rhs.ymax &&
    lhs.clase == rhs.clase;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::tfg_valderico::coordObjetos_<ContainerAllocator1> & lhs, const ::tfg_valderico::coordObjetos_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace tfg_valderico

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::tfg_valderico::coordObjetos_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tfg_valderico::coordObjetos_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tfg_valderico::coordObjetos_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tfg_valderico::coordObjetos_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tfg_valderico::coordObjetos_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tfg_valderico::coordObjetos_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tfg_valderico::coordObjetos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5e064fab0e33b43fbd58d0e3facc4d51";
  }

  static const char* value(const ::tfg_valderico::coordObjetos_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5e064fab0e33b43fULL;
  static const uint64_t static_value2 = 0xbd58d0e3facc4d51ULL;
};

template<class ContainerAllocator>
struct DataType< ::tfg_valderico::coordObjetos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tfg_valderico/coordObjetos";
  }

  static const char* value(const ::tfg_valderico::coordObjetos_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tfg_valderico::coordObjetos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 xmin\n"
"int64 xmax\n"
"int64 ymin \n"
"int64 ymax\n"
"string clase\n"
;
  }

  static const char* value(const ::tfg_valderico::coordObjetos_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tfg_valderico::coordObjetos_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.xmin);
      stream.next(m.xmax);
      stream.next(m.ymin);
      stream.next(m.ymax);
      stream.next(m.clase);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct coordObjetos_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tfg_valderico::coordObjetos_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tfg_valderico::coordObjetos_<ContainerAllocator>& v)
  {
    s << indent << "xmin: ";
    Printer<int64_t>::stream(s, indent + "  ", v.xmin);
    s << indent << "xmax: ";
    Printer<int64_t>::stream(s, indent + "  ", v.xmax);
    s << indent << "ymin: ";
    Printer<int64_t>::stream(s, indent + "  ", v.ymin);
    s << indent << "ymax: ";
    Printer<int64_t>::stream(s, indent + "  ", v.ymax);
    s << indent << "clase: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.clase);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TFG_VALDERICO_MESSAGE_COORDOBJETOS_H
