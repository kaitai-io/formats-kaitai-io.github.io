<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
 */

namespace {
    class ResourceFork extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\ResourceFork $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \ResourceFork\FileHeader($this->_io, $this, $this->_root);
            $this->_m_systemData = $this->_io->readBytes(112);
            $this->_m_applicationData = $this->_io->readBytes(128);
        }
        protected $_m_dataBlocks;

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
        public function dataBlocks() {
            if ($this->_m_dataBlocks !== null)
                return $this->_m_dataBlocks;
            $this->_m_dataBlocks = $this->dataBlocksWithIo()->data();
            return $this->_m_dataBlocks;
        }
        protected $_m_dataBlocksWithIo;

        /**
         * Use `data_blocks` instead,
         * unless you need access to this instance's `_io`.
         */
        public function dataBlocksWithIo() {
            if ($this->_m_dataBlocksWithIo !== null)
                return $this->_m_dataBlocksWithIo;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->header()->ofsDataBlocks());
            $this->_m__raw_dataBlocksWithIo = $this->_io->readBytes($this->header()->lenDataBlocks());
            $_io__raw_dataBlocksWithIo = new \Kaitai\Struct\Stream($this->_m__raw_dataBlocksWithIo);
            $this->_m_dataBlocksWithIo = new \BytesWithIo($_io__raw_dataBlocksWithIo);
            $this->_io->seek($_pos);
            return $this->_m_dataBlocksWithIo;
        }
        protected $_m_resourceMap;

        /**
         * The resource file's resource map.
         */
        public function resourceMap() {
            if ($this->_m_resourceMap !== null)
                return $this->_m_resourceMap;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->header()->ofsResourceMap());
            $this->_m__raw_resourceMap = $this->_io->readBytes($this->header()->lenResourceMap());
            $_io__raw_resourceMap = new \Kaitai\Struct\Stream($this->_m__raw_resourceMap);
            $this->_m_resourceMap = new \ResourceFork\ResourceMap($_io__raw_resourceMap, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_resourceMap;
        }
        protected $_m_header;
        protected $_m_systemData;
        protected $_m_applicationData;
        protected $_m__raw_dataBlocksWithIo;
        protected $_m__raw_resourceMap;

        /**
         * The resource file's header information.
         */
        public function header() { return $this->_m_header; }

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
        public function systemData() { return $this->_m_systemData; }

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
        public function applicationData() { return $this->_m_applicationData; }
        public function _raw_dataBlocksWithIo() { return $this->_m__raw_dataBlocksWithIo; }
        public function _raw_resourceMap() { return $this->_m__raw_resourceMap; }
    }
}

/**
 * A resource data block,
 * as stored in the resource data area.
 * 
 * Each data block stores the data contained in a resource,
 * along with its length.
 */

namespace ResourceFork {
    class DataBlock extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ResourceFork\ResourceMap\TypeListAndReferenceLists\ReferenceList\Reference $_parent = null, ?\ResourceFork $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenData = $this->_io->readU4be();
            $this->_m_data = $this->_io->readBytes($this->lenData());
        }
        protected $_m_lenData;
        protected $_m_data;

        /**
         * The length of the resource data stored in this block.
         */
        public function lenData() { return $this->_m_lenData; }

        /**
         * The data stored in this block.
         */
        public function data() { return $this->_m_data; }
    }
}

/**
 * Resource file header,
 * containing the offsets and lengths of the resource data area and resource map.
 */

