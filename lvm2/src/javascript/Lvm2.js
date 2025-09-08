// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Lvm2 || (root.Lvm2 = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Lvm2_, KaitaiStream) {
/**
 * ### Building a test file
 * 
 * ```
 * dd if=/dev/zero of=image.img bs=512 count=$(( 4 * 1024 * 2 ))
 * sudo losetup /dev/loop1 image.img
 * sudo pvcreate /dev/loop1
 * sudo vgcreate vg_test /dev/loop1
 * sudo lvcreate --name lv_test1 vg_test
 * sudo losetup -d /dev/loop1
 * ```
 * @see {@link https://github.com/libyal/libvslvm/blob/main/documentation/Logical%20Volume%20Manager%20(LVM)%20format.asciidoc|Source}
 */

var Lvm2 = (function() {
  function Lvm2(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Lvm2.prototype._read = function() {
    this.pv = new PhysicalVolume(this._io, this, this._root);
  }

  var PhysicalVolume = Lvm2.PhysicalVolume = (function() {
    function PhysicalVolume(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    PhysicalVolume.prototype._read = function() {
      this.emptySector = this._io.readBytes(this._root.sectorSize);
      this.label = new Label(this._io, this, this._root);
    }

    var Label = PhysicalVolume.Label = (function() {
      function Label(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Label.prototype._read = function() {
        this.labelHeader = new LabelHeader(this._io, this, this._root);
        this.volumeHeader = new VolumeHeader(this._io, this, this._root);
      }

      var LabelHeader = Label.LabelHeader = (function() {
        function LabelHeader(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;

          this._read();
        }
        LabelHeader.prototype._read = function() {
          this.signature = this._io.readBytes(8);
          if (!((KaitaiStream.byteArrayCompare(this.signature, new Uint8Array([76, 65, 66, 69, 76, 79, 78, 69])) == 0))) {
            throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([76, 65, 66, 69, 76, 79, 78, 69]), this.signature, this._io, "/types/physical_volume/types/label/types/label_header/seq/0");
          }
          this.sectorNumber = this._io.readU8le();
          this.checksum = this._io.readU4le();
          this.labelHeader = new LabelHeader(this._io, this, this._root);
        }

        var LabelHeader = LabelHeader.LabelHeader = (function() {
          function LabelHeader(_io, _parent, _root) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root;

            this._read();
          }
          LabelHeader.prototype._read = function() {
            this.dataOffset = this._io.readU4le();
            this.typeIndicator = this._io.readBytes(8);
            if (!((KaitaiStream.byteArrayCompare(this.typeIndicator, new Uint8Array([76, 86, 77, 50, 32, 48, 48, 49])) == 0))) {
              throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([76, 86, 77, 50, 32, 48, 48, 49]), this.typeIndicator, this._io, "/types/physical_volume/types/label/types/label_header/types/label_header_/seq/1");
            }
          }

          /**
           * The offset, in bytes, relative from the start of the physical volume label header where data is stored
           */

          return LabelHeader;
        })();

        /**
         * The sector number of the physical volume label header
         */

        /**
         * CRC-32 for offset 20 to end of the physical volume label sector
         */

        return LabelHeader;
      })();

      var VolumeHeader = Label.VolumeHeader = (function() {
        function VolumeHeader(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;

          this._read();
        }
        VolumeHeader.prototype._read = function() {
          this.id = KaitaiStream.bytesToStr(this._io.readBytes(32), "ASCII");
          this.size = this._io.readU8le();
          this.dataAreaDescriptors = [];
          var i = 0;
          do {
            var _ = new DataAreaDescriptor(this._io, this, this._root);
            this.dataAreaDescriptors.push(_);
            i++;
          } while (!( ((_.size != 0) && (_.offset != 0)) ));
          this.metadataAreaDescriptors = [];
          var i = 0;
          do {
            var _ = new MetadataAreaDescriptor(this._io, this, this._root);
            this.metadataAreaDescriptors.push(_);
            i++;
          } while (!( ((_.size != 0) && (_.offset != 0)) ));
        }

        var DataAreaDescriptor = VolumeHeader.DataAreaDescriptor = (function() {
          function DataAreaDescriptor(_io, _parent, _root) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root;

            this._read();
          }
          DataAreaDescriptor.prototype._read = function() {
            this.offset = this._io.readU8le();
            this.size = this._io.readU8le();
          }
          Object.defineProperty(DataAreaDescriptor.prototype, 'data', {
            get: function() {
              if (this._m_data !== undefined)
                return this._m_data;
              if (this.size != 0) {
                var _pos = this._io.pos;
                this._io.seek(this.offset);
                this._m_data = KaitaiStream.bytesToStr(this._io.readBytes(this.size), "ASCII");
                this._io.seek(_pos);
              }
              return this._m_data;
            }
          });

          /**
           * The offset, in bytes, relative from the start of the physical volume
           */

          /**
           * Value in bytes. Can be 0. [yellow-background]*Does this represent all remaining available space?*
           */

          return DataAreaDescriptor;
        })();

        /**
         * According to `[REDHAT]` the metadata area is a circular buffer. New metadata is appended to the old metadata and then the pointer to the start of it is updated. The metadata area, therefore, can contain copies of older versions of the metadata.
         */

        var MetadataArea = VolumeHeader.MetadataArea = (function() {
          function MetadataArea(_io, _parent, _root) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root;

            this._read();
          }
          MetadataArea.prototype._read = function() {
            this.header = new MetadataAreaHeader(this._io, this, this._root);
          }

          var MetadataAreaHeader = MetadataArea.MetadataAreaHeader = (function() {
            function MetadataAreaHeader(_io, _parent, _root) {
              this._io = _io;
              this._parent = _parent;
              this._root = _root;

              this._read();
            }
            MetadataAreaHeader.prototype._read = function() {
              this.checksum = new MetadataAreaHeader(this._io, this, this._root);
              this.signature = this._io.readBytes(16);
              if (!((KaitaiStream.byteArrayCompare(this.signature, new Uint8Array([32, 76, 86, 77, 50, 32, 120, 91, 53, 65, 37, 114, 48, 78, 42, 62])) == 0))) {
                throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([32, 76, 86, 77, 50, 32, 120, 91, 53, 65, 37, 114, 48, 78, 42, 62]), this.signature, this._io, "/types/physical_volume/types/label/types/volume_header/types/metadata_area/types/metadata_area_header/seq/1");
              }
              this.version = this._io.readU4le();
              this.metadataAreaOffset = this._io.readU8le();
              this.metadataAreaSize = this._io.readU8le();
              this.rawLocationDescriptors = [];
              var i = 0;
              do {
                var _ = new RawLocationDescriptor(this._io, this, this._root);
                this.rawLocationDescriptors.push(_);
                i++;
              } while (!( ((_.offset != 0) && (_.size != 0) && (_.checksum != 0)) ));
            }

            /**
             * The data area size can be 0. It is assumed it represents the remaining  available data.
             */

            var RawLocationDescriptor = MetadataAreaHeader.RawLocationDescriptor = (function() {
              RawLocationDescriptor.RawLocationDescriptorFlags = Object.freeze({
                RAW_LOCATION_IGNORED: 1,

                1: "RAW_LOCATION_IGNORED",
              });

              function RawLocationDescriptor(_io, _parent, _root) {
                this._io = _io;
                this._parent = _parent;
                this._root = _root;

                this._read();
              }
              RawLocationDescriptor.prototype._read = function() {
                this.offset = this._io.readU8le();
                this.size = this._io.readU8le();
                this.checksum = this._io.readU4le();
                this.flags = this._io.readU4le();
              }

              /**
               * The data area offset, in bytes, relative from the start of the metadata area
               */

              /**
               * data area size in bytes
               */

              /**
               * CRC-32 of *TODO (metadata?)*
               */

              return RawLocationDescriptor;
            })();
            Object.defineProperty(MetadataAreaHeader.prototype, 'metadata', {
              get: function() {
                if (this._m_metadata !== undefined)
                  return this._m_metadata;
                var _pos = this._io.pos;
                this._io.seek(this.metadataAreaOffset);
                this._m_metadata = this._io.readBytes(this.metadataAreaSize);
                this._io.seek(_pos);
                return this._m_metadata;
              }
            });

            /**
             * CRC-32 for offset 4 to end of the metadata area header
             */

            /**
             * The offset, in bytes, of the metadata area relative from the start of the physical volume
             */

            /**
             * The last descriptor in the list is terminator and consists of 0-byte values.
             */

            return MetadataAreaHeader;
          })();

          return MetadataArea;
        })();

        var MetadataAreaDescriptor = VolumeHeader.MetadataAreaDescriptor = (function() {
          function MetadataAreaDescriptor(_io, _parent, _root) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root;

            this._read();
          }
          MetadataAreaDescriptor.prototype._read = function() {
            this.offset = this._io.readU8le();
            this.size = this._io.readU8le();
          }
          Object.defineProperty(MetadataAreaDescriptor.prototype, 'data', {
            get: function() {
              if (this._m_data !== undefined)
                return this._m_data;
              if (this.size != 0) {
                var _pos = this._io.pos;
                this._io.seek(this.offset);
                this._raw__m_data = this._io.readBytes(this.size);
                var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
                this._m_data = new MetadataArea(_io__raw__m_data, this, this._root);
                this._io.seek(_pos);
              }
              return this._m_data;
            }
          });

          /**
           * The offset, in bytes, relative from the start of the physical volume
           */

          /**
           * Value in bytes
           */

          return MetadataAreaDescriptor;
        })();

        /**
         * Contains a UUID stored as an ASCII string. The physical volume identifier can be used to uniquely identify a physical volume. The physical volume identifier is stored as: 9LBcEB7PQTGIlLI0KxrtzrynjuSL983W but is equivalent to its formatted variant: 9LBcEB-7PQT-GIlL-I0Kx-rtzr-ynju-SL983W, which is used in the metadata.
         */

        /**
         * Physical Volume size. Value in bytes
         */

        /**
         * The last descriptor in the list is terminator and consists of 0-byte values.
         */

        return VolumeHeader;
      })();

      return Label;
    })();

    return PhysicalVolume;
  })();
  Object.defineProperty(Lvm2.prototype, 'sectorSize', {
    get: function() {
      if (this._m_sectorSize !== undefined)
        return this._m_sectorSize;
      this._m_sectorSize = 512;
      return this._m_sectorSize;
    }
  });

  /**
   * Physical volume
   */

  return Lvm2;
})();
Lvm2_.Lvm2 = Lvm2;
});
