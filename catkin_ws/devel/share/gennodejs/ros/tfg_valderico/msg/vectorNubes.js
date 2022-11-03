// Auto-generated. Do not edit!

// (in-package tfg_valderico.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let coordObjetos = require('./coordObjetos.js');
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class vectorNubes {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.nube_objetos = null;
      this.coord_objetos = null;
      this.yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('nube_objetos')) {
        this.nube_objetos = initObj.nube_objetos
      }
      else {
        this.nube_objetos = new sensor_msgs.msg.PointCloud2();
      }
      if (initObj.hasOwnProperty('coord_objetos')) {
        this.coord_objetos = initObj.coord_objetos
      }
      else {
        this.coord_objetos = [];
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type vectorNubes
    // Serialize message field [nube_objetos]
    bufferOffset = sensor_msgs.msg.PointCloud2.serialize(obj.nube_objetos, buffer, bufferOffset);
    // Serialize message field [coord_objetos]
    // Serialize the length for message field [coord_objetos]
    bufferOffset = _serializer.uint32(obj.coord_objetos.length, buffer, bufferOffset);
    obj.coord_objetos.forEach((val) => {
      bufferOffset = coordObjetos.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [yaw]
    bufferOffset = _serializer.float64(obj.yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type vectorNubes
    let len;
    let data = new vectorNubes(null);
    // Deserialize message field [nube_objetos]
    data.nube_objetos = sensor_msgs.msg.PointCloud2.deserialize(buffer, bufferOffset);
    // Deserialize message field [coord_objetos]
    // Deserialize array length for message field [coord_objetos]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.coord_objetos = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.coord_objetos[i] = coordObjetos.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.PointCloud2.getMessageSize(object.nube_objetos);
    object.coord_objetos.forEach((val) => {
      length += coordObjetos.getMessageSize(val);
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tfg_valderico/vectorNubes';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'da8a0484e6abaf2fddc50498197a2b99';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    sensor_msgs/PointCloud2 nube_objetos
    coordObjetos[] coord_objetos
    float64 yaw
    
    ================================================================================
    MSG: sensor_msgs/PointCloud2
    # This message holds a collection of N-dimensional points, which may
    # contain additional information such as normals, intensity, etc. The
    # point data is stored as a binary blob, its layout described by the
    # contents of the "fields" array.
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new vectorNubes(null);
    if (msg.nube_objetos !== undefined) {
      resolved.nube_objetos = sensor_msgs.msg.PointCloud2.Resolve(msg.nube_objetos)
    }
    else {
      resolved.nube_objetos = new sensor_msgs.msg.PointCloud2()
    }

    if (msg.coord_objetos !== undefined) {
      resolved.coord_objetos = new Array(msg.coord_objetos.length);
      for (let i = 0; i < resolved.coord_objetos.length; ++i) {
        resolved.coord_objetos[i] = coordObjetos.Resolve(msg.coord_objetos[i]);
      }
    }
    else {
      resolved.coord_objetos = []
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    return resolved;
    }
};

module.exports = vectorNubes;