namespace ResourceFork {
    class FileHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\ResourceFork $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ofsDataBlocks = $this->_io->readU4be();
            $this->_m_ofsResourceMap = $this->_io->readU4be();
            $this->_m_lenDataBlocks = $this->_io->readU4be();
            $this->_m_lenResourceMap = $this->_io->readU4be();
        }
        protected $_m_ofsDataBlocks;
        protected $_m_ofsResourceMap;
        protected $_m_lenDataBlocks;
        protected $_m_lenResourceMap;

        /**
         * Offset of the resource data area,
         * from the start of the resource file.
         * 
         * In practice,
         * this should always be `256`,
         * i. e. the resource data area should directly follow the application-specific data area.
         */
        public function ofsDataBlocks() { return $this->_m_ofsDataBlocks; }

        /**
         * Offset of the resource map,
         * from the start of the resource file.
         * 
         * In practice,
         * this should always be `ofs_data_blocks + len_data_blocks`,
         * i. e. the resource map should directly follow the resource data area.
         */
        public function ofsResourceMap() { return $this->_m_ofsResourceMap; }

        /**
         * Length of the resource data area.
         */
        public function lenDataBlocks() { return $this->_m_lenDataBlocks; }

        /**
         * Length of the resource map.
         * 
         * In practice,
         * this should always be `_root._io.size - ofs_resource_map`,
         * i. e. the resource map should extend to the end of the resource file.
         */
        public function lenResourceMap() { return $this->_m_lenResourceMap; }
    }
}

/**
 * Resource map,
 * containing information about the resources in the file and where they are located in the data area.
 */

namespace ResourceFork {
    class ResourceMap extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ResourceFork $_parent = null, ?\ResourceFork $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reservedFileHeaderCopy = new \ResourceFork\FileHeader($this->_io, $this, $this->_root);
            $this->_m_reservedNextResourceMapHandle = $this->_io->readU4be();
            $this->_m_reservedFileReferenceNumber = $this->_io->readU2be();
            $this->_m__raw_fileAttributes = $this->_io->readBytes(2);
            $_io__raw_fileAttributes = new \Kaitai\Struct\Stream($this->_m__raw_fileAttributes);
            $this->_m_fileAttributes = new \ResourceFork\ResourceMap\FileAttributes($_io__raw_fileAttributes, $this, $this->_root);
            $this->_m_ofsTypeList = $this->_io->readU2be();
            $this->_m_ofsNames = $this->_io->readU2be();
        }
        protected $_m_names;

        /**
         * Storage area for the names of all resources.
         */
        public function names() {
            if ($this->_m_names !== null)
                return $this->_m_names;
            $this->_m_names = $this->namesWithIo()->data();
            return $this->_m_names;
        }
        protected $_m_namesWithIo;

        /**
         * Use `names` instead,
         * unless you need access to this instance's `_io`.
         */
        public function namesWithIo() {
            if ($this->_m_namesWithIo !== null)
                return $this->_m_namesWithIo;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsNames());
            $this->_m__raw_namesWithIo = $this->_io->readBytesFull();
            $_io__raw_namesWithIo = new \Kaitai\Struct\Stream($this->_m__raw_namesWithIo);
            $this->_m_namesWithIo = new \BytesWithIo($_io__raw_namesWithIo);
            $this->_io->seek($_pos);
            return $this->_m_namesWithIo;
        }
        protected $_m_typeListAndReferenceLists;

        /**
         * The resource map's resource type list, followed by the resource reference list area.
         */
        public function typeListAndReferenceLists() {
            if ($this->_m_typeListAndReferenceLists !== null)
                return $this->_m_typeListAndReferenceLists;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsTypeList());
            $this->_m__raw_typeListAndReferenceLists = $this->_io->readBytes($this->ofsNames() - $this->ofsTypeList());
            $_io__raw_typeListAndReferenceLists = new \Kaitai\Struct\Stream($this->_m__raw_typeListAndReferenceLists);
            $this->_m_typeListAndReferenceLists = new \ResourceFork\ResourceMap\TypeListAndReferenceLists($_io__raw_typeListAndReferenceLists, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_typeListAndReferenceLists;
        }
        protected $_m_reservedFileHeaderCopy;
        protected $_m_reservedNextResourceMapHandle;
        protected $_m_reservedFileReferenceNumber;
        protected $_m_fileAttributes;
        protected $_m_ofsTypeList;
        protected $_m_ofsNames;
        protected $_m__raw_fileAttributes;
        protected $_m__raw_namesWithIo;
        protected $_m__raw_typeListAndReferenceLists;

        /**
         * Reserved space for a copy of the resource file header.
         */
        public function reservedFileHeaderCopy() { return $this->_m_reservedFileHeaderCopy; }

        /**
         * Reserved space for a handle to the next loaded resource map in memory.
         */
        public function reservedNextResourceMapHandle() { return $this->_m_reservedNextResourceMapHandle; }

        /**
         * Reserved space for the resource file's file reference number.
         */
        public function reservedFileReferenceNumber() { return $this->_m_reservedFileReferenceNumber; }

        /**
         * The resource file's attributes.
         */
        public function fileAttributes() { return $this->_m_fileAttributes; }

        /**
         * Offset of the resource type list,
         * from the start of the resource map.
         * 
         * In practice,
         * this should always be `sizeof<resource_map>`,
         * i. e. the resource type list should directly follow the resource map.
         */
        public function ofsTypeList() { return $this->_m_ofsTypeList; }

        /**
         * Offset of the resource name area,
         * from the start of the resource map.
         */
        public function ofsNames() { return $this->_m_ofsNames; }
        public function _raw_fileAttributes() { return $this->_m__raw_fileAttributes; }
        public function _raw_namesWithIo() { return $this->_m__raw_namesWithIo; }
        public function _raw_typeListAndReferenceLists() { return $this->_m__raw_typeListAndReferenceLists; }
    }
}

