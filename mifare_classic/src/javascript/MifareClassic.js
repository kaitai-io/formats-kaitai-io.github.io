// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.MifareClassic || (root.MifareClassic = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (MifareClassic_, KaitaiStream) {
/**
 * You can get a dump for testing from this link:
 * <https://github.com/zhovner/mfdread/raw/master/dump.mfd>
 * @see {@link https://github.com/nfc-tools/libnfc
 * https://www.nxp.com/docs/en/data-sheet/MF1S70YYX_V1.pdf
 * |Source}
 */

var MifareClassic = (function() {
  function MifareClassic(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  MifareClassic.prototype._read = function() {
    this._raw_sectors = [];
    this.sectors = [];
    var i = 0;
    while (!this._io.isEof()) {
      this._raw_sectors.push(this._io.readBytes(((i >= 32 ? 4 : 1) * 4) * 16));
      var _io__raw_sectors = new KaitaiStream(this._raw_sectors[this._raw_sectors.length - 1]);
      this.sectors.push(new Sector(_io__raw_sectors, this, this._root, i == 0));
      i++;
    }
  }

  var Key = MifareClassic.Key = (function() {
    function Key(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Key.prototype._read = function() {
      this.key = this._io.readBytes(6);
    }

    return Key;
  })();

  var Manufacturer = MifareClassic.Manufacturer = (function() {
    function Manufacturer(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Manufacturer.prototype._read = function() {
      this.nuid = this._io.readU4le();
      this.bcc = this._io.readU1();
      this.sak = this._io.readU1();
      this.atqa = this._io.readU2le();
      this.manufacturer = this._io.readBytes(8);
    }

    /**
     * beware for 7bytes UID it goes over next fields
     */

    /**
     * may contain manufacture date as BCD
     */

    return Manufacturer;
  })();

  var Sector = MifareClassic.Sector = (function() {
    function Sector(_io, _parent, _root, hasManufacturer) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.hasManufacturer = hasManufacturer;

      this._read();
    }
    Sector.prototype._read = function() {
      if (this.hasManufacturer) {
        this.manufacturer = new Manufacturer(this._io, this, this._root);
      }
      this._raw_dataFiller = this._io.readBytes((this._io.size - this._io.pos) - 16);
      var _io__raw_dataFiller = new KaitaiStream(this._raw_dataFiller);
      this.dataFiller = new Filler(_io__raw_dataFiller, this, this._root);
      this.trailer = new Trailer(this._io, this, this._root);
    }

    /**
     * only to create _io
     */

    var Filler = Sector.Filler = (function() {
      function Filler(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Filler.prototype._read = function() {
        this.data = this._io.readBytes(this._io.size);
      }

      return Filler;
    })();

    var Values = Sector.Values = (function() {
      function Values(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Values.prototype._read = function() {
        this.values = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.values.push(new ValueBlock(this._io, this, this._root));
          i++;
        }
      }

      var ValueBlock = Values.ValueBlock = (function() {
        function ValueBlock(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;

          this._read();
        }
        ValueBlock.prototype._read = function() {
          this.valuez = [];
          for (var i = 0; i < 3; i++) {
            this.valuez.push(this._io.readU4le());
          }
          this.addrz = [];
          for (var i = 0; i < 4; i++) {
            this.addrz.push(this._io.readU1());
          }
        }
        Object.defineProperty(ValueBlock.prototype, 'addr', {
          get: function() {
            if (this._m_addr !== undefined)
              return this._m_addr;
            if (this.valid) {
              this._m_addr = this.addrz[0];
            }
            return this._m_addr;
          }
        });
        Object.defineProperty(ValueBlock.prototype, 'addrValid', {
          get: function() {
            if (this._m_addrValid !== undefined)
              return this._m_addrValid;
            this._m_addrValid =  ((this.addrz[0] == ~(this.addrz[1])) && (this.addrz[0] == this.addrz[2]) && (this.addrz[1] == this.addrz[3])) ;
            return this._m_addrValid;
          }
        });
        Object.defineProperty(ValueBlock.prototype, 'valid', {
          get: function() {
            if (this._m_valid !== undefined)
              return this._m_valid;
            this._m_valid =  ((this.valueValid) && (this.addrValid)) ;
            return this._m_valid;
          }
        });
        Object.defineProperty(ValueBlock.prototype, 'value', {
          get: function() {
            if (this._m_value !== undefined)
              return this._m_value;
            if (this.valid) {
              this._m_value = this.valuez[0];
            }
            return this._m_value;
          }
        });
        Object.defineProperty(ValueBlock.prototype, 'valueValid', {
          get: function() {
            if (this._m_valueValid !== undefined)
              return this._m_valueValid;
            this._m_valueValid =  ((this.valuez[0] == ~(this.valuez[1])) && (this.valuez[0] == this.valuez[2])) ;
            return this._m_valueValid;
          }
        });

        return ValueBlock;
      })();

      return Values;
    })();
    Object.defineProperty(Sector.prototype, 'blockSize', {
      get: function() {
        if (this._m_blockSize !== undefined)
          return this._m_blockSize;
        this._m_blockSize = 16;
        return this._m_blockSize;
      }
    });
    Object.defineProperty(Sector.prototype, 'blocks', {
      get: function() {
        if (this._m_blocks !== undefined)
          return this._m_blocks;
        var io = this.dataFiller._io;
        var _pos = io.pos;
        io.seek(0);
        this._m_blocks = [];
        var i = 0;
        while (!io.isEof()) {
          this._m_blocks.push(io.readBytes(this.blockSize));
          i++;
        }
        io.seek(_pos);
        return this._m_blocks;
      }
    });
    Object.defineProperty(Sector.prototype, 'data', {
      get: function() {
        if (this._m_data !== undefined)
          return this._m_data;
        this._m_data = this.dataFiller.data;
        return this._m_data;
      }
    });
    Object.defineProperty(Sector.prototype, 'values', {
      get: function() {
        if (this._m_values !== undefined)
          return this._m_values;
        var io = this.dataFiller._io;
        var _pos = io.pos;
        io.seek(0);
        this._m_values = new Values(io, this, this._root);
        io.seek(_pos);
        return this._m_values;
      }
    });

    return Sector;
  })();

  var Trailer = MifareClassic.Trailer = (function() {
    function Trailer(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Trailer.prototype._read = function() {
      this.keyA = new Key(this._io, this, this._root);
      this._raw_accessBits = this._io.readBytes(3);
      var _io__raw_accessBits = new KaitaiStream(this._raw_accessBits);
      this.accessBits = new AccessConditions(_io__raw_accessBits, this, this._root);
      this.userByte = this._io.readU1();
      this.keyB = new Key(this._io, this, this._root);
    }

    var AccessConditions = Trailer.AccessConditions = (function() {
      function AccessConditions(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      AccessConditions.prototype._read = function() {
        this.rawChunks = [];
        for (var i = 0; i < this._parent.acCountOfChunks; i++) {
          this.rawChunks.push(this._io.readBitsIntBe(4));
        }
      }

      var Ac = AccessConditions.Ac = (function() {
        function Ac(_io, _parent, _root, index) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;
          this.index = index;

          this._read();
        }
        Ac.prototype._read = function() {
        }

        var AcBit = Ac.AcBit = (function() {
          function AcBit(_io, _parent, _root, i, chunk) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root;
            this.i = i;
            this.chunk = chunk;

            this._read();
          }
          AcBit.prototype._read = function() {
          }
          Object.defineProperty(AcBit.prototype, 'b', {
            get: function() {
              if (this._m_b !== undefined)
                return this._m_b;
              this._m_b = this.n == 1;
              return this._m_b;
            }
          });
          Object.defineProperty(AcBit.prototype, 'n', {
            get: function() {
              if (this._m_n !== undefined)
                return this._m_n;
              this._m_n = this.chunk >>> this.i & 1;
              return this._m_n;
            }
          });

          return AcBit;
        })();
        Object.defineProperty(Ac.prototype, 'bits', {
          get: function() {
            if (this._m_bits !== undefined)
              return this._m_bits;
            var _pos = this._io.pos;
            this._io.seek(0);
            this._m_bits = [];
            for (var i = 0; i < this._parent._parent.acBits; i++) {
              this._m_bits.push(new AcBit(this._io, this, this._root, this.index, this._parent.chunks[i].chunk));
            }
            this._io.seek(_pos);
            return this._m_bits;
          }
        });
        Object.defineProperty(Ac.prototype, 'invShiftVal', {
          get: function() {
            if (this._m_invShiftVal !== undefined)
              return this._m_invShiftVal;
            this._m_invShiftVal = (this.bits[0].n << 2 | this.bits[1].n << 1) | this.bits[2].n;
            return this._m_invShiftVal;
          }
        });

        /**
         * c3 c2 c1
         */
        Object.defineProperty(Ac.prototype, 'val', {
          get: function() {
            if (this._m_val !== undefined)
              return this._m_val;
            this._m_val = (this.bits[2].n << 2 | this.bits[1].n << 1) | this.bits[0].n;
            return this._m_val;
          }
        });

        return Ac;
      })();

      var ChunkBitRemap = AccessConditions.ChunkBitRemap = (function() {
        function ChunkBitRemap(_io, _parent, _root, bitNo) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;
          this.bitNo = bitNo;

          this._read();
        }
        ChunkBitRemap.prototype._read = function() {
        }
        Object.defineProperty(ChunkBitRemap.prototype, 'chunkNo', {
          get: function() {
            if (this._m_chunkNo !== undefined)
              return this._m_chunkNo;
            this._m_chunkNo = KaitaiStream.mod((this.invChunkNo + this.shiftValue) + this._parent._parent.acCountOfChunks, this._parent._parent.acCountOfChunks);
            return this._m_chunkNo;
          }
        });
        Object.defineProperty(ChunkBitRemap.prototype, 'invChunkNo', {
          get: function() {
            if (this._m_invChunkNo !== undefined)
              return this._m_invChunkNo;
            this._m_invChunkNo = this.bitNo + this.shiftValue;
            return this._m_invChunkNo;
          }
        });
        Object.defineProperty(ChunkBitRemap.prototype, 'shiftValue', {
          get: function() {
            if (this._m_shiftValue !== undefined)
              return this._m_shiftValue;
            this._m_shiftValue = (this.bitNo == 1 ? -1 : 1);
            return this._m_shiftValue;
          }
        });

        return ChunkBitRemap;
      })();

      var DataAc = AccessConditions.DataAc = (function() {
        function DataAc(_io, _parent, _root, ac) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;
          this.ac = ac;

          this._read();
        }
        DataAc.prototype._read = function() {
        }
        Object.defineProperty(DataAc.prototype, 'decrementAvailable', {
          get: function() {
            if (this._m_decrementAvailable !== undefined)
              return this._m_decrementAvailable;
            this._m_decrementAvailable =  (( ((this.ac.bits[1].b) || (!(this.ac.bits[0].b))) ) && (!(this.ac.bits[2].b))) ;
            return this._m_decrementAvailable;
          }
        });
        Object.defineProperty(DataAc.prototype, 'incrementAvailable', {
          get: function() {
            if (this._m_incrementAvailable !== undefined)
              return this._m_incrementAvailable;
            this._m_incrementAvailable =  (( ((!(this.ac.bits[0].b)) && (!(this.readKeyARequired)) && (!(this.readKeyBRequired))) ) || ( ((!(this.ac.bits[0].b)) && (this.readKeyARequired) && (this.readKeyBRequired)) )) ;
            return this._m_incrementAvailable;
          }
        });
        Object.defineProperty(DataAc.prototype, 'readKeyARequired', {
          get: function() {
            if (this._m_readKeyARequired !== undefined)
              return this._m_readKeyARequired;
            this._m_readKeyARequired = this.ac.val <= 4;
            return this._m_readKeyARequired;
          }
        });
        Object.defineProperty(DataAc.prototype, 'readKeyBRequired', {
          get: function() {
            if (this._m_readKeyBRequired !== undefined)
              return this._m_readKeyBRequired;
            this._m_readKeyBRequired = this.ac.val <= 6;
            return this._m_readKeyBRequired;
          }
        });
        Object.defineProperty(DataAc.prototype, 'writeKeyARequired', {
          get: function() {
            if (this._m_writeKeyARequired !== undefined)
              return this._m_writeKeyARequired;
            this._m_writeKeyARequired = this.ac.val == 0;
            return this._m_writeKeyARequired;
          }
        });
        Object.defineProperty(DataAc.prototype, 'writeKeyBRequired', {
          get: function() {
            if (this._m_writeKeyBRequired !== undefined)
              return this._m_writeKeyBRequired;
            this._m_writeKeyBRequired =  (( ((!(this.readKeyARequired)) || (this.readKeyBRequired)) ) && (!(this.ac.bits[0].b))) ;
            return this._m_writeKeyBRequired;
          }
        });

        return DataAc;
      })();

      var TrailerAc = AccessConditions.TrailerAc = (function() {
        function TrailerAc(_io, _parent, _root, ac) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;
          this.ac = ac;

          this._read();
        }
        TrailerAc.prototype._read = function() {
        }

        /**
         * key A is required
         */
        Object.defineProperty(TrailerAc.prototype, 'canReadKeyB', {
          get: function() {
            if (this._m_canReadKeyB !== undefined)
              return this._m_canReadKeyB;
            this._m_canReadKeyB = this.ac.invShiftVal <= 2;
            return this._m_canReadKeyB;
          }
        });
        Object.defineProperty(TrailerAc.prototype, 'canWriteAccessBits', {
          get: function() {
            if (this._m_canWriteAccessBits !== undefined)
              return this._m_canWriteAccessBits;
            this._m_canWriteAccessBits = this.ac.bits[2].b;
            return this._m_canWriteAccessBits;
          }
        });
        Object.defineProperty(TrailerAc.prototype, 'canWriteKeys', {
          get: function() {
            if (this._m_canWriteKeys !== undefined)
              return this._m_canWriteKeys;
            this._m_canWriteKeys =  ((KaitaiStream.mod(this.ac.invShiftVal + 1, 3) != 0) && (this.ac.invShiftVal < 6)) ;
            return this._m_canWriteKeys;
          }
        });
        Object.defineProperty(TrailerAc.prototype, 'keyBControlsWrite', {
          get: function() {
            if (this._m_keyBControlsWrite !== undefined)
              return this._m_keyBControlsWrite;
            this._m_keyBControlsWrite = !(this.canReadKeyB);
            return this._m_keyBControlsWrite;
          }
        });

        return TrailerAc;
      })();

      var ValidChunk = AccessConditions.ValidChunk = (function() {
        function ValidChunk(_io, _parent, _root, invChunk, chunk) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;
          this.invChunk = invChunk;
          this.chunk = chunk;

          this._read();
        }
        ValidChunk.prototype._read = function() {
        }
        Object.defineProperty(ValidChunk.prototype, 'valid', {
          get: function() {
            if (this._m_valid !== undefined)
              return this._m_valid;
            this._m_valid = (this.invChunk ^ this.chunk) == 15;
            return this._m_valid;
          }
        });

        /**
         * c3 c2 c1 c0
         */

        return ValidChunk;
      })();
      Object.defineProperty(AccessConditions.prototype, 'acsRaw', {
        get: function() {
          if (this._m_acsRaw !== undefined)
            return this._m_acsRaw;
          var _pos = this._io.pos;
          this._io.seek(0);
          this._m_acsRaw = [];
          for (var i = 0; i < this._parent.acsInSector; i++) {
            this._m_acsRaw.push(new Ac(this._io, this, this._root, i));
          }
          this._io.seek(_pos);
          return this._m_acsRaw;
        }
      });
      Object.defineProperty(AccessConditions.prototype, 'chunks', {
        get: function() {
          if (this._m_chunks !== undefined)
            return this._m_chunks;
          var _pos = this._io.pos;
          this._io.seek(0);
          this._m_chunks = [];
          for (var i = 0; i < this._parent.acBits; i++) {
            this._m_chunks.push(new ValidChunk(this._io, this, this._root, this.rawChunks[this.remaps[i].invChunkNo], this.rawChunks[this.remaps[i].chunkNo]));
          }
          this._io.seek(_pos);
          return this._m_chunks;
        }
      });
      Object.defineProperty(AccessConditions.prototype, 'dataAcs', {
        get: function() {
          if (this._m_dataAcs !== undefined)
            return this._m_dataAcs;
          var _pos = this._io.pos;
          this._io.seek(0);
          this._m_dataAcs = [];
          for (var i = 0; i < this._parent.acsInSector - 1; i++) {
            this._m_dataAcs.push(new DataAc(this._io, this, this._root, this.acsRaw[i]));
          }
          this._io.seek(_pos);
          return this._m_dataAcs;
        }
      });
      Object.defineProperty(AccessConditions.prototype, 'remaps', {
        get: function() {
          if (this._m_remaps !== undefined)
            return this._m_remaps;
          var _pos = this._io.pos;
          this._io.seek(0);
          this._m_remaps = [];
          for (var i = 0; i < this._parent.acBits; i++) {
            this._m_remaps.push(new ChunkBitRemap(this._io, this, this._root, i));
          }
          this._io.seek(_pos);
          return this._m_remaps;
        }
      });
      Object.defineProperty(AccessConditions.prototype, 'trailerAc', {
        get: function() {
          if (this._m_trailerAc !== undefined)
            return this._m_trailerAc;
          var _pos = this._io.pos;
          this._io.seek(0);
          this._m_trailerAc = new TrailerAc(this._io, this, this._root, this.acsRaw[this._parent.acsInSector - 1]);
          this._io.seek(_pos);
          return this._m_trailerAc;
        }
      });

      return AccessConditions;
    })();
    Object.defineProperty(Trailer.prototype, 'acBits', {
      get: function() {
        if (this._m_acBits !== undefined)
          return this._m_acBits;
        this._m_acBits = 3;
        return this._m_acBits;
      }
    });
    Object.defineProperty(Trailer.prototype, 'acCountOfChunks', {
      get: function() {
        if (this._m_acCountOfChunks !== undefined)
          return this._m_acCountOfChunks;
        this._m_acCountOfChunks = this.acBits * 2;
        return this._m_acCountOfChunks;
      }
    });
    Object.defineProperty(Trailer.prototype, 'acsInSector', {
      get: function() {
        if (this._m_acsInSector !== undefined)
          return this._m_acsInSector;
        this._m_acsInSector = 4;
        return this._m_acsInSector;
      }
    });

    return Trailer;
  })();

  return MifareClassic;
})();
MifareClassic_.MifareClassic = MifareClassic;
});
