# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class BtrfsStream(KaitaiStruct):
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
       Source - https://btrfs.wiki.kernel.org/index.php/Design_notes_on_Send/Receive
    """

    class Command(Enum):
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

    class Attribute(Enum):
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
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = self._root.SendStreamHeader(self._io, self, self._root)
        self.commands = []
        i = 0
        while not self._io.is_eof():
            self.commands.append(self._root.SendCommand(self._io, self, self._root))
            i += 1


    class SendStreamHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(b"\x62\x74\x72\x66\x73\x2D\x73\x74\x72\x65\x61\x6D\x00")
            self.version = self._io.read_u4le()


    class SendCommand(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_data = self._io.read_u4le()
            self.type = self._root.Command(self._io.read_u2le())
            self.checksum = self._io.read_bytes(4)
            self._raw_data = self._io.read_bytes(self.len_data)
            io = KaitaiStream(BytesIO(self._raw_data))
            self.data = self._root.SendCommand.Tlvs(io, self, self._root)

        class Tlv(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.type = self._root.Attribute(self._io.read_u2le())
                self.length = self._io.read_u2le()
                _on = self.type
                if _on == self._root.Attribute.size:
                    self.value = self._io.read_u8le()
                elif _on == self._root.Attribute.otime:
                    self._raw_value = self._io.read_bytes(self.length)
                    io = KaitaiStream(BytesIO(self._raw_value))
                    self.value = self._root.SendCommand.Timespec(io, self, self._root)
                elif _on == self._root.Attribute.mode:
                    self.value = self._io.read_u8le()
                elif _on == self._root.Attribute.uuid:
                    self._raw_value = self._io.read_bytes(self.length)
                    io = KaitaiStream(BytesIO(self._raw_value))
                    self.value = self._root.SendCommand.Uuid(io, self, self._root)
                elif _on == self._root.Attribute.clone_uuid:
                    self._raw_value = self._io.read_bytes(self.length)
                    io = KaitaiStream(BytesIO(self._raw_value))
                    self.value = self._root.SendCommand.Uuid(io, self, self._root)
                elif _on == self._root.Attribute.atime:
                    self._raw_value = self._io.read_bytes(self.length)
                    io = KaitaiStream(BytesIO(self._raw_value))
                    self.value = self._root.SendCommand.Timespec(io, self, self._root)
                elif _on == self._root.Attribute.gid:
                    self.value = self._io.read_u8le()
                elif _on == self._root.Attribute.uid:
                    self.value = self._io.read_u8le()
                elif _on == self._root.Attribute.clone_ctransid:
                    self.value = self._io.read_u8le()
                elif _on == self._root.Attribute.path_to:
                    self._raw_value = self._io.read_bytes(self.length)
                    io = KaitaiStream(BytesIO(self._raw_value))
                    self.value = self._root.SendCommand.String(io, self, self._root)
                elif _on == self._root.Attribute.ctransid:
                    self.value = self._io.read_u8le()
                elif _on == self._root.Attribute.clone_len:
                    self.value = self._io.read_u8le()
                elif _on == self._root.Attribute.mtime:
                    self._raw_value = self._io.read_bytes(self.length)
                    io = KaitaiStream(BytesIO(self._raw_value))
                    self.value = self._root.SendCommand.Timespec(io, self, self._root)
                elif _on == self._root.Attribute.file_offset:
                    self.value = self._io.read_u8le()
                elif _on == self._root.Attribute.path_link:
                    self._raw_value = self._io.read_bytes(self.length)
                    io = KaitaiStream(BytesIO(self._raw_value))
                    self.value = self._root.SendCommand.String(io, self, self._root)
                elif _on == self._root.Attribute.rdev:
                    self.value = self._io.read_u8le()
                elif _on == self._root.Attribute.ctime:
                    self._raw_value = self._io.read_bytes(self.length)
                    io = KaitaiStream(BytesIO(self._raw_value))
                    self.value = self._root.SendCommand.Timespec(io, self, self._root)
                elif _on == self._root.Attribute.clone_path:
                    self._raw_value = self._io.read_bytes(self.length)
                    io = KaitaiStream(BytesIO(self._raw_value))
                    self.value = self._root.SendCommand.String(io, self, self._root)
                elif _on == self._root.Attribute.xattr_name:
                    self._raw_value = self._io.read_bytes(self.length)
                    io = KaitaiStream(BytesIO(self._raw_value))
                    self.value = self._root.SendCommand.String(io, self, self._root)
                elif _on == self._root.Attribute.path:
                    self._raw_value = self._io.read_bytes(self.length)
                    io = KaitaiStream(BytesIO(self._raw_value))
                    self.value = self._root.SendCommand.String(io, self, self._root)
                elif _on == self._root.Attribute.clone_offset:
                    self.value = self._io.read_u8le()
                else:
                    self.value = self._io.read_bytes(self.length)


        class Uuid(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.uuid = self._io.read_bytes(16)


        class Tlvs(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.tlv = []
                i = 0
                while not self._io.is_eof():
                    self.tlv.append(self._root.SendCommand.Tlv(self._io, self, self._root))
                    i += 1



        class String(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.string = (self._io.read_bytes_full()).decode(u"UTF-8")


        class Timespec(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.ts_sec = self._io.read_s8le()
                self.ts_nsec = self._io.read_s4le()




