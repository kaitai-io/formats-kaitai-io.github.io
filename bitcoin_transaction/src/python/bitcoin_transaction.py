# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class BitcoinTransaction(KaitaiStruct):
    """
    .. seealso::
       Source - https://bitcoin.org/en/developer-guide#transactions
       https://en.bitcoin.it/wiki/Transaction
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.version = self._io.read_u4le()
        self.num_vins = self._io.read_u1()
        self.vins = [None] * (self.num_vins)
        for i in range(self.num_vins):
            self.vins[i] = self._root.Vin(self._io, self, self._root)

        self.num_vouts = self._io.read_u1()
        self.vouts = [None] * (self.num_vouts)
        for i in range(self.num_vouts):
            self.vouts[i] = self._root.Vout(self._io, self, self._root)

        self.locktime = self._io.read_u4le()

    class Vin(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.txid = self._io.read_bytes(32)
            self.output_id = self._io.read_u4le()
            self.len_script = self._io.read_u1()
            self._raw_script_sig = self._io.read_bytes(self.len_script)
            _io__raw_script_sig = KaitaiStream(BytesIO(self._raw_script_sig))
            self.script_sig = self._root.Vin.ScriptSignature(_io__raw_script_sig, self, self._root)
            self.end_of_vin = self._io.ensure_fixed_contents(b"\xFF\xFF\xFF\xFF")

        class ScriptSignature(KaitaiStruct):

            class SighashType(Enum):
                sighash_all = 1
                sighash_none = 2
                sighash_single = 3
                sighash_anyonecanpay = 80
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.len_sig_stack = self._io.read_u1()
                self.der_sig = self._root.Vin.ScriptSignature.DerSignature(self._io, self, self._root)
                self.sig_type = KaitaiStream.resolve_enum(self._root.Vin.ScriptSignature.SighashType, self._io.read_u1())
                self.len_pubkey_stack = self._io.read_u1()
                self.pubkey = self._root.Vin.ScriptSignature.PublicKey(self._io, self, self._root)

            class DerSignature(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.sequence = self._io.ensure_fixed_contents(b"\x30")
                    self.len_sig = self._io.read_u1()
                    self.sep_1 = self._io.ensure_fixed_contents(b"\x02")
                    self.len_sig_r = self._io.read_u1()
                    self.sig_r = self._io.read_bytes(self.len_sig_r)
                    self.sep_2 = self._io.ensure_fixed_contents(b"\x02")
                    self.len_sig_s = self._io.read_u1()
                    self.sig_s = self._io.read_bytes(self.len_sig_s)


            class PublicKey(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.type = self._io.read_u1()
                    self.x = self._io.read_bytes(32)
                    self.y = self._io.read_bytes(32)




    class Vout(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.amount = self._io.read_u8le()
            self.len_script = self._io.read_u1()
            self.script_pub_key = self._io.read_bytes(self.len_script)



