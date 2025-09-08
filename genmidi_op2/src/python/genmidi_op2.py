# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class GenmidiOp2(KaitaiStruct):
    """GENMIDI.OP2 is a sound bank file used by players based on DMX sound
    library to play MIDI files with General MIDI instruments using OPL2
    sound chip (which was commonly installed on popular AdLib and Sound
    Blaster sound cards).
    
    Major users of DMX sound library include:
    
    * Original Doom game engine (and games based on it: Heretic, Hexen, Strife, Chex Quest)
    * Raptor: Call of the Shadows
    
    .. seealso::
       Source - http://www.fit.vutbr.cz/~arnost/muslib/op2_form.zip
    
    
    .. seealso::
       Source - https://doom.fandom.com/wiki/GENMIDI
    
    
    .. seealso::
       Source - https://moddingwiki.shikadi.net/wiki/OP2_Bank_Format
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(GenmidiOp2, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(8)
        if not self.magic == b"\x23\x4F\x50\x4C\x5F\x49\x49\x23":
            raise kaitaistruct.ValidationNotEqualError(b"\x23\x4F\x50\x4C\x5F\x49\x49\x23", self.magic, self._io, u"/seq/0")
        self.instruments = []
        for i in range(175):
            self.instruments.append(GenmidiOp2.InstrumentEntry(self._io, self, self._root))

        self.instrument_names = []
        for i in range(175):
            self.instrument_names.append((KaitaiStream.bytes_terminate(self._io.read_bytes(32), 0, False)).decode(u"ASCII"))



    def _fetch_instances(self):
        pass
        for i in range(len(self.instruments)):
            pass
            self.instruments[i]._fetch_instances()

        for i in range(len(self.instrument_names)):
            pass


    class Instrument(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(GenmidiOp2.Instrument, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.op1 = GenmidiOp2.OpSettings(self._io, self, self._root)
            self.feedback = self._io.read_u1()
            self.op2 = GenmidiOp2.OpSettings(self._io, self, self._root)
            self.unused = self._io.read_u1()
            self.base_note = self._io.read_s2le()


        def _fetch_instances(self):
            pass
            self.op1._fetch_instances()
            self.op2._fetch_instances()


    class InstrumentEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(GenmidiOp2.InstrumentEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.flags = self._io.read_u2le()
            self.finetune = self._io.read_u1()
            self.note = self._io.read_u1()
            self.instruments = []
            for i in range(2):
                self.instruments.append(GenmidiOp2.Instrument(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.instruments)):
                pass
                self.instruments[i]._fetch_instances()



    class OpSettings(KaitaiStruct):
        """OPL2 settings for one operator (carrier or modulator)
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(GenmidiOp2.OpSettings, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.trem_vibr = self._io.read_u1()
            self.att_dec = self._io.read_u1()
            self.sust_rel = self._io.read_u1()
            self.wave = self._io.read_u1()
            self.scale = self._io.read_u1()
            self.level = self._io.read_u1()


        def _fetch_instances(self):
            pass



