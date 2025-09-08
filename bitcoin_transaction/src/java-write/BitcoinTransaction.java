// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import java.util.List;


/**
 * @see <a href="https://bitcoin.org/en/developer-guide#transactions
 * https://en.bitcoin.it/wiki/Transaction
 * ">Source</a>
 */
public class BitcoinTransaction extends KaitaiStruct.ReadWrite {
    public static BitcoinTransaction fromFile(String fileName) throws IOException {
        return new BitcoinTransaction(new ByteBufferKaitaiStream(fileName));
    }
    public BitcoinTransaction() {
        this(null, null, null);
    }

    public BitcoinTransaction(KaitaiStream _io) {
        this(_io, null, null);
    }

    public BitcoinTransaction(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public BitcoinTransaction(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, BitcoinTransaction _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.version = this._io.readU4le();
        this.numVins = this._io.readU1();
        this.vins = new ArrayList<Vin>();
        for (int i = 0; i < numVins(); i++) {
            Vin _t_vins = new Vin(this._io, this, _root);
            try {
                _t_vins._read();
            } finally {
                this.vins.add(_t_vins);
            }
        }
        this.numVouts = this._io.readU1();
        this.vouts = new ArrayList<Vout>();
        for (int i = 0; i < numVouts(); i++) {
            Vout _t_vouts = new Vout(this._io, this, _root);
            try {
                _t_vouts._read();
            } finally {
                this.vouts.add(_t_vouts);
            }
        }
        this.locktime = this._io.readU4le();
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.vins.size(); i++) {
            this.vins.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.vouts.size(); i++) {
            this.vouts.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU4le(this.version);
        this._io.writeU1(this.numVins);
        for (int i = 0; i < this.vins.size(); i++) {
            this.vins.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.writeU1(this.numVouts);
        for (int i = 0; i < this.vouts.size(); i++) {
            this.vouts.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.writeU4le(this.locktime);
    }

    public void _check() {
        if (this.vins.size() != numVins())
            throw new ConsistencyError("vins", numVins(), this.vins.size());
        for (int i = 0; i < this.vins.size(); i++) {
            if (!Objects.equals(this.vins.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("vins", _root(), this.vins.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.vins.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("vins", this, this.vins.get(((Number) (i)).intValue())._parent());
        }
        if (this.vouts.size() != numVouts())
            throw new ConsistencyError("vouts", numVouts(), this.vouts.size());
        for (int i = 0; i < this.vouts.size(); i++) {
            if (!Objects.equals(this.vouts.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("vouts", _root(), this.vouts.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.vouts.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("vouts", this, this.vouts.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Vin extends KaitaiStruct.ReadWrite {
        public static Vin fromFile(String fileName) throws IOException {
            return new Vin(new ByteBufferKaitaiStream(fileName));
        }
        public Vin() {
            this(null, null, null);
        }

        public Vin(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vin(KaitaiStream _io, BitcoinTransaction _parent) {
            this(_io, _parent, null);
        }

        public Vin(KaitaiStream _io, BitcoinTransaction _parent, BitcoinTransaction _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.txid = this._io.readBytes(32);
            this.outputId = this._io.readU4le();
            this.lenScript = this._io.readU1();
            this._raw_scriptSig = this._io.readBytes(lenScript());
            KaitaiStream _io__raw_scriptSig = new ByteBufferKaitaiStream(this._raw_scriptSig);
            this.scriptSig = new ScriptSignature(_io__raw_scriptSig, this, _root);
            this.scriptSig._read();
            this.endOfVin = this._io.readBytes(4);
            if (!(Arrays.equals(this.endOfVin, new byte[] { -1, -1, -1, -1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -1, -1, -1, -1 }, this.endOfVin, this._io, "/types/vin/seq/4");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.scriptSig._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.txid);
            this._io.writeU4le(this.outputId);
            this._io.writeU1(this.lenScript);
            final KaitaiStream _io__raw_scriptSig = new ByteBufferKaitaiStream(lenScript());
            this._io.addChildStream(_io__raw_scriptSig);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenScript()));
                final Vin _this = this;
                _io__raw_scriptSig.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_scriptSig = _io__raw_scriptSig.toByteArray();
                        if (_this._raw_scriptSig.length != lenScript())
                            throw new ConsistencyError("raw(script_sig)", lenScript(), _this._raw_scriptSig.length);
                        parent.writeBytes(_this._raw_scriptSig);
                    }
                });
            }
            this.scriptSig._write_Seq(_io__raw_scriptSig);
            this._io.writeBytes(this.endOfVin);
        }

        public void _check() {
            if (this.txid.length != 32)
                throw new ConsistencyError("txid", 32, this.txid.length);
            if (!Objects.equals(this.scriptSig._root(), _root()))
                throw new ConsistencyError("script_sig", _root(), this.scriptSig._root());
            if (!Objects.equals(this.scriptSig._parent(), this))
                throw new ConsistencyError("script_sig", this, this.scriptSig._parent());
            if (this.endOfVin.length != 4)
                throw new ConsistencyError("end_of_vin", 4, this.endOfVin.length);
            if (!(Arrays.equals(this.endOfVin, new byte[] { -1, -1, -1, -1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -1, -1, -1, -1 }, this.endOfVin, null, "/types/vin/seq/4");
            }
            _dirty = false;
        }
        public static class ScriptSignature extends KaitaiStruct.ReadWrite {
            public static ScriptSignature fromFile(String fileName) throws IOException {
                return new ScriptSignature(new ByteBufferKaitaiStream(fileName));
            }

            public enum SighashType {
                SIGHASH_ALL(1),
                SIGHASH_NONE(2),
                SIGHASH_SINGLE(3),
                SIGHASH_ANYONECANPAY(80);

                private final long id;
                SighashType(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, SighashType> byId = new HashMap<Long, SighashType>(4);
                static {
                    for (SighashType e : SighashType.values())
                        byId.put(e.id(), e);
                }
                public static SighashType byId(long id) { return byId.get(id); }
            }
            public ScriptSignature() {
                this(null, null, null);
            }

            public ScriptSignature(KaitaiStream _io) {
                this(_io, null, null);
            }

            public ScriptSignature(KaitaiStream _io, BitcoinTransaction.Vin _parent) {
                this(_io, _parent, null);
            }

            public ScriptSignature(KaitaiStream _io, BitcoinTransaction.Vin _parent, BitcoinTransaction _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.lenSigStack = this._io.readU1();
                this.derSig = new DerSignature(this._io, this, _root);
                this.derSig._read();
                this.sigType = SighashType.byId(this._io.readU1());
                this.lenPubkeyStack = this._io.readU1();
                this.pubkey = new PublicKey(this._io, this, _root);
                this.pubkey._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.derSig._fetchInstances();
                this.pubkey._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.lenSigStack);
                this.derSig._write_Seq(this._io);
                this._io.writeU1(((Number) (this.sigType.id())).intValue());
                this._io.writeU1(this.lenPubkeyStack);
                this.pubkey._write_Seq(this._io);
            }

            public void _check() {
                if (!Objects.equals(this.derSig._root(), _root()))
                    throw new ConsistencyError("der_sig", _root(), this.derSig._root());
                if (!Objects.equals(this.derSig._parent(), this))
                    throw new ConsistencyError("der_sig", this, this.derSig._parent());
                if (!Objects.equals(this.pubkey._root(), _root()))
                    throw new ConsistencyError("pubkey", _root(), this.pubkey._root());
                if (!Objects.equals(this.pubkey._parent(), this))
                    throw new ConsistencyError("pubkey", this, this.pubkey._parent());
                _dirty = false;
            }
            public static class DerSignature extends KaitaiStruct.ReadWrite {
                public static DerSignature fromFile(String fileName) throws IOException {
                    return new DerSignature(new ByteBufferKaitaiStream(fileName));
                }
                public DerSignature() {
                    this(null, null, null);
                }

                public DerSignature(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public DerSignature(KaitaiStream _io, BitcoinTransaction.Vin.ScriptSignature _parent) {
                    this(_io, _parent, null);
                }

                public DerSignature(KaitaiStream _io, BitcoinTransaction.Vin.ScriptSignature _parent, BitcoinTransaction _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.sequence = this._io.readBytes(1);
                    if (!(Arrays.equals(this.sequence, new byte[] { 48 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 48 }, this.sequence, this._io, "/types/vin/types/script_signature/types/der_signature/seq/0");
                    }
                    this.lenSig = this._io.readU1();
                    this.sep1 = this._io.readBytes(1);
                    if (!(Arrays.equals(this.sep1, new byte[] { 2 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 2 }, this.sep1, this._io, "/types/vin/types/script_signature/types/der_signature/seq/2");
                    }
                    this.lenSigR = this._io.readU1();
                    this.sigR = this._io.readBytes(lenSigR());
                    this.sep2 = this._io.readBytes(1);
                    if (!(Arrays.equals(this.sep2, new byte[] { 2 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 2 }, this.sep2, this._io, "/types/vin/types/script_signature/types/der_signature/seq/5");
                    }
                    this.lenSigS = this._io.readU1();
                    this.sigS = this._io.readBytes(lenSigS());
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.sequence);
                    this._io.writeU1(this.lenSig);
                    this._io.writeBytes(this.sep1);
                    this._io.writeU1(this.lenSigR);
                    this._io.writeBytes(this.sigR);
                    this._io.writeBytes(this.sep2);
                    this._io.writeU1(this.lenSigS);
                    this._io.writeBytes(this.sigS);
                }

                public void _check() {
                    if (this.sequence.length != 1)
                        throw new ConsistencyError("sequence", 1, this.sequence.length);
                    if (!(Arrays.equals(this.sequence, new byte[] { 48 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 48 }, this.sequence, null, "/types/vin/types/script_signature/types/der_signature/seq/0");
                    }
                    if (this.sep1.length != 1)
                        throw new ConsistencyError("sep_1", 1, this.sep1.length);
                    if (!(Arrays.equals(this.sep1, new byte[] { 2 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 2 }, this.sep1, null, "/types/vin/types/script_signature/types/der_signature/seq/2");
                    }
                    if (this.sigR.length != lenSigR())
                        throw new ConsistencyError("sig_r", lenSigR(), this.sigR.length);
                    if (this.sep2.length != 1)
                        throw new ConsistencyError("sep_2", 1, this.sep2.length);
                    if (!(Arrays.equals(this.sep2, new byte[] { 2 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 2 }, this.sep2, null, "/types/vin/types/script_signature/types/der_signature/seq/5");
                    }
                    if (this.sigS.length != lenSigS())
                        throw new ConsistencyError("sig_s", lenSigS(), this.sigS.length);
                    _dirty = false;
                }
                private byte[] sequence;
                private int lenSig;
                private byte[] sep1;
                private int lenSigR;
                private byte[] sigR;
                private byte[] sep2;
                private int lenSigS;
                private byte[] sigS;
                private BitcoinTransaction _root;
                private BitcoinTransaction.Vin.ScriptSignature _parent;
                public byte[] sequence() { return sequence; }
                public void setSequence(byte[] _v) { _dirty = true; sequence = _v; }
                public int lenSig() { return lenSig; }
                public void setLenSig(int _v) { _dirty = true; lenSig = _v; }
                public byte[] sep1() { return sep1; }
                public void setSep1(byte[] _v) { _dirty = true; sep1 = _v; }

                /**
                 * 'r' value's length.
                 */
                public int lenSigR() { return lenSigR; }
                public void setLenSigR(int _v) { _dirty = true; lenSigR = _v; }

                /**
                 * 'r' value of the ECDSA signature.
                 * @see <a href="https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm">Source</a>
                 */
                public byte[] sigR() { return sigR; }
                public void setSigR(byte[] _v) { _dirty = true; sigR = _v; }
                public byte[] sep2() { return sep2; }
                public void setSep2(byte[] _v) { _dirty = true; sep2 = _v; }

                /**
                 * 's' value's length.
                 */
                public int lenSigS() { return lenSigS; }
                public void setLenSigS(int _v) { _dirty = true; lenSigS = _v; }

                /**
                 * 's' value of the ECDSA signature.
                 * @see <a href="https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm">Source</a>
                 */
                public byte[] sigS() { return sigS; }
                public void setSigS(byte[] _v) { _dirty = true; sigS = _v; }
                public BitcoinTransaction _root() { return _root; }
                public void set_root(BitcoinTransaction _v) { _dirty = true; _root = _v; }
                public BitcoinTransaction.Vin.ScriptSignature _parent() { return _parent; }
                public void set_parent(BitcoinTransaction.Vin.ScriptSignature _v) { _dirty = true; _parent = _v; }
            }
            public static class PublicKey extends KaitaiStruct.ReadWrite {
                public static PublicKey fromFile(String fileName) throws IOException {
                    return new PublicKey(new ByteBufferKaitaiStream(fileName));
                }
                public PublicKey() {
                    this(null, null, null);
                }

                public PublicKey(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public PublicKey(KaitaiStream _io, BitcoinTransaction.Vin.ScriptSignature _parent) {
                    this(_io, _parent, null);
                }

                public PublicKey(KaitaiStream _io, BitcoinTransaction.Vin.ScriptSignature _parent, BitcoinTransaction _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.type = this._io.readU1();
                    this.x = this._io.readBytes(32);
                    this.y = this._io.readBytes(32);
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU1(this.type);
                    this._io.writeBytes(this.x);
                    this._io.writeBytes(this.y);
                }

                public void _check() {
                    if (this.x.length != 32)
                        throw new ConsistencyError("x", 32, this.x.length);
                    if (this.y.length != 32)
                        throw new ConsistencyError("y", 32, this.y.length);
                    _dirty = false;
                }
                private int type;
                private byte[] x;
                private byte[] y;
                private BitcoinTransaction _root;
                private BitcoinTransaction.Vin.ScriptSignature _parent;
                public int type() { return type; }
                public void setType(int _v) { _dirty = true; type = _v; }

                /**
                 * 'x' coordinate of the public key on the elliptic curve.
                 */
                public byte[] x() { return x; }
                public void setX(byte[] _v) { _dirty = true; x = _v; }

                /**
                 * 'y' coordinate of the public key on the elliptic curve.
                 */
                public byte[] y() { return y; }
                public void setY(byte[] _v) { _dirty = true; y = _v; }
                public BitcoinTransaction _root() { return _root; }
                public void set_root(BitcoinTransaction _v) { _dirty = true; _root = _v; }
                public BitcoinTransaction.Vin.ScriptSignature _parent() { return _parent; }
                public void set_parent(BitcoinTransaction.Vin.ScriptSignature _v) { _dirty = true; _parent = _v; }
            }
            private int lenSigStack;
            private DerSignature derSig;
            private SighashType sigType;
            private int lenPubkeyStack;
            private PublicKey pubkey;
            private BitcoinTransaction _root;
            private BitcoinTransaction.Vin _parent;
            public int lenSigStack() { return lenSigStack; }
            public void setLenSigStack(int _v) { _dirty = true; lenSigStack = _v; }

            /**
             * DER-encoded ECDSA signature.
             * @see <a href="https://en.wikipedia.org/wiki/X.690#DER_encoding
             * https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm
             * ">Source</a>
             */
            public DerSignature derSig() { return derSig; }
            public void setDerSig(DerSignature _v) { _dirty = true; derSig = _v; }

            /**
             * Type of signature.
             */
            public SighashType sigType() { return sigType; }
            public void setSigType(SighashType _v) { _dirty = true; sigType = _v; }
            public int lenPubkeyStack() { return lenPubkeyStack; }
            public void setLenPubkeyStack(int _v) { _dirty = true; lenPubkeyStack = _v; }

            /**
             * Public key (bitcoin address of the recipient).
             */
            public PublicKey pubkey() { return pubkey; }
            public void setPubkey(PublicKey _v) { _dirty = true; pubkey = _v; }
            public BitcoinTransaction _root() { return _root; }
            public void set_root(BitcoinTransaction _v) { _dirty = true; _root = _v; }
            public BitcoinTransaction.Vin _parent() { return _parent; }
            public void set_parent(BitcoinTransaction.Vin _v) { _dirty = true; _parent = _v; }
        }
        private byte[] txid;
        private long outputId;
        private int lenScript;
        private ScriptSignature scriptSig;
        private byte[] endOfVin;
        private BitcoinTransaction _root;
        private BitcoinTransaction _parent;
        private byte[] _raw_scriptSig;

        /**
         * Previous transaction hash.
         */
        public byte[] txid() { return txid; }
        public void setTxid(byte[] _v) { _dirty = true; txid = _v; }

        /**
         * ID indexing an ouput of the transaction refered by txid.
         * This output will be used as an input in the present transaction.
         */
        public long outputId() { return outputId; }
        public void setOutputId(long _v) { _dirty = true; outputId = _v; }

        /**
         * ScriptSig's length.
         */
        public int lenScript() { return lenScript; }
        public void setLenScript(int _v) { _dirty = true; lenScript = _v; }

        /**
         * ScriptSig.
         * @see <a href="https://en.bitcoin.it/wiki/Transaction#Input
         * https://en.bitcoin.it/wiki/Script
         * ">Source</a>
         */
        public ScriptSignature scriptSig() { return scriptSig; }
        public void setScriptSig(ScriptSignature _v) { _dirty = true; scriptSig = _v; }

        /**
         * Magic number indicating the end of the current input.
         */
        public byte[] endOfVin() { return endOfVin; }
        public void setEndOfVin(byte[] _v) { _dirty = true; endOfVin = _v; }
        public BitcoinTransaction _root() { return _root; }
        public void set_root(BitcoinTransaction _v) { _dirty = true; _root = _v; }
        public BitcoinTransaction _parent() { return _parent; }
        public void set_parent(BitcoinTransaction _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_scriptSig() { return _raw_scriptSig; }
        public void set_raw_ScriptSig(byte[] _v) { _dirty = true; _raw_scriptSig = _v; }
    }
    public static class Vout extends KaitaiStruct.ReadWrite {
        public static Vout fromFile(String fileName) throws IOException {
            return new Vout(new ByteBufferKaitaiStream(fileName));
        }
        public Vout() {
            this(null, null, null);
        }

        public Vout(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vout(KaitaiStream _io, BitcoinTransaction _parent) {
            this(_io, _parent, null);
        }

        public Vout(KaitaiStream _io, BitcoinTransaction _parent, BitcoinTransaction _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.amount = this._io.readU8le();
            this.lenScript = this._io.readU1();
            this.scriptPubKey = this._io.readBytes(lenScript());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.amount);
            this._io.writeU1(this.lenScript);
            this._io.writeBytes(this.scriptPubKey);
        }

        public void _check() {
            if (this.scriptPubKey.length != lenScript())
                throw new ConsistencyError("script_pub_key", lenScript(), this.scriptPubKey.length);
            _dirty = false;
        }
        private long amount;
        private int lenScript;
        private byte[] scriptPubKey;
        private BitcoinTransaction _root;
        private BitcoinTransaction _parent;

        /**
         * Number of Satoshis to be transfered.
         */
        public long amount() { return amount; }
        public void setAmount(long _v) { _dirty = true; amount = _v; }

        /**
         * ScriptPubKey's length.
         */
        public int lenScript() { return lenScript; }
        public void setLenScript(int _v) { _dirty = true; lenScript = _v; }

        /**
         * ScriptPubKey.
         * @see <a href="https://en.bitcoin.it/wiki/Transaction#Output
         * https://en.bitcoin.it/wiki/Script
         * ">Source</a>
         */
        public byte[] scriptPubKey() { return scriptPubKey; }
        public void setScriptPubKey(byte[] _v) { _dirty = true; scriptPubKey = _v; }
        public BitcoinTransaction _root() { return _root; }
        public void set_root(BitcoinTransaction _v) { _dirty = true; _root = _v; }
        public BitcoinTransaction _parent() { return _parent; }
        public void set_parent(BitcoinTransaction _v) { _dirty = true; _parent = _v; }
    }
    private long version;
    private int numVins;
    private List<Vin> vins;
    private int numVouts;
    private List<Vout> vouts;
    private long locktime;
    private BitcoinTransaction _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * Version number.
     */
    public long version() { return version; }
    public void setVersion(long _v) { _dirty = true; version = _v; }

    /**
     * Number of input transactions.
     */
    public int numVins() { return numVins; }
    public void setNumVins(int _v) { _dirty = true; numVins = _v; }

    /**
     * Input transactions.
     * An input refers to an output from a previous transaction.
     */
    public List<Vin> vins() { return vins; }
    public void setVins(List<Vin> _v) { _dirty = true; vins = _v; }

    /**
     * Number of output transactions.
     */
    public int numVouts() { return numVouts; }
    public void setNumVouts(int _v) { _dirty = true; numVouts = _v; }

    /**
     * Output transactions.
     */
    public List<Vout> vouts() { return vouts; }
    public void setVouts(List<Vout> _v) { _dirty = true; vouts = _v; }
    public long locktime() { return locktime; }
    public void setLocktime(long _v) { _dirty = true; locktime = _v; }
    public BitcoinTransaction _root() { return _root; }
    public void set_root(BitcoinTransaction _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
