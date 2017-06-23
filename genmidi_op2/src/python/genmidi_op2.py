# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
import struct


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class GenmidiOp2(KaitaiStruct):
    """GENMIDI.OP2 is a sound bank file used by players based on DMX sound
    library to play MIDI files with General MIDI instruments using OPL2
    sound chip (which was commonly installed on popular AdLib and Sound
    Blaster sound cards).
    
    Major users of DMX sound library include:
    
    * Original Doom game engine (and games based on it: Heretic, Hexen, Strife, Chex Quest)
    * Raptor: Call of the Shadows 
    
    .. seealso::
       http://doom.wikia.com/wiki/GENMIDI - http://www.fit.vutbr.cz/~arnost/muslib/op2_form.zip
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = self._io.ensure_fixed_contents(struct.pack('8b', 35, 79, 80, 76, 95, 73, 73, 35))
        self.instruments = [None] * (175)
        for i in range(175):
            self.instruments[i] = self._root.InstrumentEntry(self._io, self, self._root)

        self.instrument_names = [None] * (175)
        for i in range(175):
            self.instrument_names[i] = (KaitaiStream.bytes_terminate(KaitaiStream.bytes_strip_right(self._io.read_bytes(32), 0), 0, False)).decode(u"ASCII")


    class InstrumentEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.flags = self._io.read_u2le()
            self.finetune = self._io.read_u1()
            self.note = self._io.read_u1()
            self.instruments = [None] * (2)
            for i in range(2):
                self.instruments[i] = self._root.Instrument(self._io, self, self._root)



    class Instrument(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.op1 = self._root.OpSettings(self._io, self, self._root)
            self.feedback = self._io.read_u1()
            self.op2 = self._root.OpSettings(self._io, self, self._root)
            self.unused = self._io.read_u1()
            self.base_note = self._io.read_s2le()


    class OpSettings(KaitaiStruct):
        """OPL2 settings for one operator (carrier or modulator)
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.trem_vibr = self._io.read_u1()
            self.att_dec = self._io.read_u1()
            self.sust_rel = self._io.read_u1()
            self.wave = self._io.read_u1()
            self.scale = self._io.read_u1()
            self.level = self._io.read_u1()



