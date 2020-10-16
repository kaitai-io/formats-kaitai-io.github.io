// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Riff = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * The Resource Interchange File Format (RIFF) is a generic file container format
 * for storing data in tagged chunks. It is primarily used to store multimedia
 * such as sound and video, though it may also be used to store any arbitrary data.
 * 
 * The Microsoft implementation is mostly known through container formats
 * like AVI, ANI and WAV, which use RIFF as their basis.
 * @see {@link https://www.johnloomis.org/cpe102/asgn/asgn1/riff.html|Source}
 */

var Riff = (function() {
  Riff.Fourcc = Object.freeze({
    RIFF: 1179011410,
    INFO: 1330007625,
    LIST: 1414744396,

    1179011410: "RIFF",
    1330007625: "INFO",
    1414744396: "LIST",
  });

  function Riff(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Riff.prototype._read = function() {
    this.chunk = new Chunk(this._io, this, this._root);
  }

  var ListChunkData = Riff.ListChunkData = (function() {
    function ListChunkData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ListChunkData.prototype._read = function() {
      if (this.parentChunkDataOfs < 0) {
        this.saveParentChunkDataOfs = this._io.readBytes(0);
      }
      this.parentChunkData = new ParentChunkData(this._io, this, this._root);
    }
    Object.defineProperty(ListChunkData.prototype, 'parentChunkDataOfs', {
      get: function() {
        if (this._m_parentChunkDataOfs !== undefined)
          return this._m_parentChunkDataOfs;
        this._m_parentChunkDataOfs = this._io.pos;
        return this._m_parentChunkDataOfs;
      }
    });
    Object.defineProperty(ListChunkData.prototype, 'formType', {
      get: function() {
        if (this._m_formType !== undefined)
          return this._m_formType;
        this._m_formType = this.parentChunkData.formType;
        return this._m_formType;
      }
    });
    Object.defineProperty(ListChunkData.prototype, 'formTypeReadable', {
      get: function() {
        if (this._m_formTypeReadable !== undefined)
          return this._m_formTypeReadable;
        var _pos = this._io.pos;
        this._io.seek(this.parentChunkDataOfs);
        this._m_formTypeReadable = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
        this._io.seek(_pos);
        return this._m_formTypeReadable;
      }
    });
    Object.defineProperty(ListChunkData.prototype, 'subchunks', {
      get: function() {
        if (this._m_subchunks !== undefined)
          return this._m_subchunks;
        var io = this.parentChunkData.subchunksSlot._io;
        var _pos = io.pos;
        io.seek(0);
        this._m_subchunks = [];
        var i = 0;
        while (!io.isEof()) {
          switch (this.formType) {
          case Riff.Fourcc.INFO:
            this._m_subchunks.push(new InfoSubchunk(io, this, this._root));
            break;
          default:
            this._m_subchunks.push(new ChunkType(io, this, this._root));
            break;
          }
          i++;
        }
        io.seek(_pos);
        return this._m_subchunks;
      }
    });

    return ListChunkData;
  })();

  var Chunk = Riff.Chunk = (function() {
    function Chunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Chunk.prototype._read = function() {
      this.id = this._io.readU4le();
      this.len = this._io.readU4le();
      this._raw_dataSlot = this._io.readBytes(this.len);
      var _io__raw_dataSlot = new KaitaiStream(this._raw_dataSlot);
      this.dataSlot = new Slot(_io__raw_dataSlot, this, this._root);
      this.padByte = this._io.readBytes(KaitaiStream.mod(this.len, 2));
    }

    var Slot = Chunk.Slot = (function() {
      function Slot(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Slot.prototype._read = function() {
      }

      return Slot;
    })();

    return Chunk;
  })();

  var ParentChunkData = Riff.ParentChunkData = (function() {
    function ParentChunkData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ParentChunkData.prototype._read = function() {
      this.formType = this._io.readU4le();
      this._raw_subchunksSlot = this._io.readBytesFull();
      var _io__raw_subchunksSlot = new KaitaiStream(this._raw_subchunksSlot);
      this.subchunksSlot = new Slot(_io__raw_subchunksSlot, this, this._root);
    }

    var Slot = ParentChunkData.Slot = (function() {
      function Slot(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Slot.prototype._read = function() {
      }

      return Slot;
    })();

    return ParentChunkData;
  })();

  /**
   * All registered subchunks in the INFO chunk are NULL-terminated strings,
   * but the unregistered might not be. By convention, the registered
   * chunk IDs are in uppercase and the unregistered IDs are in lowercase.
   * 
   * If the chunk ID of an INFO subchunk contains a lowercase
   * letter, this chunk is considered as unregistered and thus we can make
   * no assumptions about the type of data.
   */

  var InfoSubchunk = Riff.InfoSubchunk = (function() {
    function InfoSubchunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    InfoSubchunk.prototype._read = function() {
      if (this.chunkOfs < 0) {
        this.saveChunkOfs = this._io.readBytes(0);
      }
      this.chunk = new Chunk(this._io, this, this._root);
    }
    Object.defineProperty(InfoSubchunk.prototype, 'chunkData', {
      get: function() {
        if (this._m_chunkData !== undefined)
          return this._m_chunkData;
        var io = this.chunk.dataSlot._io;
        var _pos = io.pos;
        io.seek(0);
        switch (this.isUnregisteredTag) {
        case false:
          this._m_chunkData = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
          break;
        }
        io.seek(_pos);
        return this._m_chunkData;
      }
    });

    /**
     * Check if chunk_id contains lowercase characters ([a-z], ASCII 97 = a, ASCII 122 = z).
     */
    Object.defineProperty(InfoSubchunk.prototype, 'isUnregisteredTag', {
      get: function() {
        if (this._m_isUnregisteredTag !== undefined)
          return this._m_isUnregisteredTag;
        this._m_isUnregisteredTag =  (( ((this.idChars[0] >= 97) && (this.idChars[0] <= 122)) ) || ( ((this.idChars[1] >= 97) && (this.idChars[1] <= 122)) ) || ( ((this.idChars[2] >= 97) && (this.idChars[2] <= 122)) ) || ( ((this.idChars[3] >= 97) && (this.idChars[3] <= 122)) )) ;
        return this._m_isUnregisteredTag;
      }
    });
    Object.defineProperty(InfoSubchunk.prototype, 'idChars', {
      get: function() {
        if (this._m_idChars !== undefined)
          return this._m_idChars;
        var _pos = this._io.pos;
        this._io.seek(this.chunkOfs);
        this._m_idChars = this._io.readBytes(4);
        this._io.seek(_pos);
        return this._m_idChars;
      }
    });
    Object.defineProperty(InfoSubchunk.prototype, 'chunkIdReadable', {
      get: function() {
        if (this._m_chunkIdReadable !== undefined)
          return this._m_chunkIdReadable;
        this._m_chunkIdReadable = KaitaiStream.bytesToStr(this.idChars, "ASCII");
        return this._m_chunkIdReadable;
      }
    });
    Object.defineProperty(InfoSubchunk.prototype, 'chunkOfs', {
      get: function() {
        if (this._m_chunkOfs !== undefined)
          return this._m_chunkOfs;
        this._m_chunkOfs = this._io.pos;
        return this._m_chunkOfs;
      }
    });

    return InfoSubchunk;
  })();

  var ChunkType = Riff.ChunkType = (function() {
    function ChunkType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ChunkType.prototype._read = function() {
      if (this.chunkOfs < 0) {
        this.saveChunkOfs = this._io.readBytes(0);
      }
      this.chunk = new Chunk(this._io, this, this._root);
    }
    Object.defineProperty(ChunkType.prototype, 'chunkOfs', {
      get: function() {
        if (this._m_chunkOfs !== undefined)
          return this._m_chunkOfs;
        this._m_chunkOfs = this._io.pos;
        return this._m_chunkOfs;
      }
    });
    Object.defineProperty(ChunkType.prototype, 'chunkId', {
      get: function() {
        if (this._m_chunkId !== undefined)
          return this._m_chunkId;
        this._m_chunkId = this.chunk.id;
        return this._m_chunkId;
      }
    });
    Object.defineProperty(ChunkType.prototype, 'chunkIdReadable', {
      get: function() {
        if (this._m_chunkIdReadable !== undefined)
          return this._m_chunkIdReadable;
        var _pos = this._io.pos;
        this._io.seek(this.chunkOfs);
        this._m_chunkIdReadable = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
        this._io.seek(_pos);
        return this._m_chunkIdReadable;
      }
    });
    Object.defineProperty(ChunkType.prototype, 'chunkData', {
      get: function() {
        if (this._m_chunkData !== undefined)
          return this._m_chunkData;
        var io = this.chunk.dataSlot._io;
        var _pos = io.pos;
        io.seek(0);
        switch (this.chunkId) {
        case Riff.Fourcc.LIST:
          this._m_chunkData = new ListChunkData(io, this, this._root);
          break;
        }
        io.seek(_pos);
        return this._m_chunkData;
      }
    });

    return ChunkType;
  })();
  Object.defineProperty(Riff.prototype, 'chunkId', {
    get: function() {
      if (this._m_chunkId !== undefined)
        return this._m_chunkId;
      this._m_chunkId = this.chunk.id;
      return this._m_chunkId;
    }
  });
  Object.defineProperty(Riff.prototype, 'isRiffChunk', {
    get: function() {
      if (this._m_isRiffChunk !== undefined)
        return this._m_isRiffChunk;
      this._m_isRiffChunk = this.chunkId == Riff.Fourcc.RIFF;
      return this._m_isRiffChunk;
    }
  });
  Object.defineProperty(Riff.prototype, 'parentChunkData', {
    get: function() {
      if (this._m_parentChunkData !== undefined)
        return this._m_parentChunkData;
      if (this.isRiffChunk) {
        var io = this.chunk.dataSlot._io;
        var _pos = io.pos;
        io.seek(0);
        this._m_parentChunkData = new ParentChunkData(io, this, this._root);
        io.seek(_pos);
      }
      return this._m_parentChunkData;
    }
  });
  Object.defineProperty(Riff.prototype, 'subchunks', {
    get: function() {
      if (this._m_subchunks !== undefined)
        return this._m_subchunks;
      if (this.isRiffChunk) {
        var io = this.parentChunkData.subchunksSlot._io;
        var _pos = io.pos;
        io.seek(0);
        this._m_subchunks = [];
        var i = 0;
        while (!io.isEof()) {
          this._m_subchunks.push(new ChunkType(io, this, this._root));
          i++;
        }
        io.seek(_pos);
      }
      return this._m_subchunks;
    }
  });

  return Riff;
})();
return Riff;
}));
