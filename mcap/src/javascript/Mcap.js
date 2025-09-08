// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Mcap || (root.Mcap = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Mcap_, KaitaiStream) {
/**
 * MCAP is a modular container format and logging library for pub/sub messages with
 * arbitrary message serialization. It is primarily intended for use in robotics
 * applications, and works well under various workloads, resource constraints, and
 * durability requirements.
 * 
 * Time values (`log_time`, `publish_time`, `create_time`) are represented in
 * nanoseconds since a user-understood epoch (i.e. Unix epoch, robot boot time,
 * etc.)
 * @see {@link https://github.com/foxglove/mcap/tree/c1cc51d/docs/specification#readme|Source}
 */

var Mcap = (function() {
  Mcap.Opcode = Object.freeze({
    HEADER: 1,
    FOOTER: 2,
    SCHEMA: 3,
    CHANNEL: 4,
    MESSAGE: 5,
    CHUNK: 6,
    MESSAGE_INDEX: 7,
    CHUNK_INDEX: 8,
    ATTACHMENT: 9,
    ATTACHMENT_INDEX: 10,
    STATISTICS: 11,
    METADATA: 12,
    METADATA_INDEX: 13,
    SUMMARY_OFFSET: 14,
    DATA_END: 15,

    1: "HEADER",
    2: "FOOTER",
    3: "SCHEMA",
    4: "CHANNEL",
    5: "MESSAGE",
    6: "CHUNK",
    7: "MESSAGE_INDEX",
    8: "CHUNK_INDEX",
    9: "ATTACHMENT",
    10: "ATTACHMENT_INDEX",
    11: "STATISTICS",
    12: "METADATA",
    13: "METADATA_INDEX",
    14: "SUMMARY_OFFSET",
    15: "DATA_END",
  });

  function Mcap(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Mcap.prototype._read = function() {
    this.headerMagic = new Magic(this._io, this, this._root);
    this.records = [];
    var i = 0;
    do {
      var _ = new Record(this._io, this, this._root);
      this.records.push(_);
      i++;
    } while (!(_.op == Mcap.Opcode.FOOTER));
    this.footerMagic = new Magic(this._io, this, this._root);
  }

  var Attachment = Mcap.Attachment = (function() {
    function Attachment(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Attachment.prototype._read = function() {
      this.logTime = this._io.readU8le();
      this.createTime = this._io.readU8le();
      this.name = new PrefixedStr(this._io, this, this._root);
      this.contentType = new PrefixedStr(this._io, this, this._root);
      this.lenData = this._io.readU8le();
      this.data = this._io.readBytes(this.lenData);
      if (this.crc32InputEnd >= 0) {
        this.invokeCrc32InputEnd = this._io.readBytes(0);
      }
      this.crc32 = this._io.readU4le();
    }
    Object.defineProperty(Attachment.prototype, 'crc32Input', {
      get: function() {
        if (this._m_crc32Input !== undefined)
          return this._m_crc32Input;
        var _pos = this._io.pos;
        this._io.seek(0);
        this._m_crc32Input = this._io.readBytes(this.crc32InputEnd);
        this._io.seek(_pos);
        return this._m_crc32Input;
      }
    });
    Object.defineProperty(Attachment.prototype, 'crc32InputEnd', {
      get: function() {
        if (this._m_crc32InputEnd !== undefined)
          return this._m_crc32InputEnd;
        this._m_crc32InputEnd = this._io.pos;
        return this._m_crc32InputEnd;
      }
    });

    /**
     * CRC-32 checksum of preceding fields in the record. A value of zero indicates that
     * CRC validation should not be performed.
     */

    return Attachment;
  })();

  var AttachmentIndex = Mcap.AttachmentIndex = (function() {
    function AttachmentIndex(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    AttachmentIndex.prototype._read = function() {
      this.ofsAttachment = this._io.readU8le();
      this.lenAttachment = this._io.readU8le();
      this.logTime = this._io.readU8le();
      this.createTime = this._io.readU8le();
      this.dataSize = this._io.readU8le();
      this.name = new PrefixedStr(this._io, this, this._root);
      this.contentType = new PrefixedStr(this._io, this, this._root);
    }
    Object.defineProperty(AttachmentIndex.prototype, 'attachment', {
      get: function() {
        if (this._m_attachment !== undefined)
          return this._m_attachment;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.ofsAttachment);
        this._raw__m_attachment = io.readBytes(this.lenAttachment);
        var _io__raw__m_attachment = new KaitaiStream(this._raw__m_attachment);
        this._m_attachment = new Record(_io__raw__m_attachment, this, this._root);
        io.seek(_pos);
        return this._m_attachment;
      }
    });

    return AttachmentIndex;
  })();

  var Channel = Mcap.Channel = (function() {
    function Channel(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Channel.prototype._read = function() {
      this.id = this._io.readU2le();
      this.schemaId = this._io.readU2le();
      this.topic = new PrefixedStr(this._io, this, this._root);
      this.messageEncoding = new PrefixedStr(this._io, this, this._root);
      this.metadata = new MapStrStr(this._io, this, this._root);
    }

    return Channel;
  })();

  var Chunk = Mcap.Chunk = (function() {
    function Chunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Chunk.prototype._read = function() {
      this.messageStartTime = this._io.readU8le();
      this.messageEndTime = this._io.readU8le();
      this.uncompressedSize = this._io.readU8le();
      this.uncompressedCrc32 = this._io.readU4le();
      this.compression = new PrefixedStr(this._io, this, this._root);
      this.lenRecords = this._io.readU8le();
      switch (this.compression.str) {
      case "":
        this._raw_records = this._io.readBytes(this.lenRecords);
        var _io__raw_records = new KaitaiStream(this._raw_records);
        this.records = new Records(_io__raw_records, this, this._root);
        break;
      default:
        this.records = this._io.readBytes(this.lenRecords);
        break;
      }
    }

    /**
     * CRC-32 checksum of uncompressed `records` field. A value of zero indicates that
     * CRC validation should not be performed.
     */

    return Chunk;
  })();

  var ChunkIndex = Mcap.ChunkIndex = (function() {
    function ChunkIndex(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ChunkIndex.prototype._read = function() {
      this.messageStartTime = this._io.readU8le();
      this.messageEndTime = this._io.readU8le();
      this.ofsChunk = this._io.readU8le();
      this.lenChunk = this._io.readU8le();
      this.lenMessageIndexOffsets = this._io.readU4le();
      this._raw_messageIndexOffsets = this._io.readBytes(this.lenMessageIndexOffsets);
      var _io__raw_messageIndexOffsets = new KaitaiStream(this._raw_messageIndexOffsets);
      this.messageIndexOffsets = new MessageIndexOffsets(_io__raw_messageIndexOffsets, this, this._root);
      this.messageIndexLength = this._io.readU8le();
      this.compression = new PrefixedStr(this._io, this, this._root);
      this.compressedSize = this._io.readU8le();
      this.uncompressedSize = this._io.readU8le();
    }

    var MessageIndexOffset = ChunkIndex.MessageIndexOffset = (function() {
      function MessageIndexOffset(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      MessageIndexOffset.prototype._read = function() {
        this.channelId = this._io.readU2le();
        this.offset = this._io.readU8le();
      }

      return MessageIndexOffset;
    })();

    var MessageIndexOffsets = ChunkIndex.MessageIndexOffsets = (function() {
      function MessageIndexOffsets(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      MessageIndexOffsets.prototype._read = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(new MessageIndexOffset(this._io, this, this._root));
          i++;
        }
      }

      return MessageIndexOffsets;
    })();
    Object.defineProperty(ChunkIndex.prototype, 'chunk', {
      get: function() {
        if (this._m_chunk !== undefined)
          return this._m_chunk;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.ofsChunk);
        this._raw__m_chunk = io.readBytes(this.lenChunk);
        var _io__raw__m_chunk = new KaitaiStream(this._raw__m_chunk);
        this._m_chunk = new Record(_io__raw__m_chunk, this, this._root);
        io.seek(_pos);
        return this._m_chunk;
      }
    });

    return ChunkIndex;
  })();

  var DataEnd = Mcap.DataEnd = (function() {
    function DataEnd(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DataEnd.prototype._read = function() {
      this.dataSectionCrc32 = this._io.readU4le();
    }

    /**
     * CRC-32 of all bytes in the data section. A value of 0 indicates the CRC-32 is not
     * available.
     */

    return DataEnd;
  })();

  var Footer = Mcap.Footer = (function() {
    function Footer(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Footer.prototype._read = function() {
      this.ofsSummarySection = this._io.readU8le();
      this.ofsSummaryOffsetSection = this._io.readU8le();
      this.summaryCrc32 = this._io.readU4le();
    }
    Object.defineProperty(Footer.prototype, 'ofsSummaryCrc32Input', {
      get: function() {
        if (this._m_ofsSummaryCrc32Input !== undefined)
          return this._m_ofsSummaryCrc32Input;
        this._m_ofsSummaryCrc32Input = (this.ofsSummarySection != 0 ? this.ofsSummarySection : this._root.ofsFooter);
        return this._m_ofsSummaryCrc32Input;
      }
    });
    Object.defineProperty(Footer.prototype, 'summaryCrc32Input', {
      get: function() {
        if (this._m_summaryCrc32Input !== undefined)
          return this._m_summaryCrc32Input;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.ofsSummaryCrc32Input);
        this._m_summaryCrc32Input = io.readBytes(((this._root._io.size - this.ofsSummaryCrc32Input) - 8) - 4);
        io.seek(_pos);
        return this._m_summaryCrc32Input;
      }
    });
    Object.defineProperty(Footer.prototype, 'summaryOffsetSection', {
      get: function() {
        if (this._m_summaryOffsetSection !== undefined)
          return this._m_summaryOffsetSection;
        if (this.ofsSummaryOffsetSection != 0) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this.ofsSummaryOffsetSection);
          this._raw__m_summaryOffsetSection = io.readBytes(this._root.ofsFooter - this.ofsSummaryOffsetSection);
          var _io__raw__m_summaryOffsetSection = new KaitaiStream(this._raw__m_summaryOffsetSection);
          this._m_summaryOffsetSection = new Records(_io__raw__m_summaryOffsetSection, this, this._root);
          io.seek(_pos);
        }
        return this._m_summaryOffsetSection;
      }
    });
    Object.defineProperty(Footer.prototype, 'summarySection', {
      get: function() {
        if (this._m_summarySection !== undefined)
          return this._m_summarySection;
        if (this.ofsSummarySection != 0) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this.ofsSummarySection);
          this._raw__m_summarySection = io.readBytes((this.ofsSummaryOffsetSection != 0 ? this.ofsSummaryOffsetSection : this._root.ofsFooter) - this.ofsSummarySection);
          var _io__raw__m_summarySection = new KaitaiStream(this._raw__m_summarySection);
          this._m_summarySection = new Records(_io__raw__m_summarySection, this, this._root);
          io.seek(_pos);
        }
        return this._m_summarySection;
      }
    });

    /**
     * A CRC-32 of all bytes from the start of the Summary section up through and
     * including the end of the previous field (summary_offset_start) in the footer
     * record. A value of 0 indicates the CRC-32 is not available.
     */

    return Footer;
  })();

  var Header = Mcap.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Header.prototype._read = function() {
      this.profile = new PrefixedStr(this._io, this, this._root);
      this.library = new PrefixedStr(this._io, this, this._root);
    }

    return Header;
  })();

  var Magic = Mcap.Magic = (function() {
    function Magic(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Magic.prototype._read = function() {
      this.magic = this._io.readBytes(8);
      if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([137, 77, 67, 65, 80, 48, 13, 10])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([137, 77, 67, 65, 80, 48, 13, 10]), this.magic, this._io, "/types/magic/seq/0");
      }
    }

    return Magic;
  })();

  var MapStrStr = Mcap.MapStrStr = (function() {
    function MapStrStr(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MapStrStr.prototype._read = function() {
      this.lenEntries = this._io.readU4le();
      this._raw_entries = this._io.readBytes(this.lenEntries);
      var _io__raw_entries = new KaitaiStream(this._raw_entries);
      this.entries = new Entries(_io__raw_entries, this, this._root);
    }

    var Entries = MapStrStr.Entries = (function() {
      function Entries(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Entries.prototype._read = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(new TupleStrStr(this._io, this, this._root));
          i++;
        }
      }

      return Entries;
    })();

    return MapStrStr;
  })();

  var Message = Mcap.Message = (function() {
    function Message(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Message.prototype._read = function() {
      this.channelId = this._io.readU2le();
      this.sequence = this._io.readU4le();
      this.logTime = this._io.readU8le();
      this.publishTime = this._io.readU8le();
      this.data = this._io.readBytesFull();
    }

    return Message;
  })();

  var MessageIndex = Mcap.MessageIndex = (function() {
    function MessageIndex(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MessageIndex.prototype._read = function() {
      this.channelId = this._io.readU2le();
      this.lenRecords = this._io.readU4le();
      this._raw_records = this._io.readBytes(this.lenRecords);
      var _io__raw_records = new KaitaiStream(this._raw_records);
      this.records = new MessageIndexEntries(_io__raw_records, this, this._root);
    }

    var MessageIndexEntries = MessageIndex.MessageIndexEntries = (function() {
      function MessageIndexEntries(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      MessageIndexEntries.prototype._read = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(new MessageIndexEntry(this._io, this, this._root));
          i++;
        }
      }

      return MessageIndexEntries;
    })();

    var MessageIndexEntry = MessageIndex.MessageIndexEntry = (function() {
      function MessageIndexEntry(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      MessageIndexEntry.prototype._read = function() {
        this.logTime = this._io.readU8le();
        this.offset = this._io.readU8le();
      }

      return MessageIndexEntry;
    })();

    return MessageIndex;
  })();

  var Metadata = Mcap.Metadata = (function() {
    function Metadata(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Metadata.prototype._read = function() {
      this.name = new PrefixedStr(this._io, this, this._root);
      this.metadata = new MapStrStr(this._io, this, this._root);
    }

    return Metadata;
  })();

  var MetadataIndex = Mcap.MetadataIndex = (function() {
    function MetadataIndex(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MetadataIndex.prototype._read = function() {
      this.ofsMetadata = this._io.readU8le();
      this.lenMetadata = this._io.readU8le();
      this.name = new PrefixedStr(this._io, this, this._root);
    }
    Object.defineProperty(MetadataIndex.prototype, 'metadata', {
      get: function() {
        if (this._m_metadata !== undefined)
          return this._m_metadata;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.ofsMetadata);
        this._raw__m_metadata = io.readBytes(this.lenMetadata);
        var _io__raw__m_metadata = new KaitaiStream(this._raw__m_metadata);
        this._m_metadata = new Record(_io__raw__m_metadata, this, this._root);
        io.seek(_pos);
        return this._m_metadata;
      }
    });

    return MetadataIndex;
  })();

  var PrefixedStr = Mcap.PrefixedStr = (function() {
    function PrefixedStr(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    PrefixedStr.prototype._read = function() {
      this.lenStr = this._io.readU4le();
      this.str = KaitaiStream.bytesToStr(this._io.readBytes(this.lenStr), "UTF-8");
    }

    return PrefixedStr;
  })();

  var Record = Mcap.Record = (function() {
    function Record(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Record.prototype._read = function() {
      this.op = this._io.readU1();
      this.lenBody = this._io.readU8le();
      switch (this.op) {
      case Mcap.Opcode.ATTACHMENT:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Attachment(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.ATTACHMENT_INDEX:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AttachmentIndex(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.CHANNEL:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Channel(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.CHUNK:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Chunk(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.CHUNK_INDEX:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new ChunkIndex(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.DATA_END:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new DataEnd(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.FOOTER:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Footer(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.HEADER:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Header(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.MESSAGE:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Message(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.MESSAGE_INDEX:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new MessageIndex(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.METADATA:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Metadata(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.METADATA_INDEX:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new MetadataIndex(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.SCHEMA:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Schema(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.STATISTICS:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Statistics(_io__raw_body, this, this._root);
        break;
      case Mcap.Opcode.SUMMARY_OFFSET:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SummaryOffset(_io__raw_body, this, this._root);
        break;
      default:
        this.body = this._io.readBytes(this.lenBody);
        break;
      }
    }

    return Record;
  })();

  var Records = Mcap.Records = (function() {
    function Records(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Records.prototype._read = function() {
      this.records = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.records.push(new Record(this._io, this, this._root));
        i++;
      }
    }

    return Records;
  })();

  var Schema = Mcap.Schema = (function() {
    function Schema(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Schema.prototype._read = function() {
      this.id = this._io.readU2le();
      this.name = new PrefixedStr(this._io, this, this._root);
      this.encoding = new PrefixedStr(this._io, this, this._root);
      this.lenData = this._io.readU4le();
      this.data = this._io.readBytes(this.lenData);
    }

    return Schema;
  })();

  var Statistics = Mcap.Statistics = (function() {
    function Statistics(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Statistics.prototype._read = function() {
      this.messageCount = this._io.readU8le();
      this.schemaCount = this._io.readU2le();
      this.channelCount = this._io.readU4le();
      this.attachmentCount = this._io.readU4le();
      this.metadataCount = this._io.readU4le();
      this.chunkCount = this._io.readU4le();
      this.messageStartTime = this._io.readU8le();
      this.messageEndTime = this._io.readU8le();
      this.lenChannelMessageCounts = this._io.readU4le();
      this._raw_channelMessageCounts = this._io.readBytes(this.lenChannelMessageCounts);
      var _io__raw_channelMessageCounts = new KaitaiStream(this._raw_channelMessageCounts);
      this.channelMessageCounts = new ChannelMessageCounts(_io__raw_channelMessageCounts, this, this._root);
    }

    var ChannelMessageCount = Statistics.ChannelMessageCount = (function() {
      function ChannelMessageCount(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      ChannelMessageCount.prototype._read = function() {
        this.channelId = this._io.readU2le();
        this.messageCount = this._io.readU8le();
      }

      return ChannelMessageCount;
    })();

    var ChannelMessageCounts = Statistics.ChannelMessageCounts = (function() {
      function ChannelMessageCounts(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      ChannelMessageCounts.prototype._read = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(new ChannelMessageCount(this._io, this, this._root));
          i++;
        }
      }

      return ChannelMessageCounts;
    })();

    return Statistics;
  })();

  var SummaryOffset = Mcap.SummaryOffset = (function() {
    function SummaryOffset(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SummaryOffset.prototype._read = function() {
      this.groupOpcode = this._io.readU1();
      this.ofsGroup = this._io.readU8le();
      this.lenGroup = this._io.readU8le();
    }
    Object.defineProperty(SummaryOffset.prototype, 'group', {
      get: function() {
        if (this._m_group !== undefined)
          return this._m_group;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.ofsGroup);
        this._raw__m_group = io.readBytes(this.lenGroup);
        var _io__raw__m_group = new KaitaiStream(this._raw__m_group);
        this._m_group = new Records(_io__raw__m_group, this, this._root);
        io.seek(_pos);
        return this._m_group;
      }
    });

    return SummaryOffset;
  })();

  var TupleStrStr = Mcap.TupleStrStr = (function() {
    function TupleStrStr(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    TupleStrStr.prototype._read = function() {
      this.key = new PrefixedStr(this._io, this, this._root);
      this.value = new PrefixedStr(this._io, this, this._root);
    }

    return TupleStrStr;
  })();
  Object.defineProperty(Mcap.prototype, 'footer', {
    get: function() {
      if (this._m_footer !== undefined)
        return this._m_footer;
      var _pos = this._io.pos;
      this._io.seek(this.ofsFooter);
      this._raw__m_footer = this._io.readBytesFull();
      var _io__raw__m_footer = new KaitaiStream(this._raw__m_footer);
      this._m_footer = new Record(_io__raw__m_footer, this, this._root);
      this._io.seek(_pos);
      return this._m_footer;
    }
  });
  Object.defineProperty(Mcap.prototype, 'ofsFooter', {
    get: function() {
      if (this._m_ofsFooter !== undefined)
        return this._m_ofsFooter;
      this._m_ofsFooter = (((this._io.size - 1) - 8) - 20) - 8;
      return this._m_ofsFooter;
    }
  });

  return Mcap;
})();
Mcap_.Mcap = Mcap;
});