/**
 * A resource file's attributes,
 * as stored in the resource map.
 * 
 * These attributes are sometimes also referred to as resource map attributes,
 * because of where they are stored in the file.
 */

namespace ResourceFork\ResourceMap {
    class FileAttributes extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ResourceFork\ResourceMap $_parent = null, ?\ResourceFork $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_resourcesLocked = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_reserved0 = $this->_io->readBitsIntBe(6);
            $this->_m_printerDriverMultifinderCompatible = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_noWriteChanges = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_needsCompact = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_mapNeedsWrite = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_reserved1 = $this->_io->readBitsIntBe(5);
        }
        protected $_m_asInt;

        /**
         * The attributes as a packed integer,
         * as they are stored in the file.
         */
        public function asInt() {
            if ($this->_m_asInt !== null)
                return $this->_m_asInt;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_asInt = $this->_io->readU2be();
            $this->_io->seek($_pos);
            return $this->_m_asInt;
        }
        protected $_m_resourcesLocked;
        protected $_m_reserved0;
        protected $_m_printerDriverMultifinderCompatible;
        protected $_m_noWriteChanges;
        protected $_m_needsCompact;
        protected $_m_mapNeedsWrite;
        protected $_m_reserved1;

        /**
         * TODO What does this attribute actually do,
         * and how is it different from `read_only`?
         * 
         * This attribute is undocumented and not defined in <CarbonCore/Resources.h>,
         * but ResEdit has a checkbox called "Resources Locked" for this attribute.
         */
        public function resourcesLocked() { return $this->_m_resourcesLocked; }

        /**
         * These attributes have no known usage or meaning and should always be zero.
         */
        public function reserved0() { return $this->_m_reserved0; }

        /**
         * Indicates that this printer driver is compatible with MultiFinder,
         * i. e. can be used simultaneously by multiple applications.
         * This attribute is only meant to be set on printer driver resource forks.
         * 
         * This attribute is not documented in Inside Macintosh and is not defined in <CarbonCore/Resources.h>.
         * It is documented in technote PR510,
         * and ResEdit has a checkbox called "Printer Driver MultiFinder Compatible" for this attribute.
         */
        public function printerDriverMultifinderCompatible() { return $this->_m_printerDriverMultifinderCompatible; }

        /**
         * Indicates that the Resource Manager should not write any changes from memory into the resource file.
         * Any modification operations requested by the application will return successfully,
         * but will not actually update the resource file.
         * 
         * TODO Is this attribute supposed to be set on disk or only in memory?
         */
        public function noWriteChanges() { return $this->_m_noWriteChanges; }

        /**
         * Indicates that the resource file should be compacted the next time it is written by the Resource Manager.
         * This attribute is only meant to be set in memory;
         * it is cleared when the resource file is written to disk.
         * 
         * This attribute is mainly used internally by the Resource Manager,
         * but may also be set manually by the application.
         */
        public function needsCompact() { return $this->_m_needsCompact; }

        /**
         * Indicates that the resource map has been changed in memory and should be written to the resource file on the next update.
         * This attribute is only meant to be set in memory;
         * it is cleared when the resource file is written to disk.
         * 
         * This attribute is mainly used internally by the Resource Manager,
         * but may also be set manually by the application.
         */
        public function mapNeedsWrite() { return $this->_m_mapNeedsWrite; }

        /**
         * These attributes have no known usage or meaning and should always be zero.
         */
        public function reserved1() { return $this->_m_reserved1; }
    }
}

