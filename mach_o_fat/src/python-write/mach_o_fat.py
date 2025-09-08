# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import mach_o


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MachOFat(ReadWriteKaitaiStruct):
    """This is a simple container format that encapsulates multiple Mach-O files,
    each generally for a different architecture. XNU can execute these files just
    like single-arch Mach-Os and will pick the appropriate entry.
    
    .. seealso::
       Source - https://opensource.apple.com/source/xnu/xnu-7195.121.3/EXTERNAL_HEADERS/mach-o/fat.h.auto.html
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(MachOFat, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\xCA\xFE\xBA\xBE":
            raise kaitaistruct.ValidationNotEqualError(b"\xCA\xFE\xBA\xBE", self.magic, self._io, u"/seq/0")
        self.num_fat_arch = self._io.read_u4be()
        self.fat_archs = []
        for i in range(self.num_fat_arch):
            _t_fat_archs = MachOFat.FatArch(self._io, self, self._root)
            try:
                _t_fat_archs._read()
            finally:
                self.fat_archs.append(_t_fat_archs)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.fat_archs)):
            pass
            self.fat_archs[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(MachOFat, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u4be(self.num_fat_arch)
        for i in range(len(self.fat_archs)):
            pass
            self.fat_archs[i]._write__seq(self._io)



    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\xCA\xFE\xBA\xBE":
            raise kaitaistruct.ValidationNotEqualError(b"\xCA\xFE\xBA\xBE", self.magic, None, u"/seq/0")
        if len(self.fat_archs) != self.num_fat_arch:
            raise kaitaistruct.ConsistencyError(u"fat_archs", self.num_fat_arch, len(self.fat_archs))
        for i in range(len(self.fat_archs)):
            pass
            if self.fat_archs[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"fat_archs", self._root, self.fat_archs[i]._root)
            if self.fat_archs[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"fat_archs", self, self.fat_archs[i]._parent)

        self._dirty = False

    class FatArch(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachOFat.FatArch, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_object = False
            self.object__enabled = True

        def _read(self):
            self.cpu_type = KaitaiStream.resolve_enum(mach_o.MachO.CpuType, self._io.read_u4be())
            self.cpu_subtype = self._io.read_u4be()
            self.ofs_object = self._io.read_u4be()
            self.len_object = self._io.read_u4be()
            self.align = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.object
            if hasattr(self, '_m_object'):
                pass
                self._m_object._fetch_instances()



        def _write__seq(self, io=None):
            super(MachOFat.FatArch, self)._write__seq(io)
            self._should_write_object = self.object__enabled
            self._io.write_u4be(int(self.cpu_type))
            self._io.write_u4be(self.cpu_subtype)
            self._io.write_u4be(self.ofs_object)
            self._io.write_u4be(self.len_object)
            self._io.write_u4be(self.align)


        def _check(self):
            if self.object__enabled:
                pass

            self._dirty = False

        @property
        def object(self):
            if self._should_write_object:
                self._write_object()
            if hasattr(self, '_m_object'):
                return self._m_object

            if not self.object__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs_object)
            self._raw__m_object = self._io.read_bytes(self.len_object)
            _io__raw__m_object = KaitaiStream(BytesIO(self._raw__m_object))
            self._m_object = mach_o.MachO(_io__raw__m_object)
            self._m_object._read()
            self._io.seek(_pos)
            return getattr(self, '_m_object', None)

        @object.setter
        def object(self, v):
            self._dirty = True
            self._m_object = v

        def _write_object(self):
            self._should_write_object = False
            _pos = self._io.pos()
            self._io.seek(self.ofs_object)
            _io__raw__m_object = KaitaiStream(BytesIO(bytearray(self.len_object)))
            self._io.add_child_stream(_io__raw__m_object)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_object))
            def handler(parent, _io__raw__m_object=_io__raw__m_object):
                self._raw__m_object = _io__raw__m_object.to_byte_array()
                if len(self._raw__m_object) != self.len_object:
                    raise kaitaistruct.ConsistencyError(u"raw(object)", self.len_object, len(self._raw__m_object))
                parent.write_bytes(self._raw__m_object)
            _io__raw__m_object.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_object._write__seq(_io__raw__m_object)
            self._io.seek(_pos)



