// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
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
public class ResourceFork extends KaitaiStruct {
    public static ResourceFork fromFile(String fileName) throws IOException {
        return new ResourceFork(new ByteBufferKaitaiStream(fileName));
    }

    public ResourceFork(KaitaiStream _io) {
        this(_io, null, null);
    }

    public ResourceFork(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public ResourceFork(KaitaiStream _io, KaitaiStruct _parent, ResourceFork _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new FileHeader(this._io, this, _root);
        this.systemData = this._io.readBytes(112);
        this.applicationData = this._io.readBytes(128);
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

    /**
     * A resource data block,
     * as stored in the resource data area.
     * 
     * Each data block stores the data contained in a resource,
     * along with its length.
     */
    public static class DataBlock extends KaitaiStruct {
        public static DataBlock fromFile(String fileName) throws IOException {
            return new DataBlock(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.lenData = this._io.readU4be();
            this.data = this._io.readBytes(lenData());
        }

        public void _fetchInstances() {
        }
        private long lenData;
        private byte[] data;
        private ResourceFork _root;
        private ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent;

        /**
         * The length of the resource data stored in this block.
         */
        public long lenData() { return lenData; }

        /**
         * The data stored in this block.
         */
        public byte[] data() { return data; }
        public ResourceFork _root() { return _root; }
        public ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent() { return _parent; }
    }

    /**
     * Resource file header,
     * containing the offsets and lengths of the resource data area and resource map.
     */
    public static class FileHeader extends KaitaiStruct {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
        }

        public FileHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileHeader(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public FileHeader(KaitaiStream _io, KaitaiStruct _parent, ResourceFork _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ofsDataBlocks = this._io.readU4be();
            this.ofsResourceMap = this._io.readU4be();
            this.lenDataBlocks = this._io.readU4be();
            this.lenResourceMap = this._io.readU4be();
        }

        public void _fetchInstances() {
        }
        private long ofsDataBlocks;
        private long ofsResourceMap;
        private long lenDataBlocks;
        private long lenResourceMap;
        private ResourceFork _root;
        private KaitaiStruct _parent;

        /**
         * Offset of the resource data area,
         * from the start of the resource file.
         * 
         * In practice,
         * this should always be `256`,
         * i. e. the resource data area should directly follow the application-specific data area.
         */
        public long ofsDataBlocks() { return ofsDataBlocks; }

        /**
         * Offset of the resource map,
         * from the start of the resource file.
         * 
         * In practice,
         * this should always be `ofs_data_blocks + len_data_blocks`,
         * i. e. the resource map should directly follow the resource data area.
         */
        public long ofsResourceMap() { return ofsResourceMap; }

        /**
         * Length of the resource data area.
         */
        public long lenDataBlocks() { return lenDataBlocks; }

        /**
         * Length of the resource map.
         * 
         * In practice,
         * this should always be `_root._io.size - ofs_resource_map`,
         * i. e. the resource map should extend to the end of the resource file.
         */
        public long lenResourceMap() { return lenResourceMap; }
        public ResourceFork _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * Resource map,
     * containing information about the resources in the file and where they are located in the data area.
     */
    public static class ResourceMap extends KaitaiStruct {
        public static ResourceMap fromFile(String fileName) throws IOException {
            return new ResourceMap(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.reservedFileHeaderCopy = new FileHeader(this._io, this, _root);
            this.reservedNextResourceMapHandle = this._io.readU4be();
            this.reservedFileReferenceNumber = this._io.readU2be();
            KaitaiStream _io_fileAttributes = this._io.substream(2);
            this.fileAttributes = new FileAttributes(_io_fileAttributes, this, _root);
            this.ofsTypeList = this._io.readU2be();
            this.ofsNames = this._io.readU2be();
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

        /**
         * A resource file's attributes,
         * as stored in the resource map.
         * 
         * These attributes are sometimes also referred to as resource map attributes,
         * because of where they are stored in the file.
         */
        public static class FileAttributes extends KaitaiStruct {
            public static FileAttributes fromFile(String fileName) throws IOException {
                return new FileAttributes(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.resourcesLocked = this._io.readBitsIntBe(1) != 0;
                this.reserved0 = this._io.readBitsIntBe(6);
                this.printerDriverMultifinderCompatible = this._io.readBitsIntBe(1) != 0;
                this.noWriteChanges = this._io.readBitsIntBe(1) != 0;
                this.needsCompact = this._io.readBitsIntBe(1) != 0;
                this.mapNeedsWrite = this._io.readBitsIntBe(1) != 0;
                this.reserved1 = this._io.readBitsIntBe(5);
            }

            public void _fetchInstances() {
                asInt();
                if (this.asInt != null) {
                }
            }
            private Integer asInt;

            /**
             * The attributes as a packed integer,
             * as they are stored in the file.
             */
            public Integer asInt() {
                if (this.asInt != null)
                    return this.asInt;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.asInt = this._io.readU2be();
                this._io.seek(_pos);
                return this.asInt;
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

            /**
             * These attributes have no known usage or meaning and should always be zero.
             */
            public long reserved0() { return reserved0; }

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

            /**
             * Indicates that the Resource Manager should not write any changes from memory into the resource file.
             * Any modification operations requested by the application will return successfully,
             * but will not actually update the resource file.
             * 
             * TODO Is this attribute supposed to be set on disk or only in memory?
             */
            public boolean noWriteChanges() { return noWriteChanges; }

            /**
             * Indicates that the resource file should be compacted the next time it is written by the Resource Manager.
             * This attribute is only meant to be set in memory;
             * it is cleared when the resource file is written to disk.
             * 
             * This attribute is mainly used internally by the Resource Manager,
             * but may also be set manually by the application.
             */
            public boolean needsCompact() { return needsCompact; }

            /**
             * Indicates that the resource map has been changed in memory and should be written to the resource file on the next update.
             * This attribute is only meant to be set in memory;
             * it is cleared when the resource file is written to disk.
             * 
             * This attribute is mainly used internally by the Resource Manager,
             * but may also be set manually by the application.
             */
            public boolean mapNeedsWrite() { return mapNeedsWrite; }

            /**
             * These attributes have no known usage or meaning and should always be zero.
             */
            public long reserved1() { return reserved1; }
            public ResourceFork _root() { return _root; }
            public ResourceFork.ResourceMap _parent() { return _parent; }
        }

        /**
         * A resource name,
         * as stored in the resource name storage area in the resource map.
         * 
         * The resource names are not required to appear in any particular order.
         * There may be unused space between and around resource names,
         * but in practice they are often contiguous.
         */
        public static class Name extends KaitaiStruct {
            public static Name fromFile(String fileName) throws IOException {
                return new Name(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.lenValue = this._io.readU1();
                this.value = this._io.readBytes(lenValue());
            }

            public void _fetchInstances() {
            }
            private int lenValue;
            private byte[] value;
            private ResourceFork _root;
            private ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent;

            /**
             * The length of the resource name, in bytes.
             */
            public int lenValue() { return lenValue; }

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
            public ResourceFork _root() { return _root; }
            public ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent() { return _parent; }
        }

        /**
         * Resource type list and storage area for resource reference lists in the resource map.
         * 
         * The two parts are combined into a single type here for technical reasons:
         * the start of the resource reference list area is not stored explicitly in the file,
         * instead it always starts directly after the resource type list.
         * The simplest way to implement this is by placing both types into a single `seq`.
         */
        public static class TypeListAndReferenceLists extends KaitaiStruct {
            public static TypeListAndReferenceLists fromFile(String fileName) throws IOException {
                return new TypeListAndReferenceLists(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.typeList = new TypeList(this._io, this, _root);
                this.referenceLists = this._io.readBytesFull();
            }

            public void _fetchInstances() {
                this.typeList._fetchInstances();
            }

            /**
             * A resource reference list,
             * as stored in the reference list area.
             * 
             * Each reference list has exactly one matching entry in the resource type list,
             * and describes all resources of a single type in the file.
             */
            public static class ReferenceList extends KaitaiStruct {

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
                    _read();
                }
                private void _read() {
                    this.references = new ArrayList<Reference>();
                    for (int i = 0; i < numReferences(); i++) {
                        this.references.add(new Reference(this._io, this, _root));
                    }
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.references.size(); i++) {
                        this.references.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                /**
                 * A single resource reference in a resource reference list.
                 */
                public static class Reference extends KaitaiStruct {
                    public static Reference fromFile(String fileName) throws IOException {
                        return new Reference(new ByteBufferKaitaiStream(fileName));
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
                        _read();
                    }
                    private void _read() {
                        this.id = this._io.readS2be();
                        this.ofsName = this._io.readU2be();
                        KaitaiStream _io_attributes = this._io.substream(1);
                        this.attributes = new Attributes(_io_attributes, this, _root);
                        this.ofsDataBlock = this._io.readBitsIntBe(24);
                        this.reservedHandle = this._io.readU4be();
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

                    /**
                     * A resource's attributes,
                     * as stored in a resource reference.
                     */
                    public static class Attributes extends KaitaiStruct {
                        public static Attributes fromFile(String fileName) throws IOException {
                            return new Attributes(new ByteBufferKaitaiStream(fileName));
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
                            _read();
                        }
                        private void _read() {
                            this.systemReference = this._io.readBitsIntBe(1) != 0;
                            this.loadIntoSystemHeap = this._io.readBitsIntBe(1) != 0;
                            this.purgeable = this._io.readBitsIntBe(1) != 0;
                            this.locked = this._io.readBitsIntBe(1) != 0;
                            this.protected = this._io.readBitsIntBe(1) != 0;
                            this.preload = this._io.readBitsIntBe(1) != 0;
                            this.needsWrite = this._io.readBitsIntBe(1) != 0;
                            this.compressed = this._io.readBitsIntBe(1) != 0;
                        }

                        public void _fetchInstances() {
                            asInt();
                            if (this.asInt != null) {
                            }
                        }
                        private Integer asInt;

                        /**
                         * The attributes as a packed integer,
                         * as they are stored in the file.
                         */
                        public Integer asInt() {
                            if (this.asInt != null)
                                return this.asInt;
                            long _pos = this._io.pos();
                            this._io.seek(0);
                            this.asInt = this._io.readU1();
                            this._io.seek(_pos);
                            return this.asInt;
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

                        /**
                         * Indicates that this resource's data should be locked to the Mac OS Memory Manager.
                         * This prevents the resource data from being moved when the heap is compacted.
                         * 
                         * This attribute may be set both in memory and on disk,
                         * but it only has any meaning while the resource file is loaded into memory.
                         */
                        public boolean locked() { return locked; }

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

                        /**
                         * Indicates that this resource's data should be immediately loaded into memory when the resource file is opened.
                         * 
                         * This attribute may be set both in memory and on disk,
                         * but it only has any meaning when the resource file is first opened.
                         */
                        public boolean preload() { return preload; }

                        /**
                         * Indicates that this resource's data has been changed in memory and should be written to the resource file on the next update.
                         * This attribute is only meant to be set in memory;
                         * it is cleared when the resource file is written to disk.
                         * 
                         * This attribute is used internally by the Resource Manager and should not be set manually by the application.
                         */
                        public boolean needsWrite() { return needsWrite; }

                        /**
                         * Indicates that this resource's data is compressed.
                         * Compressed resource data is decompressed transparently by the Resource Manager when reading.
                         * 
                         * For a detailed description of the structure of compressed resources as they are stored in the file,
                         * see the compressed_resource.ksy spec.
                         */
                        public boolean compressed() { return compressed; }
                        public ResourceFork _root() { return _root; }
                        public ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference _parent() { return _parent; }
                    }
                    private DataBlock dataBlock;

                    /**
                     * The data block containing the data for the resource described by this reference.
                     */
                    public DataBlock dataBlock() {
                        if (this.dataBlock != null)
                            return this.dataBlock;
                        KaitaiStream io = _root().dataBlocksWithIo()._io();
                        long _pos = io.pos();
                        io.seek(ofsDataBlock());
                        this.dataBlock = new DataBlock(io, this, _root);
                        io.seek(_pos);
                        return this.dataBlock;
                    }
                    private Name name;

                    /**
                     * The name (if any) of the resource described by this reference.
                     */
                    public Name name() {
                        if (this.name != null)
                            return this.name;
                        if (ofsName() != 65535) {
                            KaitaiStream io = _root().resourceMap().namesWithIo()._io();
                            long _pos = io.pos();
                            io.seek(ofsName());
                            this.name = new Name(io, this, _root);
                            io.seek(_pos);
                        }
                        return this.name;
                    }
                    private short id;
                    private int ofsName;
                    private Attributes attributes;
                    private long ofsDataBlock;
                    private long reservedHandle;
                    private ResourceFork _root;
                    private ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList _parent;

                    /**
                     * ID of the resource described by this reference.
                     */
                    public short id() { return id; }

                    /**
                     * Offset of the name for the resource described by this reference,
                     * from the start of the resource name area.
                     * 
                     * If the resource has no name,
                     * the value of this field is `0xffff`
                     * i. e. `-1` truncated to a 16-bit unsigned integer.
                     */
                    public int ofsName() { return ofsName; }

                    /**
                     * Attributes of the resource described by this reference.
                     */
                    public Attributes attributes() { return attributes; }

                    /**
                     * Offset of the data block for the resource described by this reference,
                     * from the start of the resource data area.
                     */
                    public long ofsDataBlock() { return ofsDataBlock; }

                    /**
                     * Reserved space for the resource's handle in memory.
                     */
                    public long reservedHandle() { return reservedHandle; }
                    public ResourceFork _root() { return _root; }
                    public ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList _parent() { return _parent; }
                }
                private List<Reference> references;
                private int numReferences;
                private ResourceFork _root;
                private ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry _parent;

                /**
                 * The resource references in this reference list.
                 */
                public List<Reference> references() { return references; }

                /**
                 * The number of references in this resource reference list.
                 * 
                 * This information needs to be passed in as a parameter,
                 * because it is stored in the reference list's type list entry,
                 * and not in the reference list itself.
                 */
                public int numReferences() { return numReferences; }
                public ResourceFork _root() { return _root; }
                public ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry _parent() { return _parent; }
            }

            /**
             * Resource type list in the resource map.
             */
            public static class TypeList extends KaitaiStruct {
                public static TypeList fromFile(String fileName) throws IOException {
                    return new TypeList(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.numTypesM1 = this._io.readU2be();
                    this.entries = new ArrayList<TypeListEntry>();
                    for (int i = 0; i < numTypes(); i++) {
                        this.entries.add(new TypeListEntry(this._io, this, _root));
                    }
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.entries.size(); i++) {
                        this.entries.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                /**
                 * A single entry in the resource type list.
                 * 
                 * Each entry corresponds to exactly one resource reference list.
                 */
                public static class TypeListEntry extends KaitaiStruct {
                    public static TypeListEntry fromFile(String fileName) throws IOException {
                        return new TypeListEntry(new ByteBufferKaitaiStream(fileName));
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
                        _read();
                    }
                    private void _read() {
                        this.type = this._io.readBytes(4);
                        this.numReferencesM1 = this._io.readU2be();
                        this.ofsReferenceList = this._io.readU2be();
                    }

                    public void _fetchInstances() {
                        referenceList();
                        if (this.referenceList != null) {
                            this.referenceList._fetchInstances();
                        }
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
                    private ReferenceList referenceList;

                    /**
                     * The resource reference list for this resource type.
                     */
                    public ReferenceList referenceList() {
                        if (this.referenceList != null)
                            return this.referenceList;
                        KaitaiStream io = _parent()._parent()._io();
                        long _pos = io.pos();
                        io.seek(ofsReferenceList());
                        this.referenceList = new ReferenceList(io, this, _root, numReferences());
                        io.seek(_pos);
                        return this.referenceList;
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

                    /**
                     * The number of resources in the reference list for this type,
                     * minus one.
                     * 
                     * Empty reference lists should never exist.
                     */
                    public int numReferencesM1() { return numReferencesM1; }

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
                    public ResourceFork _root() { return _root; }
                    public ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList _parent() { return _parent; }
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

                /**
                 * Entries in the resource type list.
                 */
                public List<TypeListEntry> entries() { return entries; }
                public ResourceFork _root() { return _root; }
                public ResourceFork.ResourceMap.TypeListAndReferenceLists _parent() { return _parent; }
            }
            private TypeList typeList;
            private byte[] referenceLists;
            private ResourceFork _root;
            private ResourceFork.ResourceMap _parent;

            /**
             * The resource map's resource type list.
             */
            public TypeList typeList() { return typeList; }

            /**
             * Storage area for the resource map's resource reference lists.
             * 
             * According to Inside Macintosh,
             * the reference lists are stored contiguously,
             * in the same order as their corresponding resource type list entries.
             */
            public byte[] referenceLists() { return referenceLists; }
            public ResourceFork _root() { return _root; }
            public ResourceFork.ResourceMap _parent() { return _parent; }
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
        private BytesWithIo namesWithIo;

        /**
         * Use `names` instead,
         * unless you need access to this instance's `_io`.
         */
        public BytesWithIo namesWithIo() {
            if (this.namesWithIo != null)
                return this.namesWithIo;
            long _pos = this._io.pos();
            this._io.seek(ofsNames());
            this._raw_namesWithIo = this._io.readBytesFull();
            KaitaiStream _io__raw_namesWithIo = new ByteBufferKaitaiStream(this._raw_namesWithIo);
            this.namesWithIo = new BytesWithIo(_io__raw_namesWithIo);
            this._io.seek(_pos);
            return this.namesWithIo;
        }
        private TypeListAndReferenceLists typeListAndReferenceLists;

        /**
         * The resource map's resource type list, followed by the resource reference list area.
         */
        public TypeListAndReferenceLists typeListAndReferenceLists() {
            if (this.typeListAndReferenceLists != null)
                return this.typeListAndReferenceLists;
            long _pos = this._io.pos();
            this._io.seek(ofsTypeList());
            KaitaiStream _io_typeListAndReferenceLists = this._io.substream(ofsNames() - ofsTypeList());
            this.typeListAndReferenceLists = new TypeListAndReferenceLists(_io_typeListAndReferenceLists, this, _root);
            this._io.seek(_pos);
            return this.typeListAndReferenceLists;
        }
        private FileHeader reservedFileHeaderCopy;
        private long reservedNextResourceMapHandle;
        private int reservedFileReferenceNumber;
        private FileAttributes fileAttributes;
        private int ofsTypeList;
        private int ofsNames;
        private ResourceFork _root;
        private ResourceFork _parent;
        private byte[] _raw_namesWithIo;

        /**
         * Reserved space for a copy of the resource file header.
         */
        public FileHeader reservedFileHeaderCopy() { return reservedFileHeaderCopy; }

        /**
         * Reserved space for a handle to the next loaded resource map in memory.
         */
        public long reservedNextResourceMapHandle() { return reservedNextResourceMapHandle; }

        /**
         * Reserved space for the resource file's file reference number.
         */
        public int reservedFileReferenceNumber() { return reservedFileReferenceNumber; }

        /**
         * The resource file's attributes.
         */
        public FileAttributes fileAttributes() { return fileAttributes; }

        /**
         * Offset of the resource type list,
         * from the start of the resource map.
         * 
         * In practice,
         * this should always be `sizeof<resource_map>`,
         * i. e. the resource type list should directly follow the resource map.
         */
        public int ofsTypeList() { return ofsTypeList; }

        /**
         * Offset of the resource name area,
         * from the start of the resource map.
         */
        public int ofsNames() { return ofsNames; }
        public ResourceFork _root() { return _root; }
        public ResourceFork _parent() { return _parent; }
        public byte[] _raw_namesWithIo() { return _raw_namesWithIo; }
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
    private BytesWithIo dataBlocksWithIo;

    /**
     * Use `data_blocks` instead,
     * unless you need access to this instance's `_io`.
     */
    public BytesWithIo dataBlocksWithIo() {
        if (this.dataBlocksWithIo != null)
            return this.dataBlocksWithIo;
        long _pos = this._io.pos();
        this._io.seek(header().ofsDataBlocks());
        KaitaiStream _io_dataBlocksWithIo = this._io.substream(header().lenDataBlocks());
        this.dataBlocksWithIo = new BytesWithIo(_io_dataBlocksWithIo);
        this._io.seek(_pos);
        return this.dataBlocksWithIo;
    }
    private ResourceMap resourceMap;

    /**
     * The resource file's resource map.
     */
    public ResourceMap resourceMap() {
        if (this.resourceMap != null)
            return this.resourceMap;
        long _pos = this._io.pos();
        this._io.seek(header().ofsResourceMap());
        KaitaiStream _io_resourceMap = this._io.substream(header().lenResourceMap());
        this.resourceMap = new ResourceMap(_io_resourceMap, this, _root);
        this._io.seek(_pos);
        return this.resourceMap;
    }
    private FileHeader header;
    private byte[] systemData;
    private byte[] applicationData;
    private ResourceFork _root;
    private KaitaiStruct _parent;

    /**
     * The resource file's header information.
     */
    public FileHeader header() { return header; }

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
    public ResourceFork _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
