# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import bytes_with_io


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class ResourceFork(ReadWriteKaitaiStruct):
    """The data format of Macintosh resource forks,
    used on Classic Mac OS and Mac OS X/macOS to store additional structured data along with a file's main data (the data fork).
    The kinds of data stored in resource forks include:
    
    * Document resources:
      images, sounds, etc. used by a document
    * Application resources:
      graphics, GUI layouts, localizable strings,
      and even code used by an application, a library, or system files
    * Common metadata:
      custom icons and version metadata that could be displayed by the Finder
    * Application-specific metadata:
      because resource forks follow a common format,
      other applications can store new metadata in them,
      even if the original application does not recognize or understand it
    
    Macintosh file systems (MFS, HFS, HFS+, APFS) support resource forks natively,
    which allows storing resources along with any file.
    Non-Macintosh file systems and protocols have little or no support for resource forks,
    so the resource fork data must be stored in some other way when using such file systems or protocols.
    Various file formats and tools exist for this purpose,
    such as BinHex, MacBinary, AppleSingle, AppleDouble, or QuickTime RezWack.
    In some cases,
    resource forks are stored as plain data in separate files with a .rsrc extension,
    even on Mac systems that natively support resource forks.
    
    On modern Mac OS X/macOS systems,
    resource forks are used far less commonly than on classic Mac OS systems,
    because of compatibility issues with other systems and historical limitations in the format.
    Modern macOS APIs and libraries do not use resource forks,
    and the legacy Carbon API that still used them has been deprecated since OS X 10.8.
    Despite this,
    even current macOS systems still use resource forks for certain purposes,
    such as custom file icons.
    
    .. seealso::
       Inside Macintosh, More Macintosh Toolbox, Resource Manager, Resource Manager Reference, Resource File Format - https://developer.apple.com/library/archive/documentation/mac/pdf/MoreMacintoshToolbox.pdf#page=151
    
    
    .. seealso::
       Inside Macintosh, Volume I, The Resource Manager, Format of a Resource File - https://www.pagetable.com/?p=50
    
    
    .. seealso::
       Source - https://github.com/kreativekorp/ksfl/wiki/Macintosh-Resource-File-Format
    
    
    .. seealso::
       Source - https://github.com/dgelessus/mac_file_format_docs/blob/master/README.md#resource-forks
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(ResourceFork, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_data_blocks_with_io = False
        self.data_blocks_with_io__enabled = True
        self._should_write_resource_map = False
        self.resource_map__enabled = True

    def _read(self):
        self.header = ResourceFork.FileHeader(self._io, self, self._root)
        self.header._read()
        self.system_data = self._io.read_bytes(112)
        self.application_data = self._io.read_bytes(128)
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        _ = self.data_blocks_with_io
        if hasattr(self, '_m_data_blocks_with_io'):
            pass
            self._m_data_blocks_with_io._fetch_instances()

        _ = self.resource_map
        if hasattr(self, '_m_resource_map'):
            pass
            self._m_resource_map._fetch_instances()



    def _write__seq(self, io=None):
        super(ResourceFork, self)._write__seq(io)
        self._should_write_data_blocks_with_io = self.data_blocks_with_io__enabled
        self._should_write_resource_map = self.resource_map__enabled
        self.header._write__seq(self._io)
        self._io.write_bytes(self.system_data)
        self._io.write_bytes(self.application_data)


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if len(self.system_data) != 112:
            raise kaitaistruct.ConsistencyError(u"system_data", 112, len(self.system_data))
        if len(self.application_data) != 128:
            raise kaitaistruct.ConsistencyError(u"application_data", 128, len(self.application_data))
        if self.data_blocks_with_io__enabled:
            pass

        if self.resource_map__enabled:
            pass
            if self._m_resource_map._root != self._root:
                raise kaitaistruct.ConsistencyError(u"resource_map", self._root, self._m_resource_map._root)
            if self._m_resource_map._parent != self:
                raise kaitaistruct.ConsistencyError(u"resource_map", self, self._m_resource_map._parent)

        self._dirty = False

    class DataBlock(ReadWriteKaitaiStruct):
        """A resource data block,
        as stored in the resource data area.
        
        Each data block stores the data contained in a resource,
        along with its length.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ResourceFork.DataBlock, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_data = self._io.read_u4be()
            self.data = self._io.read_bytes(self.len_data)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ResourceFork.DataBlock, self)._write__seq(io)
            self._io.write_u4be(self.len_data)
            self._io.write_bytes(self.data)


        def _check(self):
            if len(self.data) != self.len_data:
                raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self.data))
            self._dirty = False


    class FileHeader(ReadWriteKaitaiStruct):
        """Resource file header,
        containing the offsets and lengths of the resource data area and resource map.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ResourceFork.FileHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ofs_data_blocks = self._io.read_u4be()
            self.ofs_resource_map = self._io.read_u4be()
            self.len_data_blocks = self._io.read_u4be()
            self.len_resource_map = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ResourceFork.FileHeader, self)._write__seq(io)
            self._io.write_u4be(self.ofs_data_blocks)
            self._io.write_u4be(self.ofs_resource_map)
            self._io.write_u4be(self.len_data_blocks)
            self._io.write_u4be(self.len_resource_map)


        def _check(self):
            self._dirty = False


    class ResourceMap(ReadWriteKaitaiStruct):
        """Resource map,
        containing information about the resources in the file and where they are located in the data area.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ResourceFork.ResourceMap, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_names_with_io = False
            self.names_with_io__enabled = True
            self._should_write_type_list_and_reference_lists = False
            self.type_list_and_reference_lists__enabled = True

        def _read(self):
            self.reserved_file_header_copy = ResourceFork.FileHeader(self._io, self, self._root)
            self.reserved_file_header_copy._read()
            self.reserved_next_resource_map_handle = self._io.read_u4be()
            self.reserved_file_reference_number = self._io.read_u2be()
            self._raw_file_attributes = self._io.read_bytes(2)
            _io__raw_file_attributes = KaitaiStream(BytesIO(self._raw_file_attributes))
            self.file_attributes = ResourceFork.ResourceMap.FileAttributes(_io__raw_file_attributes, self, self._root)
            self.file_attributes._read()
            self.ofs_type_list = self._io.read_u2be()
            self.ofs_names = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.reserved_file_header_copy._fetch_instances()
            self.file_attributes._fetch_instances()
            _ = self.names_with_io
            if hasattr(self, '_m_names_with_io'):
                pass
                self._m_names_with_io._fetch_instances()

            _ = self.type_list_and_reference_lists
            if hasattr(self, '_m_type_list_and_reference_lists'):
                pass
                self._m_type_list_and_reference_lists._fetch_instances()



        def _write__seq(self, io=None):
            super(ResourceFork.ResourceMap, self)._write__seq(io)
            self._should_write_names_with_io = self.names_with_io__enabled
            self._should_write_type_list_and_reference_lists = self.type_list_and_reference_lists__enabled
            self.reserved_file_header_copy._write__seq(self._io)
            self._io.write_u4be(self.reserved_next_resource_map_handle)
            self._io.write_u2be(self.reserved_file_reference_number)
            _io__raw_file_attributes = KaitaiStream(BytesIO(bytearray(2)))
            self._io.add_child_stream(_io__raw_file_attributes)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (2))
            def handler(parent, _io__raw_file_attributes=_io__raw_file_attributes):
                self._raw_file_attributes = _io__raw_file_attributes.to_byte_array()
                if len(self._raw_file_attributes) != 2:
                    raise kaitaistruct.ConsistencyError(u"raw(file_attributes)", 2, len(self._raw_file_attributes))
                parent.write_bytes(self._raw_file_attributes)
            _io__raw_file_attributes.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.file_attributes._write__seq(_io__raw_file_attributes)
            self._io.write_u2be(self.ofs_type_list)
            self._io.write_u2be(self.ofs_names)


        def _check(self):
            if self.reserved_file_header_copy._root != self._root:
                raise kaitaistruct.ConsistencyError(u"reserved_file_header_copy", self._root, self.reserved_file_header_copy._root)
            if self.reserved_file_header_copy._parent != self:
                raise kaitaistruct.ConsistencyError(u"reserved_file_header_copy", self, self.reserved_file_header_copy._parent)
            if self.file_attributes._root != self._root:
                raise kaitaistruct.ConsistencyError(u"file_attributes", self._root, self.file_attributes._root)
            if self.file_attributes._parent != self:
                raise kaitaistruct.ConsistencyError(u"file_attributes", self, self.file_attributes._parent)
            if self.names_with_io__enabled:
                pass

            if self.type_list_and_reference_lists__enabled:
                pass
                if self._m_type_list_and_reference_lists._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"type_list_and_reference_lists", self._root, self._m_type_list_and_reference_lists._root)
                if self._m_type_list_and_reference_lists._parent != self:
                    raise kaitaistruct.ConsistencyError(u"type_list_and_reference_lists", self, self._m_type_list_and_reference_lists._parent)

            self._dirty = False

        class FileAttributes(ReadWriteKaitaiStruct):
            """A resource file's attributes,
            as stored in the resource map.
            
            These attributes are sometimes also referred to as resource map attributes,
            because of where they are stored in the file.
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(ResourceFork.ResourceMap.FileAttributes, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_as_int = False
                self.as_int__enabled = True

            def _read(self):
                self.resources_locked = self._io.read_bits_int_be(1) != 0
                self.reserved0 = self._io.read_bits_int_be(6)
                self.printer_driver_multifinder_compatible = self._io.read_bits_int_be(1) != 0
                self.no_write_changes = self._io.read_bits_int_be(1) != 0
                self.needs_compact = self._io.read_bits_int_be(1) != 0
                self.map_needs_write = self._io.read_bits_int_be(1) != 0
                self.reserved1 = self._io.read_bits_int_be(5)
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.as_int
                if hasattr(self, '_m_as_int'):
                    pass



            def _write__seq(self, io=None):
                super(ResourceFork.ResourceMap.FileAttributes, self)._write__seq(io)
                self._should_write_as_int = self.as_int__enabled
                self._io.write_bits_int_be(1, int(self.resources_locked))
                self._io.write_bits_int_be(6, self.reserved0)
                self._io.write_bits_int_be(1, int(self.printer_driver_multifinder_compatible))
                self._io.write_bits_int_be(1, int(self.no_write_changes))
                self._io.write_bits_int_be(1, int(self.needs_compact))
                self._io.write_bits_int_be(1, int(self.map_needs_write))
                self._io.write_bits_int_be(5, self.reserved1)


            def _check(self):
                if self.as_int__enabled:
                    pass

                self._dirty = False

            @property
            def as_int(self):
                """The attributes as a packed integer,
                as they are stored in the file.
                """
                if self._should_write_as_int:
                    self._write_as_int()
                if hasattr(self, '_m_as_int'):
                    return self._m_as_int

                if not self.as_int__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_as_int = self._io.read_u2be()
                self._io.seek(_pos)
                return getattr(self, '_m_as_int', None)

            @as_int.setter
            def as_int(self, v):
                self._dirty = True
                self._m_as_int = v

            def _write_as_int(self):
                self._should_write_as_int = False
                _pos = self._io.pos()
                self._io.seek(0)
                self._io.write_u2be(self._m_as_int)
                self._io.seek(_pos)


        class Name(ReadWriteKaitaiStruct):
            """A resource name,
            as stored in the resource name storage area in the resource map.
            
            The resource names are not required to appear in any particular order.
            There may be unused space between and around resource names,
            but in practice they are often contiguous.
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(ResourceFork.ResourceMap.Name, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.len_value = self._io.read_u1()
                self.value = self._io.read_bytes(self.len_value)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(ResourceFork.ResourceMap.Name, self)._write__seq(io)
                self._io.write_u1(self.len_value)
                self._io.write_bytes(self.value)


            def _check(self):
                if len(self.value) != self.len_value:
                    raise kaitaistruct.ConsistencyError(u"value", self.len_value, len(self.value))
                self._dirty = False


        class TypeListAndReferenceLists(ReadWriteKaitaiStruct):
            """Resource type list and storage area for resource reference lists in the resource map.
            
            The two parts are combined into a single type here for technical reasons:
            the start of the resource reference list area is not stored explicitly in the file,
            instead it always starts directly after the resource type list.
            The simplest way to implement this is by placing both types into a single `seq`.
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(ResourceFork.ResourceMap.TypeListAndReferenceLists, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.type_list = ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList(self._io, self, self._root)
                self.type_list._read()
                self.reference_lists = self._io.read_bytes_full()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.type_list._fetch_instances()


            def _write__seq(self, io=None):
                super(ResourceFork.ResourceMap.TypeListAndReferenceLists, self)._write__seq(io)
                self.type_list._write__seq(self._io)
                self._io.write_bytes(self.reference_lists)
                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"reference_lists", 0, self._io.size() - self._io.pos())


            def _check(self):
                if self.type_list._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"type_list", self._root, self.type_list._root)
                if self.type_list._parent != self:
                    raise kaitaistruct.ConsistencyError(u"type_list", self, self.type_list._parent)
                self._dirty = False

            class ReferenceList(ReadWriteKaitaiStruct):
                """A resource reference list,
                as stored in the reference list area.
                
                Each reference list has exactly one matching entry in the resource type list,
                and describes all resources of a single type in the file.
                """
                def __init__(self, num_references, _io=None, _parent=None, _root=None):
                    super(ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self.num_references = num_references

                def _read(self):
                    self.references = []
                    for i in range(self.num_references):
                        _t_references = ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference(self._io, self, self._root)
                        try:
                            _t_references._read()
                        finally:
                            self.references.append(_t_references)

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.references)):
                        pass
                        self.references[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList, self)._write__seq(io)
                    for i in range(len(self.references)):
                        pass
                        self.references[i]._write__seq(self._io)



                def _check(self):
                    if len(self.references) != self.num_references:
                        raise kaitaistruct.ConsistencyError(u"references", self.num_references, len(self.references))
                    for i in range(len(self.references)):
                        pass
                        if self.references[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"references", self._root, self.references[i]._root)
                        if self.references[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"references", self, self.references[i]._parent)

                    self._dirty = False

                class Reference(ReadWriteKaitaiStruct):
                    """A single resource reference in a resource reference list."""
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root
                        self._should_write_data_block = False
                        self.data_block__enabled = True
                        self._should_write_name = False
                        self.name__enabled = True

                    def _read(self):
                        self.id = self._io.read_s2be()
                        self.ofs_name = self._io.read_u2be()
                        self._raw_attributes = self._io.read_bytes(1)
                        _io__raw_attributes = KaitaiStream(BytesIO(self._raw_attributes))
                        self.attributes = ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference.Attributes(_io__raw_attributes, self, self._root)
                        self.attributes._read()
                        self.ofs_data_block = self._io.read_bits_int_be(24)
                        self.reserved_handle = self._io.read_u4be()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        self.attributes._fetch_instances()
                        _ = self.data_block
                        if hasattr(self, '_m_data_block'):
                            pass
                            self._m_data_block._fetch_instances()

                        _ = self.name
                        if hasattr(self, '_m_name'):
                            pass
                            self._m_name._fetch_instances()



                    def _write__seq(self, io=None):
                        super(ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference, self)._write__seq(io)
                        self._should_write_data_block = self.data_block__enabled
                        self._should_write_name = self.name__enabled
                        self._io.write_s2be(self.id)
                        self._io.write_u2be(self.ofs_name)
                        _io__raw_attributes = KaitaiStream(BytesIO(bytearray(1)))
                        self._io.add_child_stream(_io__raw_attributes)
                        _pos2 = self._io.pos()
                        self._io.seek(self._io.pos() + (1))
                        def handler(parent, _io__raw_attributes=_io__raw_attributes):
                            self._raw_attributes = _io__raw_attributes.to_byte_array()
                            if len(self._raw_attributes) != 1:
                                raise kaitaistruct.ConsistencyError(u"raw(attributes)", 1, len(self._raw_attributes))
                            parent.write_bytes(self._raw_attributes)
                        _io__raw_attributes.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                        self.attributes._write__seq(_io__raw_attributes)
                        self._io.write_bits_int_be(24, self.ofs_data_block)
                        self._io.write_u4be(self.reserved_handle)


                    def _check(self):
                        if self.attributes._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"attributes", self._root, self.attributes._root)
                        if self.attributes._parent != self:
                            raise kaitaistruct.ConsistencyError(u"attributes", self, self.attributes._parent)
                        if self.data_block__enabled:
                            pass
                            if self._m_data_block._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"data_block", self._root, self._m_data_block._root)
                            if self._m_data_block._parent != self:
                                raise kaitaistruct.ConsistencyError(u"data_block", self, self._m_data_block._parent)

                        if self.name__enabled:
                            pass
                            if self.ofs_name != 65535:
                                pass
                                if self._m_name._root != self._root:
                                    raise kaitaistruct.ConsistencyError(u"name", self._root, self._m_name._root)
                                if self._m_name._parent != self:
                                    raise kaitaistruct.ConsistencyError(u"name", self, self._m_name._parent)


                        self._dirty = False

                    class Attributes(ReadWriteKaitaiStruct):
                        """A resource's attributes,
                        as stored in a resource reference.
                        """
                        def __init__(self, _io=None, _parent=None, _root=None):
                            super(ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference.Attributes, self).__init__(_io)
                            self._parent = _parent
                            self._root = _root
                            self._should_write_as_int = False
                            self.as_int__enabled = True

                        def _read(self):
                            self.system_reference = self._io.read_bits_int_be(1) != 0
                            self.load_into_system_heap = self._io.read_bits_int_be(1) != 0
                            self.purgeable = self._io.read_bits_int_be(1) != 0
                            self.locked = self._io.read_bits_int_be(1) != 0
                            self.protected = self._io.read_bits_int_be(1) != 0
                            self.preload = self._io.read_bits_int_be(1) != 0
                            self.needs_write = self._io.read_bits_int_be(1) != 0
                            self.compressed = self._io.read_bits_int_be(1) != 0
                            self._dirty = False


                        def _fetch_instances(self):
                            pass
                            _ = self.as_int
                            if hasattr(self, '_m_as_int'):
                                pass



                        def _write__seq(self, io=None):
                            super(ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference.Attributes, self)._write__seq(io)
                            self._should_write_as_int = self.as_int__enabled
                            self._io.write_bits_int_be(1, int(self.system_reference))
                            self._io.write_bits_int_be(1, int(self.load_into_system_heap))
                            self._io.write_bits_int_be(1, int(self.purgeable))
                            self._io.write_bits_int_be(1, int(self.locked))
                            self._io.write_bits_int_be(1, int(self.protected))
                            self._io.write_bits_int_be(1, int(self.preload))
                            self._io.write_bits_int_be(1, int(self.needs_write))
                            self._io.write_bits_int_be(1, int(self.compressed))


                        def _check(self):
                            if self.as_int__enabled:
                                pass

                            self._dirty = False

                        @property
                        def as_int(self):
                            """The attributes as a packed integer,
                            as they are stored in the file.
                            """
                            if self._should_write_as_int:
                                self._write_as_int()
                            if hasattr(self, '_m_as_int'):
                                return self._m_as_int

                            if not self.as_int__enabled:
                                return None

                            _pos = self._io.pos()
                            self._io.seek(0)
                            self._m_as_int = self._io.read_u1()
                            self._io.seek(_pos)
                            return getattr(self, '_m_as_int', None)

                        @as_int.setter
                        def as_int(self, v):
                            self._dirty = True
                            self._m_as_int = v

                        def _write_as_int(self):
                            self._should_write_as_int = False
                            _pos = self._io.pos()
                            self._io.seek(0)
                            self._io.write_u1(self._m_as_int)
                            self._io.seek(_pos)


                    @property
                    def data_block(self):
                        """The data block containing the data for the resource described by this reference.
                        """
                        if self._should_write_data_block:
                            self._write_data_block()
                        if hasattr(self, '_m_data_block'):
                            return self._m_data_block

                        if not self.data_block__enabled:
                            return None

                        io = self._root.data_blocks_with_io._io
                        _pos = io.pos()
                        io.seek(self.ofs_data_block)
                        self._m_data_block = ResourceFork.DataBlock(io, self, self._root)
                        self._m_data_block._read()
                        io.seek(_pos)
                        return getattr(self, '_m_data_block', None)

                    @data_block.setter
                    def data_block(self, v):
                        self._dirty = True
                        self._m_data_block = v

                    def _write_data_block(self):
                        self._should_write_data_block = False
                        io = self._root.data_blocks_with_io._io
                        _pos = io.pos()
                        io.seek(self.ofs_data_block)
                        self._m_data_block._write__seq(io)
                        io.seek(_pos)

                    @property
                    def name(self):
                        """The name (if any) of the resource described by this reference.
                        """
                        if self._should_write_name:
                            self._write_name()
                        if hasattr(self, '_m_name'):
                            return self._m_name

                        if not self.name__enabled:
                            return None

                        if self.ofs_name != 65535:
                            pass
                            io = self._root.resource_map.names_with_io._io
                            _pos = io.pos()
                            io.seek(self.ofs_name)
                            self._m_name = ResourceFork.ResourceMap.Name(io, self, self._root)
                            self._m_name._read()
                            io.seek(_pos)

                        return getattr(self, '_m_name', None)

                    @name.setter
                    def name(self, v):
                        self._dirty = True
                        self._m_name = v

                    def _write_name(self):
                        self._should_write_name = False
                        if self.ofs_name != 65535:
                            pass
                            io = self._root.resource_map.names_with_io._io
                            _pos = io.pos()
                            io.seek(self.ofs_name)
                            self._m_name._write__seq(io)
                            io.seek(_pos)




            class TypeList(ReadWriteKaitaiStruct):
                """Resource type list in the resource map."""
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.num_types_m1 = self._io.read_u2be()
                    self.entries = []
                    for i in range(self.num_types):
                        _t_entries = ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry(self._io, self, self._root)
                        try:
                            _t_entries._read()
                        finally:
                            self.entries.append(_t_entries)

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.entries)):
                        pass
                        self.entries[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList, self)._write__seq(io)
                    self._io.write_u2be(self.num_types_m1)
                    for i in range(len(self.entries)):
                        pass
                        self.entries[i]._write__seq(self._io)



                def _check(self):
                    if len(self.entries) != self.num_types:
                        raise kaitaistruct.ConsistencyError(u"entries", self.num_types, len(self.entries))
                    for i in range(len(self.entries)):
                        pass
                        if self.entries[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                        if self.entries[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

                    self._dirty = False

                class TypeListEntry(ReadWriteKaitaiStruct):
                    """A single entry in the resource type list.
                    
                    Each entry corresponds to exactly one resource reference list.
                    """
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root
                        self._should_write_reference_list = False
                        self.reference_list__enabled = True

                    def _read(self):
                        self.type = self._io.read_bytes(4)
                        self.num_references_m1 = self._io.read_u2be()
                        self.ofs_reference_list = self._io.read_u2be()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        _ = self.reference_list
                        if hasattr(self, '_m_reference_list'):
                            pass
                            self._m_reference_list._fetch_instances()



                    def _write__seq(self, io=None):
                        super(ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry, self)._write__seq(io)
                        self._should_write_reference_list = self.reference_list__enabled
                        self._io.write_bytes(self.type)
                        self._io.write_u2be(self.num_references_m1)
                        self._io.write_u2be(self.ofs_reference_list)


                    def _check(self):
                        if len(self.type) != 4:
                            raise kaitaistruct.ConsistencyError(u"type", 4, len(self.type))
                        if self.reference_list__enabled:
                            pass
                            if self._m_reference_list._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"reference_list", self._root, self._m_reference_list._root)
                            if self._m_reference_list._parent != self:
                                raise kaitaistruct.ConsistencyError(u"reference_list", self, self._m_reference_list._parent)
                            if self._m_reference_list.num_references != self.num_references:
                                raise kaitaistruct.ConsistencyError(u"reference_list", self.num_references, self._m_reference_list.num_references)

                        self._dirty = False

                    @property
                    def num_references(self):
                        """The number of resources in the reference list for this type."""
                        if hasattr(self, '_m_num_references'):
                            return self._m_num_references

                        self._m_num_references = (self.num_references_m1 + 1) % 65536
                        return getattr(self, '_m_num_references', None)

                    def _invalidate_num_references(self):
                        del self._m_num_references
                    @property
                    def reference_list(self):
                        """The resource reference list for this resource type.
                        """
                        if self._should_write_reference_list:
                            self._write_reference_list()
                        if hasattr(self, '_m_reference_list'):
                            return self._m_reference_list

                        if not self.reference_list__enabled:
                            return None

                        io = self._parent._parent._io
                        _pos = io.pos()
                        io.seek(self.ofs_reference_list)
                        self._m_reference_list = ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList(self.num_references, io, self, self._root)
                        self._m_reference_list._read()
                        io.seek(_pos)
                        return getattr(self, '_m_reference_list', None)

                    @reference_list.setter
                    def reference_list(self, v):
                        self._dirty = True
                        self._m_reference_list = v

                    def _write_reference_list(self):
                        self._should_write_reference_list = False
                        io = self._parent._parent._io
                        _pos = io.pos()
                        io.seek(self.ofs_reference_list)
                        self._m_reference_list._write__seq(io)
                        io.seek(_pos)


                @property
                def num_types(self):
                    """The number of resource types in this list."""
                    if hasattr(self, '_m_num_types'):
                        return self._m_num_types

                    self._m_num_types = (self.num_types_m1 + 1) % 65536
                    return getattr(self, '_m_num_types', None)

                def _invalidate_num_types(self):
                    del self._m_num_types


        @property
        def names(self):
            """Storage area for the names of all resources."""
            if hasattr(self, '_m_names'):
                return self._m_names

            self._m_names = self.names_with_io.data
            return getattr(self, '_m_names', None)

        def _invalidate_names(self):
            del self._m_names
        @property
        def names_with_io(self):
            """Use `names` instead,
            unless you need access to this instance's `_io`.
            """
            if self._should_write_names_with_io:
                self._write_names_with_io()
            if hasattr(self, '_m_names_with_io'):
                return self._m_names_with_io

            if not self.names_with_io__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs_names)
            self._raw__m_names_with_io = self._io.read_bytes_full()
            _io__raw__m_names_with_io = KaitaiStream(BytesIO(self._raw__m_names_with_io))
            self._m_names_with_io = bytes_with_io.BytesWithIo(_io__raw__m_names_with_io)
            self._m_names_with_io._read()
            self._io.seek(_pos)
            return getattr(self, '_m_names_with_io', None)

        @names_with_io.setter
        def names_with_io(self, v):
            self._dirty = True
            self._m_names_with_io = v

        def _write_names_with_io(self):
            self._should_write_names_with_io = False
            _pos = self._io.pos()
            self._io.seek(self.ofs_names)
            _io__raw__m_names_with_io = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
            self._io.add_child_stream(_io__raw__m_names_with_io)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
            def handler(parent, _io__raw__m_names_with_io=_io__raw__m_names_with_io):
                self._raw__m_names_with_io = _io__raw__m_names_with_io.to_byte_array()
                parent.write_bytes(self._raw__m_names_with_io)
                if not parent.is_eof():
                    raise kaitaistruct.ConsistencyError(u"raw(names_with_io)", 0, parent.size() - parent.pos())
            _io__raw__m_names_with_io.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_names_with_io._write__seq(_io__raw__m_names_with_io)
            self._io.seek(_pos)

        @property
        def type_list_and_reference_lists(self):
            """The resource map's resource type list, followed by the resource reference list area."""
            if self._should_write_type_list_and_reference_lists:
                self._write_type_list_and_reference_lists()
            if hasattr(self, '_m_type_list_and_reference_lists'):
                return self._m_type_list_and_reference_lists

            if not self.type_list_and_reference_lists__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs_type_list)
            self._raw__m_type_list_and_reference_lists = self._io.read_bytes(self.ofs_names - self.ofs_type_list)
            _io__raw__m_type_list_and_reference_lists = KaitaiStream(BytesIO(self._raw__m_type_list_and_reference_lists))
            self._m_type_list_and_reference_lists = ResourceFork.ResourceMap.TypeListAndReferenceLists(_io__raw__m_type_list_and_reference_lists, self, self._root)
            self._m_type_list_and_reference_lists._read()
            self._io.seek(_pos)
            return getattr(self, '_m_type_list_and_reference_lists', None)

        @type_list_and_reference_lists.setter
        def type_list_and_reference_lists(self, v):
            self._dirty = True
            self._m_type_list_and_reference_lists = v

        def _write_type_list_and_reference_lists(self):
            self._should_write_type_list_and_reference_lists = False
            _pos = self._io.pos()
            self._io.seek(self.ofs_type_list)
            _io__raw__m_type_list_and_reference_lists = KaitaiStream(BytesIO(bytearray(self.ofs_names - self.ofs_type_list)))
            self._io.add_child_stream(_io__raw__m_type_list_and_reference_lists)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.ofs_names - self.ofs_type_list))
            def handler(parent, _io__raw__m_type_list_and_reference_lists=_io__raw__m_type_list_and_reference_lists):
                self._raw__m_type_list_and_reference_lists = _io__raw__m_type_list_and_reference_lists.to_byte_array()
                if len(self._raw__m_type_list_and_reference_lists) != self.ofs_names - self.ofs_type_list:
                    raise kaitaistruct.ConsistencyError(u"raw(type_list_and_reference_lists)", self.ofs_names - self.ofs_type_list, len(self._raw__m_type_list_and_reference_lists))
                parent.write_bytes(self._raw__m_type_list_and_reference_lists)
            _io__raw__m_type_list_and_reference_lists.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_type_list_and_reference_lists._write__seq(_io__raw__m_type_list_and_reference_lists)
            self._io.seek(_pos)


    @property
    def data_blocks(self):
        """Storage area for the data blocks of all resources.
        
        These data blocks are not required to appear in any particular order,
        and there may be unused space between and around them.
        
        In practice,
        the data blocks in newly created resource files are usually contiguous.
        When existing resources are shortened,
        the Mac OS resource manager leaves unused space where the now removed resource data was,
        as this is quicker than moving the following resource data into the newly freed space.
        Such unused space may be cleaned up later when the resource manager "compacts" the resource file,
        which happens when resources are removed entirely,
        or when resources are added or grown so that more space is needed in the data area.
        """
        if hasattr(self, '_m_data_blocks'):
            return self._m_data_blocks

        self._m_data_blocks = self.data_blocks_with_io.data
        return getattr(self, '_m_data_blocks', None)

    def _invalidate_data_blocks(self):
        del self._m_data_blocks
    @property
    def data_blocks_with_io(self):
        """Use `data_blocks` instead,
        unless you need access to this instance's `_io`.
        """
        if self._should_write_data_blocks_with_io:
            self._write_data_blocks_with_io()
        if hasattr(self, '_m_data_blocks_with_io'):
            return self._m_data_blocks_with_io

        if not self.data_blocks_with_io__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.ofs_data_blocks)
        self._raw__m_data_blocks_with_io = self._io.read_bytes(self.header.len_data_blocks)
        _io__raw__m_data_blocks_with_io = KaitaiStream(BytesIO(self._raw__m_data_blocks_with_io))
        self._m_data_blocks_with_io = bytes_with_io.BytesWithIo(_io__raw__m_data_blocks_with_io)
        self._m_data_blocks_with_io._read()
        self._io.seek(_pos)
        return getattr(self, '_m_data_blocks_with_io', None)

    @data_blocks_with_io.setter
    def data_blocks_with_io(self, v):
        self._dirty = True
        self._m_data_blocks_with_io = v

    def _write_data_blocks_with_io(self):
        self._should_write_data_blocks_with_io = False
        _pos = self._io.pos()
        self._io.seek(self.header.ofs_data_blocks)
        _io__raw__m_data_blocks_with_io = KaitaiStream(BytesIO(bytearray(self.header.len_data_blocks)))
        self._io.add_child_stream(_io__raw__m_data_blocks_with_io)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.header.len_data_blocks))
        def handler(parent, _io__raw__m_data_blocks_with_io=_io__raw__m_data_blocks_with_io):
            self._raw__m_data_blocks_with_io = _io__raw__m_data_blocks_with_io.to_byte_array()
            if len(self._raw__m_data_blocks_with_io) != self.header.len_data_blocks:
                raise kaitaistruct.ConsistencyError(u"raw(data_blocks_with_io)", self.header.len_data_blocks, len(self._raw__m_data_blocks_with_io))
            parent.write_bytes(self._raw__m_data_blocks_with_io)
        _io__raw__m_data_blocks_with_io.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_data_blocks_with_io._write__seq(_io__raw__m_data_blocks_with_io)
        self._io.seek(_pos)

    @property
    def resource_map(self):
        """The resource file's resource map."""
        if self._should_write_resource_map:
            self._write_resource_map()
        if hasattr(self, '_m_resource_map'):
            return self._m_resource_map

        if not self.resource_map__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.ofs_resource_map)
        self._raw__m_resource_map = self._io.read_bytes(self.header.len_resource_map)
        _io__raw__m_resource_map = KaitaiStream(BytesIO(self._raw__m_resource_map))
        self._m_resource_map = ResourceFork.ResourceMap(_io__raw__m_resource_map, self, self._root)
        self._m_resource_map._read()
        self._io.seek(_pos)
        return getattr(self, '_m_resource_map', None)

    @resource_map.setter
    def resource_map(self, v):
        self._dirty = True
        self._m_resource_map = v

    def _write_resource_map(self):
        self._should_write_resource_map = False
        _pos = self._io.pos()
        self._io.seek(self.header.ofs_resource_map)
        _io__raw__m_resource_map = KaitaiStream(BytesIO(bytearray(self.header.len_resource_map)))
        self._io.add_child_stream(_io__raw__m_resource_map)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.header.len_resource_map))
        def handler(parent, _io__raw__m_resource_map=_io__raw__m_resource_map):
            self._raw__m_resource_map = _io__raw__m_resource_map.to_byte_array()
            if len(self._raw__m_resource_map) != self.header.len_resource_map:
                raise kaitaistruct.ConsistencyError(u"raw(resource_map)", self.header.len_resource_map, len(self._raw__m_resource_map))
            parent.write_bytes(self._raw__m_resource_map)
        _io__raw__m_resource_map.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_resource_map._write__seq(_io__raw__m_resource_map)
        self._io.seek(_pos)


