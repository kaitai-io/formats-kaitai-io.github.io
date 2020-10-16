// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.GettextMo = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * [GNU gettext](https://www.gnu.org/software/gettext/) is a popular
 * solution in free/open source software world to do i18n/l10n of
 * software, by providing translated strings that will substitute
 * strings in original language (typically, English).
 * 
 * gettext .mo is a binary database format which stores these string
 * translation pairs in an efficient binary format, ready to be used by
 * gettext-enabled software. .mo format is a result of compilation of
 * text-based .po files using
 * [msgfmt](https://www.gnu.org/software/gettext/manual/html_node/msgfmt-Invocation.html#msgfmt-Invocation)
 * utility. The reverse conversion (.mo -> .po) is also possible using
 * [msgunfmt](https://www.gnu.org/software/gettext/manual/html_node/msgunfmt-Invocation.html#msgunfmt-Invocation)
 * decompiler utility.
 * @see {@link https://gitlab.com/worr/libintl|Source}
 */

var GettextMo = (function() {
  function GettextMo(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  GettextMo.prototype._read = function() {
    this.signature = this._io.readBytes(4);
    this.mo = new Mo(this._io, this, this._root);
  }

  var HashLookupIteration = GettextMo.HashLookupIteration = (function() {
    function HashLookupIteration(_io, _parent, _root, idx, collisionStep) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.idx = idx;
      this.collisionStep = collisionStep;

      this._read();
    }
    HashLookupIteration.prototype._read = function() {
    }
    Object.defineProperty(HashLookupIteration.prototype, 'original', {
      get: function() {
        if (this._m_original !== undefined)
          return this._m_original;
        this._m_original = this._root.mo.originals[this.idx].str;
        return this._m_original;
      }
    });
    Object.defineProperty(HashLookupIteration.prototype, 'translation', {
      get: function() {
        if (this._m_translation !== undefined)
          return this._m_translation;
        this._m_translation = this._root.mo.translations[this.idx].str;
        return this._m_translation;
      }
    });
    Object.defineProperty(HashLookupIteration.prototype, 'nextIdx', {
      get: function() {
        if (this._m_nextIdx !== undefined)
          return this._m_nextIdx;
        this._m_nextIdx = ((this.idx + this.collisionStep) - (this.idx >= (this._root.mo.numHashtableItems - this.collisionStep) ? this._root.mo.numHashtableItems : 0));
        return this._m_nextIdx;
      }
    });
    Object.defineProperty(HashLookupIteration.prototype, 'next', {
      get: function() {
        if (this._m_next !== undefined)
          return this._m_next;
        var _pos = this._io.pos;
        this._io.seek(0);
        this._m_next = new HashLookupIteration(this._io, this, this._root, this._root.mo.hashtableItems[this.nextIdx].val, this.collisionStep);
        this._io.seek(_pos);
        return this._m_next;
      }
    });

    return HashLookupIteration;
  })();

  var LookupIteration = GettextMo.LookupIteration = (function() {
    function LookupIteration(_io, _parent, _root, current, query) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.current = current;
      this.query = query;

      this._read();
    }
    LookupIteration.prototype._read = function() {
    }
    Object.defineProperty(LookupIteration.prototype, 'found', {
      get: function() {
        if (this._m_found !== undefined)
          return this._m_found;
        this._m_found = this.query == this.current.original;
        return this._m_found;
      }
    });
    Object.defineProperty(LookupIteration.prototype, 'next', {
      get: function() {
        if (this._m_next !== undefined)
          return this._m_next;
        if (!(this.found)) {
          var _pos = this._io.pos;
          this._io.seek(0);
          this._m_next = new LookupIteration(this._io, this, this._root, this.current.next, this.query);
          this._io.seek(_pos);
        }
        return this._m_next;
      }
    });

    return LookupIteration;
  })();

  /**
   * def lookup(s:str, t:gettext_mo.GettextMo):
   *   try:
   *     l=gettext_mo.GettextMo.HashtableLookup(s, string_hash(s), t._io, _parent=t, _root=t)
   *     e=l.entry
   *     while(not e.found):
   *       e=e.next
   *     return e.current
   *   except:
   *     raise Exception("Not found "+s+" in the hashtable!")
   * 
   * lookup(t.mo.originals[145].str, t)
   * @see {@link https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/gettext.c|Source}
   */

  var HashtableLookup = GettextMo.HashtableLookup = (function() {
    function HashtableLookup(_io, _parent, _root, query, hash) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.query = query;
      this.hash = hash;

      this._read();
    }
    HashtableLookup.prototype._read = function() {
    }
    Object.defineProperty(HashtableLookup.prototype, 'collisionStep', {
      get: function() {
        if (this._m_collisionStep !== undefined)
          return this._m_collisionStep;
        this._m_collisionStep = (KaitaiStream.mod(this.hash, (this._root.mo.numHashtableItems - 2)) + 1);
        return this._m_collisionStep;
      }
    });
    Object.defineProperty(HashtableLookup.prototype, 'idx', {
      get: function() {
        if (this._m_idx !== undefined)
          return this._m_idx;
        this._m_idx = KaitaiStream.mod(this.hash, this._root.mo.numHashtableItems);
        return this._m_idx;
      }
    });
    Object.defineProperty(HashtableLookup.prototype, 'hashLookupIteration', {
      get: function() {
        if (this._m_hashLookupIteration !== undefined)
          return this._m_hashLookupIteration;
        var _pos = this._io.pos;
        this._io.seek(0);
        this._m_hashLookupIteration = new HashLookupIteration(this._io, this, this._root, this._root.mo.hashtableItems[this.idx].val, this.collisionStep);
        this._io.seek(_pos);
        return this._m_hashLookupIteration;
      }
    });
    Object.defineProperty(HashtableLookup.prototype, 'entry', {
      get: function() {
        if (this._m_entry !== undefined)
          return this._m_entry;
        var _pos = this._io.pos;
        this._io.seek(0);
        this._m_entry = new LookupIteration(this._io, this, this._root, this.hashLookupIteration, this.query);
        this._io.seek(_pos);
        return this._m_entry;
      }
    });

    /**
     * def string_hash(s):
     *   s=s.encode("utf-8")
     *   h = 0
     *   for i in range(len(s)):
     *     h = h << 4
     *     h += s[i]
     *     tmp = h & 0xF0000000
     *     if tmp != 0:
     *       h ^= tmp
     *       h ^= tmp >> 24
     *   return h
     * @see {@link https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/strhash.c|Source}
     */

    return HashtableLookup;
  })();

  var Mo = GettextMo.Mo = (function() {
    function Mo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Mo.prototype._read = function() {
      {
        var on = this._root.signature;
        if ((KaitaiStream.byteArrayCompare(on, [222, 18, 4, 149]) == 0)) {
          this._is_le = true;
        }
        else if ((KaitaiStream.byteArrayCompare(on, [149, 4, 18, 222]) == 0)) {
          this._is_le = false;
        }
      }

      if (this._is_le === true) {
        this._readLE();
      } else if (this._is_le === false) {
        this._readBE();
      } else {
        throw new KaitaiStream.UndecidedEndiannessError();
      }
    }
    Mo.prototype._readLE = function() {
      this.version = new Version(this._io, this, this._root, this._is_le);
      this.numTranslations = this._io.readU4le();
      this.ofsOriginals = this._io.readU4le();
      this.ofsTranslations = this._io.readU4le();
      this.numHashtableItems = this._io.readU4le();
      this.ofsHashtableItems = this._io.readU4le();
    }
    Mo.prototype._readBE = function() {
      this.version = new Version(this._io, this, this._root, this._is_le);
      this.numTranslations = this._io.readU4be();
      this.ofsOriginals = this._io.readU4be();
      this.ofsTranslations = this._io.readU4be();
      this.numHashtableItems = this._io.readU4be();
      this.ofsHashtableItems = this._io.readU4be();
    }

    var Version = Mo.Version = (function() {
      function Version(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this._is_le = _is_le;

        this._read();
      }
      Version.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Version.prototype._readLE = function() {
        this.versionRaw = this._io.readU4le();
      }
      Version.prototype._readBE = function() {
        this.versionRaw = this._io.readU4be();
      }
      Object.defineProperty(Version.prototype, 'major', {
        get: function() {
          if (this._m_major !== undefined)
            return this._m_major;
          this._m_major = (this.versionRaw >>> 16);
          return this._m_major;
        }
      });
      Object.defineProperty(Version.prototype, 'minor', {
        get: function() {
          if (this._m_minor !== undefined)
            return this._m_minor;
          this._m_minor = (this.versionRaw & 65535);
          return this._m_minor;
        }
      });

      return Version;
    })();

    var HashtableItem = Mo.HashtableItem = (function() {
      function HashtableItem(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this._is_le = _is_le;

        this._read();
      }
      HashtableItem.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      HashtableItem.prototype._readLE = function() {
        this.rawVal = this._io.readU4le();
      }
      HashtableItem.prototype._readBE = function() {
        this.rawVal = this._io.readU4be();
      }
      Object.defineProperty(HashtableItem.prototype, 'mask', {
        get: function() {
          if (this._m_mask !== undefined)
            return this._m_mask;
          this._m_mask = 2147483648;
          return this._m_mask;
        }
      });
      Object.defineProperty(HashtableItem.prototype, 'val1', {
        get: function() {
          if (this._m_val1 !== undefined)
            return this._m_val1;
          if (this.rawVal != 0) {
            this._m_val1 = (this.rawVal - 1);
          }
          return this._m_val1;
        }
      });
      Object.defineProperty(HashtableItem.prototype, 'isSystemDependent', {
        get: function() {
          if (this._m_isSystemDependent !== undefined)
            return this._m_isSystemDependent;
          if (this.rawVal != 0) {
            this._m_isSystemDependent = (this.val1 & this.mask) == 1;
          }
          return this._m_isSystemDependent;
        }
      });
      Object.defineProperty(HashtableItem.prototype, 'val', {
        get: function() {
          if (this._m_val !== undefined)
            return this._m_val;
          if (this.rawVal != 0) {
            this._m_val = (this.val1 & ~(this.mask));
          }
          return this._m_val;
        }
      });

      return HashtableItem;
    })();

    var Descriptor = Mo.Descriptor = (function() {
      function Descriptor(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this._is_le = _is_le;

        this._read();
      }
      Descriptor.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Descriptor.prototype._readLE = function() {
        this.lenStr = this._io.readU4le();
        this.ofsStr = this._io.readU4le();
      }
      Descriptor.prototype._readBE = function() {
        this.lenStr = this._io.readU4be();
        this.ofsStr = this._io.readU4be();
      }
      Object.defineProperty(Descriptor.prototype, 'str', {
        get: function() {
          if (this._m_str !== undefined)
            return this._m_str;
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this.ofsStr);
          if (this._is_le) {
            this._m_str = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(io.readBytes(this.lenStr), 0, false), "UTF-8");
          } else {
            this._m_str = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(io.readBytes(this.lenStr), 0, false), "UTF-8");
          }
          io.seek(_pos);
          return this._m_str;
        }
      });

      return Descriptor;
    })();
    Object.defineProperty(Mo.prototype, 'originals', {
      get: function() {
        if (this._m_originals !== undefined)
          return this._m_originals;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.ofsOriginals);
        if (this._is_le) {
          this._m_originals = new Array(this.numTranslations);
          for (var i = 0; i < this.numTranslations; i++) {
            this._m_originals[i] = new Descriptor(io, this, this._root, this._is_le);
          }
        } else {
          this._m_originals = new Array(this.numTranslations);
          for (var i = 0; i < this.numTranslations; i++) {
            this._m_originals[i] = new Descriptor(io, this, this._root, this._is_le);
          }
        }
        io.seek(_pos);
        return this._m_originals;
      }
    });
    Object.defineProperty(Mo.prototype, 'translations', {
      get: function() {
        if (this._m_translations !== undefined)
          return this._m_translations;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.ofsTranslations);
        if (this._is_le) {
          this._m_translations = new Array(this.numTranslations);
          for (var i = 0; i < this.numTranslations; i++) {
            this._m_translations[i] = new Descriptor(io, this, this._root, this._is_le);
          }
        } else {
          this._m_translations = new Array(this.numTranslations);
          for (var i = 0; i < this.numTranslations; i++) {
            this._m_translations[i] = new Descriptor(io, this, this._root, this._is_le);
          }
        }
        io.seek(_pos);
        return this._m_translations;
      }
    });
    Object.defineProperty(Mo.prototype, 'hashtableItems', {
      get: function() {
        if (this._m_hashtableItems !== undefined)
          return this._m_hashtableItems;
        if (this.ofsHashtableItems != 0) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this.ofsHashtableItems);
          if (this._is_le) {
            this._m_hashtableItems = new Array(this.numHashtableItems);
            for (var i = 0; i < this.numHashtableItems; i++) {
              this._m_hashtableItems[i] = new HashtableItem(io, this, this._root, this._is_le);
            }
          } else {
            this._m_hashtableItems = new Array(this.numHashtableItems);
            for (var i = 0; i < this.numHashtableItems; i++) {
              this._m_hashtableItems[i] = new HashtableItem(io, this, this._root, this._is_le);
            }
          }
          io.seek(_pos);
        }
        return this._m_hashtableItems;
      }
    });

    return Mo;
  })();

  return GettextMo;
})();
return GettextMo;
}));
