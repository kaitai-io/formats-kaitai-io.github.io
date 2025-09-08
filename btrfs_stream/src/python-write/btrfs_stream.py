# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class BtrfsStream(ReadWriteKaitaiStruct):
    """Btrfs is a copy on write file system based on B-trees focusing on fault tolerance, repair and easy
    administration. Btrfs is intended to address the lack of pooling, snapshots, checksums, and
    integral multi-device spanning in Linux file systems.
    Given any pair of subvolumes (or snapshots), Btrfs can generate a binary diff between them by
    using the `btrfs send` command that can be replayed later by using `btrfs receive`, possibly on a
    different Btrfs file system. The `btrfs send` command creates a set of data modifications required
    for converting one subvolume into another.
    This spec can be used to disassemble the binary diff created by the `btrfs send` command.
    If you want a text representation you may want to checkout `btrfs receive --dump` instead.
    
    .. seealso::
       Source - https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.php/Design_notes_on_Send/Receive.html
    """

    class Attribute(IntEnum):
        unspec = 0
        uuid = 1
        ctransid = 2
        ino = 3
        size = 4
        mode = 5
        uid = 6
        gid = 7
        rdev = 8
        ctime = 9
        mtime = 10
        atime = 11
        otime = 12
        xattr_name = 13
        xattr_data = 14
        path = 15
        path_to = 16
        path_link = 17
        file_offset = 18
        data = 19
        clone_uuid = 20
        clone_ctransid = 21
        clone_path = 22
        clone_offset = 23
        clone_len = 24

    class Command(IntEnum):
        unspec = 0
        subvol = 1
        snapshot = 2
        mkfile = 3
        mkdir = 4
        mknod = 5
        mkfifo = 6
        mksock = 7
        symlink = 8
        rename = 9
        link = 10
        unlink = 11
        rmdir = 12
        set_xattr = 13
        remove_xattr = 14
        write = 15
        clone = 16
        truncate = 17
        chmod = 18
        chown = 19
        utimes = 20
        end = 21
        update_extent = 22
    def __init__(self, _io=None, _parent=None, _root=None):
        super(BtrfsStream, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = BtrfsStream.SendStreamHeader(self._io, self, self._root)
        self.header._read()
        self.commands = []
        i = 0
        while not self._io.is_eof():
            _t_commands = BtrfsStream.SendCommand(self._io, self, self._root)
            try:
                _t_commands._read()
            finally:
                self.commands.append(_t_commands)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        for i in range(len(self.commands)):
            pass
            self.commands[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(BtrfsStream, self)._write__seq(io)
        self.header._write__seq(self._io)
        for i in range(len(self.commands)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"commands", 0, self._io.size() - self._io.pos())
            self.commands[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"commands", 0, self._io.size() - self._io.pos())


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        for i in range(len(self.commands)):
            pass
            if self.commands[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"commands", self._root, self.commands[i]._root)
            if self.commands[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"commands", self, self.commands[i]._parent)

        self._dirty = False

    class SendCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(BtrfsStream.SendCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_data = self._io.read_u4le()
            self.type = KaitaiStream.resolve_enum(BtrfsStream.Command, self._io.read_u2le())
            self.checksum = self._io.read_bytes(4)
            self._raw_data = self._io.read_bytes(self.len_data)
            _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
            self.data = BtrfsStream.SendCommand.Tlvs(_io__raw_data, self, self._root)
            self.data._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.data._fetch_instances()


        def _write__seq(self, io=None):
            super(BtrfsStream.SendCommand, self)._write__seq(io)
            self._io.write_u4le(self.len_data)
            self._io.write_u2le(int(self.type))
            self._io.write_bytes(self.checksum)
            _io__raw_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
            self._io.add_child_stream(_io__raw_data)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_data))
            def handler(parent, _io__raw_data=_io__raw_data):
                self._raw_data = _io__raw_data.to_byte_array()
                if len(self._raw_data) != self.len_data:
                    raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw_data))
                parent.write_bytes(self._raw_data)
            _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.data._write__seq(_io__raw_data)


        def _check(self):
            if len(self.checksum) != 4:
                raise kaitaistruct.ConsistencyError(u"checksum", 4, len(self.checksum))
            if self.data._root != self._root:
                raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
            if self.data._parent != self:
                raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            self._dirty = False

        class String(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(BtrfsStream.SendCommand.String, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.string = (self._io.read_bytes_full()).decode(u"UTF-8")
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(BtrfsStream.SendCommand.String, self)._write__seq(io)
                self._io.write_bytes((self.string).encode(u"UTF-8"))
                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"string", 0, self._io.size() - self._io.pos())


            def _check(self):
                self._dirty = False


        class Timespec(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(BtrfsStream.SendCommand.Timespec, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.ts_sec = self._io.read_s8le()
                self.ts_nsec = self._io.read_s4le()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(BtrfsStream.SendCommand.Timespec, self)._write__seq(io)
                self._io.write_s8le(self.ts_sec)
                self._io.write_s4le(self.ts_nsec)


            def _check(self):
                self._dirty = False


        class Tlv(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(BtrfsStream.SendCommand.Tlv, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.type = KaitaiStream.resolve_enum(BtrfsStream.Attribute, self._io.read_u2le())
                self.length = self._io.read_u2le()
                _on = self.type
                if _on == BtrfsStream.Attribute.atime:
                    pass
                    self._raw_value = self._io.read_bytes(self.length)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = BtrfsStream.SendCommand.Timespec(_io__raw_value, self, self._root)
                    self.value._read()
                elif _on == BtrfsStream.Attribute.clone_ctransid:
                    pass
                    self.value = self._io.read_u8le()
                elif _on == BtrfsStream.Attribute.clone_len:
                    pass
                    self.value = self._io.read_u8le()
                elif _on == BtrfsStream.Attribute.clone_offset:
                    pass
                    self.value = self._io.read_u8le()
                elif _on == BtrfsStream.Attribute.clone_path:
                    pass
                    self._raw_value = self._io.read_bytes(self.length)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = BtrfsStream.SendCommand.String(_io__raw_value, self, self._root)
                    self.value._read()
                elif _on == BtrfsStream.Attribute.clone_uuid:
                    pass
                    self._raw_value = self._io.read_bytes(self.length)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = BtrfsStream.SendCommand.Uuid(_io__raw_value, self, self._root)
                    self.value._read()
                elif _on == BtrfsStream.Attribute.ctime:
                    pass
                    self._raw_value = self._io.read_bytes(self.length)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = BtrfsStream.SendCommand.Timespec(_io__raw_value, self, self._root)
                    self.value._read()
                elif _on == BtrfsStream.Attribute.ctransid:
                    pass
                    self.value = self._io.read_u8le()
                elif _on == BtrfsStream.Attribute.file_offset:
                    pass
                    self.value = self._io.read_u8le()
                elif _on == BtrfsStream.Attribute.gid:
                    pass
                    self.value = self._io.read_u8le()
                elif _on == BtrfsStream.Attribute.mode:
                    pass
                    self.value = self._io.read_u8le()
                elif _on == BtrfsStream.Attribute.mtime:
                    pass
                    self._raw_value = self._io.read_bytes(self.length)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = BtrfsStream.SendCommand.Timespec(_io__raw_value, self, self._root)
                    self.value._read()
                elif _on == BtrfsStream.Attribute.otime:
                    pass
                    self._raw_value = self._io.read_bytes(self.length)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = BtrfsStream.SendCommand.Timespec(_io__raw_value, self, self._root)
                    self.value._read()
                elif _on == BtrfsStream.Attribute.path:
                    pass
                    self._raw_value = self._io.read_bytes(self.length)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = BtrfsStream.SendCommand.String(_io__raw_value, self, self._root)
                    self.value._read()
                elif _on == BtrfsStream.Attribute.path_link:
                    pass
                    self._raw_value = self._io.read_bytes(self.length)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = BtrfsStream.SendCommand.String(_io__raw_value, self, self._root)
                    self.value._read()
                elif _on == BtrfsStream.Attribute.path_to:
                    pass
                    self._raw_value = self._io.read_bytes(self.length)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = BtrfsStream.SendCommand.String(_io__raw_value, self, self._root)
                    self.value._read()
                elif _on == BtrfsStream.Attribute.rdev:
                    pass
                    self.value = self._io.read_u8le()
                elif _on == BtrfsStream.Attribute.size:
                    pass
                    self.value = self._io.read_u8le()
                elif _on == BtrfsStream.Attribute.uid:
                    pass
                    self.value = self._io.read_u8le()
                elif _on == BtrfsStream.Attribute.uuid:
                    pass
                    self._raw_value = self._io.read_bytes(self.length)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = BtrfsStream.SendCommand.Uuid(_io__raw_value, self, self._root)
                    self.value._read()
                elif _on == BtrfsStream.Attribute.xattr_name:
                    pass
                    self._raw_value = self._io.read_bytes(self.length)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = BtrfsStream.SendCommand.String(_io__raw_value, self, self._root)
                    self.value._read()
                else:
                    pass
                    self.value = self._io.read_bytes(self.length)
                self._dirty = False


            def _fetch_instances(self):
                pass
                _on = self.type
                if _on == BtrfsStream.Attribute.atime:
                    pass
                    self.value._fetch_instances()
                elif _on == BtrfsStream.Attribute.clone_ctransid:
                    pass
                elif _on == BtrfsStream.Attribute.clone_len:
                    pass
                elif _on == BtrfsStream.Attribute.clone_offset:
                    pass
                elif _on == BtrfsStream.Attribute.clone_path:
                    pass
                    self.value._fetch_instances()
                elif _on == BtrfsStream.Attribute.clone_uuid:
                    pass
                    self.value._fetch_instances()
                elif _on == BtrfsStream.Attribute.ctime:
                    pass
                    self.value._fetch_instances()
                elif _on == BtrfsStream.Attribute.ctransid:
                    pass
                elif _on == BtrfsStream.Attribute.file_offset:
                    pass
                elif _on == BtrfsStream.Attribute.gid:
                    pass
                elif _on == BtrfsStream.Attribute.mode:
                    pass
                elif _on == BtrfsStream.Attribute.mtime:
                    pass
                    self.value._fetch_instances()
                elif _on == BtrfsStream.Attribute.otime:
                    pass
                    self.value._fetch_instances()
                elif _on == BtrfsStream.Attribute.path:
                    pass
                    self.value._fetch_instances()
                elif _on == BtrfsStream.Attribute.path_link:
                    pass
                    self.value._fetch_instances()
                elif _on == BtrfsStream.Attribute.path_to:
                    pass
                    self.value._fetch_instances()
                elif _on == BtrfsStream.Attribute.rdev:
                    pass
                elif _on == BtrfsStream.Attribute.size:
                    pass
                elif _on == BtrfsStream.Attribute.uid:
                    pass
                elif _on == BtrfsStream.Attribute.uuid:
                    pass
                    self.value._fetch_instances()
                elif _on == BtrfsStream.Attribute.xattr_name:
                    pass
                    self.value._fetch_instances()
                else:
                    pass


            def _write__seq(self, io=None):
                super(BtrfsStream.SendCommand.Tlv, self)._write__seq(io)
                self._io.write_u2le(int(self.type))
                self._io.write_u2le(self.length)
                _on = self.type
                if _on == BtrfsStream.Attribute.atime:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                elif _on == BtrfsStream.Attribute.clone_ctransid:
                    pass
                    self._io.write_u8le(self.value)
                elif _on == BtrfsStream.Attribute.clone_len:
                    pass
                    self._io.write_u8le(self.value)
                elif _on == BtrfsStream.Attribute.clone_offset:
                    pass
                    self._io.write_u8le(self.value)
                elif _on == BtrfsStream.Attribute.clone_path:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                elif _on == BtrfsStream.Attribute.clone_uuid:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                elif _on == BtrfsStream.Attribute.ctime:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                elif _on == BtrfsStream.Attribute.ctransid:
                    pass
                    self._io.write_u8le(self.value)
                elif _on == BtrfsStream.Attribute.file_offset:
                    pass
                    self._io.write_u8le(self.value)
                elif _on == BtrfsStream.Attribute.gid:
                    pass
                    self._io.write_u8le(self.value)
                elif _on == BtrfsStream.Attribute.mode:
                    pass
                    self._io.write_u8le(self.value)
                elif _on == BtrfsStream.Attribute.mtime:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                elif _on == BtrfsStream.Attribute.otime:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                elif _on == BtrfsStream.Attribute.path:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                elif _on == BtrfsStream.Attribute.path_link:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                elif _on == BtrfsStream.Attribute.path_to:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                elif _on == BtrfsStream.Attribute.rdev:
                    pass
                    self._io.write_u8le(self.value)
                elif _on == BtrfsStream.Attribute.size:
                    pass
                    self._io.write_u8le(self.value)
                elif _on == BtrfsStream.Attribute.uid:
                    pass
                    self._io.write_u8le(self.value)
                elif _on == BtrfsStream.Attribute.uuid:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                elif _on == BtrfsStream.Attribute.xattr_name:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                else:
                    pass
                    self._io.write_bytes(self.value)


            def _check(self):
                _on = self.type
                if _on == BtrfsStream.Attribute.atime:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == BtrfsStream.Attribute.clone_ctransid:
                    pass
                elif _on == BtrfsStream.Attribute.clone_len:
                    pass
                elif _on == BtrfsStream.Attribute.clone_offset:
                    pass
                elif _on == BtrfsStream.Attribute.clone_path:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == BtrfsStream.Attribute.clone_uuid:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == BtrfsStream.Attribute.ctime:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == BtrfsStream.Attribute.ctransid:
                    pass
                elif _on == BtrfsStream.Attribute.file_offset:
                    pass
                elif _on == BtrfsStream.Attribute.gid:
                    pass
                elif _on == BtrfsStream.Attribute.mode:
                    pass
                elif _on == BtrfsStream.Attribute.mtime:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == BtrfsStream.Attribute.otime:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == BtrfsStream.Attribute.path:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == BtrfsStream.Attribute.path_link:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == BtrfsStream.Attribute.path_to:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == BtrfsStream.Attribute.rdev:
                    pass
                elif _on == BtrfsStream.Attribute.size:
                    pass
                elif _on == BtrfsStream.Attribute.uid:
                    pass
                elif _on == BtrfsStream.Attribute.uuid:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == BtrfsStream.Attribute.xattr_name:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                else:
                    pass
                    if len(self.value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"value", self.length, len(self.value))
                self._dirty = False


        class Tlvs(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(BtrfsStream.SendCommand.Tlvs, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.tlv = []
                i = 0
                while not self._io.is_eof():
                    _t_tlv = BtrfsStream.SendCommand.Tlv(self._io, self, self._root)
                    try:
                        _t_tlv._read()
                    finally:
                        self.tlv.append(_t_tlv)
                    i += 1

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.tlv)):
                    pass
                    self.tlv[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(BtrfsStream.SendCommand.Tlvs, self)._write__seq(io)
                for i in range(len(self.tlv)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"tlv", 0, self._io.size() - self._io.pos())
                    self.tlv[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"tlv", 0, self._io.size() - self._io.pos())


            def _check(self):
                for i in range(len(self.tlv)):
                    pass
                    if self.tlv[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"tlv", self._root, self.tlv[i]._root)
                    if self.tlv[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"tlv", self, self.tlv[i]._parent)

                self._dirty = False


        class Uuid(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(BtrfsStream.SendCommand.Uuid, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.uuid = self._io.read_bytes(16)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(BtrfsStream.SendCommand.Uuid, self)._write__seq(io)
                self._io.write_bytes(self.uuid)


            def _check(self):
                if len(self.uuid) != 16:
                    raise kaitaistruct.ConsistencyError(u"uuid", 16, len(self.uuid))
                self._dirty = False



    class SendStreamHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(BtrfsStream.SendStreamHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(13)
            if not self.magic == b"\x62\x74\x72\x66\x73\x2D\x73\x74\x72\x65\x61\x6D\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x62\x74\x72\x66\x73\x2D\x73\x74\x72\x65\x61\x6D\x00", self.magic, self._io, u"/types/send_stream_header/seq/0")
            self.version = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(BtrfsStream.SendStreamHeader, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4le(self.version)


        def _check(self):
            if len(self.magic) != 13:
                raise kaitaistruct.ConsistencyError(u"magic", 13, len(self.magic))
            if not self.magic == b"\x62\x74\x72\x66\x73\x2D\x73\x74\x72\x65\x61\x6D\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x62\x74\x72\x66\x73\x2D\x73\x74\x72\x65\x61\x6D\x00", self.magic, None, u"/types/send_stream_header/seq/0")
            self._dirty = False



