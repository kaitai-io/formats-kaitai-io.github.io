// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.DnsPacket = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
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
    SRV: 33,

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
    33: "SRV",
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
    if (this.flags.isOpcodeValid) {
      this.qdcount = this._io.readU2be();
    }
    if (this.flags.isOpcodeValid) {
      this.ancount = this._io.readU2be();
    }
    if (this.flags.isOpcodeValid) {
      this.nscount = this._io.readU2be();
    }
    if (this.flags.isOpcodeValid) {
      this.arcount = this._io.readU2be();
    }
    if (this.flags.isOpcodeValid) {
      this.queries = new Array(this.qdcount);
      for (var i = 0; i < this.qdcount; i++) {
        this.queries[i] = new Query(this._io, this, this._root);
      }
    }
    if (this.flags.isOpcodeValid) {
      this.answers = new Array(this.ancount);
      for (var i = 0; i < this.ancount; i++) {
        this.answers[i] = new Answer(this._io, this, this._root);
      }
    }
    if (this.flags.isOpcodeValid) {
      this.additionals = new Array(this.arcount);
      for (var i = 0; i < this.arcount; i++) {
        this.additionals[i] = new Answer(this._io, this, this._root);
      }
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
        io.seek((this.value + ((this._parent.length - 192) << 8)));
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
        this.name = KaitaiStream.bytesToStr(this._io.readBytes(this.length), "utf-8");
      }
    }
    Object.defineProperty(Label.prototype, 'isPointer', {
      get: function() {
        if (this._m_isPointer !== undefined)
          return this._m_isPointer;
        this._m_isPointer = this.length >= 192;
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
      } while (!( ((_.length == 0) || (_.length >= 192)) ));
    }

    /**
     * Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator)
     */

    return DomainName;
  })();

  var Service = DnsPacket.Service = (function() {
    function Service(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Service.prototype._read = function() {
      this.priority = this._io.readU2be();
      this.weight = this._io.readU2be();
      this.port = this._io.readU2be();
      this.target = new DomainName(this._io, this, this._root);
    }

    return Service;
  })();

  var Txt = DnsPacket.Txt = (function() {
    function Txt(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Txt.prototype._read = function() {
      this.length = this._io.readU1();
      this.text = KaitaiStream.bytesToStr(this._io.readBytes(this.length), "utf-8");
    }

    return Txt;
  })();

  var TxtBody = DnsPacket.TxtBody = (function() {
    function TxtBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TxtBody.prototype._read = function() {
      this.data = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.data.push(new Txt(this._io, this, this._root));
        i++;
      }
    }

    return TxtBody;
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
      switch (this.type) {
      case DnsPacket.TypeType.PTR:
        this._raw_payload = this._io.readBytes(this.rdlength);
        var _io__raw_payload = new KaitaiStream(this._raw_payload);
        this.payload = new DomainName(_io__raw_payload, this, this._root);
        break;
      case DnsPacket.TypeType.CNAME:
        this._raw_payload = this._io.readBytes(this.rdlength);
        var _io__raw_payload = new KaitaiStream(this._raw_payload);
        this.payload = new DomainName(_io__raw_payload, this, this._root);
        break;
      case DnsPacket.TypeType.TXT:
        this._raw_payload = this._io.readBytes(this.rdlength);
        var _io__raw_payload = new KaitaiStream(this._raw_payload);
        this.payload = new TxtBody(_io__raw_payload, this, this._root);
        break;
      case DnsPacket.TypeType.SRV:
        this._raw_payload = this._io.readBytes(this.rdlength);
        var _io__raw_payload = new KaitaiStream(this._raw_payload);
        this.payload = new Service(_io__raw_payload, this, this._root);
        break;
      case DnsPacket.TypeType.A:
        this._raw_payload = this._io.readBytes(this.rdlength);
        var _io__raw_payload = new KaitaiStream(this._raw_payload);
        this.payload = new Address(_io__raw_payload, this, this._root);
        break;
      default:
        this.payload = this._io.readBytes(this.rdlength);
        break;
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
    Object.defineProperty(PacketFlags.prototype, 'isOpcodeValid', {
      get: function() {
        if (this._m_isOpcodeValid !== undefined)
          return this._m_isOpcodeValid;
        this._m_isOpcodeValid =  ((this.opcode == 0) || (this.opcode == 1) || (this.opcode == 2)) ;
        return this._m_isOpcodeValid;
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
return DnsPacket;
}));
