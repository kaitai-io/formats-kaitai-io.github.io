# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(kaitaistruct.__version__) < parse_version('0.9'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class MinecraftNbt(KaitaiStruct):
    """A structured binary format native to Minecraft for saving game data and transferring
    it over the network (in multiplayer), such as player data
    ([`<player>.dat`](https://minecraft.gamepedia.com/Player.dat_format); contains
    e.g. player's inventory and location), saved worlds
    ([`level.dat`](
      https://minecraft.gamepedia.com/Java_Edition_level_format#level.dat_format
    ) and [Chunk format](https://minecraft.gamepedia.com/Chunk_format#NBT_structure)),
    list of saved multiplayer servers
    ([`servers.dat`](https://minecraft.gamepedia.com/Servers.dat_format)) and so on -
    see <https://minecraft.gamepedia.com/NBT_format#Uses>.
    
    The entire file should be _gzip_-compressed (in accordance with the original
    specification [NBT.txt](
      https://web.archive.org/web/20110723210920/https://www.minecraft.net/docs/NBT.txt
    ) by Notch), but can also be compressed with _zlib_ or uncompressed.
    
    This spec can only handle uncompressed NBT data, so be sure to first detect
    what type of data you are dealing with. You can use the Unix `file` command
    to do this (`file-5.20` or later is required; older versions do not recognize
    _zlib_-compressed data and return `application/octet-stream` instead):
    
    ```shell
    file --brief --mime-type input-unknown.nbt
    ```
    
    If it says:
    
      * `application/x-gzip` or `application/gzip` (since `file-5.37`), you can decompress it by
        * `gunzip -c input-gzip.nbt > output.nbt` or
        * `python3 -c "import sys, gzip; sys.stdout.buffer.write(
          gzip.decompress(sys.stdin.buffer.read()) )" < input-gzip.nbt > output.nbt`
      * `application/zlib`, you can use
        * `openssl zlib -d -in input-zlib.nbt -out output.nbt` (does not work on most systems)
        * `python3 -c "import sys, zlib; sys.stdout.buffer.write(
          zlib.decompress(sys.stdin.buffer.read()) )" < input-zlib.nbt > output.nbt`
      * something else (especially `image/x-pcx` and `application/octet-stream`),
        it is most likely already uncompressed.
    
    The file `output.nbt` generated by one of the above commands can already be
    processed with this Kaitai Struct specification.
    
    This spec **only** implements the Java edition format. There is also
    a [Bedrock edition](https://wiki.vg/NBT#Bedrock_edition) NBT format,
    which uses little-endian encoding and has a few other differences, but it isn't
    as popular as the Java edition format.
    
    **Implementation note:** strings in `TAG_String` are incorrectly decoded with
    standard UTF-8, while they are encoded in [**Modified UTF-8**](
      https://docs.oracle.com/javase/8/docs/api/java/io/DataInput.html#modified-utf-8
    ) (MUTF-8). That's because MUTF-8 is not supported natively by most target
    languages, and thus one must use external libraries to achieve a fully-compliant
    decoder. But decoding in standard UTF-8 is still better than nothing, and
    it usually works fine.
    
    All Unicode code points with incompatible representations in MUTF-8 and UTF-8 are
    U+0000 (_NUL_), U+D800-U+DFFF (_High_ and _Low Surrogates_) and U+10000-U+10FFFF
    (all _Supplementary_ Planes; includes e.g. emoticons, pictograms).
    A _MUTF-8_-encoded string containing these code points cannot be successfully
    decoded as UTF-8. The behavior in this case depends on the target language -
    usually an exception is thrown, or the bytes that are not valid UTF-8
    are replaced or ignored.
    
    **Sample files:**
    
      * <https://wiki.vg/NBT#Download>
      * <https://github.com/twoolie/NBT/blob/f9e892e/tests/world_test/data/scoreboard.dat>
      * <https://github.com/chmod222/cNBT/tree/3f74b69/testdata>
      * <https://github.com/PistonDevelopers/hematite_nbt/tree/0b85f89/tests>
    
    .. seealso::
       Source - https://wiki.vg/NBT
    
    
    .. seealso::
       Source - https://web.archive.org/web/20110723210920/https://www.minecraft.net/docs/NBT.txt
    
    
    .. seealso::
       Source - https://minecraft.gamepedia.com/NBT_format
    """

    class Tag(Enum):
        end = 0
        byte = 1
        short = 2
        int = 3
        long = 4
        float = 5
        double = 6
        byte_array = 7
        string = 8
        list = 9
        compound = 10
        int_array = 11
        long_array = 12
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        if  ((self.root_type == MinecraftNbt.Tag.end) and (False)) :
            self.root_check = self._io.read_bytes(0)

        self.root = MinecraftNbt.NamedTag(self._io, self, self._root)

    class TagLongArray(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.num_tags = self._io.read_s4be()
            self.tags = [None] * (self.num_tags)
            for i in range(self.num_tags):
                self.tags[i] = self._io.read_s8be()


        @property
        def tags_type(self):
            if hasattr(self, '_m_tags_type'):
                return self._m_tags_type if hasattr(self, '_m_tags_type') else None

            self._m_tags_type = MinecraftNbt.Tag.long
            return self._m_tags_type if hasattr(self, '_m_tags_type') else None


    class TagByteArray(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_data = self._io.read_s4be()
            self.data = self._io.read_bytes(self.len_data)


    class TagIntArray(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.num_tags = self._io.read_s4be()
            self.tags = [None] * (self.num_tags)
            for i in range(self.num_tags):
                self.tags[i] = self._io.read_s4be()


        @property
        def tags_type(self):
            if hasattr(self, '_m_tags_type'):
                return self._m_tags_type if hasattr(self, '_m_tags_type') else None

            self._m_tags_type = MinecraftNbt.Tag.int
            return self._m_tags_type if hasattr(self, '_m_tags_type') else None


    class TagList(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.tags_type = KaitaiStream.resolve_enum(MinecraftNbt.Tag, self._io.read_u1())
            self.num_tags = self._io.read_s4be()
            self.tags = [None] * (self.num_tags)
            for i in range(self.num_tags):
                _on = self.tags_type
                if _on == MinecraftNbt.Tag.long_array:
                    self.tags[i] = MinecraftNbt.TagLongArray(self._io, self, self._root)
                elif _on == MinecraftNbt.Tag.compound:
                    self.tags[i] = MinecraftNbt.TagCompound(self._io, self, self._root)
                elif _on == MinecraftNbt.Tag.double:
                    self.tags[i] = self._io.read_f8be()
                elif _on == MinecraftNbt.Tag.list:
                    self.tags[i] = MinecraftNbt.TagList(self._io, self, self._root)
                elif _on == MinecraftNbt.Tag.float:
                    self.tags[i] = self._io.read_f4be()
                elif _on == MinecraftNbt.Tag.short:
                    self.tags[i] = self._io.read_s2be()
                elif _on == MinecraftNbt.Tag.int:
                    self.tags[i] = self._io.read_s4be()
                elif _on == MinecraftNbt.Tag.byte_array:
                    self.tags[i] = MinecraftNbt.TagByteArray(self._io, self, self._root)
                elif _on == MinecraftNbt.Tag.byte:
                    self.tags[i] = self._io.read_s1()
                elif _on == MinecraftNbt.Tag.int_array:
                    self.tags[i] = MinecraftNbt.TagIntArray(self._io, self, self._root)
                elif _on == MinecraftNbt.Tag.string:
                    self.tags[i] = MinecraftNbt.TagString(self._io, self, self._root)
                elif _on == MinecraftNbt.Tag.long:
                    self.tags[i] = self._io.read_s8be()



    class TagString(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_data = self._io.read_u2be()
            self.data = (self._io.read_bytes(self.len_data)).decode(u"utf-8")


    class TagCompound(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.tags = []
            i = 0
            while True:
                _ = MinecraftNbt.NamedTag(self._io, self, self._root)
                self.tags.append(_)
                if _.is_tag_end:
                    break
                i += 1

        @property
        def dump_num_tags(self):
            if hasattr(self, '_m_dump_num_tags'):
                return self._m_dump_num_tags if hasattr(self, '_m_dump_num_tags') else None

            self._m_dump_num_tags = (len(self.tags) - (1 if  ((len(self.tags) >= 1) and (self.tags[-1].is_tag_end))  else 0))
            return self._m_dump_num_tags if hasattr(self, '_m_dump_num_tags') else None


    class NamedTag(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.type = KaitaiStream.resolve_enum(MinecraftNbt.Tag, self._io.read_u1())
            if not (self.is_tag_end):
                self.name = MinecraftNbt.TagString(self._io, self, self._root)

            if not (self.is_tag_end):
                _on = self.type
                if _on == MinecraftNbt.Tag.long_array:
                    self.payload = MinecraftNbt.TagLongArray(self._io, self, self._root)
                elif _on == MinecraftNbt.Tag.compound:
                    self.payload = MinecraftNbt.TagCompound(self._io, self, self._root)
                elif _on == MinecraftNbt.Tag.double:
                    self.payload = self._io.read_f8be()
                elif _on == MinecraftNbt.Tag.list:
                    self.payload = MinecraftNbt.TagList(self._io, self, self._root)
                elif _on == MinecraftNbt.Tag.float:
                    self.payload = self._io.read_f4be()
                elif _on == MinecraftNbt.Tag.short:
                    self.payload = self._io.read_s2be()
                elif _on == MinecraftNbt.Tag.int:
                    self.payload = self._io.read_s4be()
                elif _on == MinecraftNbt.Tag.byte_array:
                    self.payload = MinecraftNbt.TagByteArray(self._io, self, self._root)
                elif _on == MinecraftNbt.Tag.byte:
                    self.payload = self._io.read_s1()
                elif _on == MinecraftNbt.Tag.int_array:
                    self.payload = MinecraftNbt.TagIntArray(self._io, self, self._root)
                elif _on == MinecraftNbt.Tag.string:
                    self.payload = MinecraftNbt.TagString(self._io, self, self._root)
                elif _on == MinecraftNbt.Tag.long:
                    self.payload = self._io.read_s8be()


        @property
        def is_tag_end(self):
            if hasattr(self, '_m_is_tag_end'):
                return self._m_is_tag_end if hasattr(self, '_m_is_tag_end') else None

            self._m_is_tag_end = self.type == MinecraftNbt.Tag.end
            return self._m_is_tag_end if hasattr(self, '_m_is_tag_end') else None


    @property
    def root_type(self):
        if hasattr(self, '_m_root_type'):
            return self._m_root_type if hasattr(self, '_m_root_type') else None

        _pos = self._io.pos()
        self._io.seek(0)
        self._m_root_type = KaitaiStream.resolve_enum(MinecraftNbt.Tag, self._io.read_u1())
        self._io.seek(_pos)
        if not self.root_type == MinecraftNbt.Tag.compound:
            raise kaitaistruct.ValidationNotEqualError(MinecraftNbt.Tag.compound, self.root_type, self._io, u"/instances/root_type")
        return self._m_root_type if hasattr(self, '_m_root_type') else None

