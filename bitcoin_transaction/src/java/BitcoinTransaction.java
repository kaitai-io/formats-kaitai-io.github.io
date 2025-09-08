// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import java.util.List;


/**
 * @see <a href="https://bitcoin.org/en/developer-guide#transactions
 * https://en.bitcoin.it/wiki/Transaction
 * ">Source</a>
 */
public class BitcoinTransaction extends KaitaiStruct {
    public static BitcoinTransaction fromFile(String fileName) throws IOException {
        return new BitcoinTransaction(new ByteBufferKaitaiStream(fileName));
    }

    public BitcoinTransaction(KaitaiStream _io) {
        this(_io, null, null);
    }

    public BitcoinTransaction(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public BitcoinTransaction(KaitaiStream _io, KaitaiStruct _parent, BitcoinTransaction _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.version = this._io.readU4le();
        this.numVins = this._io.readU1();
        this.vins = new ArrayList<Vin>();
        for (int i = 0; i < numVins(); i++) {
            this.vins.add(new Vin(this._io, this, _root));
        }
        this.numVouts = this._io.readU1();
        this.vouts = new ArrayList<Vout>();
        for (int i = 0; i < numVouts(); i++) {
            this.vouts.add(new Vout(this._io, this, _root));
        }
        this.locktime = this._io.readU4le();
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.vins.size(); i++) {
            this.vins.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.vouts.size(); i++) {
            this.vouts.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class Vin extends KaitaiStruct {
        public static Vin fromFile(String fileName) throws IOException {
            return new Vin(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.txid = this._io.readBytes(32);
            this.outputId = this._io.readU4le();
            this.lenScript = this._io.readU1();
            KaitaiStream _io_scriptSig = this._io.substream(lenScript());
            this.scriptSig = new ScriptSignature(_io_scriptSig, this, _root);
            this.endOfVin = this._io.readBytes(4);
            if (!(Arrays.equals(this.endOfVin, new byte[] { -1, -1, -1, -1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -1, -1, -1, -1 }, this.endOfVin, this._io, "/types/vin/seq/4");
            }
        }

        public void _fetchInstances() {
            this.scriptSig._fetchInstances();
        }
        public static class ScriptSignature extends KaitaiStruct {
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
                _read();
            }
            private void _read() {
                this.lenSigStack = this._io.readU1();
                this.derSig = new DerSignature(this._io, this, _root);
                this.sigType = SighashType.byId(this._io.readU1());
                this.lenPubkeyStack = this._io.readU1();
                this.pubkey = new PublicKey(this._io, this, _root);
            }

            public void _fetchInstances() {
                this.derSig._fetchInstances();
                this.pubkey._fetchInstances();
            }
            public static class DerSignature extends KaitaiStruct {
                public static DerSignature fromFile(String fileName) throws IOException {
                    return new DerSignature(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
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
                }

                public void _fetchInstances() {
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
                public int lenSig() { return lenSig; }
                public byte[] sep1() { return sep1; }

                /**
                 * 'r' value's length.
                 */
                public int lenSigR() { return lenSigR; }

                /**
                 * 'r' value of the ECDSA signature.
                 * @see <a href="https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm">Source</a>
                 */
                public byte[] sigR() { return sigR; }
                public byte[] sep2() { return sep2; }

                /**
                 * 's' value's length.
                 */
                public int lenSigS() { return lenSigS; }

                /**
                 * 's' value of the ECDSA signature.
                 * @see <a href="https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm">Source</a>
                 */
                public byte[] sigS() { return sigS; }
                public BitcoinTransaction _root() { return _root; }
                public BitcoinTransaction.Vin.ScriptSignature _parent() { return _parent; }
            }
            public static class PublicKey extends KaitaiStruct {
                public static PublicKey fromFile(String fileName) throws IOException {
                    return new PublicKey(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.type = this._io.readU1();
                    this.x = this._io.readBytes(32);
                    this.y = this._io.readBytes(32);
                }

                public void _fetchInstances() {
                }
                private int type;
                private byte[] x;
                private byte[] y;
                private BitcoinTransaction _root;
                private BitcoinTransaction.Vin.ScriptSignature _parent;
                public int type() { return type; }

                /**
                 * 'x' coordinate of the public key on the elliptic curve.
                 */
                public byte[] x() { return x; }

                /**
                 * 'y' coordinate of the public key on the elliptic curve.
                 */
                public byte[] y() { return y; }
                public BitcoinTransaction _root() { return _root; }
                public BitcoinTransaction.Vin.ScriptSignature _parent() { return _parent; }
            }
            private int lenSigStack;
            private DerSignature derSig;
            private SighashType sigType;
            private int lenPubkeyStack;
            private PublicKey pubkey;
            private BitcoinTransaction _root;
            private BitcoinTransaction.Vin _parent;
            public int lenSigStack() { return lenSigStack; }

            /**
             * DER-encoded ECDSA signature.
             * @see <a href="https://en.wikipedia.org/wiki/X.690#DER_encoding
             * https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm
             * ">Source</a>
             */
            public DerSignature derSig() { return derSig; }

            /**
             * Type of signature.
             */
            public SighashType sigType() { return sigType; }
            public int lenPubkeyStack() { return lenPubkeyStack; }

            /**
             * Public key (bitcoin address of the recipient).
             */
            public PublicKey pubkey() { return pubkey; }
            public BitcoinTransaction _root() { return _root; }
            public BitcoinTransaction.Vin _parent() { return _parent; }
        }
        private byte[] txid;
        private long outputId;
        private int lenScript;
        private ScriptSignature scriptSig;
        private byte[] endOfVin;
        private BitcoinTransaction _root;
        private BitcoinTransaction _parent;

        /**
         * Previous transaction hash.
         */
        public byte[] txid() { return txid; }

        /**
         * ID indexing an ouput of the transaction refered by txid.
         * This output will be used as an input in the present transaction.
         */
        public long outputId() { return outputId; }

        /**
         * ScriptSig's length.
         */
        public int lenScript() { return lenScript; }

        /**
         * ScriptSig.
         * @see <a href="https://en.bitcoin.it/wiki/Transaction#Input
         * https://en.bitcoin.it/wiki/Script
         * ">Source</a>
         */
        public ScriptSignature scriptSig() { return scriptSig; }

        /**
         * Magic number indicating the end of the current input.
         */
        public byte[] endOfVin() { return endOfVin; }
        public BitcoinTransaction _root() { return _root; }
        public BitcoinTransaction _parent() { return _parent; }
    }
    public static class Vout extends KaitaiStruct {
        public static Vout fromFile(String fileName) throws IOException {
            return new Vout(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.amount = this._io.readU8le();
            this.lenScript = this._io.readU1();
            this.scriptPubKey = this._io.readBytes(lenScript());
        }

        public void _fetchInstances() {
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

        /**
         * ScriptPubKey's length.
         */
        public int lenScript() { return lenScript; }

        /**
         * ScriptPubKey.
         * @see <a href="https://en.bitcoin.it/wiki/Transaction#Output
         * https://en.bitcoin.it/wiki/Script
         * ">Source</a>
         */
        public byte[] scriptPubKey() { return scriptPubKey; }
        public BitcoinTransaction _root() { return _root; }
        public BitcoinTransaction _parent() { return _parent; }
    }
    private long version;
    private int numVins;
    private List<Vin> vins;
    private int numVouts;
    private List<Vout> vouts;
    private long locktime;
    private BitcoinTransaction _root;
    private KaitaiStruct _parent;

    /**
     * Version number.
     */
    public long version() { return version; }

    /**
     * Number of input transactions.
     */
    public int numVins() { return numVins; }

    /**
     * Input transactions.
     * An input refers to an output from a previous transaction.
     */
    public List<Vin> vins() { return vins; }

    /**
     * Number of output transactions.
     */
    public int numVouts() { return numVouts; }

    /**
     * Output transactions.
     */
    public List<Vout> vouts() { return vouts; }
    public long locktime() { return locktime; }
    public BitcoinTransaction _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
