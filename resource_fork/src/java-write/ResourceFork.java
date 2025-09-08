// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.ArrayList;
import java.util.List;


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
 * @see <a href="https://developer.apple.com/library/archive/documentation/mac/pdf/MoreMacintoshToolbox.pdf#page=151">Inside Macintosh, More Macintosh Toolbox, Resource Manager, Resource Manager Reference, Resource File Format</a>
 * @see <a href="https://www.pagetable.com/?p=50">Inside Macintosh, Volume I, The Resource Manager, Format of a Resource File</a>
 * @see <a href="https://github.com/kreativekorp/ksfl/wiki/Macintosh-Resource-File-Format">Source</a>
 * @see <a href="https://github.com/dgelessus/mac_file_format_docs/blob/master/README.md#resource-forks">Source</a>
 */
public class ResourceFork extends KaitaiStruct.ReadWrite {
    public static ResourceFork fromFile(String fileName) throws IOException {
        return new ResourceFork(new ByteBufferKaitaiStream(fileName));
    }
    public ResourceFork() {
        this(null, null, null);
    }

    public ResourceFork(KaitaiStream _io) {
        this(_io, null, null);
    }

    public ResourceFork(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public ResourceFork(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, ResourceFork _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new FileHeader(this._io, this, _root);
        this.header._read();
        this.systemData = this._io.readBytes(112);
        this.applicationData = this._io.readBytes(128);
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        dataBlocksWithIo();
        if (this.dataBlocksWithIo != null) {
            this.dataBlocksWithIo._fetchInstances();
        }
        resourceMap();
        if (this.resourceMap != null) {
            this.resourceMap._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteDataBlocksWithIo = _enabledDataBlocksWithIo;
        _shouldWriteResourceMap = _enabledResourceMap;
        this.header._write_Seq(this._io);
        this._io.writeBytes(this.systemData);
        this._io.writeBytes(this.applicationData);
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (this.systemData.length != 112)
            throw new ConsistencyError("system_data", 112, this.systemData.length);
        if (this.applicationData.length != 128)
            throw new ConsistencyError("application_data", 128, this.applicationData.length);
        if (_enabledDataBlocksWithIo) {
        }
        if (_enabledResourceMap) {
            if (!Objects.equals(this.resourceMap._root(), _root()))
                throw new ConsistencyError("resource_map", _root(), this.resourceMap._root());
            if (!Objects.equals(this.resourceMap._parent(), this))
                throw new ConsistencyError("resource_map", this, this.resourceMap._parent());
        }
        _dirty = false;
    }

    /**
     * A resource data block,
     * as stored in the resource data area.
     * 
     * Each data block stores the data contained in a resource,
     * along with its length.
     */
    public static class DataBlock extends KaitaiStruct.ReadWrite {
        public static DataBlock fromFile(String fileName) throws IOException {
            return new DataBlock(new ByteBufferKaitaiStream(fileName));
        }
        public DataBlock() {
            this(null, null, null);
        }

        public DataBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataBlock(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent) {
            this(_io, _parent, null);
        }

        public DataBlock(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent, ResourceFork _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenData = this._io.readU4be();
            this.data = this._io.readBytes(lenData());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.lenData);
            this._io.writeBytes(this.data);
        }

        public void _check() {
            if (this.data.length != lenData())
                throw new ConsistencyError("data", lenData(), this.data.length);
            _dirty = false;
        }
        private long lenData;
        private byte[] data;
        private ResourceFork _root;
        private ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent;

        /**
         * The length of the resource data stored in this block.
         */
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }

        /**
         * The data stored in this block.
         */
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public ResourceFork _root() { return _root; }
        public void set_root(ResourceFork _v) { _dirty = true; _root = _v; }
        public ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent() { return _parent; }
        public void set_parent(ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Resource file header,
     * containing the offsets and lengths of the resource data area and resource map.
     */
    public static class FileHeader extends KaitaiStruct.ReadWrite {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
        }
        public FileHeader() {
            this(null, null, null);
        }

        public FileHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public FileHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, ResourceFork _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.ofsDataBlocks = this._io.readU4be();
            this.ofsResourceMap = this._io.readU4be();
            this.lenDataBlocks = this._io.readU4be();
            this.lenResourceMap = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.ofsDataBlocks);
            this._io.writeU4be(this.ofsResourceMap);
            this._io.writeU4be(this.lenDataBlocks);
            this._io.writeU4be(this.lenResourceMap);
        }

        public void _check() {
            _dirty = false;
        }
        private long ofsDataBlocks;
        private long ofsResourceMap;
        private long lenDataBlocks;
        private long lenResourceMap;
        private ResourceFork _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * Offset of the resource data area,
         * from the start of the resource file.
         * 
         * In practice,
         * this should always be `256`,
         * i. e. the resource data area should directly follow the application-specific data area.
         */
        public long ofsDataBlocks() { return ofsDataBlocks; }
        public void setOfsDataBlocks(long _v) { _dirty = true; ofsDataBlocks = _v; }

        /**
         * Offset of the resource map,
         * from the start of the resource file.
         * 
         * In practice,
         * this should always be `ofs_data_blocks + len_data_blocks`,
         * i. e. the resource map should directly follow the resource data area.
         */
        public long ofsResourceMap() { return ofsResourceMap; }
        public void setOfsResourceMap(long _v) { _dirty = true; ofsResourceMap = _v; }

        /**
         * Length of the resource data area.
         */
        public long lenDataBlocks() { return lenDataBlocks; }
        public void setLenDataBlocks(long _v) { _dirty = true; lenDataBlocks = _v; }

