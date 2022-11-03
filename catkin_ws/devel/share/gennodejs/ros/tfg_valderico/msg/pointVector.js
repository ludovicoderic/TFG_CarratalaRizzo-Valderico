// Auto-generated. Do not edit!

// (in-package tfg_valderico.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let pointCoordinates = require('./pointCoordinates.js');

//-----------------------------------------------------------

class pointVector {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.point_vector = null;
    }
    else {
      if (initObj.hasOwnProperty('point_vector')) {
        this.point_vector = initObj.point_vector
      }
      else {
        this.point_vector = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type pointVector
    // Serialize message field [point_vector]
    // Serialize the length for message field [point_vector]
    bufferOffset = _serializer.uint32(obj.point_vector.length, buffer, bufferOffset);
    obj.point_vector.forEach((val) => {
      bufferOffset = pointCoordinates.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type pointVector
    let len;
    let data = new pointVector(null);
    // Deserialize message field [point_vector]
    // Deserialize array length for message field [point_vector]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.point_vector = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.point_vector[i] = pointCoordinates.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.point_vector.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tfg_valderico/pointVector';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8339657f514b1575d4ed6e0e08cc15ad';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    pointCoordinates[] point_vector
    
    ================================================================================
    MSG: tfg_valderico/pointCoordinates
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new pointVector(null);
    if (msg.point_vector !== undefined) {
      resolved.point_vector = new Array(msg.point_vector.length);
      for (let i = 0; i < resolved.point_vector.length; ++i) {
        resolved.point_vector[i] = pointCoordinates.Resolve(msg.point_vector[i]);
      }
    }
    else {
      resolved.point_vector = []
    }

    return resolved;
    }
};

module.exports = pointVector;
