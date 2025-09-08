# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class GenmidiOp2(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(GenmidiOp2, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(8)
        if not self.magic == b"\x23\x4F\x50\x4C\x5F\x49\x49\x23":
            raise kaitaistruct.ValidationNotEqualError(b"\x23\x4F\x50\x4C\x5F\x49\x49\x23", self.magic, self._io, u"/seq/0")
        self.instruments = []
        for i in range(175):
            _t_instruments = GenmidiOp2.InstrumentEntry(self._io, self, self._root)
            try:
                _t_instruments._read()
            finally:
                self.instruments.append(_t_instruments)

        self.instrument_names = []
        for i in range(175):
            self.instrument_names.append((KaitaiStream.bytes_terminate(self._io.read_bytes(32), 0, False)).decode(u"ASCII"))

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.instruments)):
            pass
            self.instruments[i]._fetch_instances()

        for i in range(len(self.instrument_names)):
            pass



    def _write__seq(self, io=None):
        super(GenmidiOp2, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        for i in range(len(self.instruments)):
            pass
            self.instruments[i]._write__seq(self._io)

        for i in range(len(self.instrument_names)):
            pass
            self._io.write_bytes_limit((self.instrument_names[i]).encode(u"ASCII"), 32, 0, 0)



    def _check(self):
        if len(self.magic) != 8:
            raise kaitaistruct.ConsistencyError(u"magic", 8, len(self.magic))
        if not self.magic == b"\x23\x4F\x50\x4C\x5F\x49\x49\x23":
            raise kaitaistruct.ValidationNotEqualError(b"\x23\x4F\x50\x4C\x5F\x49\x49\x23", self.magic, None, u"/seq/0")
        if len(self.instruments) != 175:
            raise kaitaistruct.ConsistencyError(u"instruments", 175, len(self.instruments))
        for i in range(len(self.instruments)):
            pass
            if self.instruments[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"instruments", self._root, self.instruments[i]._root)
            if self.instruments[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"instruments", self, self.instruments[i]._parent)

        if len(self.instrument_names) != 175:
            raise kaitaistruct.ConsistencyError(u"instrument_names", 175, len(self.instrument_names))
        for i in range(len(self.instrument_names)):
            pass
            if len((self.instrument_names[i]).encode(u"ASCII")) > 32:
                raise kaitaistruct.ConsistencyError(u"instrument_names", 32, len((self.instrument_names[i]).encode(u"ASCII")))
            if KaitaiStream.byte_array_index_of((self.instrument_names[i]).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"instrument_names", -1, KaitaiStream.byte_array_index_of((self.instrument_names[i]).encode(u"ASCII"), 0))

        self._dirty = False

    class Instrument(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GenmidiOp2.Instrument, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.op1 = GenmidiOp2.OpSettings(self._io, self, self._root)
            self.op1._read()
            self.feedback = self._io.read_u1()
            self.op2 = GenmidiOp2.OpSettings(self._io, self, self._root)
            self.op2._read()
            self.unused = self._io.read_u1()
            self.base_note = self._io.read_s2le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.op1._fetch_instances()
            self.op2._fetch_instances()


        def _write__seq(self, io=None):
            super(GenmidiOp2.Instrument, self)._write__seq(io)
            self.op1._write__seq(self._io)
            self._io.write_u1(self.feedback)
            self.op2._write__seq(self._io)
            self._io.write_u1(self.unused)
            self._io.write_s2le(self.base_note)


        def _check(self):
            if self.op1._root != self._root:
                raise kaitaistruct.ConsistencyError(u"op1", self._root, self.op1._root)
            if self.op1._parent != self:
                raise kaitaistruct.ConsistencyError(u"op1", self, self.op1._parent)
            if self.op2._root != self._root:
                raise kaitaistruct.ConsistencyError(u"op2", self._root, self.op2._root)
            if self.op2._parent != self:
                raise kaitaistruct.ConsistencyError(u"op2", self, self.op2._parent)
            self._dirty = False


    class InstrumentEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GenmidiOp2.InstrumentEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.flags = self._io.read_u2le()
            self.finetune = self._io.read_u1()
            self.note = self._io.read_u1()
            self.instruments = []
            for i in range(2):
                _t_instruments = GenmidiOp2.Instrument(self._io, self, self._root)
                try:
                    _t_instruments._read()
                finally:
                    self.instruments.append(_t_instruments)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.instruments)):
                pass
                self.instruments[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(GenmidiOp2.InstrumentEntry, self)._write__seq(io)
            self._io.write_u2le(self.flags)
            self._io.write_u1(self.finetune)
            self._io.write_u1(self.note)
            for i in range(len(self.instruments)):
                pass
                self.instruments[i]._write__seq(self._io)



        def _check(self):
            if len(self.instruments) != 2:
                raise kaitaistruct.ConsistencyError(u"instruments", 2, len(self.instruments))
            for i in range(len(self.instruments)):
                pass
                if self.instruments[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"instruments", self._root, self.instruments[i]._root)
                if self.instruments[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"instruments", self, self.instruments[i]._parent)

            self._dirty = False


    class OpSettings(ReadWriteKaitaiStruct):
        """OPL2 settings for one operator (carrier or modulator)
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GenmidiOp2.OpSettings, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.trem_vibr = self._io.read_u1()
            self.att_dec = self._io.read_u1()
            self.sust_rel = self._io.read_u1()
            self.wave = self._io.read_u1()
            self.scale = self._io.read_u1()
            self.level = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(GenmidiOp2.OpSettings, self)._write__seq(io)
            self._io.write_u1(self.trem_vibr)
            self._io.write_u1(self.att_dec)
            self._io.write_u1(self.sust_rel)
            self._io.write_u1(self.wave)
            self._io.write_u1(self.scale)
            self._io.write_u1(self.level)


        def _check(self):
            self._dirty = False



