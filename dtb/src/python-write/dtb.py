# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Dtb(ReadWriteKaitaiStruct):
    """Also referred to as Devicetree Blob (DTB). It is a flat binary encoding
    of data (primarily devicetree data, although other data is possible as well).
    The data is internally stored as a tree of named nodes and properties. Nodes
    contain properties and child nodes, while properties are name-value pairs.
    
    The Devicetree Blobs (`.dtb` files) are compiled from the Devicetree Source
    files (`.dts`) through the Devicetree compiler (DTC).
    
    On Linux systems that support this, the blobs can be accessed in
    `/sys/firmware/fdt`:
    
    * <https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw>
    
    The encoding of strings used in the `strings_block` and `structure_block` is
    actually a subset of ASCII:
    
    <https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#node-names>
    
    Example files:
    
    * <https://github.com/qemu/qemu/tree/master/pc-bios>
    
    .. seealso::
       Source - https://devicetree-specification.readthedocs.io/en/v0.3/flattened-format.html
    
    
    .. seealso::
       Source - https://elinux.org/images/f/f4/Elc2013_Fernandes.pdf
    """

    class Fdt(IntEnum):
        begin_node = 1
        end_node = 2
        prop = 3
        nop = 4
        end = 9
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Dtb, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_memory_reservation_block = False
        self.memory_reservation_block__enabled = True
        self._should_write_strings_block = False
        self.strings_block__enabled = True
        self._should_write_structure_block = False
        self.structure_block__enabled = True

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\xD0\x0D\xFE\xED":
            raise kaitaistruct.ValidationNotEqualError(b"\xD0\x0D\xFE\xED", self.magic, self._io, u"/seq/0")
        self.total_size = self._io.read_u4be()
        self.ofs_structure_block = self._io.read_u4be()
        self.ofs_strings_block = self._io.read_u4be()
        self.ofs_memory_reservation_block = self._io.read_u4be()
        self.version = self._io.read_u4be()
        self.min_compatible_version = self._io.read_u4be()
        if not self.min_compatible_version <= self.version:
            raise kaitaistruct.ValidationGreaterThanError(self.version, self.min_compatible_version, self._io, u"/seq/6")
        self.boot_cpuid_phys = self._io.read_u4be()
        self.len_strings_block = self._io.read_u4be()
        self.len_structure_block = self._io.read_u4be()
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.memory_reservation_block
        if hasattr(self, '_m_memory_reservation_block'):
            pass
            self._m_memory_reservation_block._fetch_instances()

        _ = self.strings_block
        if hasattr(self, '_m_strings_block'):
            pass
            self._m_strings_block._fetch_instances()

        _ = self.structure_block
        if hasattr(self, '_m_structure_block'):
            pass
            self._m_structure_block._fetch_instances()



    def _write__seq(self, io=None):
        super(Dtb, self)._write__seq(io)
        self._should_write_memory_reservation_block = self.memory_reservation_block__enabled
        self._should_write_strings_block = self.strings_block__enabled
        self._should_write_structure_block = self.structure_block__enabled
        self._io.write_bytes(self.magic)
        self._io.write_u4be(self.total_size)
        self._io.write_u4be(self.ofs_structure_block)
        self._io.write_u4be(self.ofs_strings_block)
        self._io.write_u4be(self.ofs_memory_reservation_block)
        self._io.write_u4be(self.version)
        self._io.write_u4be(self.min_compatible_version)
        self._io.write_u4be(self.boot_cpuid_phys)
        self._io.write_u4be(self.len_strings_block)
        self._io.write_u4be(self.len_structure_block)


    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\xD0\x0D\xFE\xED":
            raise kaitaistruct.ValidationNotEqualError(b"\xD0\x0D\xFE\xED", self.magic, None, u"/seq/0")
        if not self.min_compatible_version <= self.version:
            raise kaitaistruct.ValidationGreaterThanError(self.version, self.min_compatible_version, None, u"/seq/6")
        if self.memory_reservation_block__enabled:
            pass
            if self._m_memory_reservation_block._root != self._root:
                raise kaitaistruct.ConsistencyError(u"memory_reservation_block", self._root, self._m_memory_reservation_block._root)
            if self._m_memory_reservation_block._parent != self:
                raise kaitaistruct.ConsistencyError(u"memory_reservation_block", self, self._m_memory_reservation_block._parent)

        if self.strings_block__enabled:
            pass
            if self._m_strings_block._root != self._root:
                raise kaitaistruct.ConsistencyError(u"strings_block", self._root, self._m_strings_block._root)
            if self._m_strings_block._parent != self:
                raise kaitaistruct.ConsistencyError(u"strings_block", self, self._m_strings_block._parent)

        if self.structure_block__enabled:
            pass
            if self._m_structure_block._root != self._root:
                raise kaitaistruct.ConsistencyError(u"structure_block", self._root, self._m_structure_block._root)
            if self._m_structure_block._parent != self:
                raise kaitaistruct.ConsistencyError(u"structure_block", self, self._m_structure_block._parent)

        self._dirty = False

    class FdtBeginNode(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dtb.FdtBeginNode, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            self.padding = self._io.read_bytes(-(self._io.pos()) % 4)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Dtb.FdtBeginNode, self)._write__seq(io)
            self._io.write_bytes((self.name).encode(u"ASCII"))
            self._io.write_u1(0)
            if len(self.padding) != -(self._io.pos()) % 4:
                raise kaitaistruct.ConsistencyError(u"padding", -(self._io.pos()) % 4, len(self.padding))
            self._io.write_bytes(self.padding)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0))
            self._dirty = False


    class FdtBlock(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dtb.FdtBlock, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.nodes = []
            i = 0
            while True:
                _t_nodes = Dtb.FdtNode(self._io, self, self._root)
                try:
                    _t_nodes._read()
                finally:
                    _ = _t_nodes
                    self.nodes.append(_)
                if _.type == Dtb.Fdt.end:
                    break
                i += 1
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.nodes)):
                pass
                self.nodes[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Dtb.FdtBlock, self)._write__seq(io)
            for i in range(len(self.nodes)):
                pass
                self.nodes[i]._write__seq(self._io)



        def _check(self):
            if len(self.nodes) == 0:
                raise kaitaistruct.ConsistencyError(u"nodes", 0, len(self.nodes))
            for i in range(len(self.nodes)):
                pass
                if self.nodes[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"nodes", self._root, self.nodes[i]._root)
                if self.nodes[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"nodes", self, self.nodes[i]._parent)
                _ = self.nodes[i]
                if (_.type == Dtb.Fdt.end) != (i == len(self.nodes) - 1):
                    raise kaitaistruct.ConsistencyError(u"nodes", i == len(self.nodes) - 1, _.type == Dtb.Fdt.end)

            self._dirty = False


    class FdtNode(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dtb.FdtNode, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type = KaitaiStream.resolve_enum(Dtb.Fdt, self._io.read_u4be())
            _on = self.type
            if _on == Dtb.Fdt.begin_node:
                pass
                self.body = Dtb.FdtBeginNode(self._io, self, self._root)
                self.body._read()
            elif _on == Dtb.Fdt.prop:
                pass
                self.body = Dtb.FdtProp(self._io, self, self._root)
                self.body._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.type
            if _on == Dtb.Fdt.begin_node:
                pass
                self.body._fetch_instances()
            elif _on == Dtb.Fdt.prop:
                pass
                self.body._fetch_instances()


        def _write__seq(self, io=None):
            super(Dtb.FdtNode, self)._write__seq(io)
            self._io.write_u4be(int(self.type))
            _on = self.type
            if _on == Dtb.Fdt.begin_node:
                pass
                self.body._write__seq(self._io)
            elif _on == Dtb.Fdt.prop:
                pass
                self.body._write__seq(self._io)


        def _check(self):
            _on = self.type
            if _on == Dtb.Fdt.begin_node:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Dtb.Fdt.prop:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            self._dirty = False


    class FdtProp(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dtb.FdtProp, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_name = False
            self.name__enabled = True

        def _read(self):
            self.len_property = self._io.read_u4be()
            self.ofs_name = self._io.read_u4be()
            self.property = self._io.read_bytes(self.len_property)
            self.padding = self._io.read_bytes(-(self._io.pos()) % 4)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.name
            if hasattr(self, '_m_name'):
                pass



        def _write__seq(self, io=None):
            super(Dtb.FdtProp, self)._write__seq(io)
            self._should_write_name = self.name__enabled
            self._io.write_u4be(self.len_property)
            self._io.write_u4be(self.ofs_name)
            self._io.write_bytes(self.property)
            if len(self.padding) != -(self._io.pos()) % 4:
                raise kaitaistruct.ConsistencyError(u"padding", -(self._io.pos()) % 4, len(self.padding))
            self._io.write_bytes(self.padding)


        def _check(self):
            if len(self.property) != self.len_property:
                raise kaitaistruct.ConsistencyError(u"property", self.len_property, len(self.property))
            if self.name__enabled:
                pass
                if KaitaiStream.byte_array_index_of((self._m_name).encode(u"ASCII"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self._m_name).encode(u"ASCII"), 0))

            self._dirty = False

        @property
        def name(self):
            if self._should_write_name:
                self._write_name()
            if hasattr(self, '_m_name'):
                return self._m_name

            if not self.name__enabled:
                return None

            io = self._root.strings_block._io
            _pos = io.pos()
            io.seek(self.ofs_name)
            self._m_name = (io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            io.seek(_pos)
            return getattr(self, '_m_name', None)

        @name.setter
        def name(self, v):
            self._dirty = True
            self._m_name = v

        def _write_name(self):
            self._should_write_name = False
            io = self._root.strings_block._io
            _pos = io.pos()
            io.seek(self.ofs_name)
            io.write_bytes((self._m_name).encode(u"ASCII"))
            io.write_u1(0)
            io.seek(_pos)


    class MemoryBlock(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dtb.MemoryBlock, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = Dtb.MemoryBlockEntry(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    self.entries.append(_t_entries)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Dtb.MemoryBlock, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                self.entries[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

            self._dirty = False


    class MemoryBlockEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dtb.MemoryBlockEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.address = self._io.read_u8be()
            self.size = self._io.read_u8be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Dtb.MemoryBlockEntry, self)._write__seq(io)
            self._io.write_u8be(self.address)
            self._io.write_u8be(self.size)


        def _check(self):
            self._dirty = False


    class Strings(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dtb.Strings, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.strings = []
            i = 0
            while not self._io.is_eof():
                self.strings.append((self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII"))
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.strings)):
                pass



        def _write__seq(self, io=None):
            super(Dtb.Strings, self)._write__seq(io)
            for i in range(len(self.strings)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"strings", 0, self._io.size() - self._io.pos())
                self._io.write_bytes((self.strings[i]).encode(u"ASCII"))
                self._io.write_u1(0)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"strings", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.strings)):
                pass
                if KaitaiStream.byte_array_index_of((self.strings[i]).encode(u"ASCII"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"strings", -1, KaitaiStream.byte_array_index_of((self.strings[i]).encode(u"ASCII"), 0))

            self._dirty = False


    @property
    def memory_reservation_block(self):
        if self._should_write_memory_reservation_block:
            self._write_memory_reservation_block()
        if hasattr(self, '_m_memory_reservation_block'):
            return self._m_memory_reservation_block

        if not self.memory_reservation_block__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_memory_reservation_block)
        self._raw__m_memory_reservation_block = self._io.read_bytes(self.ofs_structure_block - self.ofs_memory_reservation_block)
        _io__raw__m_memory_reservation_block = KaitaiStream(BytesIO(self._raw__m_memory_reservation_block))
        self._m_memory_reservation_block = Dtb.MemoryBlock(_io__raw__m_memory_reservation_block, self, self._root)
        self._m_memory_reservation_block._read()
        self._io.seek(_pos)
        return getattr(self, '_m_memory_reservation_block', None)

    @memory_reservation_block.setter
    def memory_reservation_block(self, v):
        self._dirty = True
        self._m_memory_reservation_block = v

    def _write_memory_reservation_block(self):
        self._should_write_memory_reservation_block = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_memory_reservation_block)
        _io__raw__m_memory_reservation_block = KaitaiStream(BytesIO(bytearray(self.ofs_structure_block - self.ofs_memory_reservation_block)))
        self._io.add_child_stream(_io__raw__m_memory_reservation_block)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.ofs_structure_block - self.ofs_memory_reservation_block))
        def handler(parent, _io__raw__m_memory_reservation_block=_io__raw__m_memory_reservation_block):
            self._raw__m_memory_reservation_block = _io__raw__m_memory_reservation_block.to_byte_array()
            if len(self._raw__m_memory_reservation_block) != self.ofs_structure_block - self.ofs_memory_reservation_block:
                raise kaitaistruct.ConsistencyError(u"raw(memory_reservation_block)", self.ofs_structure_block - self.ofs_memory_reservation_block, len(self._raw__m_memory_reservation_block))
            parent.write_bytes(self._raw__m_memory_reservation_block)
        _io__raw__m_memory_reservation_block.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_memory_reservation_block._write__seq(_io__raw__m_memory_reservation_block)
        self._io.seek(_pos)

    @property
    def strings_block(self):
        if self._should_write_strings_block:
            self._write_strings_block()
        if hasattr(self, '_m_strings_block'):
            return self._m_strings_block

        if not self.strings_block__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_strings_block)
        self._raw__m_strings_block = self._io.read_bytes(self.len_strings_block)
        _io__raw__m_strings_block = KaitaiStream(BytesIO(self._raw__m_strings_block))
        self._m_strings_block = Dtb.Strings(_io__raw__m_strings_block, self, self._root)
        self._m_strings_block._read()
        self._io.seek(_pos)
        return getattr(self, '_m_strings_block', None)

    @strings_block.setter
    def strings_block(self, v):
        self._dirty = True
        self._m_strings_block = v

    def _write_strings_block(self):
        self._should_write_strings_block = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_strings_block)
        _io__raw__m_strings_block = KaitaiStream(BytesIO(bytearray(self.len_strings_block)))
        self._io.add_child_stream(_io__raw__m_strings_block)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.len_strings_block))
        def handler(parent, _io__raw__m_strings_block=_io__raw__m_strings_block):
            self._raw__m_strings_block = _io__raw__m_strings_block.to_byte_array()
            if len(self._raw__m_strings_block) != self.len_strings_block:
                raise kaitaistruct.ConsistencyError(u"raw(strings_block)", self.len_strings_block, len(self._raw__m_strings_block))
            parent.write_bytes(self._raw__m_strings_block)
        _io__raw__m_strings_block.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_strings_block._write__seq(_io__raw__m_strings_block)
        self._io.seek(_pos)

    @property
    def structure_block(self):
        if self._should_write_structure_block:
            self._write_structure_block()
        if hasattr(self, '_m_structure_block'):
            return self._m_structure_block

        if not self.structure_block__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_structure_block)
        self._raw__m_structure_block = self._io.read_bytes(self.len_structure_block)
        _io__raw__m_structure_block = KaitaiStream(BytesIO(self._raw__m_structure_block))
        self._m_structure_block = Dtb.FdtBlock(_io__raw__m_structure_block, self, self._root)
        self._m_structure_block._read()
        self._io.seek(_pos)
        return getattr(self, '_m_structure_block', None)

    @structure_block.setter
    def structure_block(self, v):
        self._dirty = True
        self._m_structure_block = v

    def _write_structure_block(self):
        self._should_write_structure_block = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_structure_block)
        _io__raw__m_structure_block = KaitaiStream(BytesIO(bytearray(self.len_structure_block)))
        self._io.add_child_stream(_io__raw__m_structure_block)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.len_structure_block))
        def handler(parent, _io__raw__m_structure_block=_io__raw__m_structure_block):
            self._raw__m_structure_block = _io__raw__m_structure_block.to_byte_array()
            if len(self._raw__m_structure_block) != self.len_structure_block:
                raise kaitaistruct.ConsistencyError(u"raw(structure_block)", self.len_structure_block, len(self._raw__m_structure_block))
            parent.write_bytes(self._raw__m_structure_block)
        _io__raw__m_structure_block.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_structure_block._write__seq(_io__raw__m_structure_block)
        self._io.seek(_pos)