        /**
         * Length of the resource map.
         * 
         * In practice,
         * this should always be `_root._io.size - ofs_resource_map`,
         * i. e. the resource map should extend to the end of the resource file.
         */
        public long lenResourceMap() { return lenResourceMap; }
        public void setLenResourceMap(long _v) { _dirty = true; lenResourceMap = _v; }
        public ResourceFork _root() { return _root; }
        public void set_root(ResourceFork _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Resource map,
     * containing information about the resources in the file and where they are located in the data area.
     */
    public static class ResourceMap extends KaitaiStruct.ReadWrite {
        public static ResourceMap fromFile(String fileName) throws IOException {
            return new ResourceMap(new ByteBufferKaitaiStream(fileName));
        }
        public ResourceMap() {
            this(null, null, null);
        }

        public ResourceMap(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ResourceMap(KaitaiStream _io, ResourceFork _parent) {
            this(_io, _parent, null);
        }

        public ResourceMap(KaitaiStream _io, ResourceFork _parent, ResourceFork _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.reservedFileHeaderCopy = new FileHeader(this._io, this, _root);
            this.reservedFileHeaderCopy._read();
            this.reservedNextResourceMapHandle = this._io.readU4be();
            this.reservedFileReferenceNumber = this._io.readU2be();
            this._raw_fileAttributes = this._io.readBytes(2);
            KaitaiStream _io__raw_fileAttributes = new ByteBufferKaitaiStream(this._raw_fileAttributes);
            this.fileAttributes = new FileAttributes(_io__raw_fileAttributes, this, _root);
            this.fileAttributes._read();
            this.ofsTypeList = this._io.readU2be();
            this.ofsNames = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.reservedFileHeaderCopy._fetchInstances();
            this.fileAttributes._fetchInstances();
            namesWithIo();
            if (this.namesWithIo != null) {
                this.namesWithIo._fetchInstances();
            }
            typeListAndReferenceLists();
            if (this.typeListAndReferenceLists != null) {
                this.typeListAndReferenceLists._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteNamesWithIo = _enabledNamesWithIo;
            _shouldWriteTypeListAndReferenceLists = _enabledTypeListAndReferenceLists;
            this.reservedFileHeaderCopy._write_Seq(this._io);
            this._io.writeU4be(this.reservedNextResourceMapHandle);
            this._io.writeU2be(this.reservedFileReferenceNumber);
            final KaitaiStream _io__raw_fileAttributes = new ByteBufferKaitaiStream(2);
            this._io.addChildStream(_io__raw_fileAttributes);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (2));
                final ResourceMap _this = this;
                _io__raw_fileAttributes.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_fileAttributes = _io__raw_fileAttributes.toByteArray();
                        if (_this._raw_fileAttributes.length != 2)
                            throw new ConsistencyError("raw(file_attributes)", 2, _this._raw_fileAttributes.length);
                        parent.writeBytes(_this._raw_fileAttributes);
                    }
                });
            }
            this.fileAttributes._write_Seq(_io__raw_fileAttributes);
            this._io.writeU2be(this.ofsTypeList);
            this._io.writeU2be(this.ofsNames);
        }

        public void _check() {
            if (!Objects.equals(this.reservedFileHeaderCopy._root(), _root()))
                throw new ConsistencyError("reserved_file_header_copy", _root(), this.reservedFileHeaderCopy._root());
            if (!Objects.equals(this.reservedFileHeaderCopy._parent(), this))
                throw new ConsistencyError("reserved_file_header_copy", this, this.reservedFileHeaderCopy._parent());
            if (!Objects.equals(this.fileAttributes._root(), _root()))
                throw new ConsistencyError("file_attributes", _root(), this.fileAttributes._root());
            if (!Objects.equals(this.fileAttributes._parent(), this))
                throw new ConsistencyError("file_attributes", this, this.fileAttributes._parent());
            if (_enabledNamesWithIo) {
            }
            if (_enabledTypeListAndReferenceLists) {
                if (!Objects.equals(this.typeListAndReferenceLists._root(), _root()))
                    throw new ConsistencyError("type_list_and_reference_lists", _root(), this.typeListAndReferenceLists._root());
                if (!Objects.equals(this.typeListAndReferenceLists._parent(), this))
                    throw new ConsistencyError("type_list_and_reference_lists", this, this.typeListAndReferenceLists._parent());
            }
            _dirty = false;
        }

        /**
         * A resource file's attributes,
         * as stored in the resource map.
         * 
         * These attributes are sometimes also referred to as resource map attributes,
         * because of where they are stored in the file.
         */
        public static class FileAttributes extends KaitaiStruct.ReadWrite {
            public static FileAttributes fromFile(String fileName) throws IOException {
                return new FileAttributes(new ByteBufferKaitaiStream(fileName));
            }
            public FileAttributes() {
                this(null, null, null);
            }

            public FileAttributes(KaitaiStream _io) {
                this(_io, null, null);
            }

            public FileAttributes(KaitaiStream _io, ResourceFork.ResourceMap _parent) {
                this(_io, _parent, null);
            }

            public FileAttributes(KaitaiStream _io, ResourceFork.ResourceMap _parent, ResourceFork _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.resourcesLocked = this._io.readBitsIntBe(1) != 0;
                this.reserved0 = this._io.readBitsIntBe(6);
                this.printerDriverMultifinderCompatible = this._io.readBitsIntBe(1) != 0;
                this.noWriteChanges = this._io.readBitsIntBe(1) != 0;
                this.needsCompact = this._io.readBitsIntBe(1) != 0;
                this.mapNeedsWrite = this._io.readBitsIntBe(1) != 0;
                this.reserved1 = this._io.readBitsIntBe(5);
                _dirty = false;
            }

            public void _fetchInstances() {
                asInt();
                if (this.asInt != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteAsInt = _enabledAsInt;
                this._io.writeBitsIntBe(1, (this.resourcesLocked ? 1 : 0));
                this._io.writeBitsIntBe(6, this.reserved0);
                this._io.writeBitsIntBe(1, (this.printerDriverMultifinderCompatible ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.noWriteChanges ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.needsCompact ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.mapNeedsWrite ? 1 : 0));
                this._io.writeBitsIntBe(5, this.reserved1);
            }

            public void _check() {
                if (_enabledAsInt) {
                }
                _dirty = false;
            }
            private Integer asInt;
            private boolean _shouldWriteAsInt = false;
            private boolean _enabledAsInt = true;

            /**
             * The attributes as a packed integer,
             * as they are stored in the file.
             */
            public Integer asInt() {
                if (_shouldWriteAsInt)
                    _writeAsInt();
                if (this.asInt != null)
                    return this.asInt;
                if (!_enabledAsInt)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.asInt = this._io.readU2be();
                this._io.seek(_pos);
                return this.asInt;
            }
            public void setAsInt(int _v) { _dirty = true; asInt = _v; }
            public void setAsInt_Enabled(boolean _v) { _dirty = true; _enabledAsInt = _v; }

            private void _writeAsInt() {
                _shouldWriteAsInt = false;
                long _pos = this._io.pos();
                this._io.seek(0);
                this._io.writeU2be(this.asInt);
                this._io.seek(_pos);
            }
            private boolean resourcesLocked;
            private long reserved0;
            private boolean printerDriverMultifinderCompatible;
            private boolean noWriteChanges;
            private boolean needsCompact;
            private boolean mapNeedsWrite;
            private long reserved1;
            private ResourceFork _root;
            private ResourceFork.ResourceMap _parent;

            /**
             * TODO What does this attribute actually do,
             * and how is it different from `read_only`?
             * 
             * This attribute is undocumented and not defined in <CarbonCore/Resources.h>,
             * but ResEdit has a checkbox called "Resources Locked" for this attribute.
             */
            public boolean resourcesLocked() { return resourcesLocked; }
            public void setResourcesLocked(boolean _v) { _dirty = true; resourcesLocked = _v; }

            /**
             * These attributes have no known usage or meaning and should always be zero.
             */
            public long reserved0() { return reserved0; }
            public void setReserved0(long _v) { _dirty = true; reserved0 = _v; }

            /**
             * Indicates that this printer driver is compatible with MultiFinder,
             * i. e. can be used simultaneously by multiple applications.
             * This attribute is only meant to be set on printer driver resource forks.
             * 
             * This attribute is not documented in Inside Macintosh and is not defined in <CarbonCore/Resources.h>.
             * It is documented in technote PR510,
             * and ResEdit has a checkbox called "Printer Driver MultiFinder Compatible" for this attribute.
             * @see <a href="https://developer.apple.com/library/archive/technotes/pr/pr_510.html">Apple Technical Note PR510 - Printer Driver Q&As, section '"Printer driver is MultiFinder compatible" bit'</a>
             */
            public boolean printerDriverMultifinderCompatible() { return printerDriverMultifinderCompatible; }
            public void setPrinterDriverMultifinderCompatible(boolean _v) { _dirty = true; printerDriverMultifinderCompatible = _v; }

            /**
             * Indicates that the Resource Manager should not write any changes from memory into the resource file.
             * Any modification operations requested by the application will return successfully,
             * but will not actually update the resource file.
             * 
             * TODO Is this attribute supposed to be set on disk or only in memory?
             */
            public boolean noWriteChanges() { return noWriteChanges; }
            public void setNoWriteChanges(boolean _v) { _dirty = true; noWriteChanges = _v; }

            /**
             * Indicates that the resource file should be compacted the next time it is written by the Resource Manager.
             * This attribute is only meant to be set in memory;
             * it is cleared when the resource file is written to disk.
             * 
             * This attribute is mainly used internally by the Resource Manager,
             * but may also be set manually by the application.
             */
            public boolean needsCompact() { return needsCompact; }
            public void setNeedsCompact(boolean _v) { _dirty = true; needsCompact = _v; }

            /**
             * Indicates that the resource map has been changed in memory and should be written to the resource file on the next update.
             * This attribute is only meant to be set in memory;
             * it is cleared when the resource file is written to disk.
             * 
             * This attribute is mainly used internally by the Resource Manager,
             * but may also be set manually by the application.
             */
            public boolean mapNeedsWrite() { return mapNeedsWrite; }
            public void setMapNeedsWrite(boolean _v) { _dirty = true; mapNeedsWrite = _v; }

            /**
             * These attributes have no known usage or meaning and should always be zero.
             */
            public long reserved1() { return reserved1; }
            public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }
            public ResourceFork _root() { return _root; }
            public void set_root(ResourceFork _v) { _dirty = true; _root = _v; }
            public ResourceFork.ResourceMap _parent() { return _parent; }
            public void set_parent(ResourceFork.ResourceMap _v) { _dirty = true; _parent = _v; }
        }

        /**
         * A resource name,
         * as stored in the resource name storage area in the resource map.
         * 
         * The resource names are not required to appear in any particular order.
         * There may be unused space between and around resource names,
         * but in practice they are often contiguous.
         */
        public static class Name extends KaitaiStruct.ReadWrite {
            public static Name fromFile(String fileName) throws IOException {
                return new Name(new ByteBufferKaitaiStream(fileName));
            }
            public Name() {
                this(null, null, null);
            }

            public Name(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Name(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent) {
                this(_io, _parent, null);
            }

            public Name(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent, ResourceFork _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.lenValue = this._io.readU1();
                this.value = this._io.readBytes(lenValue());
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.lenValue);
                this._io.writeBytes(this.value);
            }

            public void _check() {
                if (this.value.length != lenValue())
                    throw new ConsistencyError("value", lenValue(), this.value.length);
                _dirty = false;
            }
            private int lenValue;
            private byte[] value;
            private ResourceFork _root;
            private ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent;

            /**
             * The length of the resource name, in bytes.
             */
            public int lenValue() { return lenValue; }
            public void setLenValue(int _v) { _dirty = true; lenValue = _v; }

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
            public byte[] value() { return value; }
            public void setValue(byte[] _v) { _dirty = true; value = _v; }
            public ResourceFork _root() { return _root; }
            public void set_root(ResourceFork _v) { _dirty = true; _root = _v; }
            public ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent() { return _parent; }
            public void set_parent(ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _v) { _dirty = true; _parent = _v; }
        }

        /**
         * Resource type list and storage area for resource reference lists in the resource map.
         * 
         * The two parts are combined into a single type here for technical reasons:
         * the start of the resource reference list area is not stored explicitly in the file,
         * instead it always starts directly after the resource type list.
         * The simplest way to implement this is by placing both types into a single `seq`.
         */
        public static class TypeListAndReferenceLists extends KaitaiStruct.ReadWrite {
            public static TypeListAndReferenceLists fromFile(String fileName) throws IOException {
                return new TypeListAndReferenceLists(new ByteBufferKaitaiStream(fileName));
            }
            public TypeListAndReferenceLists() {
                this(null, null, null);
            }

            public TypeListAndReferenceLists(KaitaiStream _io) {
                this(_io, null, null);
            }

            public TypeListAndReferenceLists(KaitaiStream _io, ResourceFork.ResourceMap _parent) {
                this(_io, _parent, null);
            }

            public TypeListAndReferenceLists(KaitaiStream _io, ResourceFork.ResourceMap _parent, ResourceFork _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.typeList = new TypeList(this._io, this, _root);
                this.typeList._read();
                this.referenceLists = this._io.readBytesFull();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.typeList._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this.typeList._write_Seq(this._io);
                this._io.writeBytes(this.referenceLists);
                if (!(this._io.isEof()))
                    throw new ConsistencyError("reference_lists", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                if (!Objects.equals(this.typeList._root(), _root()))
                    throw new ConsistencyError("type_list", _root(), this.typeList._root());
                if (!Objects.equals(this.typeList._parent(), this))
                    throw new ConsistencyError("type_list", this, this.typeList._parent());
                _dirty = false;
            }

            /**
             * A resource reference list,
             * as stored in the reference list area.
             * 
             * Each reference list has exactly one matching entry in the resource type list,
             * and describes all resources of a single type in the file.
             */
            public static class ReferenceList extends KaitaiStruct.ReadWrite {
                public ReferenceList(int numReferences) {
                    this(null, null, null, numReferences);
                }

                public ReferenceList(KaitaiStream _io, int numReferences) {
                    this(_io, null, null, numReferences);
                }

                public ReferenceList(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry _parent, int numReferences) {
                    this(_io, _parent, null, numReferences);
                }

                public ReferenceList(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry _parent, ResourceFork _root, int numReferences) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    this.numReferences = numReferences;
                }
                public void _read() {
                    this.references = new ArrayList<Reference>();
                    for (int i = 0; i < numReferences(); i++) {
                        Reference _t_references = new Reference(this._io, this, _root);
                        try {
                            _t_references._read();
                        } finally {
                            this.references.add(_t_references);
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.references.size(); i++) {
                        this.references.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    for (int i = 0; i < this.references.size(); i++) {
                        this.references.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                }

                public void _check() {
                    if (this.references.size() != numReferences())
                        throw new ConsistencyError("references", numReferences(), this.references.size());
                    for (int i = 0; i < this.references.size(); i++) {
                        if (!Objects.equals(this.references.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("references", _root(), this.references.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.references.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("references", this, this.references.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }

                /**
                 * A single resource reference in a resource reference list.
                 */
                public static class Reference extends KaitaiStruct.ReadWrite {
                    public static Reference fromFile(String fileName) throws IOException {
                        return new Reference(new ByteBufferKaitaiStream(fileName));
                    }
                    public Reference() {
                        this(null, null, null);
                    }

                    public Reference(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public Reference(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList _parent) {
                        this(_io, _parent, null);
                    }

                    public Reference(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList _parent, ResourceFork _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.id = this._io.readS2be();
                        this.ofsName = this._io.readU2be();
                        this._raw_attributes = this._io.readBytes(1);
                        KaitaiStream _io__raw_attributes = new ByteBufferKaitaiStream(this._raw_attributes);
                        this.attributes = new Attributes(_io__raw_attributes, this, _root);
                        this.attributes._read();
                        this.ofsDataBlock = this._io.readBitsIntBe(24);
                        this.reservedHandle = this._io.readU4be();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        this.attributes._fetchInstances();
                        dataBlock();
                        if (this.dataBlock != null) {
                            this.dataBlock._fetchInstances();
                        }
                        name();
                        if (this.name != null) {
                            this.name._fetchInstances();
                        }
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        _shouldWriteDataBlock = _enabledDataBlock;
                        _shouldWriteName = _enabledName;
                        this._io.writeS2be(this.id);
                        this._io.writeU2be(this.ofsName);
                        final KaitaiStream _io__raw_attributes = new ByteBufferKaitaiStream(1);
                        this._io.addChildStream(_io__raw_attributes);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (1));
                            final Reference _this = this;
                            _io__raw_attributes.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_attributes = _io__raw_attributes.toByteArray();
                                    if (_this._raw_attributes.length != 1)
                                        throw new ConsistencyError("raw(attributes)", 1, _this._raw_attributes.length);
                                    parent.writeBytes(_this._raw_attributes);
                                }
                            });
                        }
                        this.attributes._write_Seq(_io__raw_attributes);
                        this._io.writeBitsIntBe(24, this.ofsDataBlock);
                        this._io.writeU4be(this.reservedHandle);
                    }

                    public void _check() {
                        if (!Objects.equals(this.attributes._root(), _root()))
                            throw new ConsistencyError("attributes", _root(), this.attributes._root());
                        if (!Objects.equals(this.attributes._parent(), this))
                            throw new ConsistencyError("attributes", this, this.attributes._parent());
                        if (_enabledDataBlock) {
                            if (!Objects.equals(this.dataBlock._root(), _root()))
                                throw new ConsistencyError("data_block", _root(), this.dataBlock._root());
                            if (!Objects.equals(this.dataBlock._parent(), this))
                                throw new ConsistencyError("data_block", this, this.dataBlock._parent());
                        }
                        if (_enabledName) {
                            if (ofsName() != 65535) {
                                if (!Objects.equals(this.name._root(), _root()))
                                    throw new ConsistencyError("name", _root(), this.name._root());
                                if (!Objects.equals(this.name._parent(), this))
                                    throw new ConsistencyError("name", this, this.name._parent());
                            }
                        }
                        _dirty = false;
                    }

                    /**
                     * A resource's attributes,
                     * as stored in a resource reference.
                     */
                    public static class Attributes extends KaitaiStruct.ReadWrite {
                        public static Attributes fromFile(String fileName) throws IOException {
                            return new Attributes(new ByteBufferKaitaiStream(fileName));
                        }
                        public Attributes() {
                            this(null, null, null);
                        }

                        public Attributes(KaitaiStream _io) {
                            this(_io, null, null);
                        }

                        public Attributes(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent) {
                            this(_io, _parent, null);
                        }

                        public Attributes(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent, ResourceFork _root) {
                            super(_io);
                            this._parent = _parent;
                            this._root = _root;
                        }
                        public void _read() {
                            this.systemReference = this._io.readBitsIntBe(1) != 0;
                            this.loadIntoSystemHeap = this._io.readBitsIntBe(1) != 0;
                            this.purgeable = this._io.readBitsIntBe(1) != 0;
                            this.locked = this._io.readBitsIntBe(1) != 0;
                            this.protected = this._io.readBitsIntBe(1) != 0;
                            this.preload = this._io.readBitsIntBe(1) != 0;
                            this.needsWrite = this._io.readBitsIntBe(1) != 0;
                            this.compressed = this._io.readBitsIntBe(1) != 0;
                            _dirty = false;
                        }

                        public void _fetchInstances() {
                            asInt();
                            if (this.asInt != null) {
                            }
                        }

                        public void _write_Seq() {
                            _assertNotDirty();
                            _shouldWriteAsInt = _enabledAsInt;
                            this._io.writeBitsIntBe(1, (this.systemReference ? 1 : 0));
                            this._io.writeBitsIntBe(1, (this.loadIntoSystemHeap ? 1 : 0));
                            this._io.writeBitsIntBe(1, (this.purgeable ? 1 : 0));
                            this._io.writeBitsIntBe(1, (this.locked ? 1 : 0));
                            this._io.writeBitsIntBe(1, (this.protected ? 1 : 0));
                            this._io.writeBitsIntBe(1, (this.preload ? 1 : 0));
                            this._io.writeBitsIntBe(1, (this.needsWrite ? 1 : 0));
                            this._io.writeBitsIntBe(1, (this.compressed ? 1 : 0));
                        }

                        public void _check() {
                            if (_enabledAsInt) {
                            }
                            _dirty = false;
                        }
                        private Integer asInt;
                        private boolean _shouldWriteAsInt = false;
                        private boolean _enabledAsInt = true;

                        /**
                         * The attributes as a packed integer,
                         * as they are stored in the file.
                         */
                        public Integer asInt() {
                            if (_shouldWriteAsInt)
                                _writeAsInt();
                            if (this.asInt != null)
                                return this.asInt;
                            if (!_enabledAsInt)
                                return null;
                            long _pos = this._io.pos();
                            this._io.seek(0);
                            this.asInt = this._io.readU1();
                            this._io.seek(_pos);
                            return this.asInt;
                        }
                        public void setAsInt(int _v) { _dirty = true; asInt = _v; }
                        public void setAsInt_Enabled(boolean _v) { _dirty = true; _enabledAsInt = _v; }

                        private void _writeAsInt() {
                            _shouldWriteAsInt = false;
                            long _pos = this._io.pos();
                            this._io.seek(0);
                            this._io.writeU1(this.asInt);
                            this._io.seek(_pos);
                        }
                        private boolean systemReference;
                        private boolean loadIntoSystemHeap;
                        private boolean purgeable;
                        private boolean locked;
                        private boolean protected;
                        private boolean preload;
                        private boolean needsWrite;
                        private boolean compressed;
                        private ResourceFork _root;
                        private ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent;

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
                        public boolean systemReference() { return systemReference; }
                        public void setSystemReference(boolean _v) { _dirty = true; systemReference = _v; }

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
                        public boolean loadIntoSystemHeap() { return loadIntoSystemHeap; }
                        public void setLoadIntoSystemHeap(boolean _v) { _dirty = true; loadIntoSystemHeap = _v; }

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
                        public boolean purgeable() { return purgeable; }
                        public void setPurgeable(boolean _v) { _dirty = true; purgeable = _v; }

                        /**
                         * Indicates that this resource's data should be locked to the Mac OS Memory Manager.
                         * This prevents the resource data from being moved when the heap is compacted.
                         * 
                         * This attribute may be set both in memory and on disk,
                         * but it only has any meaning while the resource file is loaded into memory.
                         */
                        public boolean locked() { return locked; }
                        public void setLocked(boolean _v) { _dirty = true; locked = _v; }

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
                        public boolean protected() { return protected; }
                        public void setProtected(boolean _v) { _dirty = true; protected = _v; }

                        /**
                         * Indicates that this resource's data should be immediately loaded into memory when the resource file is opened.
                         * 
                         * This attribute may be set both in memory and on disk,
                         * but it only has any meaning when the resource file is first opened.
                         */
                        public boolean preload() { return preload; }
                        public void setPreload(boolean _v) { _dirty = true; preload = _v; }

                        /**
                         * Indicates that this resource's data has been changed in memory and should be written to the resource file on the next update.
                         * This attribute is only meant to be set in memory;
                         * it is cleared when the resource file is written to disk.
                         * 
                         * This attribute is used internally by the Resource Manager and should not be set manually by the application.
                         */
                        public boolean needsWrite() { return needsWrite; }
                        public void setNeedsWrite(boolean _v) { _dirty = true; needsWrite = _v; }

                        /**
                         * Indicates that this resource's data is compressed.
                         * Compressed resource data is decompressed transparently by the Resource Manager when reading.
                         * 
                         * For a detailed description of the structure of compressed resources as they are stored in the file,
                         * see the compressed_resource.ksy spec.
                         */
                        public boolean compressed() { return compressed; }
                        public void setCompressed(boolean _v) { _dirty = true; compressed = _v; }
                        public ResourceFork _root() { return _root; }
                        public void set_root(ResourceFork _v) { _dirty = true; _root = _v; }
                        public ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent() { return _parent; }
                        public void set_parent(ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _v) { _dirty = true; _parent = _v; }
                    }
                    private DataBlock dataBlock;
                    private boolean _shouldWriteDataBlock = false;
                    private boolean _enabledDataBlock = true;

                    /**
                     * The data block containing the data for the resource described by this reference.
                     */
                    public DataBlock dataBlock() {
                        if (_shouldWriteDataBlock)
                            _writeDataBlock();
                        if (this.dataBlock != null)
                            return this.dataBlock;
                        if (!_enabledDataBlock)
                            return null;
                        KaitaiStream io = _root().dataBlocksWithIo()._io();
                        long _pos = io.pos();
                        io.seek(ofsDataBlock());
                        this.dataBlock = new DataBlock(io, this, _root);
                        this.dataBlock._read();
                        io.seek(_pos);
                        return this.dataBlock;
                    }
                    public void setDataBlock(DataBlock _v) { _dirty = true; dataBlock = _v; }
                    public void setDataBlock_Enabled(boolean _v) { _dirty = true; _enabledDataBlock = _v; }

                    private void _writeDataBlock() {
                        _shouldWriteDataBlock = false;
                        KaitaiStream io = _root().dataBlocksWithIo()._io();
                        long _pos = io.pos();
                        io.seek(ofsDataBlock());
                        this.dataBlock._write_Seq(io);
                        io.seek(_pos);
                    }
                    private Name name;
                    private boolean _shouldWriteName = false;
                    private boolean _enabledName = true;

                    /**
                     * The name (if any) of the resource described by this reference.
                     */
                    public Name name() {
                        if (_shouldWriteName)
                            _writeName();
                        if (this.name != null)
                            return this.name;
                        if (!_enabledName)
                            return null;
                        if (ofsName() != 65535) {
                            KaitaiStream io = _root().resourceMap().namesWithIo()._io();
                            long _pos = io.pos();
                            io.seek(ofsName());
                            this.name = new Name(io, this, _root);
                            this.name._read();
                            io.seek(_pos);
                        }
                        return this.name;
                    }
                    public void setName(Name _v) { _dirty = true; name = _v; }
                    public void setName_Enabled(boolean _v) { _dirty = true; _enabledName = _v; }

                    private void _writeName() {
                        _shouldWriteName = false;
                        if (ofsName() != 65535) {
                            KaitaiStream io = _root().resourceMap().namesWithIo()._io();
                            long _pos = io.pos();
                            io.seek(ofsName());
                            this.name._write_Seq(io);
                            io.seek(_pos);
                        }
                    }
                    private short id;
                    private int ofsName;
                    private Attributes attributes;
                    private long ofsDataBlock;
                    private long reservedHandle;
                    private ResourceFork _root;
                    private ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList _parent;
                    private byte[] _raw_attributes;

                    /**
                     * ID of the resource described by this reference.
                     */
                    public short id() { return id; }
                    public void setId(short _v) { _dirty = true; id = _v; }

                    /**
                     * Offset of the name for the resource described by this reference,
                     * from the start of the resource name area.
                     * 
                     * If the resource has no name,
                     * the value of this field is `0xffff`
                     * i. e. `-1` truncated to a 16-bit unsigned integer.
                     */
                    public int ofsName() { return ofsName; }
                    public void setOfsName(int _v) { _dirty = true; ofsName = _v; }

                    /**
                     * Attributes of the resource described by this reference.
                     */
                    public Attributes attributes() { return attributes; }
                    public void setAttributes(Attributes _v) { _dirty = true; attributes = _v; }

                    /**
                     * Offset of the data block for the resource described by this reference,
                     * from the start of the resource data area.
                     */
                    public long ofsDataBlock() { return ofsDataBlock; }
                    public void setOfsDataBlock(long _v) { _dirty = true; ofsDataBlock = _v; }

                    /**
                     * Reserved space for the resource's handle in memory.
                     */
                    public long reservedHandle() { return reservedHandle; }
                    public void setReservedHandle(long _v) { _dirty = true; reservedHandle = _v; }
                    public ResourceFork _root() { return _root; }
                    public void set_root(ResourceFork _v) { _dirty = true; _root = _v; }
                    public ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList _parent() { return _parent; }
                    public void set_parent(ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList _v) { _dirty = true; _parent = _v; }
                    public byte[] _raw_attributes() { return _raw_attributes; }
                    public void set_raw_Attributes(byte[] _v) { _dirty = true; _raw_attributes = _v; }
                }
                private List<Reference> references;
                private int numReferences;
                private ResourceFork _root;
                private ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry _parent;

                /**
                 * The resource references in this reference list.
                 */
                public List<Reference> references() { return references; }
                public void setReferences(List<Reference> _v) { _dirty = true; references = _v; }

                /**
                 * The number of references in this resource reference list.
                 * 
                 * This information needs to be passed in as a parameter,
                 * because it is stored in the reference list's type list entry,
                 * and not in the reference list itself.
                 */
                public int numReferences() { return numReferences; }
                public void setNumReferences(int _v) { _dirty = true; numReferences = _v; }
                public ResourceFork _root() { return _root; }
                public void set_root(ResourceFork _v) { _dirty = true; _root = _v; }
                public ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry _parent() { return _parent; }
                public void set_parent(ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry _v) { _dirty = true; _parent = _v; }
            }

            /**
             * Resource type list in the resource map.
             */
            public static class TypeList extends KaitaiStruct.ReadWrite {
                public static TypeList fromFile(String fileName) throws IOException {
                    return new TypeList(new ByteBufferKaitaiStream(fileName));
                }
                public TypeList() {
                    this(null, null, null);
                }

                public TypeList(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public TypeList(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists _parent) {
                    this(_io, _parent, null);
                }

                public TypeList(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists _parent, ResourceFork _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.numTypesM1 = this._io.readU2be();
                    this.entries = new ArrayList<TypeListEntry>();
                    for (int i = 0; i < numTypes(); i++) {
                        TypeListEntry _t_entries = new TypeListEntry(this._io, this, _root);
                        try {
                            _t_entries._read();
                        } finally {
                            this.entries.add(_t_entries);
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.entries.size(); i++) {
                        this.entries.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU2be(this.numTypesM1);
                    for (int i = 0; i < this.entries.size(); i++) {
                        this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                }

                public void _check() {
                    if (this.entries.size() != numTypes())
                        throw new ConsistencyError("entries", numTypes(), this.entries.size());
                    for (int i = 0; i < this.entries.size(); i++) {
                        if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }

                /**
                 * A single entry in the resource type list.
                 * 
                 * Each entry corresponds to exactly one resource reference list.
                 */
                public static class TypeListEntry extends KaitaiStruct.ReadWrite {
                    public static TypeListEntry fromFile(String fileName) throws IOException {
                        return new TypeListEntry(new ByteBufferKaitaiStream(fileName));
                    }
                    public TypeListEntry() {
                        this(null, null, null);
                    }

                    public TypeListEntry(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public TypeListEntry(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList _parent) {
                        this(_io, _parent, null);
                    }

                    public TypeListEntry(KaitaiStream _io, ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList _parent, ResourceFork _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.type = this._io.readBytes(4);
                        this.numReferencesM1 = this._io.readU2be();
                        this.ofsReferenceList = this._io.readU2be();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        referenceList();
                        if (this.referenceList != null) {
                            this.referenceList._fetchInstances();
                        }
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        _shouldWriteReferenceList = _enabledReferenceList;
                        this._io.writeBytes(this.type);
                        this._io.writeU2be(this.numReferencesM1);
                        this._io.writeU2be(this.ofsReferenceList);
                    }

                    public void _check() {
                        if (this.type.length != 4)
                            throw new ConsistencyError("type", 4, this.type.length);
                        if (_enabledReferenceList) {
                            if (!Objects.equals(this.referenceList._root(), _root()))
                                throw new ConsistencyError("reference_list", _root(), this.referenceList._root());
                            if (!Objects.equals(this.referenceList._parent(), this))
                                throw new ConsistencyError("reference_list", this, this.referenceList._parent());
                            if (this.referenceList.numReferences() != numReferences())
                                throw new ConsistencyError("reference_list", numReferences(), this.referenceList.numReferences());
                        }
                        _dirty = false;
                    }
                    private Integer numReferences;

                    /**
                     * The number of resources in the reference list for this type.
                     */
                    public Integer numReferences() {
                        if (this.numReferences != null)
                            return this.numReferences;
                        this.numReferences = ((Number) (KaitaiStream.mod(numReferencesM1() + 1, 65536))).intValue();
                        return this.numReferences;
                    }
                    public void _invalidateNumReferences() { this.numReferences = null; }
                    private ReferenceList referenceList;
                    private boolean _shouldWriteReferenceList = false;
                    private boolean _enabledReferenceList = true;

                    /**
                     * The resource reference list for this resource type.
                     */
                    public ReferenceList referenceList() {
                        if (_shouldWriteReferenceList)
                            _writeReferenceList();
                        if (this.referenceList != null)
                            return this.referenceList;
                        if (!_enabledReferenceList)
                            return null;
                        KaitaiStream io = _parent()._parent()._io();
                        long _pos = io.pos();
                        io.seek(ofsReferenceList());
                        this.referenceList = new ReferenceList(io, this, _root, numReferences());
                        this.referenceList._read();
                        io.seek(_pos);
                        return this.referenceList;
                    }
                    public void setReferenceList(ReferenceList _v) { _dirty = true; referenceList = _v; }
                    public void setReferenceList_Enabled(boolean _v) { _dirty = true; _enabledReferenceList = _v; }

                    private void _writeReferenceList() {
                        _shouldWriteReferenceList = false;
                        KaitaiStream io = _parent()._parent()._io();
                        long _pos = io.pos();
                        io.seek(ofsReferenceList());
                        this.referenceList._write_Seq(io);
                        io.seek(_pos);
                    }
                    private byte[] type;
                    private int numReferencesM1;
                    private int ofsReferenceList;
                    private ResourceFork _root;
                    private ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList _parent;

                    /**
                     * The four-character type code of the resources in the reference list.
                     */
                    public byte[] type() { return type; }
                    public void setType(byte[] _v) { _dirty = true; type = _v; }

                    /**
                     * The number of resources in the reference list for this type,
                     * minus one.
                     * 
                     * Empty reference lists should never exist.
                     */
                    public int numReferencesM1() { return numReferencesM1; }
                    public void setNumReferencesM1(int _v) { _dirty = true; numReferencesM1 = _v; }

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
                    public int ofsReferenceList() { return ofsReferenceList; }
                    public void setOfsReferenceList(int _v) { _dirty = true; ofsReferenceList = _v; }
                    public ResourceFork _root() { return _root; }
                    public void set_root(ResourceFork _v) { _dirty = true; _root = _v; }
                    public ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList _parent() { return _parent; }
                    public void set_parent(ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList _v) { _dirty = true; _parent = _v; }
                }
                private Integer numTypes;

                /**
                 * The number of resource types in this list.
                 */
                public Integer numTypes() {
                    if (this.numTypes != null)
                        return this.numTypes;
                    this.numTypes = ((Number) (KaitaiStream.mod(numTypesM1() + 1, 65536))).intValue();
                    return this.numTypes;
                }
                public void _invalidateNumTypes() { this.numTypes = null; }
                private int numTypesM1;
                private List<TypeListEntry> entries;
                private ResourceFork _root;
                private ResourceFork.ResourceMap.TypeListAndReferenceLists _parent;

                /**
                 * The number of resource types in this list,
                 * minus one.
                 * 
                 * If the resource list is empty,
                 * the value of this field is `0xffff`,
                 * i. e. `-1` truncated to a 16-bit unsigned integer.
                 */
                public int numTypesM1() { return numTypesM1; }
                public void setNumTypesM1(int _v) { _dirty = true; numTypesM1 = _v; }

                /**
                 * Entries in the resource type list.
                 */
                public List<TypeListEntry> entries() { return entries; }
                public void setEntries(List<TypeListEntry> _v) { _dirty = true; entries = _v; }
                public ResourceFork _root() { return _root; }
                public void set_root(ResourceFork _v) { _dirty = true; _root = _v; }
                public ResourceFork.ResourceMap.TypeListAndReferenceLists _parent() { return _parent; }
                public void set_parent(ResourceFork.ResourceMap.TypeListAndReferenceLists _v) { _dirty = true; _parent = _v; }
            }
            private TypeList typeList;
            private byte[] referenceLists;
            private ResourceFork _root;
            private ResourceFork.ResourceMap _parent;

            /**
             * The resource map's resource type list.
             */
            public TypeList typeList() { return typeList; }
            public void setTypeList(TypeList _v) { _dirty = true; typeList = _v; }

            /**
             * Storage area for the resource map's resource reference lists.
             * 
             * According to Inside Macintosh,
             * the reference lists are stored contiguously,
             * in the same order as their corresponding resource type list entries.
             */
            public byte[] referenceLists() { return referenceLists; }
            public void setReferenceLists(byte[] _v) { _dirty = true; referenceLists = _v; }
            public ResourceFork _root() { return _root; }
            public void set_root(ResourceFork _v) { _dirty = true; _root = _v; }
            public ResourceFork.ResourceMap _parent() { return _parent; }
            public void set_parent(ResourceFork.ResourceMap _v) { _dirty = true; _parent = _v; }
        }
        private byte[] names;

        /**
         * Storage area for the names of all resources.
         */
        public byte[] names() {
            if (this.names != null)
                return this.names;
            this.names = namesWithIo().data();
            return this.names;
        }
        public void _invalidateNames() { this.names = null; }
        private BytesWithIo namesWithIo;
        private boolean _shouldWriteNamesWithIo = false;
        private boolean _enabledNamesWithIo = true;

        /**
         * Use `names` instead,
         * unless you need access to this instance's `_io`.
         */
        public BytesWithIo namesWithIo() {
            if (_shouldWriteNamesWithIo)
                _writeNamesWithIo();
            if (this.namesWithIo != null)
                return this.namesWithIo;
            if (!_enabledNamesWithIo)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsNames());
            this._raw_namesWithIo = this._io.readBytesFull();
            KaitaiStream _io__raw_namesWithIo = new ByteBufferKaitaiStream(this._raw_namesWithIo);
            this.namesWithIo = new BytesWithIo(_io__raw_namesWithIo);
            this.namesWithIo._read();
            this._io.seek(_pos);
            return this.namesWithIo;
        }
        public void setNamesWithIo(BytesWithIo _v) { _dirty = true; namesWithIo = _v; }
        public void setNamesWithIo_Enabled(boolean _v) { _dirty = true; _enabledNamesWithIo = _v; }

        private void _writeNamesWithIo() {
            _shouldWriteNamesWithIo = false;
            long _pos = this._io.pos();
            this._io.seek(ofsNames());
            final KaitaiStream _io__raw_namesWithIo = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
            this._io.addChildStream(_io__raw_namesWithIo);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                final ResourceMap _this = this;
                _io__raw_namesWithIo.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_namesWithIo = _io__raw_namesWithIo.toByteArray();
                        parent.writeBytes(_this._raw_namesWithIo);
                        if (!(parent.isEof()))
                            throw new ConsistencyError("raw(names_with_io)", 0, parent.size() - parent.pos());
                    }
                });
            }
            this.namesWithIo._write_Seq(_io__raw_namesWithIo);
            this._io.seek(_pos);
        }
        private TypeListAndReferenceLists typeListAndReferenceLists;
        private boolean _shouldWriteTypeListAndReferenceLists = false;
        private boolean _enabledTypeListAndReferenceLists = true;

        /**
         * The resource map's resource type list, followed by the resource reference list area.
         */
        public TypeListAndReferenceLists typeListAndReferenceLists() {
            if (_shouldWriteTypeListAndReferenceLists)
                _writeTypeListAndReferenceLists();
            if (this.typeListAndReferenceLists != null)
                return this.typeListAndReferenceLists;
            if (!_enabledTypeListAndReferenceLists)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsTypeList());
            this._raw_typeListAndReferenceLists = this._io.readBytes(ofsNames() - ofsTypeList());
            KaitaiStream _io__raw_typeListAndReferenceLists = new ByteBufferKaitaiStream(this._raw_typeListAndReferenceLists);
            this.typeListAndReferenceLists = new TypeListAndReferenceLists(_io__raw_typeListAndReferenceLists, this, _root);
            this.typeListAndReferenceLists._read();
            this._io.seek(_pos);
            return this.typeListAndReferenceLists;
        }
        public void setTypeListAndReferenceLists(TypeListAndReferenceLists _v) { _dirty = true; typeListAndReferenceLists = _v; }
        public void setTypeListAndReferenceLists_Enabled(boolean _v) { _dirty = true; _enabledTypeListAndReferenceLists = _v; }

        private void _writeTypeListAndReferenceLists() {
            _shouldWriteTypeListAndReferenceLists = false;
            long _pos = this._io.pos();
            this._io.seek(ofsTypeList());
            final KaitaiStream _io__raw_typeListAndReferenceLists = new ByteBufferKaitaiStream(ofsNames() - ofsTypeList());
            this._io.addChildStream(_io__raw_typeListAndReferenceLists);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (ofsNames() - ofsTypeList()));
                final ResourceMap _this = this;
                _io__raw_typeListAndReferenceLists.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_typeListAndReferenceLists = _io__raw_typeListAndReferenceLists.toByteArray();
                        if (_this._raw_typeListAndReferenceLists.length != ofsNames() - ofsTypeList())
                            throw new ConsistencyError("raw(type_list_and_reference_lists)", ofsNames() - ofsTypeList(), _this._raw_typeListAndReferenceLists.length);
                        parent.writeBytes(_this._raw_typeListAndReferenceLists);
                    }
                });
            }
            this.typeListAndReferenceLists._write_Seq(_io__raw_typeListAndReferenceLists);
            this._io.seek(_pos);
        }
        private FileHeader reservedFileHeaderCopy;
        private long reservedNextResourceMapHandle;
        private int reservedFileReferenceNumber;
        private FileAttributes fileAttributes;
        private int ofsTypeList;
        private int ofsNames;
        private ResourceFork _root;
        private ResourceFork _parent;
        private byte[] _raw_fileAttributes;
        private byte[] _raw_namesWithIo;
        private byte[] _raw_typeListAndReferenceLists;

        /**
         * Reserved space for a copy of the resource file header.
         */
        public FileHeader reservedFileHeaderCopy() { return reservedFileHeaderCopy; }
        public void setReservedFileHeaderCopy(FileHeader _v) { _dirty = true; reservedFileHeaderCopy = _v; }

        /**
         * Reserved space for a handle to the next loaded resource map in memory.
         */
        public long reservedNextResourceMapHandle() { return reservedNextResourceMapHandle; }
        public void setReservedNextResourceMapHandle(long _v) { _dirty = true; reservedNextResourceMapHandle = _v; }

        /**
         * Reserved space for the resource file's file reference number.
         */
        public int reservedFileReferenceNumber() { return reservedFileReferenceNumber; }
        public void setReservedFileReferenceNumber(int _v) { _dirty = true; reservedFileReferenceNumber = _v; }

        /**
         * The resource file's attributes.
         */
        public FileAttributes fileAttributes() { return fileAttributes; }
        public void setFileAttributes(FileAttributes _v) { _dirty = true; fileAttributes = _v; }

        /**
         * Offset of the resource type list,
         * from the start of the resource map.
         * 
         * In practice,
         * this should always be `sizeof<resource_map>`,
         * i. e. the resource type list should directly follow the resource map.
         */
        public int ofsTypeList() { return ofsTypeList; }
        public void setOfsTypeList(int _v) { _dirty = true; ofsTypeList = _v; }

        /**
         * Offset of the resource name area,
         * from the start of the resource map.
         */
        public int ofsNames() { return ofsNames; }
        public void setOfsNames(int _v) { _dirty = true; ofsNames = _v; }
        public ResourceFork _root() { return _root; }
        public void set_root(ResourceFork _v) { _dirty = true; _root = _v; }
        public ResourceFork _parent() { return _parent; }
        public void set_parent(ResourceFork _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_fileAttributes() { return _raw_fileAttributes; }
        public void set_raw_FileAttributes(byte[] _v) { _dirty = true; _raw_fileAttributes = _v; }
        public byte[] _raw_namesWithIo() { return _raw_namesWithIo; }
        public void set_raw_NamesWithIo(byte[] _v) { _dirty = true; _raw_namesWithIo = _v; }
        public byte[] _raw_typeListAndReferenceLists() { return _raw_typeListAndReferenceLists; }
        public void set_raw_TypeListAndReferenceLists(byte[] _v) { _dirty = true; _raw_typeListAndReferenceLists = _v; }
    }
    private byte[] dataBlocks;

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
    public byte[] dataBlocks() {
        if (this.dataBlocks != null)
            return this.dataBlocks;
        this.dataBlocks = dataBlocksWithIo().data();
        return this.dataBlocks;
    }
    public void _invalidateDataBlocks() { this.dataBlocks = null; }
    private BytesWithIo dataBlocksWithIo;
    private boolean _shouldWriteDataBlocksWithIo = false;
    private boolean _enabledDataBlocksWithIo = true;

    /**
     * Use `data_blocks` instead,
     * unless you need access to this instance's `_io`.
     */
    public BytesWithIo dataBlocksWithIo() {
        if (_shouldWriteDataBlocksWithIo)
            _writeDataBlocksWithIo();
        if (this.dataBlocksWithIo != null)
            return this.dataBlocksWithIo;
        if (!_enabledDataBlocksWithIo)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().ofsDataBlocks());
        this._raw_dataBlocksWithIo = this._io.readBytes(header().lenDataBlocks());
        KaitaiStream _io__raw_dataBlocksWithIo = new ByteBufferKaitaiStream(this._raw_dataBlocksWithIo);
        this.dataBlocksWithIo = new BytesWithIo(_io__raw_dataBlocksWithIo);
        this.dataBlocksWithIo._read();
        this._io.seek(_pos);
        return this.dataBlocksWithIo;
    }
    public void setDataBlocksWithIo(BytesWithIo _v) { _dirty = true; dataBlocksWithIo = _v; }
    public void setDataBlocksWithIo_Enabled(boolean _v) { _dirty = true; _enabledDataBlocksWithIo = _v; }

    private void _writeDataBlocksWithIo() {
        _shouldWriteDataBlocksWithIo = false;
        long _pos = this._io.pos();
        this._io.seek(header().ofsDataBlocks());
        final KaitaiStream _io__raw_dataBlocksWithIo = new ByteBufferKaitaiStream(header().lenDataBlocks());
        this._io.addChildStream(_io__raw_dataBlocksWithIo);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (header().lenDataBlocks()));
            final ResourceFork _this = this;
            _io__raw_dataBlocksWithIo.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_dataBlocksWithIo = _io__raw_dataBlocksWithIo.toByteArray();
                    if (_this._raw_dataBlocksWithIo.length != header().lenDataBlocks())
                        throw new ConsistencyError("raw(data_blocks_with_io)", header().lenDataBlocks(), _this._raw_dataBlocksWithIo.length);
                    parent.writeBytes(_this._raw_dataBlocksWithIo);
                }
            });
        }
        this.dataBlocksWithIo._write_Seq(_io__raw_dataBlocksWithIo);
        this._io.seek(_pos);
    }
    private ResourceMap resourceMap;
    private boolean _shouldWriteResourceMap = false;
    private boolean _enabledResourceMap = true;

    /**
     * The resource file's resource map.
     */
    public ResourceMap resourceMap() {
        if (_shouldWriteResourceMap)
            _writeResourceMap();
        if (this.resourceMap != null)
            return this.resourceMap;
        if (!_enabledResourceMap)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().ofsResourceMap());
        this._raw_resourceMap = this._io.readBytes(header().lenResourceMap());
        KaitaiStream _io__raw_resourceMap = new ByteBufferKaitaiStream(this._raw_resourceMap);
        this.resourceMap = new ResourceMap(_io__raw_resourceMap, this, _root);
        this.resourceMap._read();
        this._io.seek(_pos);
        return this.resourceMap;
    }
    public void setResourceMap(ResourceMap _v) { _dirty = true; resourceMap = _v; }
    public void setResourceMap_Enabled(boolean _v) { _dirty = true; _enabledResourceMap = _v; }

    private void _writeResourceMap() {
        _shouldWriteResourceMap = false;
        long _pos = this._io.pos();
        this._io.seek(header().ofsResourceMap());
        final KaitaiStream _io__raw_resourceMap = new ByteBufferKaitaiStream(header().lenResourceMap());
        this._io.addChildStream(_io__raw_resourceMap);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (header().lenResourceMap()));
            final ResourceFork _this = this;
            _io__raw_resourceMap.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_resourceMap = _io__raw_resourceMap.toByteArray();
                    if (_this._raw_resourceMap.length != header().lenResourceMap())
                        throw new ConsistencyError("raw(resource_map)", header().lenResourceMap(), _this._raw_resourceMap.length);
                    parent.writeBytes(_this._raw_resourceMap);
                }
            });
        }
        this.resourceMap._write_Seq(_io__raw_resourceMap);
        this._io.seek(_pos);
    }
    private FileHeader header;
    private byte[] systemData;
    private byte[] applicationData;
    private ResourceFork _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_dataBlocksWithIo;
    private byte[] _raw_resourceMap;

    /**
     * The resource file's header information.
     */
    public FileHeader header() { return header; }
    public void setHeader(FileHeader _v) { _dirty = true; header = _v; }

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
    public byte[] systemData() { return systemData; }
    public void setSystemData(byte[] _v) { _dirty = true; systemData = _v; }

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
    public byte[] applicationData() { return applicationData; }
    public void setApplicationData(byte[] _v) { _dirty = true; applicationData = _v; }
    public ResourceFork _root() { return _root; }
    public void set_root(ResourceFork _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_dataBlocksWithIo() { return _raw_dataBlocksWithIo; }
    public void set_raw_DataBlocksWithIo(byte[] _v) { _dirty = true; _raw_dataBlocksWithIo = _v; }
    public byte[] _raw_resourceMap() { return _raw_resourceMap; }
    public void set_raw_ResourceMap(byte[] _v) { _dirty = true; _raw_resourceMap = _v; }
}
