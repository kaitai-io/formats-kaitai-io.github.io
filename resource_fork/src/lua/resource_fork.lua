-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")

require("bytes_with_io")
-- 
-- The data format of Macintosh resource forks,
-- used on Classic Mac OS and Mac OS X/macOS to store additional structured data along with a file's main data (the data fork).
-- The kinds of data stored in resource forks include:
-- 
-- * Document resources:
--   images, sounds, etc. used by a document
-- * Application resources:
--   graphics, GUI layouts, localizable strings,
--   and even code used by an application, a library, or system files
-- * Common metadata:
--   custom icons and version metadata that could be displayed by the Finder
-- * Application-specific metadata:
--   because resource forks follow a common format,
--   other applications can store new metadata in them,
--   even if the original application does not recognize or understand it
-- 
-- Macintosh file systems (MFS, HFS, HFS+, APFS) support resource forks natively,
-- which allows storing resources along with any file.
-- Non-Macintosh file systems and protocols have little or no support for resource forks,
-- so the resource fork data must be stored in some other way when using such file systems or protocols.
-- Various file formats and tools exist for this purpose,
-- such as BinHex, MacBinary, AppleSingle, AppleDouble, or QuickTime RezWack.
-- In some cases,
-- resource forks are stored as plain data in separate files with a .rsrc extension,
-- even on Mac systems that natively support resource forks.
-- 
-- On modern Mac OS X/macOS systems,
-- resource forks are used far less commonly than on classic Mac OS systems,
-- because of compatibility issues with other systems and historical limitations in the format.
-- Modern macOS APIs and libraries do not use resource forks,
-- and the legacy Carbon API that still used them has been deprecated since OS X 10.8.
-- Despite this,
-- even current macOS systems still use resource forks for certain purposes,
-- such as custom file icons.
-- See also: Inside Macintosh, More Macintosh Toolbox, Resource Manager, Resource Manager Reference, Resource File Format (https://developer.apple.com/library/archive/documentation/mac/pdf/MoreMacintoshToolbox.pdf#page=151)
-- See also: Inside Macintosh, Volume I, The Resource Manager, Format of a Resource File (http://www.pagetable.com/?p=50)
-- See also: Source (https://github.com/kreativekorp/ksfl/wiki/Macintosh-Resource-File-Format)
-- See also: Source (https://github.com/dgelessus/mac_file_format_docs/blob/master/README.md#resource-forks)
ResourceFork = class.class(KaitaiStruct)

function ResourceFork:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ResourceFork:_read()
  self.header = ResourceFork.FileHeader(self._io, self, self._root)
  self.system_data = self._io:read_bytes(112)
  self.application_data = self._io:read_bytes(128)
end

-- 
-- Use `data_blocks` instead,
-- unless you need access to this instance's `_io`.
ResourceFork.property.data_blocks_with_io = {}
function ResourceFork.property.data_blocks_with_io:get()
  if self._m_data_blocks_with_io ~= nil then
    return self._m_data_blocks_with_io
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.ofs_data_blocks)
  self._raw__m_data_blocks_with_io = self._io:read_bytes(self.header.len_data_blocks)
  local _io = KaitaiStream(stringstream(self._raw__m_data_blocks_with_io))
  self._m_data_blocks_with_io = BytesWithIo(_io)
  self._io:seek(_pos)
  return self._m_data_blocks_with_io
end

-- 
-- Storage area for the data blocks of all resources.
-- 
-- These data blocks are not required to appear in any particular order,
-- and there may be unused space between and around them.
-- 
-- In practice,
-- the data blocks in newly created resource files are usually contiguous.
-- When existing resources are shortened,
-- the Mac OS resource manager leaves unused space where the now removed resource data was,
-- as this is quicker than moving the following resource data into the newly freed space.
-- Such unused space may be cleaned up later when the resource manager "compacts" the resource file,
-- which happens when resources are removed entirely,
-- or when resources are added or grown so that more space is needed in the data area.
ResourceFork.property.data_blocks = {}
function ResourceFork.property.data_blocks:get()
  if self._m_data_blocks ~= nil then
    return self._m_data_blocks
  end

  self._m_data_blocks = self.data_blocks_with_io.data
  return self._m_data_blocks
end

-- 
-- The resource file's resource map.
ResourceFork.property.resource_map = {}
function ResourceFork.property.resource_map:get()
  if self._m_resource_map ~= nil then
    return self._m_resource_map
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.ofs_resource_map)
  self._raw__m_resource_map = self._io:read_bytes(self.header.len_resource_map)
  local _io = KaitaiStream(stringstream(self._raw__m_resource_map))
  self._m_resource_map = ResourceFork.ResourceMap(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_resource_map
end

-- 
-- The resource file's header information.
-- 
-- System-reserved data area.
-- This field can generally be ignored when reading and writing.
-- 
-- This field is used by the Classic Mac OS Finder as temporary storage space.
-- It usually contains parts of the file metadata (name, type/creator code, etc.).
-- Any existing data in this field is ignored and overwritten.
-- 
-- In resource files written by Mac OS X,
-- this field is set to all zero bytes.
-- 
-- Application-specific data area.
-- This field can generally be ignored when reading and writing.
-- 
-- According to early revisions of Inside Macintosh,
-- this field is "available for application data".
-- In practice, it is almost never used for this purpose,
-- and usually contains only junk data.
-- 
-- In resource files written by Mac OS X,
-- this field is set to all zero bytes.

-- 
-- Resource file header,
-- containing the offsets and lengths of the resource data area and resource map.
ResourceFork.FileHeader = class.class(KaitaiStruct)

function ResourceFork.FileHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ResourceFork.FileHeader:_read()
  self.ofs_data_blocks = self._io:read_u4be()
  self.ofs_resource_map = self._io:read_u4be()
  self.len_data_blocks = self._io:read_u4be()
  self.len_resource_map = self._io:read_u4be()
end

-- 
-- Offset of the resource data area,
-- from the start of the resource file.
-- 
-- In practice,
-- this should always be `256`,
-- i. e. the resource data area should directly follow the application-specific data area.
-- 
-- Offset of the resource map,
-- from the start of the resource file.
-- 
-- In practice,
-- this should always be `ofs_data_blocks + len_data_blocks`,
-- i. e. the resource map should directly follow the resource data area.
-- 
-- Length of the resource data area.
-- 
-- Length of the resource map.
-- 
-- In practice,
-- this should always be `_root._io.size - ofs_resource_map`,
-- i. e. the resource map should extend to the end of the resource file.

-- 
-- A resource data block,
-- as stored in the resource data area.
-- 
-- Each data block stores the data contained in a resource,
-- along with its length.
ResourceFork.DataBlock = class.class(KaitaiStruct)

function ResourceFork.DataBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ResourceFork.DataBlock:_read()
  self.len_data = self._io:read_u4be()
  self.data = self._io:read_bytes(self.len_data)
end

-- 
-- The length of the resource data stored in this block.
-- 
-- The data stored in this block.

-- 
-- Resource map,
-- containing information about the resources in the file and where they are located in the data area.
ResourceFork.ResourceMap = class.class(KaitaiStruct)

function ResourceFork.ResourceMap:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ResourceFork.ResourceMap:_read()
  self.reserved_file_header_copy = ResourceFork.FileHeader(self._io, self, self._root)
  self.reserved_next_resource_map_handle = self._io:read_u4be()
  self.reserved_file_reference_number = self._io:read_u2be()
  self._raw_file_attributes = self._io:read_bytes(2)
  local _io = KaitaiStream(stringstream(self._raw_file_attributes))
  self.file_attributes = ResourceFork.ResourceMap.FileAttributes(_io, self, self._root)
  self.ofs_type_list = self._io:read_u2be()
  self.ofs_names = self._io:read_u2be()
end

-- 
-- The resource map's resource type list, followed by the resource reference list area.
ResourceFork.ResourceMap.property.type_list_and_reference_lists = {}
function ResourceFork.ResourceMap.property.type_list_and_reference_lists:get()
  if self._m_type_list_and_reference_lists ~= nil then
    return self._m_type_list_and_reference_lists
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_type_list)
  self._raw__m_type_list_and_reference_lists = self._io:read_bytes((self.ofs_names - self.ofs_type_list))
  local _io = KaitaiStream(stringstream(self._raw__m_type_list_and_reference_lists))
  self._m_type_list_and_reference_lists = ResourceFork.ResourceMap.TypeListAndReferenceLists(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_type_list_and_reference_lists
end

-- 
-- Use `names` instead,
-- unless you need access to this instance's `_io`.
ResourceFork.ResourceMap.property.names_with_io = {}
function ResourceFork.ResourceMap.property.names_with_io:get()
  if self._m_names_with_io ~= nil then
    return self._m_names_with_io
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_names)
  self._raw__m_names_with_io = self._io:read_bytes_full()
  local _io = KaitaiStream(stringstream(self._raw__m_names_with_io))
  self._m_names_with_io = BytesWithIo(_io)
  self._io:seek(_pos)
  return self._m_names_with_io
end

-- 
-- Storage area for the names of all resources.
ResourceFork.ResourceMap.property.names = {}
function ResourceFork.ResourceMap.property.names:get()
  if self._m_names ~= nil then
    return self._m_names
  end

  self._m_names = self.names_with_io.data
  return self._m_names
end

-- 
-- Reserved space for a copy of the resource file header.
-- 
-- Reserved space for a handle to the next loaded resource map in memory.
-- 
-- Reserved space for the resource file's file reference number.
-- 
-- The resource file's attributes.
-- 
-- Offset of the resource type list,
-- from the start of the resource map.
-- 
-- In practice,
-- this should always be `sizeof<resource_map>`,
-- i. e. the resource type list should directly follow the resource map.
-- 
-- Offset of the resource name area,
-- from the start of the resource map.

-- 
-- A resource file's attributes,
-- as stored in the resource map.
-- 
-- These attributes are sometimes also referred to as resource map attributes,
-- because of where they are stored in the file.
ResourceFork.ResourceMap.FileAttributes = class.class(KaitaiStruct)

function ResourceFork.ResourceMap.FileAttributes:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ResourceFork.ResourceMap.FileAttributes:_read()
  self.resources_locked = self._io:read_bits_int_be(1)
  self.reserved0 = self._io:read_bits_int_be(6)
  self.printer_driver_multifinder_compatible = self._io:read_bits_int_be(1)
  self.no_write_changes = self._io:read_bits_int_be(1)
  self.needs_compact = self._io:read_bits_int_be(1)
  self.map_needs_write = self._io:read_bits_int_be(1)
  self.reserved1 = self._io:read_bits_int_be(5)
end

-- 
-- The attributes as a packed integer,
-- as they are stored in the file.
ResourceFork.ResourceMap.FileAttributes.property.as_int = {}
function ResourceFork.ResourceMap.FileAttributes.property.as_int:get()
  if self._m_as_int ~= nil then
    return self._m_as_int
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_as_int = self._io:read_u2be()
  self._io:seek(_pos)
  return self._m_as_int
end

-- 
-- TODO What does this attribute actually do,
-- and how is it different from `read_only`?
-- 
-- This attribute is undocumented and not defined in <CarbonCore/Resources.h>,
-- but ResEdit has a checkbox called "Resources Locked" for this attribute.
-- 
-- These attributes have no known usage or meaning and should always be zero.
-- 
-- Indicates that this printer driver is compatible with MultiFinder,
-- i. e. can be used simultaneously by multiple applications.
-- This attribute is only meant to be set on printer driver resource forks.
-- 
-- This attribute is not documented in Inside Macintosh and is not defined in <CarbonCore/Resources.h>.
-- It is documented in technote PR510,
-- and ResEdit has a checkbox called "Printer Driver MultiFinder Compatible" for this attribute.
-- See also: Apple Technical Note PR510 - Printer Driver Q&As, section '"Printer driver is MultiFinder compatible" bit' (https://www.fenestrated.net/mirrors/Apple%20Technotes%20(As%20of%202002)/pr/pr_510.html)
-- 
-- Indicates that the Resource Manager should not write any changes from memory into the resource file.
-- Any modification operations requested by the application will return successfully,
-- but will not actually update the resource file.
-- 
-- TODO Is this attribute supposed to be set on disk or only in memory?
-- 
-- Indicates that the resource file should be compacted the next time it is written by the Resource Manager.
-- This attribute is only meant to be set in memory;
-- it is cleared when the resource file is written to disk.
-- 
-- This attribute is mainly used internally by the Resource Manager,
-- but may also be set manually by the application.
-- 
-- Indicates that the resource map has been changed in memory and should be written to the resource file on the next update.
-- This attribute is only meant to be set in memory;
-- it is cleared when the resource file is written to disk.
-- 
-- This attribute is mainly used internally by the Resource Manager,
-- but may also be set manually by the application.
-- 
-- These attributes have no known usage or meaning and should always be zero.

-- 
-- Resource type list and storage area for resource reference lists in the resource map.
-- 
-- The two parts are combined into a single type here for technical reasons:
-- the start of the resource reference list area is not stored explicitly in the file,
-- instead it always starts directly after the resource type list.
-- The simplest way to implement this is by placing both types into a single `seq`.
ResourceFork.ResourceMap.TypeListAndReferenceLists = class.class(KaitaiStruct)

function ResourceFork.ResourceMap.TypeListAndReferenceLists:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ResourceFork.ResourceMap.TypeListAndReferenceLists:_read()
  self.type_list = ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList(self._io, self, self._root)
  self.reference_lists = self._io:read_bytes_full()
end

-- 
-- The resource map's resource type list.
-- 
-- Storage area for the resource map's resource reference lists.
-- 
-- According to Inside Macintosh,
-- the reference lists are stored contiguously,
-- in the same order as their corresponding resource type list entries.

-- 
-- Resource type list in the resource map.
ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList = class.class(KaitaiStruct)

function ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList:_read()
  self.num_types_m1 = self._io:read_u2be()
  self.entries = {}
  for i = 0, self.num_types - 1 do
    self.entries[i + 1] = ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry(self._io, self, self._root)
  end
end

-- 
-- The number of resource types in this list.
ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.property.num_types = {}
function ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.property.num_types:get()
  if self._m_num_types ~= nil then
    return self._m_num_types
  end

  self._m_num_types = ((self.num_types_m1 + 1) % 65536)
  return self._m_num_types
end

-- 
-- The number of resource types in this list,
-- minus one.
-- 
-- If the resource list is empty,
-- the value of this field is `0xffff`,
-- i. e. `-1` truncated to a 16-bit unsigned integer.
-- 
-- Entries in the resource type list.

-- 
-- A single entry in the resource type list.
-- 
-- Each entry corresponds to exactly one resource reference list.
ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry = class.class(KaitaiStruct)

function ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry:_read()
  self.type = self._io:read_bytes(4)
  self.num_references_m1 = self._io:read_u2be()
  self.ofs_reference_list = self._io:read_u2be()
end

-- 
-- The number of resources in the reference list for this type.
ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry.property.num_references = {}
function ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry.property.num_references:get()
  if self._m_num_references ~= nil then
    return self._m_num_references
  end

  self._m_num_references = ((self.num_references_m1 + 1) % 65536)
  return self._m_num_references
end

-- 
-- The resource reference list for this resource type.
ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry.property.reference_list = {}
function ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry.property.reference_list:get()
  if self._m_reference_list ~= nil then
    return self._m_reference_list
  end

  local _io = self._parent._parent._io
  local _pos = _io:pos()
  _io:seek(self.ofs_reference_list)
  self._m_reference_list = ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList(self.num_references, _io, self, self._root)
  _io:seek(_pos)
  return self._m_reference_list
end

-- 
-- The four-character type code of the resources in the reference list.
-- 
-- The number of resources in the reference list for this type,
-- minus one.
-- 
-- Empty reference lists should never exist.
-- 
-- Offset of the resource reference list for this resource type,
-- from the start of the resource type list.
-- 
-- Although the offset is relative to the start of the type list,
-- it should never point into the type list itself,
-- but into the reference list storage area that directly follows it.
-- That is,
-- it should always be at least `_parent._sizeof`.

-- 
-- A resource reference list,
-- as stored in the reference list area.
-- 
-- Each reference list has exactly one matching entry in the resource type list,
-- and describes all resources of a single type in the file.
ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList = class.class(KaitaiStruct)

function ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList:_init(num_references, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.num_references = num_references
  self:_read()
end

function ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList:_read()
  self.references = {}
  for i = 0, self.num_references - 1 do
    self.references[i + 1] = ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference(self._io, self, self._root)
  end
end

-- 
-- The resource references in this reference list.
-- 
-- The number of references in this resource reference list.
-- 
-- This information needs to be passed in as a parameter,
-- because it is stored in the reference list's type list entry,
-- and not in the reference list itself.

-- 
-- A single resource reference in a resource reference list.
ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference = class.class(KaitaiStruct)

function ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference:_read()
  self.id = self._io:read_s2be()
  self.ofs_name = self._io:read_u2be()
  self._raw_attributes = self._io:read_bytes(1)
  local _io = KaitaiStream(stringstream(self._raw_attributes))
  self.attributes = ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference.Attributes(_io, self, self._root)
  self.ofs_data_block = self._io:read_bits_int_be(24)
  self._io:align_to_byte()
  self.reserved_handle = self._io:read_u4be()
end

-- 
-- The name (if any) of the resource described by this reference.
ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference.property.name = {}
function ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference.property.name:get()
  if self._m_name ~= nil then
    return self._m_name
  end

  if self.ofs_name ~= 65535 then
    local _io = self._root.resource_map.names_with_io._io
    local _pos = _io:pos()
    _io:seek(self.ofs_name)
    self._m_name = ResourceFork.ResourceMap.Name(_io, self, self._root)
    _io:seek(_pos)
  end
  return self._m_name
end

-- 
-- The data block containing the data for the resource described by this reference.
ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference.property.data_block = {}
function ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference.property.data_block:get()
  if self._m_data_block ~= nil then
    return self._m_data_block
  end

  local _io = self._root.data_blocks_with_io._io
  local _pos = _io:pos()
  _io:seek(self.ofs_data_block)
  self._m_data_block = ResourceFork.DataBlock(_io, self, self._root)
  _io:seek(_pos)
  return self._m_data_block
end

-- 
-- ID of the resource described by this reference.
-- 
-- Offset of the name for the resource described by this reference,
-- from the start of the resource name area.
-- 
-- If the resource has no name,
-- the value of this field is `0xffff`
-- i. e. `-1` truncated to a 16-bit unsigned integer.
-- 
-- Attributes of the resource described by this reference.
-- 
-- Offset of the data block for the resource described by this reference,
-- from the start of the resource data area.
-- 
-- Reserved space for the resource's handle in memory.

-- 
-- A resource's attributes,
-- as stored in a resource reference.
ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference.Attributes = class.class(KaitaiStruct)

function ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference.Attributes:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference.Attributes:_read()
  self.system_reference = self._io:read_bits_int_be(1)
  self.load_into_system_heap = self._io:read_bits_int_be(1)
  self.purgeable = self._io:read_bits_int_be(1)
  self.locked = self._io:read_bits_int_be(1)
  self.protected = self._io:read_bits_int_be(1)
  self.preload = self._io:read_bits_int_be(1)
  self.needs_write = self._io:read_bits_int_be(1)
  self.compressed = self._io:read_bits_int_be(1)
end

-- 
-- The attributes as a packed integer,
-- as they are stored in the file.
ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference.Attributes.property.as_int = {}
function ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference.Attributes.property.as_int:get()
  if self._m_as_int ~= nil then
    return self._m_as_int
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_as_int = self._io:read_u1()
  self._io:seek(_pos)
  return self._m_as_int
end

-- 
-- Indicates that this resource reference is a system reference rather than a regular local reference.
-- This attribute is nearly undocumented.
-- For all practical purposes,
-- it should be considered reserved and should always be zero.
-- 
-- This attribute was last documented in the Promotional Edition of Inside Macintosh,
-- in the Resource Manager chapter,
-- on pages 37-41,
-- in a "System References" section that calls itself "of historical interest only".
-- The final versions of Inside Macintosh only mention this attribute as "reserved for use by the Resource Manager".
-- <CarbonCore/Resources.h> contains a `resSysRefBit` constant,
-- but no corresponding `resSysRef` constant like for all other resource attributes.
-- 
-- According to the Inside Macintosh Promotional Edition,
-- a system reference was effectively an alias pointing to a resource stored in the system file,
-- possibly with a different ID and name (but not type) than the system reference.
-- If this attribute is set,
-- `ofs_data_block` is ignored and should be zero,
-- and `reserved_handle` contains
-- (in its high and low two bytes, respectively)
-- the ID and name offset of the real system resource that this system reference points to.
-- 
-- TODO Do any publicly available Mac OS versions support system references,
-- and do any real files/applications use them?
-- So far the answer seems to be no,
-- but I would like to be proven wrong!
-- 
-- Indicates that this resource should be loaded into the system heap if possible,
-- rather than the application heap.
-- 
-- This attribute is only meant to be used by Mac OS itself,
-- for System and Finder resources,
-- and not by normal applications.
-- 
-- This attribute may be set both in memory and on disk,
-- but it only has any meaning while the resource file is loaded into memory.
-- 
-- Indicates that this resource's data should be purgeable by the Mac OS Memory Manager.
-- This allows the resource data to be purged from memory if space is needed on the heap.
-- Purged resources can later be reloaded from disk if their data is needed again.
-- 
-- If the `locked` attribute is set,
-- this attribute has no effect
-- (i. e. locked resources are never purgeable).
-- 
-- This attribute may be set both in memory and on disk,
-- but it only has any meaning while the resource file is loaded into memory.
-- 
-- Indicates that this resource's data should be locked to the Mac OS Memory Manager.
-- This prevents the resource data from being moved when the heap is compacted.
-- 
-- This attribute may be set both in memory and on disk,
-- but it only has any meaning while the resource file is loaded into memory.
-- 
-- Indicates that this resource should be protected (i. e. unmodifiable) in memory.
-- This prevents the application from using the Resource Manager to change the resource's data or metadata,
-- or delete it.
-- The only exception are the resource's attributes,
-- which can always be changed,
-- even for protected resources.
-- This allows protected resources to be unprotected again by the application.
-- 
-- This attribute may be set both in memory and on disk,
-- but it only has any meaning while the resource file is loaded into memory.
-- 
-- Indicates that this resource's data should be immediately loaded into memory when the resource file is opened.
-- 
-- This attribute may be set both in memory and on disk,
-- but it only has any meaning when the resource file is first opened.
-- 
-- Indicates that this resource's data has been changed in memory and should be written to the resource file on the next update.
-- This attribute is only meant to be set in memory;
-- it is cleared when the resource file is written to disk.
-- 
-- This attribute is used internally by the Resource Manager and should not be set manually by the application.
-- 
-- Indicates that this resource's data is compressed.
-- Compressed resource data is decompressed transparently by the Resource Manager when reading.
-- 
-- For a detailed description of the structure of compressed resources as they are stored in the file,
-- see the compressed_resource.ksy spec.

-- 
-- A resource name,
-- as stored in the resource name storage area in the resource map.
-- 
-- The resource names are not required to appear in any particular order.
-- There may be unused space between and around resource names,
-- but in practice they are often contiguous.
ResourceFork.ResourceMap.Name = class.class(KaitaiStruct)

function ResourceFork.ResourceMap.Name:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ResourceFork.ResourceMap.Name:_read()
  self.len_value = self._io:read_u1()
  self.value = self._io:read_bytes(self.len_value)
end

-- 
-- The length of the resource name, in bytes.
-- 
-- The resource name.
-- 
-- This field is exposed as a byte array,
-- because there is no universal encoding for resource names.
-- Most Classic Mac software does not deal with encodings explicitly and instead assumes that all strings,
-- including resource names,
-- use the system encoding,
-- which varies depending on the system language.
-- This means that resource names can use different encodings depending on what system language they were created with.
-- 
-- Many resource names are plain ASCII,
-- meaning that the encoding often does not matter
-- (because all Mac OS encodings are ASCII-compatible).
-- For non-ASCII resource names,
-- the most common encoding is perhaps MacRoman
-- (used for English and other Western languages),
-- but other encodings are also sometimes used,
-- especially for software in non-Western languages.
-- 
-- There is no requirement that all names in a single resource file use the same encoding.
-- For example,
-- localized software may have some (but not all) of its resource names translated.
-- For non-Western languages,
-- this can lead to some resource names using MacRoman,
-- and others using a different encoding.

