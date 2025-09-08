# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import dos_datetime
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Rar(ReadWriteKaitaiStruct):
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

    class BlockTypes(IntEnum):
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

    class Methods(IntEnum):
        store = 48
        fastest = 49
        fast = 50
        normal = 51
        good = 52
        best = 53

    class Oses(IntEnum):
        ms_dos = 0
        os_2 = 1
        windows = 2
        unix = 3
        mac_os = 4
        beos = 5
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Rar, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = Rar.MagicSignature(self._io, self, self._root)
        self.magic._read()
        self.blocks = []
        i = 0
        while not self._io.is_eof():
            _on = self.magic.version
            if _on == 0:
                pass
                _t_blocks = Rar.Block(self._io, self, self._root)
                try:
                    _t_blocks._read()
                finally:
                    self.blocks.append(_t_blocks)
            elif _on == 1:
                pass
                _t_blocks = Rar.BlockV5(self._io, self, self._root)
                try:
                    _t_blocks._read()
                finally:
                    self.blocks.append(_t_blocks)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.magic._fetch_instances()
        for i in range(len(self.blocks)):
            pass
            _on = self.magic.version
            if _on == 0:
                pass
                self.blocks[i]._fetch_instances()
            elif _on == 1:
                pass
                self.blocks[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Rar, self)._write__seq(io)
        self.magic._write__seq(self._io)
        for i in range(len(self.blocks)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"blocks", 0, self._io.size() - self._io.pos())
            _on = self.magic.version
            if _on == 0:
                pass
                self.blocks[i]._write__seq(self._io)
            elif _on == 1:
                pass
                self.blocks[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"blocks", 0, self._io.size() - self._io.pos())


    def _check(self):
        if self.magic._root != self._root:
            raise kaitaistruct.ConsistencyError(u"magic", self._root, self.magic._root)
        if self.magic._parent != self:
            raise kaitaistruct.ConsistencyError(u"magic", self, self.magic._parent)
        for i in range(len(self.blocks)):
            pass
            _on = self.magic.version
            if _on == 0:
                pass
                if self.blocks[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"blocks", self._root, self.blocks[i]._root)
                if self.blocks[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"blocks", self, self.blocks[i]._parent)
            elif _on == 1:
                pass
                if self.blocks[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"blocks", self._root, self.blocks[i]._root)
                if self.blocks[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"blocks", self, self.blocks[i]._parent)

        self._dirty = False

    class Block(ReadWriteKaitaiStruct):
        """Basic block that RAR files consist of. There are several block
        types (see `block_type`), which have different `body` and
        `add_body`.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Rar.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.crc16 = self._io.read_u2le()
            self.block_type = KaitaiStream.resolve_enum(Rar.BlockTypes, self._io.read_u1())
            self.flags = self._io.read_u2le()
            self.block_size = self._io.read_u2le()
            if self.has_add:
                pass
                self.add_size = self._io.read_u4le()

            _on = self.block_type
            if _on == Rar.BlockTypes.file_header:
                pass
                self._raw_body = self._io.read_bytes(self.body_size)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Rar.BlockFileHeader(_io__raw_body, self, self._root)
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes(self.body_size)
            if self.has_add:
                pass
                self.add_body = self._io.read_bytes(self.add_size)

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.has_add:
                pass

            _on = self.block_type
            if _on == Rar.BlockTypes.file_header:
                pass
                self.body._fetch_instances()
            else:
                pass
            if self.has_add:
                pass



        def _write__seq(self, io=None):
            super(Rar.Block, self)._write__seq(io)
            self._io.write_u2le(self.crc16)
            self._io.write_u1(int(self.block_type))
            self._io.write_u2le(self.flags)
            self._io.write_u2le(self.block_size)
            if self.has_add:
                pass
                self._io.write_u4le(self.add_size)

            _on = self.block_type
            if _on == Rar.BlockTypes.file_header:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.body_size)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.body_size))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.body_size:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.body_size, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            else:
                pass
                self._io.write_bytes(self.body)
            if self.has_add:
                pass
                self._io.write_bytes(self.add_body)



        def _check(self):
            if self.has_add:
                pass

            _on = self.block_type
            if _on == Rar.BlockTypes.file_header:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if len(self.body) != self.body_size:
                    raise kaitaistruct.ConsistencyError(u"body", self.body_size, len(self.body))
            if self.has_add:
                pass
                if len(self.add_body) != self.add_size:
                    raise kaitaistruct.ConsistencyError(u"add_body", self.add_size, len(self.add_body))

            self._dirty = False

        @property
        def body_size(self):
            if hasattr(self, '_m_body_size'):
                return self._m_body_size

            self._m_body_size = self.block_size - self.header_size
            return getattr(self, '_m_body_size', None)

        def _invalidate_body_size(self):
            del self._m_body_size
        @property
        def has_add(self):
            """True if block has additional content attached to it."""
            if hasattr(self, '_m_has_add'):
                return self._m_has_add

            self._m_has_add = self.flags & 32768 != 0
            return getattr(self, '_m_has_add', None)

        def _invalidate_has_add(self):
            del self._m_has_add
        @property
        def header_size(self):
            if hasattr(self, '_m_header_size'):
                return self._m_header_size

            self._m_header_size = (11 if self.has_add else 7)
            return getattr(self, '_m_header_size', None)

        def _invalidate_header_size(self):
            del self._m_header_size

    class BlockFileHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Rar.BlockFileHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.low_unp_size = self._io.read_u4le()
            self.host_os = KaitaiStream.resolve_enum(Rar.Oses, self._io.read_u1())
            self.file_crc32 = self._io.read_u4le()
            self._raw_file_time = self._io.read_bytes(4)
            _io__raw_file_time = KaitaiStream(BytesIO(self._raw_file_time))
            self.file_time = dos_datetime.DosDatetime(_io__raw_file_time)
            self.file_time._read()
            self.rar_version = self._io.read_u1()
            self.method = KaitaiStream.resolve_enum(Rar.Methods, self._io.read_u1())
            self.name_size = self._io.read_u2le()
            self.attr = self._io.read_u4le()
            if self._parent.flags & 256 != 0:
                pass
                self.high_pack_size = self._io.read_u4le()

            self.file_name = self._io.read_bytes(self.name_size)
            if self._parent.flags & 1024 != 0:
                pass
                self.salt = self._io.read_u8le()

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.file_time._fetch_instances()
            if self._parent.flags & 256 != 0:
                pass

            if self._parent.flags & 1024 != 0:
                pass



        def _write__seq(self, io=None):
            super(Rar.BlockFileHeader, self)._write__seq(io)
            self._io.write_u4le(self.low_unp_size)
            self._io.write_u1(int(self.host_os))
            self._io.write_u4le(self.file_crc32)
            _io__raw_file_time = KaitaiStream(BytesIO(bytearray(4)))
            self._io.add_child_stream(_io__raw_file_time)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (4))
            def handler(parent, _io__raw_file_time=_io__raw_file_time):
                self._raw_file_time = _io__raw_file_time.to_byte_array()
                if len(self._raw_file_time) != 4:
                    raise kaitaistruct.ConsistencyError(u"raw(file_time)", 4, len(self._raw_file_time))
                parent.write_bytes(self._raw_file_time)
            _io__raw_file_time.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.file_time._write__seq(_io__raw_file_time)
            self._io.write_u1(self.rar_version)
            self._io.write_u1(int(self.method))
            self._io.write_u2le(self.name_size)
            self._io.write_u4le(self.attr)
            if self._parent.flags & 256 != 0:
                pass
                self._io.write_u4le(self.high_pack_size)

            self._io.write_bytes(self.file_name)
            if self._parent.flags & 1024 != 0:
                pass
                self._io.write_u8le(self.salt)



        def _check(self):
            if self._parent.flags & 256 != 0:
                pass

            if len(self.file_name) != self.name_size:
                raise kaitaistruct.ConsistencyError(u"file_name", self.name_size, len(self.file_name))
            if self._parent.flags & 1024 != 0:
                pass

            self._dirty = False


    class BlockV5(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Rar.BlockV5, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Rar.BlockV5, self)._write__seq(io)


        def _check(self):
            self._dirty = False


    class MagicSignature(ReadWriteKaitaiStruct):
        """RAR uses either 7-byte magic for RAR versions 1.5 to 4.0, and
        8-byte magic (and pretty different block format) for v5+. This
        type would parse and validate both versions of signature. Note
        that actually this signature is a valid RAR "block": in theory,
        one can omit signature reading at all, and read this normally,
        as a block, if exact RAR version is known (and thus it's
        possible to choose correct block format).
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Rar.MagicSignature, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic1 = self._io.read_bytes(6)
            if not self.magic1 == b"\x52\x61\x72\x21\x1A\x07":
                raise kaitaistruct.ValidationNotEqualError(b"\x52\x61\x72\x21\x1A\x07", self.magic1, self._io, u"/types/magic_signature/seq/0")
            self.version = self._io.read_u1()
            if self.version == 1:
                pass
                self.magic3 = self._io.read_bytes(1)
                if not self.magic3 == b"\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00", self.magic3, self._io, u"/types/magic_signature/seq/2")

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.version == 1:
                pass



        def _write__seq(self, io=None):
            super(Rar.MagicSignature, self)._write__seq(io)
            self._io.write_bytes(self.magic1)
            self._io.write_u1(self.version)
            if self.version == 1:
                pass
                self._io.write_bytes(self.magic3)



        def _check(self):
            if len(self.magic1) != 6:
                raise kaitaistruct.ConsistencyError(u"magic1", 6, len(self.magic1))
            if not self.magic1 == b"\x52\x61\x72\x21\x1A\x07":
                raise kaitaistruct.ValidationNotEqualError(b"\x52\x61\x72\x21\x1A\x07", self.magic1, None, u"/types/magic_signature/seq/0")
            if self.version == 1:
                pass
                if len(self.magic3) != 1:
                    raise kaitaistruct.ConsistencyError(u"magic3", 1, len(self.magic3))
                if not self.magic3 == b"\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00", self.magic3, None, u"/types/magic_signature/seq/2")

            self._dirty = False



