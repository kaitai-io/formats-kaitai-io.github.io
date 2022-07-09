// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.ChromePak = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * Format mostly used by Google Chrome and various Android apps to store
 * resources such as translated strings, help messages and images.
 * @see {@link https://dev.chromium.org/developers/design-documents/linuxresourcesandlocalizedstrings|Source}
 * @see {@link https://chromium.googlesource.com/chromium/src/tools/grit/+/3c36f27/grit/format/data_pack.py|Source}
 * @see {@link https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/grit/format/data_pack.py|Source}
 */

var ChromePak = (function() {
  ChromePak.Encodings = Object.freeze({
    BINARY: 0,
    UTF8: 1,
    UTF16: 2,

    0: "BINARY",
    1: "UTF8",
    2: "UTF16",
  });

  function ChromePak(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  ChromePak.prototype._read = function() {
    this.version = this._io.readU4le();
    if (!( ((this.version == 4) || (this.version == 5)) )) {
      throw new KaitaiStream.ValidationNotAnyOfError(this.version, this._io, "/seq/0");
    }
    if (this.version == 4) {
      this.numResourcesV4 = this._io.readU4le();
    }
    this.encoding = this._io.readU1();
    if (this.version == 5) {
      this.v5Part = new HeaderV5Part(this._io, this, this._root);
    }
    this.resources = [];
    for (var i = 0; i < (this.numResources + 1); i++) {
      this.resources.push(new Resource(this._io, this, this._root, i, i < this.numResources));
    }
    this.aliases = [];
    for (var i = 0; i < this.numAliases; i++) {
      this.aliases.push(new Alias(this._io, this, this._root));
    }
  }

  var HeaderV5Part = ChromePak.HeaderV5Part = (function() {
    function HeaderV5Part(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HeaderV5Part.prototype._read = function() {
      this.encodingPadding = this._io.readBytes(3);
      this.numResources = this._io.readU2le();
      this.numAliases = this._io.readU2le();
    }

    return HeaderV5Part;
  })();

  var Resource = ChromePak.Resource = (function() {
    function Resource(_io, _parent, _root, idx, hasBody) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.idx = idx;
      this.hasBody = hasBody;

      this._read();
    }
    Resource.prototype._read = function() {
      this.id = this._io.readU2le();
      this.ofsBody = this._io.readU4le();
    }

    /**
     * MUST NOT be accessed until the next `resource` is parsed
     */
    Object.defineProperty(Resource.prototype, 'lenBody', {
      get: function() {
        if (this._m_lenBody !== undefined)
          return this._m_lenBody;
        if (this.hasBody) {
          this._m_lenBody = (this._parent.resources[(this.idx + 1)].ofsBody - this.ofsBody);
        }
        return this._m_lenBody;
      }
    });

    /**
     * MUST NOT be accessed until the next `resource` is parsed
     */
    Object.defineProperty(Resource.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        if (this.hasBody) {
          var _pos = this._io.pos;
          this._io.seek(this.ofsBody);
          this._m_body = this._io.readBytes(this.lenBody);
          this._io.seek(_pos);
        }
        return this._m_body;
      }
    });

    return Resource;
  })();

  var Alias = ChromePak.Alias = (function() {
    function Alias(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Alias.prototype._read = function() {
      this.id = this._io.readU2le();
      this.resourceIdx = this._io.readU2le();
      if (!(this.resourceIdx <= (this._parent.numResources - 1))) {
        throw new KaitaiStream.ValidationGreaterThanError((this._parent.numResources - 1), this.resourceIdx, this._io, "/types/alias/seq/1");
      }
    }
    Object.defineProperty(Alias.prototype, 'resource', {
      get: function() {
        if (this._m_resource !== undefined)
          return this._m_resource;
        this._m_resource = this._parent.resources[this.resourceIdx];
        return this._m_resource;
      }
    });

    return Alias;
  })();
  Object.defineProperty(ChromePak.prototype, 'numResources', {
    get: function() {
      if (this._m_numResources !== undefined)
        return this._m_numResources;
      this._m_numResources = (this.version == 5 ? this.v5Part.numResources : this.numResourcesV4);
      return this._m_numResources;
    }
  });
  Object.defineProperty(ChromePak.prototype, 'numAliases', {
    get: function() {
      if (this._m_numAliases !== undefined)
        return this._m_numAliases;
      this._m_numAliases = (this.version == 5 ? this.v5Part.numAliases : 0);
      return this._m_numAliases;
    }
  });

  /**
   * only versions 4 and 5 are supported
   */

  /**
   * Character encoding of all text resources in the PAK file. Note that
   * the file can **always** contain binary resources, this only applies to
   * those that are supposed to hold text.
   * 
   * In practice, this will probably always be `encodings::utf8` - I haven't
   * seen any organic file that would state otherwise. `UTF8` is also usually
   * hardcoded in Python scripts from the GRIT repository that generate .pak
   * files (for example
   * [`pak_util.py:79`](https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/pak_util.py#79)).
   */

  /**
   * The length is calculated by looking at the offset of
   * the next item, so an extra entry is stored with id 0
   * and offset pointing to the end of the resources.
   */

  return ChromePak;
})();
return ChromePak;
}));