/**
 * A resource name,
 * as stored in the resource name storage area in the resource map.
 * 
 * The resource names are not required to appear in any particular order.
 * There may be unused space between and around resource names,
 * but in practice they are often contiguous.
 */

namespace ResourceFork\ResourceMap {
    class Name extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ResourceFork\ResourceMap\TypeListAndReferenceLists\ReferenceList\Reference $_parent = null, ?\ResourceFork $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenValue = $this->_io->readU1();
            $this->_m_value = $this->_io->readBytes($this->lenValue());
        }
        protected $_m_lenValue;
        protected $_m_value;

        /**
         * The length of the resource name, in bytes.
         */
        public function lenValue() { return $this->_m_lenValue; }

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
        public function value() { return $this->_m_value; }
    }
}

/**
 * Resource type list and storage area for resource reference lists in the resource map.
 * 
 * The two parts are combined into a single type here for technical reasons:
 * the start of the resource reference list area is not stored explicitly in the file,
 * instead it always starts directly after the resource type list.
 * The simplest way to implement this is by placing both types into a single `seq`.
 */

namespace ResourceFork\ResourceMap {
    class TypeListAndReferenceLists extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ResourceFork\ResourceMap $_parent = null, ?\ResourceFork $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_typeList = new \ResourceFork\ResourceMap\TypeListAndReferenceLists\TypeList($this->_io, $this, $this->_root);
            $this->_m_referenceLists = $this->_io->readBytesFull();
        }
        protected $_m_typeList;
        protected $_m_referenceLists;

        /**
         * The resource map's resource type list.
         */
        public function typeList() { return $this->_m_typeList; }

        /**
         * Storage area for the resource map's resource reference lists.
         * 
         * According to Inside Macintosh,
         * the reference lists are stored contiguously,
         * in the same order as their corresponding resource type list entries.
         */
        public function referenceLists() { return $this->_m_referenceLists; }
    }
}

/**
 * A resource reference list,
 * as stored in the reference list area.
 * 
 * Each reference list has exactly one matching entry in the resource type list,
 * and describes all resources of a single type in the file.
 */

namespace ResourceFork\ResourceMap\TypeListAndReferenceLists {
    class ReferenceList extends \Kaitai\Struct\Struct {
        public function __construct(int $numReferences, \Kaitai\Struct\Stream $_io, ?\ResourceFork\ResourceMap\TypeListAndReferenceLists\TypeList\TypeListEntry $_parent = null, ?\ResourceFork $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_numReferences = $numReferences;
            $this->_read();
        }

        private function _read() {
            $this->_m_references = [];
            $n = $this->numReferences();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_references[] = new \ResourceFork\ResourceMap\TypeListAndReferenceLists\ReferenceList\Reference($this->_io, $this, $this->_root);
            }
        }
        protected $_m_references;
        protected $_m_numReferences;

        /**
         * The resource references in this reference list.
         */
        public function references() { return $this->_m_references; }

        /**
         * The number of references in this resource reference list.
         * 
         * This information needs to be passed in as a parameter,
         * because it is stored in the reference list's type list entry,
         * and not in the reference list itself.
         */
        public function numReferences() { return $this->_m_numReferences; }
    }
}

/**
 * A single resource reference in a resource reference list.
 */

