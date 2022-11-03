// Auto-generated. Do not edit!

// (in-package gmapping.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class treeInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.treeVariables = null;
    }
    else {
      if (initObj.hasOwnProperty('treeVariables')) {
        this.treeVariables = initObj.treeVariables
      }
      else {
        this.treeVariables = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type treeInfo
    // Serialize message field [treeVariables]
    bufferOffset = _arraySerializer.float64(obj.treeVariables, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type treeInfo
    let len;
    let data = new treeInfo(null);
    // Deserialize message field [treeVariables]
    data.treeVariables = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.treeVariables.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gmapping/treeInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '381c8aedf942d9074ebb838ccb473b35';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] treeVariables
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new treeInfo(null);
    if (msg.treeVariables !== undefined) {
      resolved.treeVariables = msg.treeVariables;
    }
    else {
      resolved.treeVariables = []
    }

    return resolved;
    }
};

module.exports = treeInfo;
