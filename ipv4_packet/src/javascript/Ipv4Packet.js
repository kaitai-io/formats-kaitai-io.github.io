// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './ProtocolBody'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./ProtocolBody'));
  } else {
    root.Ipv4Packet = factory(root.KaitaiStream, root.ProtocolBody);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream, ProtocolBody) {
var Ipv4Packet = (function() {
  function Ipv4Packet(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Ipv4Packet.prototype._read = function() {
    this.b1 = this._io.readU1();
    this.b2 = this._io.readU1();
    this.totalLength = this._io.readU2be();
    this.identification = this._io.readU2be();
    this.b67 = this._io.readU2be();
    this.ttl = this._io.readU1();
    this.protocol = this._io.readU1();
    this.headerChecksum = this._io.readU2be();
    this.srcIpAddr = this._io.readBytes(4);
    this.dstIpAddr = this._io.readBytes(4);
    this._raw_options = this._io.readBytes((this.ihlBytes - 20));
    var _io__raw_options = new KaitaiStream(this._raw_options);
    this.options = new Ipv4Options(_io__raw_options, this, this._root);
    this._raw_body = this._io.readBytes((this.totalLength - this.ihlBytes));
    var _io__raw_body = new KaitaiStream(this._raw_body);
    this.body = new ProtocolBody(_io__raw_body, this, null, this.protocol);
  }

  var Ipv4Options = Ipv4Packet.Ipv4Options = (function() {
    function Ipv4Options(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Ipv4Options.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new Ipv4Option(this._io, this, this._root));
        i++;
      }
    }

    return Ipv4Options;
  })();

  var Ipv4Option = Ipv4Packet.Ipv4Option = (function() {
    function Ipv4Option(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Ipv4Option.prototype._read = function() {
      this.b1 = this._io.readU1();
      this.len = this._io.readU1();
      this.body = this._io.readBytes((this.len > 2 ? (this.len - 2) : 0));
    }
    Object.defineProperty(Ipv4Option.prototype, 'copy', {
      get: function() {
        if (this._m_copy !== undefined)
          return this._m_copy;
        this._m_copy = ((this.b1 & 128) >>> 7);
        return this._m_copy;
      }
    });
    Object.defineProperty(Ipv4Option.prototype, 'optClass', {
      get: function() {
        if (this._m_optClass !== undefined)
          return this._m_optClass;
        this._m_optClass = ((this.b1 & 96) >>> 5);
        return this._m_optClass;
      }
    });
    Object.defineProperty(Ipv4Option.prototype, 'number', {
      get: function() {
        if (this._m_number !== undefined)
          return this._m_number;
        this._m_number = (this.b1 & 31);
        return this._m_number;
      }
    });

    return Ipv4Option;
  })();
  Object.defineProperty(Ipv4Packet.prototype, 'version', {
    get: function() {
      if (this._m_version !== undefined)
        return this._m_version;
      this._m_version = ((this.b1 & 240) >>> 4);
      return this._m_version;
    }
  });
  Object.defineProperty(Ipv4Packet.prototype, 'ihl', {
    get: function() {
      if (this._m_ihl !== undefined)
        return this._m_ihl;
      this._m_ihl = (this.b1 & 15);
      return this._m_ihl;
    }
  });
  Object.defineProperty(Ipv4Packet.prototype, 'ihlBytes', {
    get: function() {
      if (this._m_ihlBytes !== undefined)
        return this._m_ihlBytes;
      this._m_ihlBytes = (this.ihl * 4);
      return this._m_ihlBytes;
    }
  });

  return Ipv4Packet;
})();
return Ipv4Packet;
}));
