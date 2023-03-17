// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './BytesWithIo'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./BytesWithIo'));
  } else {
    root.ResourceFork = factory(root.KaitaiStream, root.BytesWithIo);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream, BytesWithIo) {
/**
 * The data format of Macintosh resource forks,
 * used on Classic Mac OS and Mac OS X/macOS to store additional structured data along with a file's main data (the data fork).
 * The kinds of data stored in resource forks include:
 * 
 * * Document resources:
 *   images, sounds, etc. used by a document
 * * Application resources:
 *   graphics, GUI layouts, localizable strings,
 *   and even code used by an application, a library, or system files
 * * Common metadata:
 *   custom icons and version metadata that could be displayed by the Finder
 * * Application-specific metadata:
 *   because resource forks follow a common format,
 *   other applications can store new metadata in them,
 *   even if the original application does not recognize or understand it
 * 
 * Macintosh file systems (MFS, HFS, HFS+, APFS) support resource forks natively,
 * which allows storing resources along with any file.
 * Non-Macintosh file systems and protocols have little or no support for resource forks,
 * so the resource fork data must be stored in some other way when using such file systems or protocols.
 * Various file formats and tools exist for this purpose,
 * such as BinHex, MacBinary, AppleSingle, AppleDouble, or QuickTime RezWack.
 * In some cases,
 * resource forks are stored as plain data in separate files with a .rsrc extension,
 * even on Mac systems that natively support resource forks.
 * 
 * On modern Mac OS X/macOS systems,
 * resource forks are used far less commonly than on classic Mac OS systems,
 * because of compatibility issues with other systems and historical limitations in the format.
 * Modern macOS APIs and libraries do not use resource forks,
 * and the legacy Carbon API that still used them has been deprecated since OS X 10.8.
 * Despite this,
 * even current macOS systems still use resource forks for certain purposes,
 * such as custom file icons.
 * @see {@link https://developer.apple.com/library/archive/documentation/mac/pdf/MoreMacintoshToolbox.pdf#page=151|Inside Macintosh, More Macintosh Toolbox, Resource Manager, Resource Manager Reference, Resource File Format}
 * @see {@link https://www.pagetable.com/?p=50|Inside Macintosh, Volume I, The Resource Manager, Format of a Resource File}
 * @see {@link https://github.com/kreativekorp/ksfl/wiki/Macintosh-Resource-File-Format|Source}
 * @see {@link https://github.com/dgelessus/mac_file_format_docs/blob/master/README.md#resource-forks|Source}
 */

var ResourceFork = (function() {
  function ResourceFork(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  ResourceFork.prototype._read = function() {
    this.header = new FileHeader(this._io, this, this._root);
    this.systemData = this._io.readBytes(112);
    this.applicationData = this._io.readBytes(128);
  }

  /**
   * Resource file header,
   * containing the offsets and lengths of the resource data area and resource map.
   */

  var FileHeader = ResourceFork.FileHeader = (function() {
    function FileHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileHeader.prototype._read = function() {
      this.ofsDataBlocks = this._io.readU4be();
      this.ofsResourceMap = this._io.readU4be();
      this.lenDataBlocks = this._io.readU4be();
      this.lenResourceMap = this._io.readU4be();
    }

    /**
     * Offset of the resource data area,
     * from the start of the resource file.
     * 
     * In practice,
     * this should always be `256`,
     * i. e. the resource data area should directly follow the application-specific data area.
     */

    /**
     * Offset of the resource map,
     * from the start of the resource file.
     * 
     * In practice,
     * this should always be `ofs_data_blocks + len_data_blocks`,
     * i. e. the resource map should directly follow the resource data area.
     */

    /**
     * Length of the resource data area.
     */

    /**
     * Length of the resource map.
     * 
     * In practice,
     * this should always be `_root._io.size - ofs_resource_map`,
     * i. e. the resource map should extend to the end of the resource file.
     */

    return FileHeader;
  })();

  /**
   * A resource data block,
   * as stored in the resource data area.
   * 
   * Each data block stores the data contained in a resource,
   * along with its length.
   */

  var DataBlock = ResourceFork.DataBlock = (function() {
    function DataBlock(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DataBlock.prototype._read = function() {
      this.lenData = this._io.readU4be();
      this.data = this._io.readBytes(this.lenData);
    }

    /**
     * The length of the resource data stored in this block.
     */

    /**
     * The data stored in this block.
     */

    return DataBlock;
  })();

  /**
   * Resource map,
   * containing information about the resources in the file and where they are located in the data area.
   */

  var ResourceMap = ResourceFork.ResourceMap = (function() {
    function ResourceMap(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ResourceMap.prototype._read = function() {
      this.reservedFileHeaderCopy = new FileHeader(this._io, this, this._root);
      this.reservedNextResourceMapHandle = this._io.readU4be();
      this.reservedFileReferenceNumber = this._io.readU2be();
      this._raw_fileAttributes = this._io.readBytes(2);
      var _io__raw_fileAttributes = new KaitaiStream(this._raw_fileAttributes);
      this.fileAttributes = new FileAttributes(_io__raw_fileAttributes, this, this._root);
      this.ofsTypeList = this._io.readU2be();
      this.ofsNames = this._io.readU2be();
    }

    /**
     * A resource file's attributes,
     * as stored in the resource map.
     * 
     * These attributes are sometimes also referred to as resource map attributes,
     * because of where they are stored in the file.
     */

    var FileAttributes = ResourceMap.FileAttributes = (function() {
      function FileAttributes(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      FileAttributes.prototype._read = function() {
        this.resourcesLocked = this._io.readBitsIntBe(1) != 0;
        this.reserved0 = this._io.readBitsIntBe(6);
        this.printerDriverMultifinderCompatible = this._io.readBitsIntBe(1) != 0;
        this.noWriteChanges = this._io.readBitsIntBe(1) != 0;
        this.needsCompact = this._io.readBitsIntBe(1) != 0;
        this.mapNeedsWrite = this._io.readBitsIntBe(1) != 0;
        this.reserved1 = this._io.readBitsIntBe(5);
      }

      /**
       * The attributes as a packed integer,
       * as they are stored in the file.
       */
      Object.defineProperty(FileAttributes.prototype, 'asInt', {
        get: function() {
          if (this._m_asInt !== undefined)
            return this._m_asInt;
          var _pos = this._io.pos;
          this._io.seek(0);
          this._m_asInt = this._io.readU2be();
          this._io.seek(_pos);
          return this._m_asInt;
        }
      });

      /**
       * TODO What does this attribute actually do,
       * and how is it different from `read_only`?
       * 
       * This attribute is undocumented and not defined in <CarbonCore/Resources.h>,
       * but ResEdit has a checkbox called "Resources Locked" for this attribute.
       */

      /**
       * These attributes have no known usage or meaning and should always be zero.
       */

      /**
       * Indicates that this printer driver is compatible with MultiFinder,
       * i. e. can be used simultaneously by multiple applications.
       * This attribute is only meant to be set on printer driver resource forks.
       * 
       * This attribute is not documented in Inside Macintosh and is not defined in <CarbonCore/Resources.h>.
       * It is documented in technote PR510,
       * and ResEdit has a checkbox called "Printer Driver MultiFinder Compatible" for this attribute.
       * @see {@link https://developer.apple.com/library/archive/technotes/pr/pr_510.html|Apple Technical Note PR510 - Printer Driver Q&As, section '"Printer driver is MultiFinder compatible" bit'}
       */

      /**
       * Indicates that the Resource Manager should not write any changes from memory into the resource file.
       * Any modification operations requested by the application will return successfully,
       * but will not actually update the resource file.
       * 
       * TODO Is this attribute supposed to be set on disk or only in memory?
       */

      /**
       * Indicates that the resource file should be compacted the next time it is written by the Resource Manager.
       * This attribute is only meant to be set in memory;
       * it is cleared when the resource file is written to disk.
       * 
       * This attribute is mainly used internally by the Resource Manager,
       * but may also be set manually by the application.
       */

      /**
       * Indicates that the resource map has been changed in memory and should be written to the resource file on the next update.
       * This attribute is only meant to be set in memory;
       * it is cleared when the resource file is written to disk.
       * 
       * This attribute is mainly used internally by the Resource Manager,
       * but may also be set manually by the application.
       */

      /**
       * These attributes have no known usage or meaning and should always be zero.
       */

      return FileAttributes;
    })();

    /**
     * Resource type list and storage area for resource reference lists in the resource map.
     * 
     * The two parts are combined into a single type here for technical reasons:
     * the start of the resource reference list area is not stored explicitly in the file,
     * instead it always starts directly after the resource type list.
     * The simplest way to implement this is by placing both types into a single `seq`.
     */

    var TypeListAndReferenceLists = ResourceMap.TypeListAndReferenceLists = (function() {
      function TypeListAndReferenceLists(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      TypeListAndReferenceLists.prototype._read = function() {
        this.typeList = new TypeList(this._io, this, this._root);
        this.referenceLists = this._io.readBytesFull();
      }

      /**
       * Resource type list in the resource map.
       */

      var TypeList = TypeListAndReferenceLists.TypeList = (function() {
        function TypeList(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        TypeList.prototype._read = function() {
          this.numTypesM1 = this._io.readU2be();
          this.entries = [];
          for (var i = 0; i < this.numTypes; i++) {
            this.entries.push(new TypeListEntry(this._io, this, this._root));
          }
        }

        /**
         * A single entry in the resource type list.
         * 
         * Each entry corresponds to exactly one resource reference list.
         */

        var TypeListEntry = TypeList.TypeListEntry = (function() {
          function TypeListEntry(_io, _parent, _root) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root || this;

            this._read();
          }
          TypeListEntry.prototype._read = function() {
            this.type = this._io.readBytes(4);
            this.numReferencesM1 = this._io.readU2be();
            this.ofsReferenceList = this._io.readU2be();
          }

          /**
           * The number of resources in the reference list for this type.
           */
          Object.defineProperty(TypeListEntry.prototype, 'numReferences', {
            get: function() {
              if (this._m_numReferences !== undefined)
                return this._m_numReferences;
              this._m_numReferences = KaitaiStream.mod((this.numReferencesM1 + 1), 65536);
              return this._m_numReferences;
            }
          });

          /**
           * The resource reference list for this resource type.
           */
          Object.defineProperty(TypeListEntry.prototype, 'referenceList', {
            get: function() {
              if (this._m_referenceList !== undefined)
                return this._m_referenceList;
              var io = this._parent._parent._io;
              var _pos = io.pos;
              io.seek(this.ofsReferenceList);
              this._m_referenceList = new ReferenceList(io, this, this._root, this.numReferences);
              io.seek(_pos);
              return this._m_referenceList;
            }
          });

          /**
           * The four-character type code of the resources in the reference list.
           */

          /**
           * The number of resources in the reference list for this type,
           * minus one.
           * 
           * Empty reference lists should never exist.
           */

          /**
           * Offset of the resource reference list for this resource type,
           * from the start of the resource type list.
           * 
           * Although the offset is relative to the start of the type list,
           * it should never point into the type list itself,
           * but into the reference list storage area that directly follows it.
           * That is,
           * it should always be at least `_parent._sizeof`.
           */

          return TypeListEntry;
        })();

        /**
         * The number of resource types in this list.
         */
        Object.defineProperty(TypeList.prototype, 'numTypes', {
          get: function() {
            if (this._m_numTypes !== undefined)
              return this._m_numTypes;
            this._m_numTypes = KaitaiStream.mod((this.numTypesM1 + 1), 65536);
            return this._m_numTypes;
          }
        });

        /**
         * The number of resource types in this list,
         * minus one.
         * 
         * If the resource list is empty,
         * the value of this field is `0xffff`,
         * i. e. `-1` truncated to a 16-bit unsigned integer.
         */

        /**
         * Entries in the resource type list.
         */

        return TypeList;
      })();

      /**
       * A resource reference list,
       * as stored in the reference list area.
       * 
       * Each reference list has exactly one matching entry in the resource type list,
       * and describes all resources of a single type in the file.
       */

      var ReferenceList = TypeListAndReferenceLists.ReferenceList = (function() {
        function ReferenceList(_io, _parent, _root, numReferences) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;
          this.numReferences = numReferences;

          this._read();
        }
        ReferenceList.prototype._read = function() {
          this.references = [];
          for (var i = 0; i < this.numReferences; i++) {
            this.references.push(new Reference(this._io, this, this._root));
          }
        }

        /**
         * A single resource reference in a resource reference list.
         */

        var Reference = ReferenceList.Reference = (function() {
          function Reference(_io, _parent, _root) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root || this;

            this._read();
          }
          Reference.prototype._read = function() {
            this.id = this._io.readS2be();
            this.ofsName = this._io.readU2be();
            this._raw_attributes = this._io.readBytes(1);
            var _io__raw_attributes = new KaitaiStream(this._raw_attributes);
            this.attributes = new Attributes(_io__raw_attributes, this, this._root);
            this.ofsDataBlock = this._io.readBitsIntBe(24);
            this._io.alignToByte();
            this.reservedHandle = this._io.readU4be();
          }

          /**
           * A resource's attributes,
           * as stored in a resource reference.
           */

          var Attributes = Reference.Attributes = (function() {
            function Attributes(_io, _parent, _root) {
              this._io = _io;
              this._parent = _parent;
              this._root = _root || this;

              this._read();
            }
            Attributes.prototype._read = function() {
              this.systemReference = this._io.readBitsIntBe(1) != 0;
              this.loadIntoSystemHeap = this._io.readBitsIntBe(1) != 0;
              this.purgeable = this._io.readBitsIntBe(1) != 0;
              this.locked = this._io.readBitsIntBe(1) != 0;
              this.protected = this._io.readBitsIntBe(1) != 0;
              this.preload = this._io.readBitsIntBe(1) != 0;
              this.needsWrite = this._io.readBitsIntBe(1) != 0;
              this.compressed = this._io.readBitsIntBe(1) != 0;
            }

            /**
             * The attributes as a packed integer,
             * as they are stored in the file.
             */
            Object.defineProperty(Attributes.prototype, 'asInt', {
              get: function() {
                if (this._m_asInt !== undefined)
                  return this._m_asInt;
                var _pos = this._io.pos;
                this._io.seek(0);
                this._m_asInt = this._io.readU1();
                this._io.seek(_pos);
                return this._m_asInt;
              }
            });

            /**
             * Indicates that this resource reference is a system reference rather than a regular local reference.
             * This attribute is nearly undocumented.
             * For all practical purposes,
             * it should be considered reserved and should always be zero.
             * 
             * This attribute was last documented in the Promotional Edition of Inside Macintosh,
             * in the Resource Manager chapter,
             * on pages 37-41,
             * in a "System References" section that calls itself "of historical interest only".
             * The final versions of Inside Macintosh only mention this attribute as "reserved for use by the Resource Manager".
             * <CarbonCore/Resources.h> contains a `resSysRefBit` constant,
             * but no corresponding `resSysRef` constant like for all other resource attributes.
             * 
             * According to the Inside Macintosh Promotional Edition,
             * a system reference was effectively an alias pointing to a resource stored in the system file,
             * possibly with a different ID and name (but not type) than the system reference.
             * If this attribute is set,
             * `ofs_data_block` is ignored and should be zero,
             * and `reserved_handle` contains
             * (in its high and low two bytes, respectively)
             * the ID and name offset of the real system resource that this system reference points to.
             * 
             * TODO Do any publicly available Mac OS versions support system references,
             * and do any real files/applications use them?
             * So far the answer seems to be no,
             * but I would like to be proven wrong!
             */

            /**
             * Indicates that this resource should be loaded into the system heap if possible,
             * rather than the application heap.
             * 
             * This attribute is only meant to be used by Mac OS itself,
             * for System and Finder resources,
             * and not by normal applications.
             * 
             * This attribute may be set both in memory and on disk,
             * but it only has any meaning while the resource file is loaded into memory.
             */

            /**
             * Indicates that this resource's data should be purgeable by the Mac OS Memory Manager.
             * This allows the resource data to be purged from memory if space is needed on the heap.
             * Purged resources can later be reloaded from disk if their data is needed again.
             * 
             * If the `locked` attribute is set,
             * this attribute has no effect
             * (i. e. locked resources are never purgeable).
             * 
             * This attribute may be set both in memory and on disk,
             * but it only has any meaning while the resource file is loaded into memory.
             */

            /**
             * Indicates that this resource's data should be locked to the Mac OS Memory Manager.
             * This prevents the resource data from being moved when the heap is compacted.
             * 
             * This attribute may be set both in memory and on disk,
             * but it only has any meaning while the resource file is loaded into memory.
             */

            /**
             * Indicates that this resource should be protected (i. e. unmodifiable) in memory.
             * This prevents the application from using the Resource Manager to change the resource's data or metadata,
             * or delete it.
             * The only exception are the resource's attributes,
             * which can always be changed,
             * even for protected resources.
             * This allows protected resources to be unprotected again by the application.
             * 
             * This attribute may be set both in memory and on disk,
             * but it only has any meaning while the resource file is loaded into memory.
             */

            /**
             * Indicates that this resource's data should be immediately loaded into memory when the resource file is opened.
             * 
             * This attribute may be set both in memory and on disk,
             * but it only has any meaning when the resource file is first opened.
             */

            /**
             * Indicates that this resource's data has been changed in memory and should be written to the resource file on the next update.
             * This attribute is only meant to be set in memory;
             * it is cleared when the resource file is written to disk.
             * 
             * This attribute is used internally by the Resource Manager and should not be set manually by the application.
             */

            /**
             * Indicates that this resource's data is compressed.
             * Compressed resource data is decompressed transparently by the Resource Manager when reading.
             * 
             * For a detailed description of the structure of compressed resources as they are stored in the file,
             * see the compressed_resource.ksy spec.
             */

            return Attributes;
          })();

          /**
           * The name (if any) of the resource described by this reference.
           */
          Object.defineProperty(Reference.prototype, 'name', {
            get: function() {
              if (this._m_name !== undefined)
                return this._m_name;
              if (this.ofsName != 65535) {
                var io = this._root.resourceMap.namesWithIo._io;
                var _pos = io.pos;
                io.seek(this.ofsName);
                this._m_name = new Name(io, this, this._root);
                io.seek(_pos);
              }
              return this._m_name;
            }
          });

          /**
           * The data block containing the data for the resource described by this reference.
           */
          Object.defineProperty(Reference.prototype, 'dataBlock', {
            get: function() {
              if (this._m_dataBlock !== undefined)
                return this._m_dataBlock;
              var io = this._root.dataBlocksWithIo._io;
              var _pos = io.pos;
              io.seek(this.ofsDataBlock);
              this._m_dataBlock = new DataBlock(io, this, this._root);
              io.seek(_pos);
              return this._m_dataBlock;
            }
          });

          /**
           * ID of the resource described by this reference.
           */

          /**
           * Offset of the name for the resource described by this reference,
           * from the start of the resource name area.
           * 
           * If the resource has no name,
           * the value of this field is `0xffff`
           * i. e. `-1` truncated to a 16-bit unsigned integer.
           */

          /**
           * Attributes of the resource described by this reference.
           */

          /**
           * Offset of the data block for the resource described by this reference,
           * from the start of the resource data area.
           */

          /**
           * Reserved space for the resource's handle in memory.
           */

          return Reference;
        })();

        /**
         * The resource references in this reference list.
         */

        /**
         * The number of references in this resource reference list.
         * 
         * This information needs to be passed in as a parameter,
         * because it is stored in the reference list's type list entry,
         * and not in the reference list itself.
         */

        return ReferenceList;
      })();

      /**
       * The resource map's resource type list.
       */

      /**
       * Storage area for the resource map's resource reference lists.
       * 
       * According to Inside Macintosh,
       * the reference lists are stored contiguously,
       * in the same order as their corresponding resource type list entries.
       */

      return TypeListAndReferenceLists;
    })();

    /**
     * A resource name,
     * as stored in the resource name storage area in the resource map.
     * 
     * The resource names are not required to appear in any particular order.
     * There may be unused space between and around resource names,
     * but in practice they are often contiguous.
     */

    var Name = ResourceMap.Name = (function() {
      function Name(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Name.prototype._read = function() {
        this.lenValue = this._io.readU1();
        this.value = this._io.readBytes(this.lenValue);
      }

      /**
       * The length of the resource name, in bytes.
       */

      /**
       * The resource name.
       * 
       * This field is exposed as a byte array,
       * because there is no universal encoding for resource names.
       * Most Classic Mac software does not deal with encodings explicitly and instead assumes that all strings,
       * including resource names,
       * use the system encoding,
       * which varies depending on the system language.
       * This means that resource names can use different encodings depending on what system language they were created with.
       * 
       * Many resource names are plain ASCII,
       * meaning that the encoding often does not matter
       * (because all Mac OS encodings are ASCII-compatible).
       * For non-ASCII resource names,
       * the most common encoding is perhaps MacRoman
       * (used for English and other Western languages),
       * but other encodings are also sometimes used,
       * especially for software in non-Western languages.
       * 
       * There is no requirement that all names in a single resource file use the same encoding.
       * For example,
       * localized software may have some (but not all) of its resource names translated.
       * For non-Western languages,
       * this can lead to some resource names using MacRoman,
       * and others using a different encoding.
       */

      return Name;
    })();

    /**
     * The resource map's resource type list, followed by the resource reference list area.
     */
    Object.defineProperty(ResourceMap.prototype, 'typeListAndReferenceLists', {
      get: function() {
        if (this._m_typeListAndReferenceLists !== undefined)
          return this._m_typeListAndReferenceLists;
        var _pos = this._io.pos;
        this._io.seek(this.ofsTypeList);
        this._raw__m_typeListAndReferenceLists = this._io.readBytes((this.ofsNames - this.ofsTypeList));
        var _io__raw__m_typeListAndReferenceLists = new KaitaiStream(this._raw__m_typeListAndReferenceLists);
        this._m_typeListAndReferenceLists = new TypeListAndReferenceLists(_io__raw__m_typeListAndReferenceLists, this, this._root);
        this._io.seek(_pos);
        return this._m_typeListAndReferenceLists;
      }
    });

    /**
     * Use `names` instead,
     * unless you need access to this instance's `_io`.
     */
    Object.defineProperty(ResourceMap.prototype, 'namesWithIo', {
      get: function() {
        if (this._m_namesWithIo !== undefined)
          return this._m_namesWithIo;
        var _pos = this._io.pos;
        this._io.seek(this.ofsNames);
        this._raw__m_namesWithIo = this._io.readBytesFull();
        var _io__raw__m_namesWithIo = new KaitaiStream(this._raw__m_namesWithIo);
        this._m_namesWithIo = new BytesWithIo(_io__raw__m_namesWithIo, this, null);
        this._io.seek(_pos);
        return this._m_namesWithIo;
      }
    });

    /**
     * Storage area for the names of all resources.
     */
    Object.defineProperty(ResourceMap.prototype, 'names', {
      get: function() {
        if (this._m_names !== undefined)
          return this._m_names;
        this._m_names = this.namesWithIo.data;
        return this._m_names;
      }
    });

    /**
     * Reserved space for a copy of the resource file header.
     */

    /**
     * Reserved space for a handle to the next loaded resource map in memory.
     */

    /**
     * Reserved space for the resource file's file reference number.
     */

    /**
     * The resource file's attributes.
     */

    /**
     * Offset of the resource type list,
     * from the start of the resource map.
     * 
     * In practice,
     * this should always be `sizeof<resource_map>`,
     * i. e. the resource type list should directly follow the resource map.
     */

    /**
     * Offset of the resource name area,
     * from the start of the resource map.
     */

    return ResourceMap;
  })();

  /**
   * Use `data_blocks` instead,
   * unless you need access to this instance's `_io`.
   */
  Object.defineProperty(ResourceFork.prototype, 'dataBlocksWithIo', {
    get: function() {
      if (this._m_dataBlocksWithIo !== undefined)
        return this._m_dataBlocksWithIo;
      var _pos = this._io.pos;
      this._io.seek(this.header.ofsDataBlocks);
      this._raw__m_dataBlocksWithIo = this._io.readBytes(this.header.lenDataBlocks);
      var _io__raw__m_dataBlocksWithIo = new KaitaiStream(this._raw__m_dataBlocksWithIo);
      this._m_dataBlocksWithIo = new BytesWithIo(_io__raw__m_dataBlocksWithIo, this, null);
      this._io.seek(_pos);
      return this._m_dataBlocksWithIo;
    }
  });

  /**
   * Storage area for the data blocks of all resources.
   * 
   * These data blocks are not required to appear in any particular order,
   * and there may be unused space between and around them.
   * 
   * In practice,
   * the data blocks in newly created resource files are usually contiguous.
   * When existing resources are shortened,
   * the Mac OS resource manager leaves unused space where the now removed resource data was,
   * as this is quicker than moving the following resource data into the newly freed space.
   * Such unused space may be cleaned up later when the resource manager "compacts" the resource file,
   * which happens when resources are removed entirely,
   * or when resources are added or grown so that more space is needed in the data area.
   */
  Object.defineProperty(ResourceFork.prototype, 'dataBlocks', {
    get: function() {
      if (this._m_dataBlocks !== undefined)
        return this._m_dataBlocks;
      this._m_dataBlocks = this.dataBlocksWithIo.data;
      return this._m_dataBlocks;
    }
  });

  /**
   * The resource file's resource map.
   */
  Object.defineProperty(ResourceFork.prototype, 'resourceMap', {
    get: function() {
      if (this._m_resourceMap !== undefined)
        return this._m_resourceMap;
      var _pos = this._io.pos;
      this._io.seek(this.header.ofsResourceMap);
      this._raw__m_resourceMap = this._io.readBytes(this.header.lenResourceMap);
      var _io__raw__m_resourceMap = new KaitaiStream(this._raw__m_resourceMap);
      this._m_resourceMap = new ResourceMap(_io__raw__m_resourceMap, this, this._root);
      this._io.seek(_pos);
      return this._m_resourceMap;
    }
  });

  /**
   * The resource file's header information.
   */

  /**
   * System-reserved data area.
   * This field can generally be ignored when reading and writing.
   * 
   * This field is used by the Classic Mac OS Finder as temporary storage space.
   * It usually contains parts of the file metadata (name, type/creator code, etc.).
   * Any existing data in this field is ignored and overwritten.
   * 
   * In resource files written by Mac OS X,
   * this field is set to all zero bytes.
   */

  /**
   * Application-specific data area.
   * This field can generally be ignored when reading and writing.
   * 
   * According to early revisions of Inside Macintosh,
   * this field is "available for application data".
   * In practice, it is almost never used for this purpose,
   * and usually contains only junk data.
   * 
   * In resource files written by Mac OS X,
   * this field is set to all zero bytes.
   */

  return ResourceFork;
})();
return ResourceFork;
}));
