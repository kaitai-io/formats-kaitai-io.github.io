# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(kaitaistruct.__version__) < parse_version('0.9'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class Dtb(KaitaiStruct):
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

    class Fdt(Enum):
        begin_node = 1
        end_node = 2
        prop = 3
        nop = 4
        end = 9
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

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

    class MemoryBlock(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append(Dtb.MemoryBlockEntry(self._io, self, self._root))
                i += 1



    class FdtBlock(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.nodes = []
            i = 0
            while True:
                _ = Dtb.FdtNode(self._io, self, self._root)
                self.nodes.append(_)
                if _.type == Dtb.Fdt.end:
                    break
                i += 1


    class MemoryBlockEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.address = self._io.read_u8be()
            self.size = self._io.read_u8be()


    class Strings(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.strings = []
            i = 0
            while not self._io.is_eof():
                self.strings.append((self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII"))
                i += 1



    class FdtProp(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_property = self._io.read_u4be()
            self.ofs_name = self._io.read_u4be()
            self.property = self._io.read_bytes(self.len_property)
            self.padding = self._io.read_bytes((-(self._io.pos()) % 4))

        @property
        def name(self):
            if hasattr(self, '_m_name'):
                return self._m_name if hasattr(self, '_m_name') else None

            io = self._root.strings_block._io
            _pos = io.pos()
            io.seek(self.ofs_name)
            self._m_name = (io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            io.seek(_pos)
            return self._m_name if hasattr(self, '_m_name') else None


    class FdtNode(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.type = KaitaiStream.resolve_enum(Dtb.Fdt, self._io.read_u4be())
            _on = self.type
            if _on == Dtb.Fdt.begin_node:
                self.body = Dtb.FdtBeginNode(self._io, self, self._root)
            elif _on == Dtb.Fdt.prop:
                self.body = Dtb.FdtProp(self._io, self, self._root)


    class FdtBeginNode(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            self.padding = self._io.read_bytes((-(self._io.pos()) % 4))


    @property
    def memory_reservation_block(self):
        if hasattr(self, '_m_memory_reservation_block'):
            return self._m_memory_reservation_block if hasattr(self, '_m_memory_reservation_block') else None

        _pos = self._io.pos()
        self._io.seek(self.ofs_memory_reservation_block)
        self._raw__m_memory_reservation_block = self._io.read_bytes((self.ofs_structure_block - self.ofs_memory_reservation_block))
        _io__raw__m_memory_reservation_block = KaitaiStream(BytesIO(self._raw__m_memory_reservation_block))
        self._m_memory_reservation_block = Dtb.MemoryBlock(_io__raw__m_memory_reservation_block, self, self._root)
        self._io.seek(_pos)
        return self._m_memory_reservation_block if hasattr(self, '_m_memory_reservation_block') else None

    @property
    def structure_block(self):
        if hasattr(self, '_m_structure_block'):
            return self._m_structure_block if hasattr(self, '_m_structure_block') else None

        _pos = self._io.pos()
        self._io.seek(self.ofs_structure_block)
        self._raw__m_structure_block = self._io.read_bytes(self.len_structure_block)
        _io__raw__m_structure_block = KaitaiStream(BytesIO(self._raw__m_structure_block))
        self._m_structure_block = Dtb.FdtBlock(_io__raw__m_structure_block, self, self._root)
        self._io.seek(_pos)
        return self._m_structure_block if hasattr(self, '_m_structure_block') else None

    @property
    def strings_block(self):
        if hasattr(self, '_m_strings_block'):
            return self._m_strings_block if hasattr(self, '_m_strings_block') else None

        _pos = self._io.pos()
        self._io.seek(self.ofs_strings_block)
        self._raw__m_strings_block = self._io.read_bytes(self.len_strings_block)
        _io__raw__m_strings_block = KaitaiStream(BytesIO(self._raw__m_strings_block))
        self._m_strings_block = Dtb.Strings(_io__raw__m_strings_block, self, self._root)
        self._io.seek(_pos)
        return self._m_strings_block if hasattr(self, '_m_strings_block') else None


