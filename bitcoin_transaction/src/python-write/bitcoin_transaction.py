# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class BitcoinTransaction(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://bitcoin.org/en/developer-guide#transactions
       https://en.bitcoin.it/wiki/Transaction
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(BitcoinTransaction, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.version = self._io.read_u4le()
        self.num_vins = self._io.read_u1()
        self.vins = []
        for i in range(self.num_vins):
            _t_vins = BitcoinTransaction.Vin(self._io, self, self._root)
            try:
                _t_vins._read()
            finally:
                self.vins.append(_t_vins)

        self.num_vouts = self._io.read_u1()
        self.vouts = []
        for i in range(self.num_vouts):
            _t_vouts = BitcoinTransaction.Vout(self._io, self, self._root)
            try:
                _t_vouts._read()
            finally:
                self.vouts.append(_t_vouts)

        self.locktime = self._io.read_u4le()
        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.vins)):
            pass
            self.vins[i]._fetch_instances()

        for i in range(len(self.vouts)):
            pass
            self.vouts[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(BitcoinTransaction, self)._write__seq(io)
        self._io.write_u4le(self.version)
        self._io.write_u1(self.num_vins)
        for i in range(len(self.vins)):
            pass
            self.vins[i]._write__seq(self._io)

        self._io.write_u1(self.num_vouts)
        for i in range(len(self.vouts)):
            pass
            self.vouts[i]._write__seq(self._io)

        self._io.write_u4le(self.locktime)


    def _check(self):
        if len(self.vins) != self.num_vins:
            raise kaitaistruct.ConsistencyError(u"vins", self.num_vins, len(self.vins))
        for i in range(len(self.vins)):
            pass
            if self.vins[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"vins", self._root, self.vins[i]._root)
            if self.vins[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"vins", self, self.vins[i]._parent)

        if len(self.vouts) != self.num_vouts:
            raise kaitaistruct.ConsistencyError(u"vouts", self.num_vouts, len(self.vouts))
        for i in range(len(self.vouts)):
            pass
            if self.vouts[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"vouts", self._root, self.vouts[i]._root)
            if self.vouts[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"vouts", self, self.vouts[i]._parent)

        self._dirty = False

    class Vin(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(BitcoinTransaction.Vin, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.txid = self._io.read_bytes(32)
            self.output_id = self._io.read_u4le()
            self.len_script = self._io.read_u1()
            self._raw_script_sig = self._io.read_bytes(self.len_script)
            _io__raw_script_sig = KaitaiStream(BytesIO(self._raw_script_sig))
            self.script_sig = BitcoinTransaction.Vin.ScriptSignature(_io__raw_script_sig, self, self._root)
            self.script_sig._read()
            self.end_of_vin = self._io.read_bytes(4)
            if not self.end_of_vin == b"\xFF\xFF\xFF\xFF":
                raise kaitaistruct.ValidationNotEqualError(b"\xFF\xFF\xFF\xFF", self.end_of_vin, self._io, u"/types/vin/seq/4")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.script_sig._fetch_instances()


        def _write__seq(self, io=None):
            super(BitcoinTransaction.Vin, self)._write__seq(io)
            self._io.write_bytes(self.txid)
            self._io.write_u4le(self.output_id)
            self._io.write_u1(self.len_script)
            _io__raw_script_sig = KaitaiStream(BytesIO(bytearray(self.len_script)))
            self._io.add_child_stream(_io__raw_script_sig)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_script))
            def handler(parent, _io__raw_script_sig=_io__raw_script_sig):
                self._raw_script_sig = _io__raw_script_sig.to_byte_array()
                if len(self._raw_script_sig) != self.len_script:
                    raise kaitaistruct.ConsistencyError(u"raw(script_sig)", self.len_script, len(self._raw_script_sig))
                parent.write_bytes(self._raw_script_sig)
            _io__raw_script_sig.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.script_sig._write__seq(_io__raw_script_sig)
            self._io.write_bytes(self.end_of_vin)


        def _check(self):
            if len(self.txid) != 32:
                raise kaitaistruct.ConsistencyError(u"txid", 32, len(self.txid))
            if self.script_sig._root != self._root:
                raise kaitaistruct.ConsistencyError(u"script_sig", self._root, self.script_sig._root)
            if self.script_sig._parent != self:
                raise kaitaistruct.ConsistencyError(u"script_sig", self, self.script_sig._parent)
            if len(self.end_of_vin) != 4:
                raise kaitaistruct.ConsistencyError(u"end_of_vin", 4, len(self.end_of_vin))
            if not self.end_of_vin == b"\xFF\xFF\xFF\xFF":
                raise kaitaistruct.ValidationNotEqualError(b"\xFF\xFF\xFF\xFF", self.end_of_vin, None, u"/types/vin/seq/4")
            self._dirty = False

        class ScriptSignature(ReadWriteKaitaiStruct):

            class SighashType(IntEnum):
                sighash_all = 1
                sighash_none = 2
                sighash_single = 3
                sighash_anyonecanpay = 80
            def __init__(self, _io=None, _parent=None, _root=None):
                super(BitcoinTransaction.Vin.ScriptSignature, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.len_sig_stack = self._io.read_u1()
                self.der_sig = BitcoinTransaction.Vin.ScriptSignature.DerSignature(self._io, self, self._root)
                self.der_sig._read()
                self.sig_type = KaitaiStream.resolve_enum(BitcoinTransaction.Vin.ScriptSignature.SighashType, self._io.read_u1())
                self.len_pubkey_stack = self._io.read_u1()
                self.pubkey = BitcoinTransaction.Vin.ScriptSignature.PublicKey(self._io, self, self._root)
                self.pubkey._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.der_sig._fetch_instances()
                self.pubkey._fetch_instances()


            def _write__seq(self, io=None):
                super(BitcoinTransaction.Vin.ScriptSignature, self)._write__seq(io)
                self._io.write_u1(self.len_sig_stack)
                self.der_sig._write__seq(self._io)
                self._io.write_u1(int(self.sig_type))
                self._io.write_u1(self.len_pubkey_stack)
                self.pubkey._write__seq(self._io)


            def _check(self):
                if self.der_sig._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"der_sig", self._root, self.der_sig._root)
                if self.der_sig._parent != self:
                    raise kaitaistruct.ConsistencyError(u"der_sig", self, self.der_sig._parent)
                if self.pubkey._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"pubkey", self._root, self.pubkey._root)
                if self.pubkey._parent != self:
                    raise kaitaistruct.ConsistencyError(u"pubkey", self, self.pubkey._parent)
                self._dirty = False

            class DerSignature(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(BitcoinTransaction.Vin.ScriptSignature.DerSignature, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.sequence = self._io.read_bytes(1)
                    if not self.sequence == b"\x30":
                        raise kaitaistruct.ValidationNotEqualError(b"\x30", self.sequence, self._io, u"/types/vin/types/script_signature/types/der_signature/seq/0")
                    self.len_sig = self._io.read_u1()
                    self.sep_1 = self._io.read_bytes(1)
                    if not self.sep_1 == b"\x02":
                        raise kaitaistruct.ValidationNotEqualError(b"\x02", self.sep_1, self._io, u"/types/vin/types/script_signature/types/der_signature/seq/2")
                    self.len_sig_r = self._io.read_u1()
                    self.sig_r = self._io.read_bytes(self.len_sig_r)
                    self.sep_2 = self._io.read_bytes(1)
                    if not self.sep_2 == b"\x02":
                        raise kaitaistruct.ValidationNotEqualError(b"\x02", self.sep_2, self._io, u"/types/vin/types/script_signature/types/der_signature/seq/5")
                    self.len_sig_s = self._io.read_u1()
                    self.sig_s = self._io.read_bytes(self.len_sig_s)
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(BitcoinTransaction.Vin.ScriptSignature.DerSignature, self)._write__seq(io)
                    self._io.write_bytes(self.sequence)
                    self._io.write_u1(self.len_sig)
                    self._io.write_bytes(self.sep_1)
                    self._io.write_u1(self.len_sig_r)
                    self._io.write_bytes(self.sig_r)
                    self._io.write_bytes(self.sep_2)
                    self._io.write_u1(self.len_sig_s)
                    self._io.write_bytes(self.sig_s)


                def _check(self):
                    if len(self.sequence) != 1:
                        raise kaitaistruct.ConsistencyError(u"sequence", 1, len(self.sequence))
                    if not self.sequence == b"\x30":
                        raise kaitaistruct.ValidationNotEqualError(b"\x30", self.sequence, None, u"/types/vin/types/script_signature/types/der_signature/seq/0")
                    if len(self.sep_1) != 1:
                        raise kaitaistruct.ConsistencyError(u"sep_1", 1, len(self.sep_1))
                    if not self.sep_1 == b"\x02":
                        raise kaitaistruct.ValidationNotEqualError(b"\x02", self.sep_1, None, u"/types/vin/types/script_signature/types/der_signature/seq/2")
                    if len(self.sig_r) != self.len_sig_r:
                        raise kaitaistruct.ConsistencyError(u"sig_r", self.len_sig_r, len(self.sig_r))
                    if len(self.sep_2) != 1:
                        raise kaitaistruct.ConsistencyError(u"sep_2", 1, len(self.sep_2))
                    if not self.sep_2 == b"\x02":
                        raise kaitaistruct.ValidationNotEqualError(b"\x02", self.sep_2, None, u"/types/vin/types/script_signature/types/der_signature/seq/5")
                    if len(self.sig_s) != self.len_sig_s:
                        raise kaitaistruct.ConsistencyError(u"sig_s", self.len_sig_s, len(self.sig_s))
                    self._dirty = False


            class PublicKey(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(BitcoinTransaction.Vin.ScriptSignature.PublicKey, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.type = self._io.read_u1()
                    self.x = self._io.read_bytes(32)
                    self.y = self._io.read_bytes(32)
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(BitcoinTransaction.Vin.ScriptSignature.PublicKey, self)._write__seq(io)
                    self._io.write_u1(self.type)
                    self._io.write_bytes(self.x)
                    self._io.write_bytes(self.y)


                def _check(self):
                    if len(self.x) != 32:
                        raise kaitaistruct.ConsistencyError(u"x", 32, len(self.x))
                    if len(self.y) != 32:
                        raise kaitaistruct.ConsistencyError(u"y", 32, len(self.y))
                    self._dirty = False




    class Vout(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(BitcoinTransaction.Vout, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.amount = self._io.read_u8le()
            self.len_script = self._io.read_u1()
            self.script_pub_key = self._io.read_bytes(self.len_script)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(BitcoinTransaction.Vout, self)._write__seq(io)
            self._io.write_u8le(self.amount)
            self._io.write_u1(self.len_script)
            self._io.write_bytes(self.script_pub_key)


        def _check(self):
            if len(self.script_pub_key) != self.len_script:
                raise kaitaistruct.ConsistencyError(u"script_pub_key", self.len_script, len(self.script_pub_key))
            self._dirty = False