namespace ResourceFork\ResourceMap\TypeListAndReferenceLists\ReferenceList {
    class Reference extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ResourceFork\ResourceMap\TypeListAndReferenceLists\ReferenceList $_parent = null, ?\ResourceFork $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_id = $this->_io->readS2be();
            $this->_m_ofsName = $this->_io->readU2be();
            $this->_m__raw_attributes = $this->_io->readBytes(1);
            $_io__raw_attributes = new \Kaitai\Struct\Stream($this->_m__raw_attributes);
            $this->_m_attributes = new \ResourceFork\ResourceMap\TypeListAndReferenceLists\ReferenceList\Reference\Attributes($_io__raw_attributes, $this, $this->_root);
            $this->_m_ofsDataBlock = $this->_io->readBitsIntBe(24);
            $this->_io->alignToByte();
            $this->_m_reservedHandle = $this->_io->readU4be();
        }
        protected $_m_dataBlock;

        /**
         * The data block containing the data for the resource described by this reference.
         */
        public function dataBlock() {
            if ($this->_m_dataBlock !== null)
                return $this->_m_dataBlock;
            $io = $this->_root()->dataBlocksWithIo()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsDataBlock());
            $this->_m_dataBlock = new \ResourceFork\DataBlock($io, $this, $this->_root);
            $io->seek($_pos);
            return $this->_m_dataBlock;
        }
        protected $_m_name;

        /**
         * The name (if any) of the resource described by this reference.
         */
        public function name() {
            if ($this->_m_name !== null)
                return $this->_m_name;
            if ($this->ofsName() != 65535) {
                $io = $this->_root()->resourceMap()->namesWithIo()->_io();
                $_pos = $io->pos();
                $io->seek($this->ofsName());
                $this->_m_name = new \ResourceFork\ResourceMap\Name($io, $this, $this->_root);
                $io->seek($_pos);
            }
            return $this->_m_name;
        }
        protected $_m_id;
        protected $_m_ofsName;
        protected $_m_attributes;
        protected $_m_ofsDataBlock;
        protected $_m_reservedHandle;
        protected $_m__raw_attributes;

        /**
         * ID of the resource described by this reference.
         */
        public function id() { return $this->_m_id; }

        /**
         * Offset of the name for the resource described by this reference,
         * from the start of the resource name area.
         * 
         * If the resource has no name,
         * the value of this field is `0xffff`
         * i. e. `-1` truncated to a 16-bit unsigned integer.
         */
        public function ofsName() { return $this->_m_ofsName; }

        /**
         * Attributes of the resource described by this reference.
         */
        public function attributes() { return $this->_m_attributes; }

        /**
         * Offset of the data block for the resource described by this reference,
         * from the start of the resource data area.
         */
        public function ofsDataBlock() { return $this->_m_ofsDataBlock; }

        /**
         * Reserved space for the resource's handle in memory.
         */
        public function reservedHandle() { return $this->_m_reservedHandle; }
        public function _raw_attributes() { return $this->_m__raw_attributes; }
    }
}

/**
 * A resource's attributes,
 * as stored in a resource reference.
 */

namespace ResourceFork\ResourceMap\TypeListAndReferenceLists\ReferenceList\Reference {
    class Attributes extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ResourceFork\ResourceMap\TypeListAndReferenceLists\ReferenceList\Reference $_parent = null, ?\ResourceFork $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_systemReference = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_loadIntoSystemHeap = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_purgeable = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_locked = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_protected = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_preload = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_needsWrite = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_compressed = $this->_io->readBitsIntBe(1) != 0;
        }
        protected $_m_asInt;

        /**
         * The attributes as a packed integer,
         * as they are stored in the file.
         */
        public function asInt() {
            if ($this->_m_asInt !== null)
                return $this->_m_asInt;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_asInt = $this->_io->readU1();
            $this->_io->seek($_pos);
            return $this->_m_asInt;
        }
        protected $_m_systemReference;
        protected $_m_loadIntoSystemHeap;
        protected $_m_purgeable;
        protected $_m_locked;
        protected $_m_protected;
        protected $_m_preload;
        protected $_m_needsWrite;
        protected $_m_compressed;

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
        public function systemReference() { return $this->_m_systemReference; }

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
        public function loadIntoSystemHeap() { return $this->_m_loadIntoSystemHeap; }

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
        public function purgeable() { return $this->_m_purgeable; }

        /**
         * Indicates that this resource's data should be locked to the Mac OS Memory Manager.
         * This prevents the resource data from being moved when the heap is compacted.
         * 
         * This attribute may be set both in memory and on disk,
         * but it only has any meaning while the resource file is loaded into memory.
         */
        public function locked() { return $this->_m_locked; }

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
        public function protected() { return $this->_m_protected; }

        /**
         * Indicates that this resource's data should be immediately loaded into memory when the resource file is opened.
         * 
         * This attribute may be set both in memory and on disk,
         * but it only has any meaning when the resource file is first opened.
         */
        public function preload() { return $this->_m_preload; }

        /**
         * Indicates that this resource's data has been changed in memory and should be written to the resource file on the next update.
         * This attribute is only meant to be set in memory;
         * it is cleared when the resource file is written to disk.
         * 
         * This attribute is used internally by the Resource Manager and should not be set manually by the application.
         */
        public function needsWrite() { return $this->_m_needsWrite; }

        /**
         * Indicates that this resource's data is compressed.
         * Compressed resource data is decompressed transparently by the Resource Manager when reading.
         * 
         * For a detailed description of the structure of compressed resources as they are stored in the file,
         * see the compressed_resource.ksy spec.
         */
        public function compressed() { return $this->_m_compressed; }
    }
}

