# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

import dos_datetime
class Rar(KaitaiStruct):
    """RAR is a archive format used by popular proprietary RAR archiver,
    created by Eugene Roshal. There are two major versions of format
    (v1.5-4.0 and RAR v5+).
    
    File format essentially consists of a linear sequence of
    blocks. Each block has fixed header and custom body (that depends on
    block type), so it's possible to skip block even if one doesn't know
    how to process a certain block type.
    
    .. seealso::
       Source - http://acritum.com/winrar/rar-format
    """

    class BlockTypes(Enum):
        marker = 114
        archive_header = 115
        file_header = 116
        old_style_comment_header = 117
        old_style_authenticity_info_76 = 118
        old_style_subblock = 119
        old_style_recovery_record = 120
        old_style_authenticity_info_79 = 121
        subblock = 122
        terminator = 123

    class Oses(Enum):
        ms_dos = 0
        os_2 = 1
        windows = 2
        unix = 3
        mac_os = 4
        beos = 5

    class Methods(Enum):
        store = 48
        fastest = 49
        fast = 50
        normal = 51
        good = 52
        best = 53
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = Rar.MagicSignature(self._io, self, self._root)
        self.blocks = []
        i = 0
        while not self._io.is_eof():
            _on = self.magic.version
            if _on == 0:
                self.blocks.append(Rar.Block(self._io, self, self._root))
            elif _on == 1:
                self.blocks.append(Rar.BlockV5(self._io, self, self._root))
            i += 1


    class MagicSignature(KaitaiStruct):
        """RAR uses either 7-byte magic for RAR versions 1.5 to 4.0, and
        8-byte magic (and pretty different block format) for v5+. This
        type would parse and validate both versions of signature. Note
        that actually this signature is a valid RAR "block": in theory,
        one can omit signature reading at all, and read this normally,
        as a block, if exact RAR version is known (and thus it's
        possible to choose correct block format).
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic1 = self._io.read_bytes(6)
            if not self.magic1 == b"\x52\x61\x72\x21\x1A\x07":
                raise kaitaistruct.ValidationNotEqualError(b"\x52\x61\x72\x21\x1A\x07", self.magic1, self._io, u"/types/magic_signature/seq/0")
            self.version = self._io.read_u1()
            if self.version == 1:
                self.magic3 = self._io.read_bytes(1)
                if not self.magic3 == b"\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00", self.magic3, self._io, u"/types/magic_signature/seq/2")



    class Block(KaitaiStruct):
        """Basic block that RAR files consist of. There are several block
        types (see `block_type`), which have different `body` and
        `add_body`.
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.crc16 = self._io.read_u2le()
            self.block_type = KaitaiStream.resolve_enum(Rar.BlockTypes, self._io.read_u1())
            self.flags = self._io.read_u2le()
            self.block_size = self._io.read_u2le()
            if self.has_add:
                self.add_size = self._io.read_u4le()

            _on = self.block_type
            if _on == Rar.BlockTypes.file_header:
                self._raw_body = self._io.read_bytes(self.body_size)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Rar.BlockFileHeader(_io__raw_body, self, self._root)
            else:
                self.body = self._io.read_bytes(self.body_size)
            if self.has_add:
                self.add_body = self._io.read_bytes(self.add_size)


        @property
        def has_add(self):
            """True if block has additional content attached to it."""
            if hasattr(self, '_m_has_add'):
                return self._m_has_add

            self._m_has_add = (self.flags & 32768) != 0
            return getattr(self, '_m_has_add', None)

        @property
        def header_size(self):
            if hasattr(self, '_m_header_size'):
                return self._m_header_size

            self._m_header_size = (11 if self.has_add else 7)
            return getattr(self, '_m_header_size', None)

        @property
        def body_size(self):
            if hasattr(self, '_m_body_size'):
                return self._m_body_size

            self._m_body_size = (self.block_size - self.header_size)
            return getattr(self, '_m_body_size', None)


    class BlockFileHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.low_unp_size = self._io.read_u4le()
            self.host_os = KaitaiStream.resolve_enum(Rar.Oses, self._io.read_u1())
            self.file_crc32 = self._io.read_u4le()
            self._raw_file_time = self._io.read_bytes(4)
            _io__raw_file_time = KaitaiStream(BytesIO(self._raw_file_time))
            self.file_time = dos_datetime.DosDatetime(_io__raw_file_time)
            self.rar_version = self._io.read_u1()
            self.method = KaitaiStream.resolve_enum(Rar.Methods, self._io.read_u1())
            self.name_size = self._io.read_u2le()
            self.attr = self._io.read_u4le()
            if (self._parent.flags & 256) != 0:
                self.high_pack_size = self._io.read_u4le()

            self.file_name = self._io.read_bytes(self.name_size)
            if (self._parent.flags & 1024) != 0:
                self.salt = self._io.read_u8le()



    class BlockV5(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            pass



