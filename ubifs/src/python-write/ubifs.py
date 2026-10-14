# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Ubifs(ReadWriteKaitaiStruct):
    """UBIFS is a file system for raw flash memory devices. It works on top of
    UBI (Unsorted Block Images), which works as an abstraction layer so UBIFS
    does not need to care about low level details. This specification only covers
    UBIFS, not UBI.
    
    A UBIFS image is divided into several Logical Erase Blocks (LEB). The first
    LEB (LEB0) contains the superblock node, which includes information about LEB
    size, amongst others. The next two LEBs (LEB1 and LEB2) comprise the so called
    "master area" and both contain a copy of the master node, which includes
    information about where to find the root index node, which is then used to
    access all the files on the file system.
    
    **Limitations of this Kaitai Struct implementation:**
    
    1. It only supports UBIFS images created by `mkfs.ubifs` (such as those in
       firmware images built by OpenWrt), not file systems modified after
       creation, e.g. by writing files to them on a running Linux system. The
       Linux kernel appends a new copy of the master node to LEB1 and LEB2
       whenever it mounts the file system read-write, unmounts it, or commits
       changes (updates the index on flash to include them). When mounting, Linux
       uses the
       [last copy](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L84-L165),
       whereas this implementation reads the first one (`master_1`), which still
       describes the file system as it was created. Changes made since then are
       therefore not visible via `index_root`.
    2. Changes that have not been committed yet are not in the index at all, so
       they are not visible via `index_root` either. Until they are committed,
       UBIFS keeps them only in the journal. This only matters for file systems
       that were not unmounted cleanly, because unmounting
       [commits](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/super.c#L486-L493)
       all changes.
    3. Parsing doesn't advance the stream position. This implementation reads
       the image only through instances, so that parsing doesn't copy the
       whole image into memory. To find where the image ends, e.g. when
       carving it out of a larger file, use `len_image`. For the same reason,
       parsing doesn't fail if the image is truncated. To detect that, check
       that the stream is at least `len_image` bytes long
       (`_io.size >= len_image`).
    
    .. seealso::
       Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h
    
    
    .. seealso::
       Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h
    
    
    .. seealso::
       Source - http://www.linux-mtd.infradead.org/doc/ubifs.pdf
    """

    class Compression(IntEnum):
        no_compression = 0
        lzo = 1
        zlib = 2
        zstd = 3

    class HashAlgos(IntEnum):
        md4 = 0
        md5 = 1
        sha1 = 2
        ripe_md_160 = 3
        sha256 = 4
        sha384 = 5
        sha512 = 6
        sha224 = 7
        ripe_md_128 = 8
        ripe_md_256 = 9
        ripe_md_320 = 10
        wp_256 = 11
        wp_384 = 12
        wp_512 = 13
        tgr_128 = 14
        tgr_160 = 15
        tgr_192 = 16
        sm3_256 = 17
        streebog_256 = 18
        streebog_512 = 19
        sha3_256 = 20
        sha3_384 = 21
        sha3_512 = 22

    class Hashes(IntEnum):
        r5 = 0
        test_hash = 1

    class InodeTypes(IntEnum):
        regular = 0
        directory = 1
        link = 2
        block_device = 3
        character_device = 4
        fifo = 5
        socket = 6

    class KeyFormats(IntEnum):
        simple = 0

    class KeyTypes(IntEnum):
        inode = 0
        data = 1
        directory = 2
        extended_attribute = 3

    class NodeGroupTypes(IntEnum):
        no_node_group = 0
        in_node_group = 1
        last_of_node_group = 2

    class NodeTypes(IntEnum):
        inode = 0
        data = 1
        directory = 2
        extended_attribute = 3
        truncation = 4
        padding = 5
        superblock = 6
        master = 7
        reference = 8
        index = 9
        commit_start = 10
        orphan = 11
        authentication = 12
        signature = 13
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Ubifs, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_index = False
        self.index__enabled = True
        self._should_write_index_root = False
        self.index_root__enabled = True
        self._should_write_lebs = False
        self.lebs__enabled = True
        self._should_write_master_1 = False
        self.master_1__enabled = True
        self._should_write_master_2 = False
        self.master_2__enabled = True
        self._should_write_superblock = False
        self.superblock__enabled = True

    def _read(self):
        pass
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.index
        if hasattr(self, '_m_index'):
            pass
            self._m_index._fetch_instances()

        _ = self.index_root
        if hasattr(self, '_m_index_root'):
            pass
            self._m_index_root._fetch_instances()

        _ = self.lebs
        if hasattr(self, '_m_lebs'):
            pass
            for i in range(len(self._m_lebs)):
                pass


        _ = self.master_1
        if hasattr(self, '_m_master_1'):
            pass
            self._m_master_1._fetch_instances()

        _ = self.master_2
        if hasattr(self, '_m_master_2'):
            pass
            self._m_master_2._fetch_instances()

        _ = self.superblock
        if hasattr(self, '_m_superblock'):
            pass
            self._m_superblock._fetch_instances()



    def _write__seq(self, io=None):
        super(Ubifs, self)._write__seq(io)
        self._should_write_index = self.index__enabled
        self._should_write_index_root = self.index_root__enabled
        self._should_write_lebs = self.lebs__enabled
        self._should_write_master_1 = self.master_1__enabled
        self._should_write_master_2 = self.master_2__enabled
        self._should_write_superblock = self.superblock__enabled


    def _check(self):
        if self.index__enabled:
            pass
            if self._m_index._root != self._root:
                raise kaitaistruct.ConsistencyError(u"index", self._root, self._m_index._root)
            if self._m_index._parent != self:
                raise kaitaistruct.ConsistencyError(u"index", self, self._m_index._parent)

        if self.index_root__enabled:
            pass
            if self._m_index_root._root != self._root:
                raise kaitaistruct.ConsistencyError(u"index_root", self._root, self._m_index_root._root)
            if self._m_index_root._parent != self:
                raise kaitaistruct.ConsistencyError(u"index_root", self, self._m_index_root._parent)

        if self.lebs__enabled:
            pass
            for i in range(len(self._m_lebs)):
                pass


        if self.master_1__enabled:
            pass
            if self._m_master_1._root != self._root:
                raise kaitaistruct.ConsistencyError(u"master_1", self._root, self._m_master_1._root)
            if self._m_master_1._parent != self:
                raise kaitaistruct.ConsistencyError(u"master_1", self, self._m_master_1._parent)

        if self.master_2__enabled:
            pass
            if self._m_master_2._root != self._root:
                raise kaitaistruct.ConsistencyError(u"master_2", self._root, self._m_master_2._root)
            if self._m_master_2._parent != self:
                raise kaitaistruct.ConsistencyError(u"master_2", self, self._m_master_2._parent)

        if self.superblock__enabled:
            pass
            if self._m_superblock._root != self._root:
                raise kaitaistruct.ConsistencyError(u"superblock", self._root, self._m_superblock._root)
            if self._m_superblock._parent != self:
                raise kaitaistruct.ConsistencyError(u"superblock", self, self._m_superblock._parent)

        self._dirty = False

    class AuthenticationHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L774-L782
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.AuthenticationHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.hmac = self._io.read_bytes(self._root.superblock.node_header.len_hash)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ubifs.AuthenticationHeader, self)._write__seq(io)
            self._io.write_bytes(self.hmac)


        def _check(self):
            if len(self.hmac) != self._root.superblock.node_header.len_hash:
                raise kaitaistruct.ConsistencyError(u"hmac", self._root.superblock.node_header.len_hash, len(self.hmac))
            self._dirty = False


    class Block(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header = Ubifs.CommonHeader(self._io, self, self._root)
            self.header._read()
            _on = self.header.node_type
            if _on == Ubifs.NodeTypes.authentication:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.AuthenticationHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            elif _on == Ubifs.NodeTypes.commit_start:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.CommitStartHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            elif _on == Ubifs.NodeTypes.data:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.DataHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            elif _on == Ubifs.NodeTypes.directory:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.DirectoryHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            elif _on == Ubifs.NodeTypes.extended_attribute:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.DirectoryHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            elif _on == Ubifs.NodeTypes.index:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.IndexHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            elif _on == Ubifs.NodeTypes.inode:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.InodeHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            elif _on == Ubifs.NodeTypes.master:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.MasterHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            elif _on == Ubifs.NodeTypes.orphan:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.OrphanHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            elif _on == Ubifs.NodeTypes.padding:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.PaddingHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            elif _on == Ubifs.NodeTypes.reference:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.ReferenceHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            elif _on == Ubifs.NodeTypes.signature:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.SignatureHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            elif _on == Ubifs.NodeTypes.superblock:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.SuperblockHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            elif _on == Ubifs.NodeTypes.truncation:
                pass
                self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
                _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
                self.node_header = Ubifs.TruncationHeader(_io__raw_node_header, self, self._root)
                self.node_header._read()
            else:
                pass
                self.node_header = self._io.read_bytes(self.header.len_full_node - 24)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            _on = self.header.node_type
            if _on == Ubifs.NodeTypes.authentication:
                pass
                self.node_header._fetch_instances()
            elif _on == Ubifs.NodeTypes.commit_start:
                pass
                self.node_header._fetch_instances()
            elif _on == Ubifs.NodeTypes.data:
                pass
                self.node_header._fetch_instances()
            elif _on == Ubifs.NodeTypes.directory:
                pass
                self.node_header._fetch_instances()
            elif _on == Ubifs.NodeTypes.extended_attribute:
                pass
                self.node_header._fetch_instances()
            elif _on == Ubifs.NodeTypes.index:
                pass
                self.node_header._fetch_instances()
            elif _on == Ubifs.NodeTypes.inode:
                pass
                self.node_header._fetch_instances()
            elif _on == Ubifs.NodeTypes.master:
                pass
                self.node_header._fetch_instances()
            elif _on == Ubifs.NodeTypes.orphan:
                pass
                self.node_header._fetch_instances()
            elif _on == Ubifs.NodeTypes.padding:
                pass
                self.node_header._fetch_instances()
            elif _on == Ubifs.NodeTypes.reference:
                pass
                self.node_header._fetch_instances()
            elif _on == Ubifs.NodeTypes.signature:
                pass
                self.node_header._fetch_instances()
            elif _on == Ubifs.NodeTypes.superblock:
                pass
                self.node_header._fetch_instances()
            elif _on == Ubifs.NodeTypes.truncation:
                pass
                self.node_header._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(Ubifs.Block, self)._write__seq(io)
            self.header._write__seq(self._io)
            _on = self.header.node_type
            if _on == Ubifs.NodeTypes.authentication:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            elif _on == Ubifs.NodeTypes.commit_start:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            elif _on == Ubifs.NodeTypes.data:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            elif _on == Ubifs.NodeTypes.directory:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            elif _on == Ubifs.NodeTypes.extended_attribute:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            elif _on == Ubifs.NodeTypes.index:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            elif _on == Ubifs.NodeTypes.inode:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            elif _on == Ubifs.NodeTypes.master:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            elif _on == Ubifs.NodeTypes.orphan:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            elif _on == Ubifs.NodeTypes.padding:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            elif _on == Ubifs.NodeTypes.reference:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            elif _on == Ubifs.NodeTypes.signature:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            elif _on == Ubifs.NodeTypes.superblock:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            elif _on == Ubifs.NodeTypes.truncation:
                pass
                _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
                self._io.add_child_stream(_io__raw_node_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
                def handler(parent, _io__raw_node_header=_io__raw_node_header):
                    self._raw_node_header = _io__raw_node_header.to_byte_array()
                    if len(self._raw_node_header) != self.header.len_full_node - 24:
                        raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                    parent.write_bytes(self._raw_node_header)
                _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.node_header._write__seq(_io__raw_node_header)
            else:
                pass
                self._io.write_bytes(self.node_header)


        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            _on = self.header.node_type
            if _on == Ubifs.NodeTypes.authentication:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            elif _on == Ubifs.NodeTypes.commit_start:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            elif _on == Ubifs.NodeTypes.data:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            elif _on == Ubifs.NodeTypes.directory:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            elif _on == Ubifs.NodeTypes.extended_attribute:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            elif _on == Ubifs.NodeTypes.index:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            elif _on == Ubifs.NodeTypes.inode:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            elif _on == Ubifs.NodeTypes.master:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            elif _on == Ubifs.NodeTypes.orphan:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            elif _on == Ubifs.NodeTypes.padding:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            elif _on == Ubifs.NodeTypes.reference:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            elif _on == Ubifs.NodeTypes.signature:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            elif _on == Ubifs.NodeTypes.superblock:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            elif _on == Ubifs.NodeTypes.truncation:
                pass
                if self.node_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
                if self.node_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            else:
                pass
                if len(self.node_header) != self.header.len_full_node - 24:
                    raise kaitaistruct.ConsistencyError(u"node_header", self.header.len_full_node - 24, len(self.node_header))
            self._dirty = False


    class Branch(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L801-L817
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.Branch, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_target = False
            self.target__enabled = True

        def _read(self):
            self.target_leb = self._io.read_u4le()
            self.ofs_target = self._io.read_u4le()
            self.len_target = self._io.read_u4le()
            self._raw_key = self._io.read_bytes(8)
            _io__raw_key = KaitaiStream(BytesIO(self._raw_key))
            self.key = Ubifs.Key(_io__raw_key, self, self._root)
            self.key._read()
            self.hash = self._io.read_bytes(self._root.superblock.node_header.len_hash)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.key._fetch_instances()
            _ = self.target
            if hasattr(self, '_m_target'):
                pass
                self._m_target._fetch_instances()



        def _write__seq(self, io=None):
            super(Ubifs.Branch, self)._write__seq(io)
            self._should_write_target = self.target__enabled
            self._io.write_u4le(self.target_leb)
            self._io.write_u4le(self.ofs_target)
            self._io.write_u4le(self.len_target)
            _io__raw_key = KaitaiStream(BytesIO(bytearray(8)))
            self._io.add_child_stream(_io__raw_key)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (8))
            def handler(parent, _io__raw_key=_io__raw_key):
                self._raw_key = _io__raw_key.to_byte_array()
                if len(self._raw_key) != 8:
                    raise kaitaistruct.ConsistencyError(u"raw(key)", 8, len(self._raw_key))
                parent.write_bytes(self._raw_key)
            _io__raw_key.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.key._write__seq(_io__raw_key)
            self._io.write_bytes(self.hash)


        def _check(self):
            if self.key._root != self._root:
                raise kaitaistruct.ConsistencyError(u"key", self._root, self.key._root)
            if self.key._parent != self:
                raise kaitaistruct.ConsistencyError(u"key", self, self.key._parent)
            if len(self.hash) != self._root.superblock.node_header.len_hash:
                raise kaitaistruct.ConsistencyError(u"hash", self._root.superblock.node_header.len_hash, len(self.hash))
            if self.target__enabled:
                pass
                if self._m_target._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"target", self._root, self._m_target._root)
                if self._m_target._parent != self:
                    raise kaitaistruct.ConsistencyError(u"target", self, self._m_target._parent)
                _ = self._m_target
                if not  ((_.header.len_full_node == self.len_target) and ((_.header.node_type == Ubifs.NodeTypes.index if self._parent.level != 0 else int(_.header.node_type) == int(self.key.type)))) :
                    raise kaitaistruct.ValidationExprError(self._m_target, None, u"/types/branch/instances/target")

            self._dirty = False

        @property
        def target(self):
            if self._should_write_target:
                self._write_target()
            if hasattr(self, '_m_target'):
                return self._m_target

            if not self.target__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self._root.superblock.node_header.leb_size * self.target_leb + self.ofs_target)
            self._raw__m_target = io.read_bytes(self.len_target)
            _io__raw__m_target = KaitaiStream(BytesIO(self._raw__m_target))
            self._m_target = Ubifs.Block(_io__raw__m_target, self, self._root)
            self._m_target._read()
            _ = self._m_target
            if not  ((_.header.len_full_node == self.len_target) and ((_.header.node_type == Ubifs.NodeTypes.index if self._parent.level != 0 else int(_.header.node_type) == int(self.key.type)))) :
                raise kaitaistruct.ValidationExprError(self._m_target, self._io, u"/types/branch/instances/target")
            io.seek(_pos)
            return getattr(self, '_m_target', None)

        @target.setter
        def target(self, v):
            self._dirty = True
            self._m_target = v

        def _write_target(self):
            self._should_write_target = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self._root.superblock.node_header.leb_size * self.target_leb + self.ofs_target)
            _io__raw__m_target = KaitaiStream(BytesIO(bytearray(self.len_target)))
            io.add_child_stream(_io__raw__m_target)
            _pos2 = io.pos()
            io.seek(io.pos() + (self.len_target))
            def handler(parent, _io__raw__m_target=_io__raw__m_target):
                self._raw__m_target = _io__raw__m_target.to_byte_array()
                if len(self._raw__m_target) != self.len_target:
                    raise kaitaistruct.ConsistencyError(u"raw(target)", self.len_target, len(self._raw__m_target))
                parent.write_bytes(self._raw__m_target)
            _io__raw__m_target.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_target._write__seq(_io__raw__m_target)
            io.seek(_pos)


    class CommitStartHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L833-L841
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.CommitStartHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.commit_number = self._io.read_u8le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ubifs.CommitStartHeader, self)._write__seq(io)
            self._io.write_u8le(self.commit_number)


        def _check(self):
            self._dirty = False


    class CommonHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L443-L464
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.CommonHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_u4le()
            if not self.magic == 101718065:
                raise kaitaistruct.ValidationNotEqualError(101718065, self.magic, self._io, u"/types/common_header/seq/0")
            self.crc = self._io.read_u4le()
            self.sequence_number = self._io.read_u8le()
            self.len_full_node = self._io.read_u4le()
            self.node_type = KaitaiStream.resolve_enum(Ubifs.NodeTypes, self._io.read_u1())
            self.group_type = KaitaiStream.resolve_enum(Ubifs.NodeGroupTypes, self._io.read_u1())
            self.padding = self._io.read_bytes(2)
            if not self.padding == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.padding, self._io, u"/types/common_header/seq/6")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ubifs.CommonHeader, self)._write__seq(io)
            self._io.write_u4le(self.magic)
            self._io.write_u4le(self.crc)
            self._io.write_u8le(self.sequence_number)
            self._io.write_u4le(self.len_full_node)
            self._io.write_u1(int(self.node_type))
            self._io.write_u1(int(self.group_type))
            self._io.write_bytes(self.padding)


        def _check(self):
            if not self.magic == 101718065:
                raise kaitaistruct.ValidationNotEqualError(101718065, self.magic, None, u"/types/common_header/seq/0")
            if len(self.padding) != 2:
                raise kaitaistruct.ConsistencyError(u"padding", 2, len(self.padding))
            if not self.padding == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.padding, None, u"/types/common_header/seq/6")
            self._dirty = False


    class DataHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L567-L584
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.DataHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._raw_key = self._io.read_bytes(16)
            _io__raw_key = KaitaiStream(BytesIO(self._raw_key))
            self.key = Ubifs.Key(_io__raw_key, self, self._root)
            self.key._read()
            self.len_uncompressed = self._io.read_u4le()
            if not self.len_uncompressed >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.len_uncompressed, self._io, u"/types/data_header/seq/1")
            if not self.len_uncompressed <= 4096:
                raise kaitaistruct.ValidationGreaterThanError(4096, self.len_uncompressed, self._io, u"/types/data_header/seq/1")
            self.compression = KaitaiStream.resolve_enum(Ubifs.Compression, self._io.read_u2le())
            if not isinstance(self.compression, Ubifs.Compression):
                raise kaitaistruct.ValidationNotInEnumError(self.compression, self._io, u"/types/data_header/seq/2")
            self.len_compressed_data = self._io.read_u2le()
            self.data = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.key._fetch_instances()


        def _write__seq(self, io=None):
            super(Ubifs.DataHeader, self)._write__seq(io)
            _io__raw_key = KaitaiStream(BytesIO(bytearray(16)))
            self._io.add_child_stream(_io__raw_key)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (16))
            def handler(parent, _io__raw_key=_io__raw_key):
                self._raw_key = _io__raw_key.to_byte_array()
                if len(self._raw_key) != 16:
                    raise kaitaistruct.ConsistencyError(u"raw(key)", 16, len(self._raw_key))
                parent.write_bytes(self._raw_key)
            _io__raw_key.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.key._write__seq(_io__raw_key)
            self._io.write_u4le(self.len_uncompressed)
            self._io.write_u2le(int(self.compression))
            self._io.write_u2le(self.len_compressed_data)
            self._io.write_bytes(self.data)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


        def _check(self):
            if self.key._root != self._root:
                raise kaitaistruct.ConsistencyError(u"key", self._root, self.key._root)
            if self.key._parent != self:
                raise kaitaistruct.ConsistencyError(u"key", self, self.key._parent)
            if not self.len_uncompressed >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.len_uncompressed, None, u"/types/data_header/seq/1")
            if not self.len_uncompressed <= 4096:
                raise kaitaistruct.ValidationGreaterThanError(4096, self.len_uncompressed, None, u"/types/data_header/seq/1")
            if not isinstance(self.compression, Ubifs.Compression):
                raise kaitaistruct.ValidationNotInEnumError(self.compression, None, u"/types/data_header/seq/2")
            self._dirty = False


    class DirectoryHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L541-L565
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.DirectoryHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._raw_key = self._io.read_bytes(16)
            _io__raw_key = KaitaiStream(BytesIO(self._raw_key))
            self.key = Ubifs.Key(_io__raw_key, self, self._root)
            self.key._read()
            _ = self.key
            if not  ((_.type == Ubifs.KeyTypes.directory) or (_.type == Ubifs.KeyTypes.extended_attribute)) :
                raise kaitaistruct.ValidationExprError(self.key, self._io, u"/types/directory_header/seq/0")
            self.inode_number = self._io.read_u8le()
            if not self.inode_number <= 4294967295:
                raise kaitaistruct.ValidationGreaterThanError(4294967295, self.inode_number, self._io, u"/types/directory_header/seq/1")
            self.padding1 = self._io.read_bytes(1)
            if not self.padding1 == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.padding1, self._io, u"/types/directory_header/seq/2")
            self.inode_type = KaitaiStream.resolve_enum(Ubifs.InodeTypes, self._io.read_u1())
            if not isinstance(self.inode_type, Ubifs.InodeTypes):
                raise kaitaistruct.ValidationNotInEnumError(self.inode_type, self._io, u"/types/directory_header/seq/3")
            self.len_name = self._io.read_u2le()
            self.cookie = self._io.read_u4le()
            self.name = self._io.read_bytes(self.len_name)
            self.name_terminator = self._io.read_bytes(1)
            if not self.name_terminator == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.name_terminator, self._io, u"/types/directory_header/seq/7")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.key._fetch_instances()


        def _write__seq(self, io=None):
            super(Ubifs.DirectoryHeader, self)._write__seq(io)
            _io__raw_key = KaitaiStream(BytesIO(bytearray(16)))
            self._io.add_child_stream(_io__raw_key)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (16))
            def handler(parent, _io__raw_key=_io__raw_key):
                self._raw_key = _io__raw_key.to_byte_array()
                if len(self._raw_key) != 16:
                    raise kaitaistruct.ConsistencyError(u"raw(key)", 16, len(self._raw_key))
                parent.write_bytes(self._raw_key)
            _io__raw_key.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.key._write__seq(_io__raw_key)
            self._io.write_u8le(self.inode_number)
            self._io.write_bytes(self.padding1)
            self._io.write_u1(int(self.inode_type))
            self._io.write_u2le(self.len_name)
            self._io.write_u4le(self.cookie)
            self._io.write_bytes(self.name)
            self._io.write_bytes(self.name_terminator)


        def _check(self):
            if self.key._root != self._root:
                raise kaitaistruct.ConsistencyError(u"key", self._root, self.key._root)
            if self.key._parent != self:
                raise kaitaistruct.ConsistencyError(u"key", self, self.key._parent)
            _ = self.key
            if not  ((_.type == Ubifs.KeyTypes.directory) or (_.type == Ubifs.KeyTypes.extended_attribute)) :
                raise kaitaistruct.ValidationExprError(self.key, None, u"/types/directory_header/seq/0")
            if not self.inode_number <= 4294967295:
                raise kaitaistruct.ValidationGreaterThanError(4294967295, self.inode_number, None, u"/types/directory_header/seq/1")
            if len(self.padding1) != 1:
                raise kaitaistruct.ConsistencyError(u"padding1", 1, len(self.padding1))
            if not self.padding1 == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.padding1, None, u"/types/directory_header/seq/2")
            if not isinstance(self.inode_type, Ubifs.InodeTypes):
                raise kaitaistruct.ValidationNotInEnumError(self.inode_type, None, u"/types/directory_header/seq/3")
            if len(self.name) != self.len_name:
                raise kaitaistruct.ConsistencyError(u"name", self.len_name, len(self.name))
            if len(self.name_terminator) != 1:
                raise kaitaistruct.ConsistencyError(u"name_terminator", 1, len(self.name_terminator))
            if not self.name_terminator == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.name_terminator, None, u"/types/directory_header/seq/7")
            self._dirty = False


    class Dummy(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.Dummy, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ubifs.Dummy, self)._write__seq(io)


        def _check(self):
            self._dirty = False


    class IndexBlock(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.IndexBlock, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header = Ubifs.CommonHeader(self._io, self, self._root)
            self.header._read()
            _ = self.header
            if not _.node_type == Ubifs.NodeTypes.index:
                raise kaitaistruct.ValidationExprError(self.header, self._io, u"/types/index_block/seq/0")
            self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
            _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
            self.node_header = Ubifs.IndexHeader(_io__raw_node_header, self, self._root)
            self.node_header._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            self.node_header._fetch_instances()


        def _write__seq(self, io=None):
            super(Ubifs.IndexBlock, self)._write__seq(io)
            self.header._write__seq(self._io)
            _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
            self._io.add_child_stream(_io__raw_node_header)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
            def handler(parent, _io__raw_node_header=_io__raw_node_header):
                self._raw_node_header = _io__raw_node_header.to_byte_array()
                if len(self._raw_node_header) != self.header.len_full_node - 24:
                    raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                parent.write_bytes(self._raw_node_header)
            _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.node_header._write__seq(_io__raw_node_header)


        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            _ = self.header
            if not _.node_type == Ubifs.NodeTypes.index:
                raise kaitaistruct.ValidationExprError(self.header, None, u"/types/index_block/seq/0")
            if self.node_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
            if self.node_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            self._dirty = False


    class IndexHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L819-L831
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.IndexHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_branches = self._io.read_u2le()
            self.level = self._io.read_u2le()
            self.branches = []
            for i in range(self.num_branches):
                _t_branches = Ubifs.Branch(self._io, self, self._root)
                try:
                    _t_branches._read()
                finally:
                    self.branches.append(_t_branches)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.branches)):
                pass
                self.branches[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Ubifs.IndexHeader, self)._write__seq(io)
            self._io.write_u2le(self.num_branches)
            self._io.write_u2le(self.level)
            for i in range(len(self.branches)):
                pass
                self.branches[i]._write__seq(self._io)



        def _check(self):
            if len(self.branches) != self.num_branches:
                raise kaitaistruct.ConsistencyError(u"branches", self.num_branches, len(self.branches))
            for i in range(len(self.branches)):
                pass
                if self.branches[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"branches", self._root, self.branches[i]._root)
                if self.branches[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"branches", self, self.branches[i]._parent)

            self._dirty = False


    class InodeHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L480-L539
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.InodeHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._raw_key = self._io.read_bytes(16)
            _io__raw_key = KaitaiStream(BytesIO(self._raw_key))
            self.key = Ubifs.Key(_io__raw_key, self, self._root)
            self.key._read()
            self.creation_sequence_number = self._io.read_u8le()
            self.len_uncompressed = self._io.read_u8le()
            self.atime_sec = self._io.read_u8le()
            self.ctime_sec = self._io.read_u8le()
            self.mtime_sec = self._io.read_u8le()
            self.atime_nsec = self._io.read_u4le()
            self.ctime_nsec = self._io.read_u4le()
            self.mtime_nsec = self._io.read_u4le()
            self.num_links = self._io.read_u4le()
            self.uid = self._io.read_u4le()
            self.gid = self._io.read_u4le()
            self.mode = self._io.read_u4le()
            self.flags = self._io.read_u4le()
            self.len_data = self._io.read_u4le()
            self.num_xattrs = self._io.read_u4le()
            self.xattr_size = self._io.read_u4le()
            self.padding1 = self._io.read_bytes(4)
            if not self.padding1 == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.padding1, self._io, u"/types/inode_header/seq/17")
            self.xattr_names = self._io.read_u4le()
            self.compression = KaitaiStream.resolve_enum(Ubifs.Compression, self._io.read_u2le())
            if not isinstance(self.compression, Ubifs.Compression):
                raise kaitaistruct.ValidationNotInEnumError(self.compression, self._io, u"/types/inode_header/seq/19")
            self.padding2 = self._io.read_bytes(26)
            self.data = self._io.read_bytes(self.len_data)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.key._fetch_instances()


        def _write__seq(self, io=None):
            super(Ubifs.InodeHeader, self)._write__seq(io)
            _io__raw_key = KaitaiStream(BytesIO(bytearray(16)))
            self._io.add_child_stream(_io__raw_key)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (16))
            def handler(parent, _io__raw_key=_io__raw_key):
                self._raw_key = _io__raw_key.to_byte_array()
                if len(self._raw_key) != 16:
                    raise kaitaistruct.ConsistencyError(u"raw(key)", 16, len(self._raw_key))
                parent.write_bytes(self._raw_key)
            _io__raw_key.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.key._write__seq(_io__raw_key)
            self._io.write_u8le(self.creation_sequence_number)
            self._io.write_u8le(self.len_uncompressed)
            self._io.write_u8le(self.atime_sec)
            self._io.write_u8le(self.ctime_sec)
            self._io.write_u8le(self.mtime_sec)
            self._io.write_u4le(self.atime_nsec)
            self._io.write_u4le(self.ctime_nsec)
            self._io.write_u4le(self.mtime_nsec)
            self._io.write_u4le(self.num_links)
            self._io.write_u4le(self.uid)
            self._io.write_u4le(self.gid)
            self._io.write_u4le(self.mode)
            self._io.write_u4le(self.flags)
            self._io.write_u4le(self.len_data)
            self._io.write_u4le(self.num_xattrs)
            self._io.write_u4le(self.xattr_size)
            self._io.write_bytes(self.padding1)
            self._io.write_u4le(self.xattr_names)
            self._io.write_u2le(int(self.compression))
            self._io.write_bytes(self.padding2)
            self._io.write_bytes(self.data)


        def _check(self):
            if self.key._root != self._root:
                raise kaitaistruct.ConsistencyError(u"key", self._root, self.key._root)
            if self.key._parent != self:
                raise kaitaistruct.ConsistencyError(u"key", self, self.key._parent)
            if len(self.padding1) != 4:
                raise kaitaistruct.ConsistencyError(u"padding1", 4, len(self.padding1))
            if not self.padding1 == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.padding1, None, u"/types/inode_header/seq/17")
            if not isinstance(self.compression, Ubifs.Compression):
                raise kaitaistruct.ValidationNotInEnumError(self.compression, None, u"/types/inode_header/seq/19")
            if len(self.padding2) != 26:
                raise kaitaistruct.ConsistencyError(u"padding2", 26, len(self.padding2))
            if len(self.data) != self.len_data:
                raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self.data))
            self._dirty = False

        @property
        def append(self):
            """writes to the inode may only append data."""
            if hasattr(self, '_m_append'):
                return self._m_append

            self._m_append = self.flags & 8 != 0
            return getattr(self, '_m_append', None)

        def _invalidate_append(self):
            del self._m_append
        @property
        def compressed(self):
            """use compression for this inode."""
            if hasattr(self, '_m_compressed'):
                return self._m_compressed

            self._m_compressed = self.flags & 1 != 0
            return getattr(self, '_m_compressed', None)

        def _invalidate_compressed(self):
            del self._m_compressed
        @property
        def dirsync(self):
            """I/O on this directory inode has to be synchronous."""
            if hasattr(self, '_m_dirsync'):
                return self._m_dirsync

            self._m_dirsync = self.flags & 16 != 0
            return getattr(self, '_m_dirsync', None)

        def _invalidate_dirsync(self):
            del self._m_dirsync
        @property
        def encrypted(self):
            """use encryption for this inode."""
            if hasattr(self, '_m_encrypted'):
                return self._m_encrypted

            self._m_encrypted = self.flags & 64 != 0
            return getattr(self, '_m_encrypted', None)

        def _invalidate_encrypted(self):
            del self._m_encrypted
        @property
        def immutable(self):
            """inode is immutable."""
            if hasattr(self, '_m_immutable'):
                return self._m_immutable

            self._m_immutable = self.flags & 4 != 0
            return getattr(self, '_m_immutable', None)

        def _invalidate_immutable(self):
            del self._m_immutable
        @property
        def is_block_device(self):
            if hasattr(self, '_m_is_block_device'):
                return self._m_is_block_device

            self._m_is_block_device = self.mode & 61440 == 24576
            return getattr(self, '_m_is_block_device', None)

        def _invalidate_is_block_device(self):
            del self._m_is_block_device
        @property
        def is_character_device(self):
            if hasattr(self, '_m_is_character_device'):
                return self._m_is_character_device

            self._m_is_character_device = self.mode & 61440 == 8192
            return getattr(self, '_m_is_character_device', None)

        def _invalidate_is_character_device(self):
            del self._m_is_character_device
        @property
        def is_dir(self):
            if hasattr(self, '_m_is_dir'):
                return self._m_is_dir

            self._m_is_dir = self.mode & 61440 == 16384
            return getattr(self, '_m_is_dir', None)

        def _invalidate_is_dir(self):
            del self._m_is_dir
        @property
        def is_fifo(self):
            if hasattr(self, '_m_is_fifo'):
                return self._m_is_fifo

            self._m_is_fifo = self.mode & 61440 == 4096
            return getattr(self, '_m_is_fifo', None)

        def _invalidate_is_fifo(self):
            del self._m_is_fifo
        @property
        def is_link(self):
            if hasattr(self, '_m_is_link'):
                return self._m_is_link

            self._m_is_link = self.mode & 61440 == 40960
            return getattr(self, '_m_is_link', None)

        def _invalidate_is_link(self):
            del self._m_is_link
        @property
        def is_regular(self):
            if hasattr(self, '_m_is_regular'):
                return self._m_is_regular

            self._m_is_regular = self.mode & 61440 == 32768
            return getattr(self, '_m_is_regular', None)

        def _invalidate_is_regular(self):
            del self._m_is_regular
        @property
        def is_socket(self):
            if hasattr(self, '_m_is_socket'):
                return self._m_is_socket

            self._m_is_socket = self.mode & 61440 == 49152
            return getattr(self, '_m_is_socket', None)

        def _invalidate_is_socket(self):
            del self._m_is_socket
        @property
        def synchronous(self):
            """I/O on this inode has to be synchronous."""
            if hasattr(self, '_m_synchronous'):
                return self._m_synchronous

            self._m_synchronous = self.flags & 2 != 0
            return getattr(self, '_m_synchronous', None)

        def _invalidate_synchronous(self):
            del self._m_synchronous
        @property
        def xattr(self):
            """this inode is the inode for an extended attribute value."""
            if hasattr(self, '_m_xattr'):
                return self._m_xattr

            self._m_xattr = self.flags & 32 != 0
            return getattr(self, '_m_xattr', None)

        def _invalidate_xattr(self):
            del self._m_xattr

    class Key(ReadWriteKaitaiStruct):
        """Inode nodes (`inode_header`), directory and extended attribute entry
        nodes (`directory_header`) and data nodes (`data_header`) store keys in a
        16-byte field (`UBIFS_MAX_KEY_LEN`). The simple key format, the only one
        there is (see `<superblock_header>.key_fmt`), uses only the first 8
        bytes, and Linux (v7.2)
        [zeroes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L432-L440)
        the rest. Branches of index nodes (`branch`)
        [store only these 8 bytes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L448-L455).
        
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L16-L22
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.Key, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.inode_number = self._io.read_u4le()
            self.value = self._io.read_bits_int_le(29)
            self.type = KaitaiStream.resolve_enum(Ubifs.KeyTypes, self._io.read_bits_int_le(3))
            if not isinstance(self.type, Ubifs.KeyTypes):
                raise kaitaistruct.ValidationNotInEnumError(self.type, self._io, u"/types/key/seq/2")
            self.unused = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ubifs.Key, self)._write__seq(io)
            self._io.write_u4le(self.inode_number)
            self._io.write_bits_int_le(29, self.value)
            self._io.write_bits_int_le(3, int(self.type))
            self._io.write_bytes(self.unused)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"unused", 0, self._io.size() - self._io.pos())


        def _check(self):
            if not isinstance(self.type, Ubifs.KeyTypes):
                raise kaitaistruct.ValidationNotInEnumError(self.type, None, u"/types/key/seq/2")
            self._dirty = False


    class MasterHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L685-L756
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.MasterHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.highest_inum = self._io.read_u8le()
            self.commit_number = self._io.read_u8le()
            self.flags = self._io.read_u4le()
            self.leb_log = self._io.read_u4le()
            self.leb_root = self._io.read_u4le()
            self.ofs_root = self._io.read_u4le()
            self.len_root = self._io.read_u4le()
            self.leb_garbage_collect = self._io.read_u4le()
            self.leb_index_head = self._io.read_u4le()
            self.ofs_index_head = self._io.read_u4le()
            self.len_index = self._io.read_u8le()
            self.total_free = self._io.read_u8le()
            self.total_dirty = self._io.read_u8le()
            self.total_used = self._io.read_u8le()
            self.total_dead = self._io.read_u8le()
            self.total_dark = self._io.read_u8le()
            self.leb_lpt = self._io.read_u4le()
            self.ofs_lpt = self._io.read_u4le()
            self.leb_nhead = self._io.read_u4le()
            self.ofs_nhead = self._io.read_u4le()
            self.leb_lprops_table = self._io.read_u4le()
            self.ofs_lprops_table = self._io.read_u4le()
            self.leb_save_table = self._io.read_u4le()
            self.ofs_save_table = self._io.read_u4le()
            self.leb_last_lpt_scan = self._io.read_u4le()
            self.num_empty_lebs = self._io.read_u4le()
            self.num_index_lebs = self._io.read_u4le()
            self.num_lebs = self._io.read_u4le()
            self.hash_root_index = self._io.read_bytes(64)
            self.hash_lpt = self._io.read_bytes(64)
            self.hmac = self._io.read_bytes(64)
            self.padding = self._io.read_bytes(152)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ubifs.MasterHeader, self)._write__seq(io)
            self._io.write_u8le(self.highest_inum)
            self._io.write_u8le(self.commit_number)
            self._io.write_u4le(self.flags)
            self._io.write_u4le(self.leb_log)
            self._io.write_u4le(self.leb_root)
            self._io.write_u4le(self.ofs_root)
            self._io.write_u4le(self.len_root)
            self._io.write_u4le(self.leb_garbage_collect)
            self._io.write_u4le(self.leb_index_head)
            self._io.write_u4le(self.ofs_index_head)
            self._io.write_u8le(self.len_index)
            self._io.write_u8le(self.total_free)
            self._io.write_u8le(self.total_dirty)
            self._io.write_u8le(self.total_used)
            self._io.write_u8le(self.total_dead)
            self._io.write_u8le(self.total_dark)
            self._io.write_u4le(self.leb_lpt)
            self._io.write_u4le(self.ofs_lpt)
            self._io.write_u4le(self.leb_nhead)
            self._io.write_u4le(self.ofs_nhead)
            self._io.write_u4le(self.leb_lprops_table)
            self._io.write_u4le(self.ofs_lprops_table)
            self._io.write_u4le(self.leb_save_table)
            self._io.write_u4le(self.ofs_save_table)
            self._io.write_u4le(self.leb_last_lpt_scan)
            self._io.write_u4le(self.num_empty_lebs)
            self._io.write_u4le(self.num_index_lebs)
            self._io.write_u4le(self.num_lebs)
            self._io.write_bytes(self.hash_root_index)
            self._io.write_bytes(self.hash_lpt)
            self._io.write_bytes(self.hmac)
            self._io.write_bytes(self.padding)


        def _check(self):
            if len(self.hash_root_index) != 64:
                raise kaitaistruct.ConsistencyError(u"hash_root_index", 64, len(self.hash_root_index))
            if len(self.hash_lpt) != 64:
                raise kaitaistruct.ConsistencyError(u"hash_lpt", 64, len(self.hash_lpt))
            if len(self.hmac) != 64:
                raise kaitaistruct.ConsistencyError(u"hmac", 64, len(self.hmac))
            if len(self.padding) != 152:
                raise kaitaistruct.ConsistencyError(u"padding", 152, len(self.padding))
            self._dirty = False

        @property
        def dirty(self):
            """master node is dirty."""
            if hasattr(self, '_m_dirty'):
                return self._m_dirty

            self._m_dirty = self.flags & 1 != 0
            return getattr(self, '_m_dirty', None)

        def _invalidate_dirty(self):
            del self._m_dirty
        @property
        def no_orphans(self):
            """no orphan inodes present."""
            if hasattr(self, '_m_no_orphans'):
                return self._m_no_orphans

            self._m_no_orphans = self.flags & 2 != 0
            return getattr(self, '_m_no_orphans', None)

        def _invalidate_no_orphans(self):
            del self._m_no_orphans
        @property
        def recovery(self):
            """written by recovery."""
            if hasattr(self, '_m_recovery'):
                return self._m_recovery

            self._m_recovery = self.flags & 4 != 0
            return getattr(self, '_m_recovery', None)

        def _invalidate_recovery(self):
            del self._m_recovery

    class MasterblockNode(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.MasterblockNode, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header = Ubifs.CommonHeader(self._io, self, self._root)
            self.header._read()
            _ = self.header
            if not _.node_type == Ubifs.NodeTypes.master:
                raise kaitaistruct.ValidationExprError(self.header, self._io, u"/types/masterblock_node/seq/0")
            self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
            _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
            self.node_header = Ubifs.MasterHeader(_io__raw_node_header, self, self._root)
            self.node_header._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            self.node_header._fetch_instances()


        def _write__seq(self, io=None):
            super(Ubifs.MasterblockNode, self)._write__seq(io)
            self.header._write__seq(self._io)
            _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
            self._io.add_child_stream(_io__raw_node_header)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
            def handler(parent, _io__raw_node_header=_io__raw_node_header):
                self._raw_node_header = _io__raw_node_header.to_byte_array()
                if len(self._raw_node_header) != self.header.len_full_node - 24:
                    raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                parent.write_bytes(self._raw_node_header)
            _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.node_header._write__seq(_io__raw_node_header)


        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            _ = self.header
            if not _.node_type == Ubifs.NodeTypes.master:
                raise kaitaistruct.ValidationExprError(self.header, None, u"/types/masterblock_node/seq/0")
            if self.node_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
            if self.node_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            self._dirty = False


    class OrphanHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L843-L853
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.OrphanHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.commit_number = self._io.read_u8le()
            self.inode_numbers = []
            i = 0
            while not self._io.is_eof():
                self.inode_numbers.append(self._io.read_u8le())
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.inode_numbers)):
                pass



        def _write__seq(self, io=None):
            super(Ubifs.OrphanHeader, self)._write__seq(io)
            self._io.write_u8le(self.commit_number)
            for i in range(len(self.inode_numbers)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"inode_numbers", 0, self._io.size() - self._io.pos())
                self._io.write_u8le(self.inode_numbers[i])

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"inode_numbers", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.inode_numbers)):
                pass

            self._dirty = False


    class PaddingHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L606-L615
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.PaddingHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_padding = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ubifs.PaddingHeader, self)._write__seq(io)
            self._io.write_u4le(self.len_padding)


        def _check(self):
            self._dirty = False


    class ReferenceHeader(ReadWriteKaitaiStruct):
        """logical eraseblock reference node.
        
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L758-L772
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.ReferenceHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.leb_number = self._io.read_u4le()
            self.ofs_leb = self._io.read_u4le()
            self.journal_head_number = self._io.read_u4le()
            self.padding = self._io.read_bytes(28)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ubifs.ReferenceHeader, self)._write__seq(io)
            self._io.write_u4le(self.leb_number)
            self._io.write_u4le(self.ofs_leb)
            self._io.write_u4le(self.journal_head_number)
            self._io.write_bytes(self.padding)


        def _check(self):
            if len(self.padding) != 28:
                raise kaitaistruct.ConsistencyError(u"padding", 28, len(self.padding))
            self._dirty = False


    class SignatureHeader(ReadWriteKaitaiStruct):
        """Signature of the superblock node of a file system signed when it was
        created (`mkfs.ubifs` with a key). Linux
        [expects it](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L198-L216)
        as the first node after the superblock node in LEB0.
        
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L784-L799
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.SignatureHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type = self._io.read_u4le()
            if not self.type == 1:
                raise kaitaistruct.ValidationNotEqualError(1, self.type, self._io, u"/types/signature_header/seq/0")
            self.len_signature = self._io.read_u4le()
            self.padding = self._io.read_bytes(32)
            self.signature = self._io.read_bytes(self.len_signature)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ubifs.SignatureHeader, self)._write__seq(io)
            self._io.write_u4le(self.type)
            self._io.write_u4le(self.len_signature)
            self._io.write_bytes(self.padding)
            self._io.write_bytes(self.signature)


        def _check(self):
            if not self.type == 1:
                raise kaitaistruct.ValidationNotEqualError(1, self.type, None, u"/types/signature_header/seq/0")
            if len(self.padding) != 32:
                raise kaitaistruct.ConsistencyError(u"padding", 32, len(self.padding))
            if len(self.signature) != self.len_signature:
                raise kaitaistruct.ConsistencyError(u"signature", self.len_signature, len(self.signature))
            self._dirty = False


    class SuperblockHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L617-L683
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.SuperblockHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.padding0 = self._io.read_bytes(2)
            if not self.padding0 == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.padding0, self._io, u"/types/superblock_header/seq/0")
            self.key_hash = KaitaiStream.resolve_enum(Ubifs.Hashes, self._io.read_u1())
            if not isinstance(self.key_hash, Ubifs.Hashes):
                raise kaitaistruct.ValidationNotInEnumError(self.key_hash, self._io, u"/types/superblock_header/seq/1")
            self.key_fmt = KaitaiStream.resolve_enum(Ubifs.KeyFormats, self._io.read_u1())
            if not self.key_fmt == Ubifs.KeyFormats.simple:
                raise kaitaistruct.ValidationNotEqualError(Ubifs.KeyFormats.simple, self.key_fmt, self._io, u"/types/superblock_header/seq/2")
            self.flags = self._io.read_u4le()
            self.min_io_size = self._io.read_u4le()
            self.leb_size = self._io.read_u4le()
            self.num_lebs = self._io.read_u4le()
            self.max_num_lebs = self._io.read_u4le()
            if not self.max_num_lebs >= self.num_lebs:
                raise kaitaistruct.ValidationLessThanError(self.num_lebs, self.max_num_lebs, self._io, u"/types/superblock_header/seq/7")
            self.max_bud_bytes = self._io.read_u8le()
            self.num_log_lebs = self._io.read_u4le()
            if not self.num_log_lebs >= 2:
                raise kaitaistruct.ValidationLessThanError(2, self.num_log_lebs, self._io, u"/types/superblock_header/seq/9")
            self.num_lpt_lebs = self._io.read_u4le()
            if not self.num_lpt_lebs >= 2:
                raise kaitaistruct.ValidationLessThanError(2, self.num_lpt_lebs, self._io, u"/types/superblock_header/seq/10")
            self.num_orphan_lebs = self._io.read_u4le()
            if not self.num_orphan_lebs >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.num_orphan_lebs, self._io, u"/types/superblock_header/seq/11")
            self.num_journal_heads = self._io.read_u4le()
            self.fanout = self._io.read_u4le()
            self.num_save_table_entries = self._io.read_u4le()
            self.fmt_version = self._io.read_u4le()
            if not self.fmt_version >= 4:
                raise kaitaistruct.ValidationLessThanError(4, self.fmt_version, self._io, u"/types/superblock_header/seq/15")
            self.default_compression = KaitaiStream.resolve_enum(Ubifs.Compression, self._io.read_u2le())
            if not isinstance(self.default_compression, Ubifs.Compression):
                raise kaitaistruct.ValidationNotInEnumError(self.default_compression, self._io, u"/types/superblock_header/seq/16")
            self.padding1 = self._io.read_bytes(2)
            if not self.padding1 == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.padding1, self._io, u"/types/superblock_header/seq/17")
            self.reserve_pool_uid = self._io.read_u4le()
            self.reserve_pool_gid = self._io.read_u4le()
            self.reserve_pool_size = self._io.read_u8le()
            self.time_granularity = self._io.read_u4le()
            if not self.time_granularity >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.time_granularity, self._io, u"/types/superblock_header/seq/21")
            if not self.time_granularity <= 1000000000:
                raise kaitaistruct.ValidationGreaterThanError(1000000000, self.time_granularity, self._io, u"/types/superblock_header/seq/21")
            self.uuid = self._io.read_bytes(16)
            self.ro_compat_version = self._io.read_u4le()
            self.hmac = self._io.read_bytes(64)
            self.hmac_wkm = self._io.read_bytes(64)
            if self.authenticated:
                pass
                self.hash_algo = KaitaiStream.resolve_enum(Ubifs.HashAlgos, self._io.read_u2le())
                if not isinstance(self.hash_algo, Ubifs.HashAlgos):
                    raise kaitaistruct.ValidationNotInEnumError(self.hash_algo, self._io, u"/types/superblock_header/seq/26")

            if (not (self.authenticated)):
                pass
                self.hash_algo_unused = self._io.read_u2le()

            self.hash_mst = self._io.read_bytes(64)
            self.padding2 = self._io.read_bytes(3774)
            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.authenticated:
                pass

            if (not (self.authenticated)):
                pass



        def _write__seq(self, io=None):
            super(Ubifs.SuperblockHeader, self)._write__seq(io)
            self._io.write_bytes(self.padding0)
            self._io.write_u1(int(self.key_hash))
            self._io.write_u1(int(self.key_fmt))
            self._io.write_u4le(self.flags)
            self._io.write_u4le(self.min_io_size)
            self._io.write_u4le(self.leb_size)
            self._io.write_u4le(self.num_lebs)
            self._io.write_u4le(self.max_num_lebs)
            self._io.write_u8le(self.max_bud_bytes)
            self._io.write_u4le(self.num_log_lebs)
            self._io.write_u4le(self.num_lpt_lebs)
            self._io.write_u4le(self.num_orphan_lebs)
            self._io.write_u4le(self.num_journal_heads)
            self._io.write_u4le(self.fanout)
            self._io.write_u4le(self.num_save_table_entries)
            self._io.write_u4le(self.fmt_version)
            self._io.write_u2le(int(self.default_compression))
            self._io.write_bytes(self.padding1)
            self._io.write_u4le(self.reserve_pool_uid)
            self._io.write_u4le(self.reserve_pool_gid)
            self._io.write_u8le(self.reserve_pool_size)
            self._io.write_u4le(self.time_granularity)
            self._io.write_bytes(self.uuid)
            self._io.write_u4le(self.ro_compat_version)
            self._io.write_bytes(self.hmac)
            self._io.write_bytes(self.hmac_wkm)
            if self.authenticated:
                pass
                self._io.write_u2le(int(self.hash_algo))

            if (not (self.authenticated)):
                pass
                self._io.write_u2le(self.hash_algo_unused)

            self._io.write_bytes(self.hash_mst)
            self._io.write_bytes(self.padding2)


        def _check(self):
            if len(self.padding0) != 2:
                raise kaitaistruct.ConsistencyError(u"padding0", 2, len(self.padding0))
            if not self.padding0 == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.padding0, None, u"/types/superblock_header/seq/0")
            if not isinstance(self.key_hash, Ubifs.Hashes):
                raise kaitaistruct.ValidationNotInEnumError(self.key_hash, None, u"/types/superblock_header/seq/1")
            if not self.key_fmt == Ubifs.KeyFormats.simple:
                raise kaitaistruct.ValidationNotEqualError(Ubifs.KeyFormats.simple, self.key_fmt, None, u"/types/superblock_header/seq/2")
            if not self.max_num_lebs >= self.num_lebs:
                raise kaitaistruct.ValidationLessThanError(self.num_lebs, self.max_num_lebs, None, u"/types/superblock_header/seq/7")
            if not self.num_log_lebs >= 2:
                raise kaitaistruct.ValidationLessThanError(2, self.num_log_lebs, None, u"/types/superblock_header/seq/9")
            if not self.num_lpt_lebs >= 2:
                raise kaitaistruct.ValidationLessThanError(2, self.num_lpt_lebs, None, u"/types/superblock_header/seq/10")
            if not self.num_orphan_lebs >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.num_orphan_lebs, None, u"/types/superblock_header/seq/11")
            if not self.fmt_version >= 4:
                raise kaitaistruct.ValidationLessThanError(4, self.fmt_version, None, u"/types/superblock_header/seq/15")
            if not isinstance(self.default_compression, Ubifs.Compression):
                raise kaitaistruct.ValidationNotInEnumError(self.default_compression, None, u"/types/superblock_header/seq/16")
            if len(self.padding1) != 2:
                raise kaitaistruct.ConsistencyError(u"padding1", 2, len(self.padding1))
            if not self.padding1 == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.padding1, None, u"/types/superblock_header/seq/17")
            if not self.time_granularity >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.time_granularity, None, u"/types/superblock_header/seq/21")
            if not self.time_granularity <= 1000000000:
                raise kaitaistruct.ValidationGreaterThanError(1000000000, self.time_granularity, None, u"/types/superblock_header/seq/21")
            if len(self.uuid) != 16:
                raise kaitaistruct.ConsistencyError(u"uuid", 16, len(self.uuid))
            if len(self.hmac) != 64:
                raise kaitaistruct.ConsistencyError(u"hmac", 64, len(self.hmac))
            if len(self.hmac_wkm) != 64:
                raise kaitaistruct.ConsistencyError(u"hmac_wkm", 64, len(self.hmac_wkm))
            if self.authenticated:
                pass
                if not isinstance(self.hash_algo, Ubifs.HashAlgos):
                    raise kaitaistruct.ValidationNotInEnumError(self.hash_algo, None, u"/types/superblock_header/seq/26")

            if (not (self.authenticated)):
                pass

            if len(self.hash_mst) != 64:
                raise kaitaistruct.ConsistencyError(u"hash_mst", 64, len(self.hash_mst))
            if len(self.padding2) != 3774:
                raise kaitaistruct.ConsistencyError(u"padding2", 3774, len(self.padding2))
            self._dirty = False

        @property
        def authenticated(self):
            """this filesystem contains hashes for authentication."""
            if hasattr(self, '_m_authenticated'):
                return self._m_authenticated

            self._m_authenticated = self.flags & 32 != 0
            return getattr(self, '_m_authenticated', None)

        def _invalidate_authenticated(self):
            del self._m_authenticated
        @property
        def biglpt(self):
            """if "big" LPT model is used if set."""
            if hasattr(self, '_m_biglpt'):
                return self._m_biglpt

            self._m_biglpt = self.flags & 2 != 0
            return getattr(self, '_m_biglpt', None)

        def _invalidate_biglpt(self):
            del self._m_biglpt
        @property
        def double_hash(self):
            """store a 32bit cookie in directory entry nodes to
            support 64bit cookies for lookups by hash
            """
            if hasattr(self, '_m_double_hash'):
                return self._m_double_hash

            self._m_double_hash = self.flags & 8 != 0
            return getattr(self, '_m_double_hash', None)

        def _invalidate_double_hash(self):
            del self._m_double_hash
        @property
        def encrypted(self):
            """filesystem contains encrypted files."""
            if hasattr(self, '_m_encrypted'):
                return self._m_encrypted

            self._m_encrypted = self.flags & 16 != 0
            return getattr(self, '_m_encrypted', None)

        def _invalidate_encrypted(self):
            del self._m_encrypted
        @property
        def len_hash(self):
            """Length in bytes of the hash of a node (`c->hash_len` in Linux), e.g.
            in each branch of an index node. In an authenticated file system, it
            is determined by `hash_algo`. Otherwise, it is 0.
            """
            if hasattr(self, '_m_len_hash'):
                return self._m_len_hash

            self._m_len_hash = (0 if (not (self.authenticated)) else (16 if  ((self.hash_algo == Ubifs.HashAlgos.md4) or (self.hash_algo == Ubifs.HashAlgos.md5) or (self.hash_algo == Ubifs.HashAlgos.ripe_md_128) or (self.hash_algo == Ubifs.HashAlgos.tgr_128))  else (20 if  ((self.hash_algo == Ubifs.HashAlgos.sha1) or (self.hash_algo == Ubifs.HashAlgos.ripe_md_160) or (self.hash_algo == Ubifs.HashAlgos.tgr_160))  else (24 if self.hash_algo == Ubifs.HashAlgos.tgr_192 else (28 if self.hash_algo == Ubifs.HashAlgos.sha224 else (32 if  ((self.hash_algo == Ubifs.HashAlgos.sha256) or (self.hash_algo == Ubifs.HashAlgos.ripe_md_256) or (self.hash_algo == Ubifs.HashAlgos.wp_256) or (self.hash_algo == Ubifs.HashAlgos.sm3_256) or (self.hash_algo == Ubifs.HashAlgos.streebog_256) or (self.hash_algo == Ubifs.HashAlgos.sha3_256))  else (40 if self.hash_algo == Ubifs.HashAlgos.ripe_md_320 else (48 if  ((self.hash_algo == Ubifs.HashAlgos.sha384) or (self.hash_algo == Ubifs.HashAlgos.wp_384) or (self.hash_algo == Ubifs.HashAlgos.sha3_384))  else (64 if  ((self.hash_algo == Ubifs.HashAlgos.sha512) or (self.hash_algo == Ubifs.HashAlgos.wp_512) or (self.hash_algo == Ubifs.HashAlgos.streebog_512) or (self.hash_algo == Ubifs.HashAlgos.sha3_512))  else -1)))))))))
            return getattr(self, '_m_len_hash', None)

        def _invalidate_len_hash(self):
            del self._m_len_hash
        @property
        def space_fixup(self):
            """first-mount "fixup" of free space within LEBs needed."""
            if hasattr(self, '_m_space_fixup'):
                return self._m_space_fixup

            self._m_space_fixup = self.flags & 4 != 0
            return getattr(self, '_m_space_fixup', None)

        def _invalidate_space_fixup(self):
            del self._m_space_fixup

    class SuperblockNode(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.SuperblockNode, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header = Ubifs.CommonHeader(self._io, self, self._root)
            self.header._read()
            _ = self.header
            if not _.node_type == Ubifs.NodeTypes.superblock:
                raise kaitaistruct.ValidationExprError(self.header, self._io, u"/types/superblock_node/seq/0")
            self._raw_node_header = self._io.read_bytes(self.header.len_full_node - 24)
            _io__raw_node_header = KaitaiStream(BytesIO(self._raw_node_header))
            self.node_header = Ubifs.SuperblockHeader(_io__raw_node_header, self, self._root)
            self.node_header._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            self.node_header._fetch_instances()


        def _write__seq(self, io=None):
            super(Ubifs.SuperblockNode, self)._write__seq(io)
            self.header._write__seq(self._io)
            _io__raw_node_header = KaitaiStream(BytesIO(bytearray(self.header.len_full_node - 24)))
            self._io.add_child_stream(_io__raw_node_header)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.header.len_full_node - 24))
            def handler(parent, _io__raw_node_header=_io__raw_node_header):
                self._raw_node_header = _io__raw_node_header.to_byte_array()
                if len(self._raw_node_header) != self.header.len_full_node - 24:
                    raise kaitaistruct.ConsistencyError(u"raw(node_header)", self.header.len_full_node - 24, len(self._raw_node_header))
                parent.write_bytes(self._raw_node_header)
            _io__raw_node_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.node_header._write__seq(_io__raw_node_header)


        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            _ = self.header
            if not _.node_type == Ubifs.NodeTypes.superblock:
                raise kaitaistruct.ValidationExprError(self.header, None, u"/types/superblock_node/seq/0")
            if self.node_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"node_header", self._root, self.node_header._root)
            if self.node_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"node_header", self, self.node_header._parent)
            self._dirty = False


    class TruncationHeader(ReadWriteKaitaiStruct):
        """This node exists only in the journal and never goes to the main area.
        
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L586-L604
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ubifs.TruncationHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.inode_number = self._io.read_u4le()
            self.padding = self._io.read_bytes(12)
            self.old_size = self._io.read_u8le()
            if not self.old_size >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.old_size, self._io, u"/types/truncation_header/seq/2")
            self.new_size = self._io.read_u8le()
            if not self.new_size <= self.old_size - 1:
                raise kaitaistruct.ValidationGreaterThanError(self.old_size - 1, self.new_size, self._io, u"/types/truncation_header/seq/3")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ubifs.TruncationHeader, self)._write__seq(io)
            self._io.write_u4le(self.inode_number)
            self._io.write_bytes(self.padding)
            self._io.write_u8le(self.old_size)
            self._io.write_u8le(self.new_size)


        def _check(self):
            if len(self.padding) != 12:
                raise kaitaistruct.ConsistencyError(u"padding", 12, len(self.padding))
            if not self.old_size >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.old_size, None, u"/types/truncation_header/seq/2")
            if not self.new_size <= self.old_size - 1:
                raise kaitaistruct.ValidationGreaterThanError(self.old_size - 1, self.new_size, None, u"/types/truncation_header/seq/3")
            self._dirty = False


    @property
    def index(self):
        """The LEB containing the root index node, as given by `leb_root` in
        `master_1`.
        
        This instance only provides the substream for `index_root`, which can then
        use `ofs_root` (an offset within the LEB) as its `pos` directly.
        """
        if self._should_write_index:
            self._write_index()
        if hasattr(self, '_m_index'):
            return self._m_index

        if not self.index__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.superblock.node_header.leb_size * self.master_1.node_header.leb_root)
        self._raw__m_index = self._io.read_bytes(self.superblock.node_header.leb_size)
        _io__raw__m_index = KaitaiStream(BytesIO(self._raw__m_index))
        self._m_index = Ubifs.Dummy(_io__raw__m_index, self, self._root)
        self._m_index._read()
        self._io.seek(_pos)
        return getattr(self, '_m_index', None)

    @index.setter
    def index(self, v):
        self._dirty = True
        self._m_index = v

    def _write_index(self):
        self._should_write_index = False
        _pos = self._io.pos()
        self._io.seek(self.superblock.node_header.leb_size * self.master_1.node_header.leb_root)
        _io__raw__m_index = KaitaiStream(BytesIO(bytearray(self.superblock.node_header.leb_size)))
        self._io.add_child_stream(_io__raw__m_index)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.superblock.node_header.leb_size))
        def handler(parent, _io__raw__m_index=_io__raw__m_index):
            self._raw__m_index = _io__raw__m_index.to_byte_array()
            if len(self._raw__m_index) != self.superblock.node_header.leb_size:
                raise kaitaistruct.ConsistencyError(u"raw(index)", self.superblock.node_header.leb_size, len(self._raw__m_index))
            parent.write_bytes(self._raw__m_index)
        _io__raw__m_index.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_index._write__seq(_io__raw__m_index)
        self._io.seek(_pos)

    @property
    def index_root(self):
        """The root index node, in the `index` LEB at the offset given by
        `ofs_root` in `master_1`. All other index nodes, and through them all
        the files, are reached from it by recursively following the `target` of
        each of the `branches`.
        """
        if self._should_write_index_root:
            self._write_index_root()
        if hasattr(self, '_m_index_root'):
            return self._m_index_root

        if not self.index_root__enabled:
            return None

        io = self.index._io
        _pos = io.pos()
        io.seek(self.master_1.node_header.ofs_root)
        self._m_index_root = Ubifs.IndexBlock(io, self, self._root)
        self._m_index_root._read()
        _ = self._m_index_root
        if not _.header.len_full_node == self.master_1.node_header.len_root:
            raise kaitaistruct.ValidationExprError(self._m_index_root, self._io, u"/instances/index_root")
        io.seek(_pos)
        return getattr(self, '_m_index_root', None)

    @index_root.setter
    def index_root(self, v):
        self._dirty = True
        self._m_index_root = v

    def _write_index_root(self):
        self._should_write_index_root = False
        io = self.index._io
        _pos = io.pos()
        io.seek(self.master_1.node_header.ofs_root)
        self._m_index_root._write__seq(io)
        io.seek(_pos)

    @property
    def lebs(self):
        """All LEBs of the file system: `lebs[n]` is LEB number `n`, which starts
        at offset `n * <superblock_header>.leb_size`.
        
        Accessing this instance reads the whole image into memory. To get a
        single LEB, it's cheaper to read `<superblock_header>.leb_size` bytes
        at the offset of that LEB.
        """
        if self._should_write_lebs:
            self._write_lebs()
        if hasattr(self, '_m_lebs'):
            return self._m_lebs

        if not self.lebs__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(0)
        self._m_lebs = []
        for i in range(self.superblock.node_header.num_lebs):
            self._m_lebs.append(self._io.read_bytes(self.superblock.node_header.leb_size))

        self._io.seek(_pos)
        return getattr(self, '_m_lebs', None)

    @lebs.setter
    def lebs(self, v):
        self._dirty = True
        self._m_lebs = v

    def _write_lebs(self):
        self._should_write_lebs = False
        _pos = self._io.pos()
        self._io.seek(0)
        if len(self._m_lebs) != self.superblock.node_header.num_lebs:
            raise kaitaistruct.ConsistencyError(u"lebs", self.superblock.node_header.num_lebs, len(self._m_lebs))
        for i in range(len(self._m_lebs)):
            pass
            if len(self._m_lebs[i]) != self.superblock.node_header.leb_size:
                raise kaitaistruct.ConsistencyError(u"lebs", self.superblock.node_header.leb_size, len(self._m_lebs[i]))
            self._io.write_bytes(self._m_lebs[i])

        self._io.seek(_pos)

    @property
    def len_image(self):
        """Length of the file system image in bytes:
        `<superblock_header>.num_lebs` LEBs of `<superblock_header>.leb_size`
        bytes each. Use it to find where the image ends and to detect a
        truncated image (see the top-level `doc`).
        """
        if hasattr(self, '_m_len_image'):
            return self._m_len_image

        self._m_len_image = self.superblock.node_header.leb_size * self.superblock.node_header.num_lebs
        return getattr(self, '_m_len_image', None)

    def _invalidate_len_image(self):
        del self._m_len_image
    @property
    def master_1(self):
        """The first copy of the master node in LEB1. This Kaitai Struct
        implementation uses it to locate `index_root`. In an image created by
        `mkfs.ubifs`, it is the only copy in LEB1.
        
        .. seealso::
           Git tag "v2.3.1" - https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633
        """
        if self._should_write_master_1:
            self._write_master_1()
        if hasattr(self, '_m_master_1'):
            return self._m_master_1

        if not self.master_1__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.superblock.node_header.leb_size)
        self._raw__m_master_1 = self._io.read_bytes(self.superblock.node_header.leb_size)
        _io__raw__m_master_1 = KaitaiStream(BytesIO(self._raw__m_master_1))
        self._m_master_1 = Ubifs.MasterblockNode(_io__raw__m_master_1, self, self._root)
        self._m_master_1._read()
        self._io.seek(_pos)
        return getattr(self, '_m_master_1', None)

    @master_1.setter
    def master_1(self, v):
        self._dirty = True
        self._m_master_1 = v

    def _write_master_1(self):
        self._should_write_master_1 = False
        _pos = self._io.pos()
        self._io.seek(self.superblock.node_header.leb_size)
        _io__raw__m_master_1 = KaitaiStream(BytesIO(bytearray(self.superblock.node_header.leb_size)))
        self._io.add_child_stream(_io__raw__m_master_1)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.superblock.node_header.leb_size))
        def handler(parent, _io__raw__m_master_1=_io__raw__m_master_1):
            self._raw__m_master_1 = _io__raw__m_master_1.to_byte_array()
            if len(self._raw__m_master_1) != self.superblock.node_header.leb_size:
                raise kaitaistruct.ConsistencyError(u"raw(master_1)", self.superblock.node_header.leb_size, len(self._raw__m_master_1))
            parent.write_bytes(self._raw__m_master_1)
        _io__raw__m_master_1.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_master_1._write__seq(_io__raw__m_master_1)
        self._io.seek(_pos)

    @property
    def master_2(self):
        """The first copy of the master node in LEB2. In an image created by
        `mkfs.ubifs`, it is the same as `master_1` except for the sequence
        number and CRC in the common header. Linux keeps the master node in both
        LEB1 and LEB2 for redundancy, and when mounting, it checks that the
        copies in both match.
        
        .. seealso::
           Git tag "v2.3.1" - https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633
        
        
        .. seealso::
           Git tag "v7.2" - https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L115-L130
        """
        if self._should_write_master_2:
            self._write_master_2()
        if hasattr(self, '_m_master_2'):
            return self._m_master_2

        if not self.master_2__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.superblock.node_header.leb_size * 2)
        self._raw__m_master_2 = self._io.read_bytes(self.superblock.node_header.leb_size)
        _io__raw__m_master_2 = KaitaiStream(BytesIO(self._raw__m_master_2))
        self._m_master_2 = Ubifs.MasterblockNode(_io__raw__m_master_2, self, self._root)
        self._m_master_2._read()
        self._io.seek(_pos)
        return getattr(self, '_m_master_2', None)

    @master_2.setter
    def master_2(self, v):
        self._dirty = True
        self._m_master_2 = v

    def _write_master_2(self):
        self._should_write_master_2 = False
        _pos = self._io.pos()
        self._io.seek(self.superblock.node_header.leb_size * 2)
        _io__raw__m_master_2 = KaitaiStream(BytesIO(bytearray(self.superblock.node_header.leb_size)))
        self._io.add_child_stream(_io__raw__m_master_2)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.superblock.node_header.leb_size))
        def handler(parent, _io__raw__m_master_2=_io__raw__m_master_2):
            self._raw__m_master_2 = _io__raw__m_master_2.to_byte_array()
            if len(self._raw__m_master_2) != self.superblock.node_header.leb_size:
                raise kaitaistruct.ConsistencyError(u"raw(master_2)", self.superblock.node_header.leb_size, len(self._raw__m_master_2))
            parent.write_bytes(self._raw__m_master_2)
        _io__raw__m_master_2.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_master_2._write__seq(_io__raw__m_master_2)
        self._io.seek(_pos)

    @property
    def superblock(self):
        """The superblock node will always be at the start of
        the first LEB.
        """
        if self._should_write_superblock:
            self._write_superblock()
        if hasattr(self, '_m_superblock'):
            return self._m_superblock

        if not self.superblock__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(0)
        self._m_superblock = Ubifs.SuperblockNode(self._io, self, self._root)
        self._m_superblock._read()
        self._io.seek(_pos)
        return getattr(self, '_m_superblock', None)

    @superblock.setter
    def superblock(self, v):
        self._dirty = True
        self._m_superblock = v

    def _write_superblock(self):
        self._should_write_superblock = False
        _pos = self._io.pos()
        self._io.seek(0)
        self._m_superblock._write__seq(self._io)
        self._io.seek(_pos)


