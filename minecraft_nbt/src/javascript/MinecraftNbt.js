// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.MinecraftNbt = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * A structured binary format native to Minecraft for saving game data and transferring
 * it over the network (in multiplayer), such as player data
 * ([`<player>.dat`](https://minecraft.gamepedia.com/Player.dat_format); contains
 * e.g. player's inventory and location), saved worlds
 * ([`level.dat`](
 *   https://minecraft.gamepedia.com/Java_Edition_level_format#level.dat_format
 * ) and [Chunk format](https://minecraft.gamepedia.com/Chunk_format#NBT_structure)),
 * list of saved multiplayer servers
 * ([`servers.dat`](https://minecraft.gamepedia.com/Servers.dat_format)) and so on -
 * see <https://minecraft.gamepedia.com/NBT_format#Uses>.
 * 
 * The entire file should be _gzip_-compressed (in accordance with the original
 * specification [NBT.txt](
 *   https://web.archive.org/web/20110723210920/https://www.minecraft.net/docs/NBT.txt
 * ) by Notch), but can also be compressed with _zlib_ or uncompressed.
 * 
 * This spec can only handle uncompressed NBT data, so be sure to first detect
 * what type of data you are dealing with. You can use the Unix `file` command
 * to do this:
 * 
 * ```shell
 * file --brief --mime-type input-unknown.nbt
 * ```
 * 
 * If it says:
 * 
 *   * `application/gzip`, you can decompress it by
 *     * `gunzip -c input-gzip.nbt > output.nbt` or
 *     * `python3 -c "import sys, gzip; sys.stdout.buffer.write(
 *       gzip.decompress(sys.stdin.buffer.read()) )" < input-gzip.nbt > output.nbt`
 *   * `application/zlib`, you can use
 *     * `openssl zlib -d -in input-zlib.nbt -out output.nbt` (does not work on most systems)
 *     * `python3 -c "import sys, zlib; sys.stdout.buffer.write(
 *       zlib.decompress(sys.stdin.buffer.read()) )" < input-zlib.nbt > output.nbt`
 *   * something else (especially `image/x-pcx` and `application/octet-stream`),
 *     it is most likely already uncompressed.
 * 
 * The file `output.nbt` generated by one of the above commands can already be
 * processed with this Kaitai Struct specification.
 * 
 * This spec **only** implements the Java edition format. There is also
 * a [Bedrock edition](https://wiki.vg/NBT#Bedrock_edition) NBT format,
 * which uses little-endian encoding and has a few other differences, but it isn't
 * as popular as the Java edition format.
 * 
 * **Implementation note:** strings in `TAG_String` are incorrectly decoded with
 * standard UTF-8, while they are encoded in [**Modified UTF-8**](
 *   https://docs.oracle.com/javase/8/docs/api/java/io/DataInput.html#modified-utf-8
 * ) (MUTF-8). That's because MUTF-8 is not supported natively by most target
 * languages, and thus one must use external libraries to achieve a fully-compliant
 * decoder. But decoding in standard UTF-8 is still better than nothing, and
 * it usually works fine.
 * 
 * All Unicode code points with incompatible representations in MUTF-8 and UTF-8 are
 * U+0000 (_NUL_), U+D800-U+DFFF (_High_ and _Low Surrogates_) and U+10000-U+10FFFF
 * (all _Supplementary_ Planes; includes e.g. emoticons, pictograms).
 * A _MUTF-8_-encoded string containing these code points cannot be successfully
 * decoded as UTF-8. The behavior in this case depends on the target language -
 * usually an exception is thrown, or the bytes that are not valid UTF-8
 * are replaced or ignored.
 * 
 * **Sample files:**
 * 
 *   * <https://wiki.vg/NBT#Download>
 *   * <https://github.com/twoolie/NBT/blob/f9e892e/tests/world_test/data/scoreboard.dat>
 *   * <https://github.com/chmod222/cNBT/tree/3f74b69/testdata>
 *   * <https://github.com/PistonDevelopers/hematite_nbt/tree/0b85f89/tests>
 * @see {@link https://wiki.vg/NBT|Source}
 * @see {@link https://web.archive.org/web/20110723210920/https://www.minecraft.net/docs/NBT.txt|Source}
 * @see {@link https://minecraft.gamepedia.com/NBT_format|Source}
 */

var MinecraftNbt = (function() {
  MinecraftNbt.Tag = Object.freeze({
    END: 0,
    BYTE: 1,
    SHORT: 2,
    INT: 3,
    LONG: 4,
    FLOAT: 5,
    DOUBLE: 6,
    BYTE_ARRAY: 7,
    STRING: 8,
    LIST: 9,
    COMPOUND: 10,
    INT_ARRAY: 11,
    LONG_ARRAY: 12,

    0: "END",
    1: "BYTE",
    2: "SHORT",
    3: "INT",
    4: "LONG",
    5: "FLOAT",
    6: "DOUBLE",
    7: "BYTE_ARRAY",
    8: "STRING",
    9: "LIST",
    10: "COMPOUND",
    11: "INT_ARRAY",
    12: "LONG_ARRAY",
  });

  function MinecraftNbt(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  MinecraftNbt.prototype._read = function() {
    if ( ((this.rootType == MinecraftNbt.Tag.END) && (false)) ) {
      this.rootCheck = this._io.readBytes(0);
    }
    this.root = new NamedTag(this._io, this, this._root);
  }

  var TagLongArray = MinecraftNbt.TagLongArray = (function() {
    function TagLongArray(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TagLongArray.prototype._read = function() {
      this.numTags = this._io.readS4be();
      this.tags = new Array(this.numTags);
      for (var i = 0; i < this.numTags; i++) {
        this.tags[i] = this._io.readS8be();
      }
    }
    Object.defineProperty(TagLongArray.prototype, 'tagsType', {
      get: function() {
        if (this._m_tagsType !== undefined)
          return this._m_tagsType;
        this._m_tagsType = MinecraftNbt.Tag.LONG;
        return this._m_tagsType;
      }
    });

    return TagLongArray;
  })();

  var TagByteArray = MinecraftNbt.TagByteArray = (function() {
    function TagByteArray(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TagByteArray.prototype._read = function() {
      this.lenData = this._io.readS4be();
      this.data = this._io.readBytes(this.lenData);
    }

    return TagByteArray;
  })();

  var TagIntArray = MinecraftNbt.TagIntArray = (function() {
    function TagIntArray(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TagIntArray.prototype._read = function() {
      this.numTags = this._io.readS4be();
      this.tags = new Array(this.numTags);
      for (var i = 0; i < this.numTags; i++) {
        this.tags[i] = this._io.readS4be();
      }
    }
    Object.defineProperty(TagIntArray.prototype, 'tagsType', {
      get: function() {
        if (this._m_tagsType !== undefined)
          return this._m_tagsType;
        this._m_tagsType = MinecraftNbt.Tag.INT;
        return this._m_tagsType;
      }
    });

    return TagIntArray;
  })();

  var TagList = MinecraftNbt.TagList = (function() {
    function TagList(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TagList.prototype._read = function() {
      this.tagsType = this._io.readU1();
      this.numTags = this._io.readS4be();
      this.tags = new Array(this.numTags);
      for (var i = 0; i < this.numTags; i++) {
        switch (this.tagsType) {
        case MinecraftNbt.Tag.LONG_ARRAY:
          this.tags[i] = new TagLongArray(this._io, this, this._root);
          break;
        case MinecraftNbt.Tag.COMPOUND:
          this.tags[i] = new TagCompound(this._io, this, this._root);
          break;
        case MinecraftNbt.Tag.DOUBLE:
          this.tags[i] = this._io.readF8be();
          break;
        case MinecraftNbt.Tag.LIST:
          this.tags[i] = new TagList(this._io, this, this._root);
          break;
        case MinecraftNbt.Tag.FLOAT:
          this.tags[i] = this._io.readF4be();
          break;
        case MinecraftNbt.Tag.SHORT:
          this.tags[i] = this._io.readS2be();
          break;
        case MinecraftNbt.Tag.INT:
          this.tags[i] = this._io.readS4be();
          break;
        case MinecraftNbt.Tag.BYTE_ARRAY:
          this.tags[i] = new TagByteArray(this._io, this, this._root);
          break;
        case MinecraftNbt.Tag.BYTE:
          this.tags[i] = this._io.readS1();
          break;
        case MinecraftNbt.Tag.INT_ARRAY:
          this.tags[i] = new TagIntArray(this._io, this, this._root);
          break;
        case MinecraftNbt.Tag.STRING:
          this.tags[i] = new TagString(this._io, this, this._root);
          break;
        case MinecraftNbt.Tag.LONG:
          this.tags[i] = this._io.readS8be();
          break;
        }
      }
    }

    return TagList;
  })();

  var TagString = MinecraftNbt.TagString = (function() {
    function TagString(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TagString.prototype._read = function() {
      this.lenData = this._io.readU2be();
      this.data = KaitaiStream.bytesToStr(this._io.readBytes(this.lenData), "utf-8");
    }

    /**
     * unsigned according to https://wiki.vg/NBT#Specification
     */

    return TagString;
  })();

  var TagCompound = MinecraftNbt.TagCompound = (function() {
    function TagCompound(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TagCompound.prototype._read = function() {
      this.tags = []
      var i = 0;
      do {
        var _ = new NamedTag(this._io, this, this._root);
        this.tags.push(_);
        i++;
      } while (!(_.isTagEnd));
    }
    Object.defineProperty(TagCompound.prototype, 'dumpNumTags', {
      get: function() {
        if (this._m_dumpNumTags !== undefined)
          return this._m_dumpNumTags;
        this._m_dumpNumTags = (this.tags.length - ( ((this.tags.length >= 1) && (this.tags[this.tags.length - 1].isTagEnd))  ? 1 : 0));
        return this._m_dumpNumTags;
      }
    });

    return TagCompound;
  })();

  var NamedTag = MinecraftNbt.NamedTag = (function() {
    function NamedTag(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    NamedTag.prototype._read = function() {
      this.type = this._io.readU1();
      if (!(this.isTagEnd)) {
        this.name = new TagString(this._io, this, this._root);
      }
      if (!(this.isTagEnd)) {
        switch (this.type) {
        case MinecraftNbt.Tag.LONG_ARRAY:
          this.payload = new TagLongArray(this._io, this, this._root);
          break;
        case MinecraftNbt.Tag.COMPOUND:
          this.payload = new TagCompound(this._io, this, this._root);
          break;
        case MinecraftNbt.Tag.DOUBLE:
          this.payload = this._io.readF8be();
          break;
        case MinecraftNbt.Tag.LIST:
          this.payload = new TagList(this._io, this, this._root);
          break;
        case MinecraftNbt.Tag.FLOAT:
          this.payload = this._io.readF4be();
          break;
        case MinecraftNbt.Tag.SHORT:
          this.payload = this._io.readS2be();
          break;
        case MinecraftNbt.Tag.INT:
          this.payload = this._io.readS4be();
          break;
        case MinecraftNbt.Tag.BYTE_ARRAY:
          this.payload = new TagByteArray(this._io, this, this._root);
          break;
        case MinecraftNbt.Tag.BYTE:
          this.payload = this._io.readS1();
          break;
        case MinecraftNbt.Tag.INT_ARRAY:
          this.payload = new TagIntArray(this._io, this, this._root);
          break;
        case MinecraftNbt.Tag.STRING:
          this.payload = new TagString(this._io, this, this._root);
          break;
        case MinecraftNbt.Tag.LONG:
          this.payload = this._io.readS8be();
          break;
        }
      }
    }
    Object.defineProperty(NamedTag.prototype, 'isTagEnd', {
      get: function() {
        if (this._m_isTagEnd !== undefined)
          return this._m_isTagEnd;
        this._m_isTagEnd = this.type == MinecraftNbt.Tag.END;
        return this._m_isTagEnd;
      }
    });

    return NamedTag;
  })();
  Object.defineProperty(MinecraftNbt.prototype, 'rootType', {
    get: function() {
      if (this._m_rootType !== undefined)
        return this._m_rootType;
      var _pos = this._io.pos;
      this._io.seek(0);
      this._m_rootType = this._io.readU1();
      this._io.seek(_pos);
      if (!(this.rootType == MinecraftNbt.Tag.COMPOUND)) {
        throw new KaitaiStream.ValidationNotEqualError(MinecraftNbt.Tag.COMPOUND, this.rootType, this._io, "/instances/root_type");
      }
      return this._m_rootType;
    }
  });

  return MinecraftNbt;
})();
return MinecraftNbt;
}));
