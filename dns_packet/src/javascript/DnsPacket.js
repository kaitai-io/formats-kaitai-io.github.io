// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * (No support for Auth-Name + Add-Name for simplicity)
 */

var DnsPacket = (function() {
  DnsPacket.ClassType = Object.freeze({
    IN_CLASS: 1,
    CS: 2,
    CH: 3,
    HS: 4,

    1: "IN_CLASS",
    2: "CS",
    3: "CH",
    4: "HS",
  });

  DnsPacket.TypeType = Object.freeze({
    A: 1,
    NS: 2,
    MD: 3,
    MF: 4,
    CNAME: 5,
    SOE: 6,
    MB: 7,
    MG: 8,
    MR: 9,
    NULL: 10,
    WKS: 11,
    PTR: 12,
    HINFO: 13,
    MINFO: 14,
    MX: 15,
    TXT: 16,

    1: "A",
    2: "NS",
    3: "MD",
    4: "MF",
    5: "CNAME",
    6: "SOE",
    7: "MB",
    8: "MG",
    9: "MR",
    10: "NULL",
    11: "WKS",
    12: "PTR",
    13: "HINFO",
    14: "MINFO",
    15: "MX",
    16: "TXT",
  });

  function DnsPacket(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  DnsPacket.prototype._read = function() {
    this.transactionId = this._io.readU2be();
    this.flags = new PacketFlags(this._io, this, this._root);
    this.qdcount = this._io.readU2be();
    this.ancount = this._io.readU2be();
    this.nscount = this._io.readU2be();
    this.arcount = this._io.readU2be();
    this.queries = new Array(this.qdcount);
    for (var i = 0; i < this.qdcount; i++) {
      this.queries[i] = new Query(this._io, this, this._root);
    }
    this.answers = new Array(this.ancount);
    for (var i = 0; i < this.ancount; i++) {
      this.answers[i] = new Answer(this._io, this, this._root);
    }
  }

  var PointerStruct = DnsPacket.PointerStruct = (function() {
    function PointerStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PointerStruct.prototype._read = function() {
      this.value = this._io.readU1();
    }
    Object.defineProperty(PointerStruct.prototype, 'contents', {
      get: function() {
        if (this._m_contents !== undefined)
          return this._m_contents;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.value);
        this._m_contents = new DomainName(io, this, this._root);
        io.seek(_pos);
        return this._m_contents;
      }
    });

    /**
     * Read one byte, then offset to that position, read one domain-name and return
     */

    return PointerStruct;
  })();

  var Label = DnsPacket.Label = (function() {
    function Label(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Label.prototype._read = function() {
      this.length = this._io.readU1();
      if (this.isPointer) {
        this.pointer = new PointerStruct(this._io, this, this._root);
      }
      if (!(this.isPointer)) {
        this.name = KaitaiStream.bytesToStr(this._io.readBytes(this.length), "ASCII");
      }
    }
    Object.defineProperty(Label.prototype, 'isPointer', {
      get: function() {
        if (this._m_isPointer !== undefined)
          return this._m_isPointer;
        this._m_isPointer = this.length == 192;
        return this._m_isPointer;
      }
    });

    /**
     * RFC1035 4.1.4: If the first two bits are raised it's a pointer-offset to a previously defined name
     */

    /**
     * Otherwise its a string the length of the length value
     */

    return Label;
  })();

  var Query = DnsPacket.Query = (function() {
    function Query(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Query.prototype._read = function() {
      this.name = new DomainName(this._io, this, this._root);
      this.type = this._io.readU2be();
      this.queryClass = this._io.readU2be();
    }

    return Query;
  })();

  var DomainName = DnsPacket.DomainName = (function() {
    function DomainName(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DomainName.prototype._read = function() {
      this.name = []
      var i = 0;
      do {
        var _ = new Label(this._io, this, this._root);
        this.name.push(_);
        i++;
      } while (!( ((_.length == 0) || (_.length == 192)) ));
    }

    /**
     * Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator)
     */

    return DomainName;
  })();

  var Address = DnsPacket.Address = (function() {
    function Address(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Address.prototype._read = function() {
      this.ip = new Array(4);
      for (var i = 0; i < 4; i++) {
        this.ip[i] = this._io.readU1();
      }
    }

    return Address;
  })();

  var Answer = DnsPacket.Answer = (function() {
    function Answer(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Answer.prototype._read = function() {
      this.name = new DomainName(this._io, this, this._root);
      this.type = this._io.readU2be();
      this.answerClass = this._io.readU2be();
      this.ttl = this._io.readS4be();
      this.rdlength = this._io.readU2be();
      if (this.type == DnsPacket.TypeType.PTR) {
        this.ptrdname = new DomainName(this._io, this, this._root);
      }
      if (this.type == DnsPacket.TypeType.A) {
        this.address = new Address(this._io, this, this._root);
      }
    }

    /**
     * Time to live (in seconds)
     */

    /**
     * Length in octets of the following payload
     */

    return Answer;
  })();

  var PacketFlags = DnsPacket.PacketFlags = (function() {
    function PacketFlags(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PacketFlags.prototype._read = function() {
      this.flag = this._io.readU2be();
    }
    Object.defineProperty(PacketFlags.prototype, 'qr', {
      get: function() {
        if (this._m_qr !== undefined)
          return this._m_qr;
        this._m_qr = ((this.flag & 32768) >>> 15);
        return this._m_qr;
      }
    });
    Object.defineProperty(PacketFlags.prototype, 'ra', {
      get: function() {
        if (this._m_ra !== undefined)
          return this._m_ra;
        this._m_ra = ((this.flag & 128) >>> 7);
        return this._m_ra;
      }
    });
    Object.defineProperty(PacketFlags.prototype, 'tc', {
      get: function() {
        if (this._m_tc !== undefined)
          return this._m_tc;
        this._m_tc = ((this.flag & 512) >>> 9);
        return this._m_tc;
      }
    });
    Object.defineProperty(PacketFlags.prototype, 'rcode', {
      get: function() {
        if (this._m_rcode !== undefined)
          return this._m_rcode;
        this._m_rcode = ((this.flag & 15) >>> 0);
        return this._m_rcode;
      }
    });
    Object.defineProperty(PacketFlags.prototype, 'opcode', {
      get: function() {
        if (this._m_opcode !== undefined)
          return this._m_opcode;
        this._m_opcode = ((this.flag & 30720) >>> 11);
        return this._m_opcode;
      }
    });
    Object.defineProperty(PacketFlags.prototype, 'aa', {
      get: function() {
        if (this._m_aa !== undefined)
          return this._m_aa;
        this._m_aa = ((this.flag & 1024) >>> 10);
        return this._m_aa;
      }
    });
    Object.defineProperty(PacketFlags.prototype, 'z', {
      get: function() {
        if (this._m_z !== undefined)
          return this._m_z;
        this._m_z = ((this.flag & 64) >>> 6);
        return this._m_z;
      }
    });
    Object.defineProperty(PacketFlags.prototype, 'rd', {
      get: function() {
        if (this._m_rd !== undefined)
          return this._m_rd;
        this._m_rd = ((this.flag & 256) >>> 8);
        return this._m_rd;
      }
    });
    Object.defineProperty(PacketFlags.prototype, 'cd', {
      get: function() {
        if (this._m_cd !== undefined)
          return this._m_cd;
        this._m_cd = ((this.flag & 16) >>> 4);
        return this._m_cd;
      }
    });
    Object.defineProperty(PacketFlags.prototype, 'ad', {
      get: function() {
        if (this._m_ad !== undefined)
          return this._m_ad;
        this._m_ad = ((this.flag & 32) >>> 5);
        return this._m_ad;
      }
    });

    return PacketFlags;
  })();

  /**
   * ID to keep track of request/responces
   */

  /**
   * How many questions are there
   */

  /**
   * Number of resource records answering the question
   */

  /**
   * Number of resource records pointing toward an authority
   */

  /**
   * Number of resource records holding additional information
   */

  return DnsPacket;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('DnsPacket', [], function() {
    return DnsPacket;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = DnsPacket;
}