/**
 * Resource type list in the resource map.
 */

namespace ResourceFork\ResourceMap\TypeListAndReferenceLists {
    class TypeList extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ResourceFork\ResourceMap\TypeListAndReferenceLists $_parent = null, ?\ResourceFork $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numTypesM1 = $this->_io->readU2be();
            $this->_m_entries = [];
            $n = $this->numTypes();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_entries[] = new \ResourceFork\ResourceMap\TypeListAndReferenceLists\TypeList\TypeListEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numTypes;

        /**
         * The number of resource types in this list.
         */
        public function numTypes() {
            if ($this->_m_numTypes !== null)
                return $this->_m_numTypes;
            $this->_m_numTypes = \Kaitai\Struct\Stream::mod($this->numTypesM1() + 1, 65536);
            return $this->_m_numTypes;
        }
        protected $_m_numTypesM1;
        protected $_m_entries;

        /**
         * The number of resource types in this list,
         * minus one.
         * 
         * If the resource list is empty,
         * the value of this field is `0xffff`,
         * i. e. `-1` truncated to a 16-bit unsigned integer.
         */
        public function numTypesM1() { return $this->_m_numTypesM1; }

        /**
         * Entries in the resource type list.
         */
        public function entries() { return $this->_m_entries; }
    }
}

/**
 * A single entry in the resource type list.
 * 
 * Each entry corresponds to exactly one resource reference list.
 */

namespace ResourceFork\ResourceMap\TypeListAndReferenceLists\TypeList {
    class TypeListEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ResourceFork\ResourceMap\TypeListAndReferenceLists\TypeList $_parent = null, ?\ResourceFork $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_type = $this->_io->readBytes(4);
            $this->_m_numReferencesM1 = $this->_io->readU2be();
            $this->_m_ofsReferenceList = $this->_io->readU2be();
        }
        protected $_m_numReferences;

        /**
         * The number of resources in the reference list for this type.
         */
        public function numReferences() {
            if ($this->_m_numReferences !== null)
                return $this->_m_numReferences;
            $this->_m_numReferences = \Kaitai\Struct\Stream::mod($this->numReferencesM1() + 1, 65536);
            return $this->_m_numReferences;
        }
        protected $_m_referenceList;

        /**
         * The resource reference list for this resource type.
         */
        public function referenceList() {
            if ($this->_m_referenceList !== null)
                return $this->_m_referenceList;
            $io = $this->_parent()->_parent()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsReferenceList());
            $this->_m_referenceList = new \ResourceFork\ResourceMap\TypeListAndReferenceLists\ReferenceList($this->numReferences(), $io, $this, $this->_root);
            $io->seek($_pos);
            return $this->_m_referenceList;
        }
        protected $_m_type;
        protected $_m_numReferencesM1;
        protected $_m_ofsReferenceList;

        /**
         * The four-character type code of the resources in the reference list.
         */
        public function type() { return $this->_m_type; }

        /**
         * The number of resources in the reference list for this type,
         * minus one.
         * 
         * Empty reference lists should never exist.
         */
        public function numReferencesM1() { return $this->_m_numReferencesM1; }

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
        public function ofsReferenceList() { return $this->_m_ofsReferenceList; }
    }
}
