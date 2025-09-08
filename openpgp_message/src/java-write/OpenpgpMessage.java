// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * The OpenPGP Message Format is a format to store encryption and signature keys for emails.
 * @see <a href="https://www.rfc-editor.org/rfc/rfc4880">Source</a>
 */
public class OpenpgpMessage extends KaitaiStruct.ReadWrite {
    public static OpenpgpMessage fromFile(String fileName) throws IOException {
        return new OpenpgpMessage(new ByteBufferKaitaiStream(fileName));
    }

    public enum CompressionAlgorithms {
        UNCOMPRESSED(0),
        ZIB(1),
        ZLIB(2),
        BZIP(3),
        PRIVATE_EXPERIMENTAL_ALGORITHM_00(100),
        PRIVATE_EXPERIMENTAL_ALGORITHM_01(101),
        PRIVATE_EXPERIMENTAL_ALGORITHM_02(102),
        PRIVATE_EXPERIMENTAL_ALGORITHM_03(103),
        PRIVATE_EXPERIMENTAL_ALGORITHM_04(104),
        PRIVATE_EXPERIMENTAL_ALGORITHM_05(105),
        PRIVATE_EXPERIMENTAL_ALGORITHM_06(106),
        PRIVATE_EXPERIMENTAL_ALGORITHM_07(107),
        PRIVATE_EXPERIMENTAL_ALGORITHM_08(108),
        PRIVATE_EXPERIMENTAL_ALGORITHM_09(109),
        PRIVATE_EXPERIMENTAL_ALGORITHM_10(110);

        private final long id;
        CompressionAlgorithms(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, CompressionAlgorithms> byId = new HashMap<Long, CompressionAlgorithms>(15);
        static {
            for (CompressionAlgorithms e : CompressionAlgorithms.values())
                byId.put(e.id(), e);
        }
        public static CompressionAlgorithms byId(long id) { return byId.get(id); }
    }

    public enum HashAlgorithms {
        MD5(1),
        SHA1(2),
        RIPEMD160(3),
        RESERVED4(4),
        RESERVED5(5),
        RESERVED6(6),
        RESERVED7(7),
        SHA256(8),
        SHA384(9),
        SHA512(10),
        SHA224(11),
        PRIVATE_EXPERIMENTAL_ALGORITHM_00(100),
        PRIVATE_EXPERIMENTAL_ALGORITHM_01(101),
        PRIVATE_EXPERIMENTAL_ALGORITHM_02(102),
        PRIVATE_EXPERIMENTAL_ALGORITHM_03(103),
        PRIVATE_EXPERIMENTAL_ALGORITHM_04(104),
        PRIVATE_EXPERIMENTAL_ALGORITHM_05(105),
        PRIVATE_EXPERIMENTAL_ALGORITHM_06(106),
        PRIVATE_EXPERIMENTAL_ALGORITHM_07(107),
        PRIVATE_EXPERIMENTAL_ALGORITHM_08(108),
        PRIVATE_EXPERIMENTAL_ALGORITHM_09(109),
        PRIVATE_EXPERIMENTAL_ALGORITHM_10(110);

        private final long id;
        HashAlgorithms(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, HashAlgorithms> byId = new HashMap<Long, HashAlgorithms>(22);
        static {
            for (HashAlgorithms e : HashAlgorithms.values())
                byId.put(e.id(), e);
        }
        public static HashAlgorithms byId(long id) { return byId.get(id); }
    }

    public enum KeyFlags {
        THIS_KEY_MAY_BE_USED_TO_CERTIFY_OTHER_KEYS(1),
        THIS_KEY_MAY_BE_USED_TO_SIGN_DATA(2),
        THIS_KEY_MAY_BE_USED_TO_ENCRYPT_COMMUNICATIONS(4),
        THIS_KEY_MAY_BE_USED_TO_ENCRYPT_STORAGE(8),
        THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_HAVE_BEEN_SPLIT_BY_A_SECRET_SHARING_MECHANISM(16),
        THIS_KEY_MAY_BE_USED_FOR_AUTHENTICATION(32),
        THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_BE_IN_THE_POSSESSION_OF_MORE_THAN_ONE_PERSON(128);

        private final long id;
        KeyFlags(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, KeyFlags> byId = new HashMap<Long, KeyFlags>(7);
        static {
            for (KeyFlags e : KeyFlags.values())
                byId.put(e.id(), e);
        }
        public static KeyFlags byId(long id) { return byId.get(id); }
    }

    public enum PacketTags {
        RESERVED_A_PACKET_TAG_MUST_NOT_HAVE_THIS_VALUE(0),
        PUBLIC_KEY_ENCRYPTED_SESSION_KEY_PACKET(1),
        SIGNATURE_PACKET(2),
        SYMMETRIC_KEY_ENCRYPTED_SESSION_KEY_PACKET(3),
        ONE_PASS_SIGNATURE_PACKET(4),
        SECRET_KEY_PACKET(5),
        PUBLIC_KEY_PACKET(6),
        SECRET_SUBKEY_PACKET(7),
        COMPRESSED_DATA_PACKET(8),
        SYMMETRICALLY_ENCRYPTED_DATA_PACKET(9),
        MARKER_PACKET(10),
        LITERAL_DATA_PACKET(11),
        TRUST_PACKET(12),
        USER_ID_PACKET(13),
        PUBLIC_SUBKEY_PACKET(14),
        USER_ATTRIBUTE_PACKET(17),
        SYM_ENCRYPTED_AND_INTEGRITY_PROTECTED_DATA_PACKET(18),
        MODIFICATION_DETECTION_CODE_PACKET(19),
        PRIVATE_OR_EXPERIMENTAL_VALUES_0(60),
        PRIVATE_OR_EXPERIMENTAL_VALUES_1(61),
        PRIVATE_OR_EXPERIMENTAL_VALUES_2(62),
        PRIVATE_OR_EXPERIMENTAL_VALUES_3(63);

        private final long id;
        PacketTags(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PacketTags> byId = new HashMap<Long, PacketTags>(22);
        static {
            for (PacketTags e : PacketTags.values())
                byId.put(e.id(), e);
        }
        public static PacketTags byId(long id) { return byId.get(id); }
    }

    public enum PublicKeyAlgorithms {
        RSA_ENCRYPT_OR_SIGN_HAC(1),
        RSA_ENCRYPT_ONLY_HAC(2),
        RSA_SIGN_ONLY_HAC(3),
        ELGAMAL_ENCRYPT_ONLY_ELGAMAL_HAC(16),
        DSA_DIGITAL_SIGNATURE_ALGORITHM_FIPS_HAC(17),
        RESERVED_FOR_ELLIPTIC_CURVE(18),
        RESERVED_FOR_ECDSA(19),
        RESERVED_FORMERLY_ELGAMAL_ENCRYPT_OR_SIGN_(20),
        RESERVED_FOR_DIFFIE_HELLMAN_X_AS_DEFINED_FOR_IETF_S_MIME(21),
        PRIVATE_EXPERIMENTAL_ALGORITHM_00(100),
        PRIVATE_EXPERIMENTAL_ALGORITHM_01(101),
        PRIVATE_EXPERIMENTAL_ALGORITHM_02(102),
        PRIVATE_EXPERIMENTAL_ALGORITHM_03(103),
        PRIVATE_EXPERIMENTAL_ALGORITHM_04(104),
        PRIVATE_EXPERIMENTAL_ALGORITHM_05(105),
        PRIVATE_EXPERIMENTAL_ALGORITHM_06(106),
        PRIVATE_EXPERIMENTAL_ALGORITHM_07(107),
        PRIVATE_EXPERIMENTAL_ALGORITHM_08(108),
        PRIVATE_EXPERIMENTAL_ALGORITHM_09(109),
        PRIVATE_EXPERIMENTAL_ALGORITHM_10(110);

        private final long id;
        PublicKeyAlgorithms(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PublicKeyAlgorithms> byId = new HashMap<Long, PublicKeyAlgorithms>(20);
        static {
            for (PublicKeyAlgorithms e : PublicKeyAlgorithms.values())
                byId.put(e.id(), e);
        }
        public static PublicKeyAlgorithms byId(long id) { return byId.get(id); }
    }

    public enum RevocationCodes {
        NO_REASON_SPECIFIED_KEY_REVOCATIONS_OR_CERT_REVOCATIONS(0),
        KEY_IS_SUPERSEDED_KEY_REVOCATIONS(1),
        KEY_MATERIAL_HAS_BEEN_COMPROMISED_KEY_REVOCATIONS(2),
        KEY_IS_RETIRED_AND_NO_LONGER_USED_KEY_REVOCATIONS(3),
        USER_ID_INFORMATION_IS_NO_LONGER_VALID_CERT_REVOCATIONS(32),
        PRIVATE_USE_1(100),
        PRIVATE_USE_2(101),
        PRIVATE_USE_3(102),
        PRIVATE_USE_4(103),
        PRIVATE_USE_11(110);

        private final long id;
        RevocationCodes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, RevocationCodes> byId = new HashMap<Long, RevocationCodes>(10);
        static {
            for (RevocationCodes e : RevocationCodes.values())
                byId.put(e.id(), e);
        }
        public static RevocationCodes byId(long id) { return byId.get(id); }
    }

    public enum ServerFlags {
        NO_MODIFY(128);

        private final long id;
        ServerFlags(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ServerFlags> byId = new HashMap<Long, ServerFlags>(1);
        static {
            for (ServerFlags e : ServerFlags.values())
                byId.put(e.id(), e);
        }
        public static ServerFlags byId(long id) { return byId.get(id); }
    }

    public enum SubpacketTypes {
        RESERVED0(0),
        RESERVED1(1),
        SIGNATURE_CREATION_TIME(2),
        SIGNATURE_EXPIRATION_TIME(3),
        EXPORTABLE_CERTIFICATION(4),
        TRUST_SIGNATURE(5),
        REGULAR_EXPRESSION(6),
        REVOCABLE(7),
        RESERVED8(8),
        KEY_EXPIRATION_TIME(9),
        PLACEHOLDER_FOR_BACKWARD_COMPATIBILITY(10),
        PREFERRED_SYMMETRIC_ALGORITHMS(11),
        REVOCATION_KEY(12),
        RESERVED13(13),
        RESERVED14(14),
        RESERVED15(15),
        ISSUER(16),
        RESERVED17(17),
        RESERVED18(18),
        RESERVED19(19),
        NOTATION_DATA(20),
        PREFERRED_HASH_ALGORITHMS(21),
        PREFERRED_COMPRESSION_ALGORITHMS(22),
        KEY_SERVER_PREFERENCES(23),
        PREFERRED_KEY_SERVER(24),
        PRIMARY_USER_ID(25),
        POLICY_URI(26),
        KEY_FLAGS(27),
        SIGNERS_USER_ID(28),
        REASON_FOR_REVOCATION(29),
        FEATURES(30),
        SIGNATURE_TARGET(31),
        EMBEDDED_SIGNATURE(32);

        private final long id;
        SubpacketTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SubpacketTypes> byId = new HashMap<Long, SubpacketTypes>(33);
        static {
            for (SubpacketTypes e : SubpacketTypes.values())
                byId.put(e.id(), e);
        }
        public static SubpacketTypes byId(long id) { return byId.get(id); }
    }

    public enum SymmetricKeyAlgorithm {
        PLAIN(0),
        IDEA(1),
        TRIPLE_DES(2),
        CAST5(3),
        BLOWFISCH(4),
        RESERVED5(5),
        RESERVED6(6),
        AES_128(7),
        AES_192(8),
        AES_256(9),
        TWOFISH_256(10),
        PRIVATE_EXPERIMENTAL_ALGORITHM_00(100),
        PRIVATE_EXPERIMENTAL_ALGORITHM_01(101),
        PRIVATE_EXPERIMENTAL_ALGORITHM_02(102),
        PRIVATE_EXPERIMENTAL_ALGORITHM_03(103),
        PRIVATE_EXPERIMENTAL_ALGORITHM_04(104),
        PRIVATE_EXPERIMENTAL_ALGORITHM_05(105),
        PRIVATE_EXPERIMENTAL_ALGORITHM_06(106),
        PRIVATE_EXPERIMENTAL_ALGORITHM_07(107),
        PRIVATE_EXPERIMENTAL_ALGORITHM_08(108),
        PRIVATE_EXPERIMENTAL_ALGORITHM_09(109),
        PRIVATE_EXPERIMENTAL_ALGORITHM_10(110);

        private final long id;
        SymmetricKeyAlgorithm(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SymmetricKeyAlgorithm> byId = new HashMap<Long, SymmetricKeyAlgorithm>(22);
        static {
            for (SymmetricKeyAlgorithm e : SymmetricKeyAlgorithm.values())
                byId.put(e.id(), e);
        }
        public static SymmetricKeyAlgorithm byId(long id) { return byId.get(id); }
    }
    public OpenpgpMessage() {
        this(null, null, null);
    }

    public OpenpgpMessage(KaitaiStream _io) {
        this(_io, null, null);
    }

    public OpenpgpMessage(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public OpenpgpMessage(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, OpenpgpMessage _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.packets = new ArrayList<Packet>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Packet _t_packets = new Packet(this._io, this, _root);
                try {
                    _t_packets._read();
                } finally {
                    this.packets.add(_t_packets);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.packets.size(); i++) {
            this.packets.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.packets.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("packets", 0, this._io.size() - this._io.pos());
            this.packets.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("packets", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.packets.size(); i++) {
            if (!Objects.equals(this.packets.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("packets", _root(), this.packets.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.packets.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("packets", this, this.packets.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class EmbeddedSignature extends KaitaiStruct.ReadWrite {
        public static EmbeddedSignature fromFile(String fileName) throws IOException {
            return new EmbeddedSignature(new ByteBufferKaitaiStream(fileName));
        }
        public EmbeddedSignature() {
            this(null, null, null);
        }

        public EmbeddedSignature(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EmbeddedSignature(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public EmbeddedSignature(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.signaturePacket = new SignaturePacket(this._io, this, _root);
            this.signaturePacket._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.signaturePacket._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.signaturePacket._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.signaturePacket._root(), _root()))
                throw new ConsistencyError("signature_packet", _root(), this.signaturePacket._root());
            if (!Objects.equals(this.signaturePacket._parent(), this))
                throw new ConsistencyError("signature_packet", this, this.signaturePacket._parent());
            _dirty = false;
        }
        private SignaturePacket signaturePacket;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public SignaturePacket signaturePacket() { return signaturePacket; }
        public void setSignaturePacket(SignaturePacket _v) { _dirty = true; signaturePacket = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class ExportableCertification extends KaitaiStruct.ReadWrite {
        public static ExportableCertification fromFile(String fileName) throws IOException {
            return new ExportableCertification(new ByteBufferKaitaiStream(fileName));
        }
        public ExportableCertification() {
            this(null, null, null);
        }

        public ExportableCertification(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExportableCertification(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public ExportableCertification(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.exportable = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.exportable);
        }

        public void _check() {
            _dirty = false;
        }
        private int exportable;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public int exportable() { return exportable; }
        public void setExportable(int _v) { _dirty = true; exportable = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class Features extends KaitaiStruct.ReadWrite {
        public static Features fromFile(String fileName) throws IOException {
            return new Features(new ByteBufferKaitaiStream(fileName));
        }
        public Features() {
            this(null, null, null);
        }

        public Features(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Features(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public Features(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.flags = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.flags);
            if (!(this._io.isEof()))
                throw new ConsistencyError("flags", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private byte[] flags;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public byte[] flags() { return flags; }
        public void setFlags(byte[] _v) { _dirty = true; flags = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class Issuer extends KaitaiStruct.ReadWrite {
        public static Issuer fromFile(String fileName) throws IOException {
            return new Issuer(new ByteBufferKaitaiStream(fileName));
        }
        public Issuer() {
            this(null, null, null);
        }

        public Issuer(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Issuer(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public Issuer(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.keyid = this._io.readU8be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8be(this.keyid);
        }

        public void _check() {
            _dirty = false;
        }
        private long keyid;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public long keyid() { return keyid; }
        public void setKeyid(long _v) { _dirty = true; keyid = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class KeyExpirationTime extends KaitaiStruct.ReadWrite {
        public static KeyExpirationTime fromFile(String fileName) throws IOException {
            return new KeyExpirationTime(new ByteBufferKaitaiStream(fileName));
        }
        public KeyExpirationTime() {
            this(null, null, null);
        }

        public KeyExpirationTime(KaitaiStream _io) {
            this(_io, null, null);
        }

        public KeyExpirationTime(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public KeyExpirationTime(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.time = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.time);
        }

        public void _check() {
            _dirty = false;
        }
        private long time;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public long time() { return time; }
        public void setTime(long _v) { _dirty = true; time = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class KeyFlags extends KaitaiStruct.ReadWrite {
        public static KeyFlags fromFile(String fileName) throws IOException {
            return new KeyFlags(new ByteBufferKaitaiStream(fileName));
        }
        public KeyFlags() {
            this(null, null, null);
        }

        public KeyFlags(KaitaiStream _io) {
            this(_io, null, null);
        }

        public KeyFlags(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public KeyFlags(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.flag = new ArrayList<KeyFlags>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.flag.add(.byId(this._io.readU1()));
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.flag.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.flag.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("flag", 0, this._io.size() - this._io.pos());
                this._io.writeU1(((Number) (this.flag.get(((Number) (i)).intValue()).id())).intValue());
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("flag", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.flag.size(); i++) {
            }
            _dirty = false;
        }
        private List<KeyFlags> flag;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public List<KeyFlags> flag() { return flag; }
        public void setFlag(List<KeyFlags> _v) { _dirty = true; flag = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class KeyServerPreferences extends KaitaiStruct.ReadWrite {
        public static KeyServerPreferences fromFile(String fileName) throws IOException {
            return new KeyServerPreferences(new ByteBufferKaitaiStream(fileName));
        }
        public KeyServerPreferences() {
            this(null, null, null);
        }

        public KeyServerPreferences(KaitaiStream _io) {
            this(_io, null, null);
        }

        public KeyServerPreferences(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public KeyServerPreferences(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.flag = new ArrayList<ServerFlags>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.flag.add(OpenpgpMessage.ServerFlags.byId(this._io.readU1()));
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.flag.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.flag.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("flag", 0, this._io.size() - this._io.pos());
                this._io.writeU1(((Number) (this.flag.get(((Number) (i)).intValue()).id())).intValue());
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("flag", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.flag.size(); i++) {
            }
            _dirty = false;
        }
        private List<ServerFlags> flag;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public List<ServerFlags> flag() { return flag; }
        public void setFlag(List<ServerFlags> _v) { _dirty = true; flag = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class LenSubpacket extends KaitaiStruct.ReadWrite {
        public static LenSubpacket fromFile(String fileName) throws IOException {
            return new LenSubpacket(new ByteBufferKaitaiStream(fileName));
        }
        public LenSubpacket() {
            this(null, null, null);
        }

        public LenSubpacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LenSubpacket(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public LenSubpacket(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.firstOctet = this._io.readU1();
            if ( ((firstOctet() >= 192) && (firstOctet() < 255)) ) {
                this.secondOctet = this._io.readU1();
            }
            if (firstOctet() == 255) {
                this.scalar = this._io.readU4be();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if ( ((firstOctet() >= 192) && (firstOctet() < 255)) ) {
            }
            if (firstOctet() == 255) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.firstOctet);
            if ( ((firstOctet() >= 192) && (firstOctet() < 255)) ) {
                this._io.writeU1(this.secondOctet);
            }
            if (firstOctet() == 255) {
                this._io.writeU4be(this.scalar);
            }
        }

        public void _check() {
            if ( ((firstOctet() >= 192) && (firstOctet() < 255)) ) {
            }
            if (firstOctet() == 255) {
            }
            _dirty = false;
        }
        private Integer len;
        public Integer len() {
            if (this.len != null)
                return this.len;
            this.len = ((Number) ((firstOctet() < 192 ? firstOctet() : ( ((firstOctet() >= 192) && (firstOctet() < 255))  ? ((firstOctet() - 192 << 8) + secondOctet()) + 192 : scalar())))).intValue();
            return this.len;
        }
        public void _invalidateLen() { this.len = null; }
        private int firstOctet;
        private Integer secondOctet;
        private Long scalar;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public int firstOctet() { return firstOctet; }
        public void setFirstOctet(int _v) { _dirty = true; firstOctet = _v; }
        public Integer secondOctet() { return secondOctet; }
        public void setSecondOctet(Integer _v) { _dirty = true; secondOctet = _v; }
        public Long scalar() { return scalar; }
        public void setScalar(Long _v) { _dirty = true; scalar = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class NotationData extends KaitaiStruct.ReadWrite {
        public static NotationData fromFile(String fileName) throws IOException {
            return new NotationData(new ByteBufferKaitaiStream(fileName));
        }
        public NotationData() {
            this(null, null, null);
        }

        public NotationData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public NotationData(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public NotationData(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.flags = this._io.readBytes(4);
            this.lenName = this._io.readU2be();
            this.lenValue = this._io.readU2be();
            this.name = this._io.readBytes(lenName());
            this.value = this._io.readBytes(lenValue());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.flags);
            this._io.writeU2be(this.lenName);
            this._io.writeU2be(this.lenValue);
            this._io.writeBytes(this.name);
            this._io.writeBytes(this.value);
        }

        public void _check() {
            if (this.flags.length != 4)
                throw new ConsistencyError("flags", 4, this.flags.length);
            if (this.name.length != lenName())
                throw new ConsistencyError("name", lenName(), this.name.length);
            if (this.value.length != lenValue())
                throw new ConsistencyError("value", lenValue(), this.value.length);
            _dirty = false;
        }
        private byte[] flags;
        private int lenName;
        private int lenValue;
        private byte[] name;
        private byte[] value;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public byte[] flags() { return flags; }
        public void setFlags(byte[] _v) { _dirty = true; flags = _v; }
        public int lenName() { return lenName; }
        public void setLenName(int _v) { _dirty = true; lenName = _v; }
        public int lenValue() { return lenValue; }
        public void setLenValue(int _v) { _dirty = true; lenValue = _v; }
        public byte[] name() { return name; }
        public void setName(byte[] _v) { _dirty = true; name = _v; }
        public byte[] value() { return value; }
        public void setValue(byte[] _v) { _dirty = true; value = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class OldPacket extends KaitaiStruct.ReadWrite {
        public static OldPacket fromFile(String fileName) throws IOException {
            return new OldPacket(new ByteBufferKaitaiStream(fileName));
        }
        public OldPacket() {
            this(null, null, null);
        }

        public OldPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OldPacket(KaitaiStream _io, OpenpgpMessage.Packet _parent) {
            this(_io, _parent, null);
        }

        public OldPacket(KaitaiStream _io, OpenpgpMessage.Packet _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            switch (_parent().lenType()) {
            case 0: {
                this.len = ((Number) (this._io.readU1())).longValue();
                break;
            }
            case 1: {
                this.len = ((Number) (this._io.readU2be())).longValue();
                break;
            }
            case 2: {
                this.len = this._io.readU4be();
                break;
            }
            }
            {
                PacketTags on = _parent().packetTypeOld();
                if (on != null) {
                    switch (_parent().packetTypeOld()) {
                    case PUBLIC_KEY_PACKET: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new PublicKeyPacket(_io__raw_body, this, _root);
                        ((PublicKeyPacket) (this.body))._read();
                        break;
                    }
                    case PUBLIC_SUBKEY_PACKET: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new PublicKeyPacket(_io__raw_body, this, _root);
                        ((PublicKeyPacket) (this.body))._read();
                        break;
                    }
                    case SECRET_KEY_PACKET: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SecretKeyPacket(_io__raw_body, this, _root);
                        ((SecretKeyPacket) (this.body))._read();
                        break;
                    }
                    case SECRET_SUBKEY_PACKET: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new PublicKeyPacket(_io__raw_body, this, _root);
                        ((PublicKeyPacket) (this.body))._read();
                        break;
                    }
                    case SIGNATURE_PACKET: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SignaturePacket(_io__raw_body, this, _root);
                        ((SignaturePacket) (this.body))._read();
                        break;
                    }
                    case USER_ID_PACKET: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new UserIdPacket(_io__raw_body, this, _root);
                        ((UserIdPacket) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(len());
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes(len());
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (_parent().lenType()) {
            case 0: {
                break;
            }
            case 1: {
                break;
            }
            case 2: {
                break;
            }
            }
            {
                PacketTags on = _parent().packetTypeOld();
                if (on != null) {
                    switch (_parent().packetTypeOld()) {
                    case PUBLIC_KEY_PACKET: {
                        ((PublicKeyPacket) (this.body))._fetchInstances();
                        break;
                    }
                    case PUBLIC_SUBKEY_PACKET: {
                        ((PublicKeyPacket) (this.body))._fetchInstances();
                        break;
                    }
                    case SECRET_KEY_PACKET: {
                        ((SecretKeyPacket) (this.body))._fetchInstances();
                        break;
                    }
                    case SECRET_SUBKEY_PACKET: {
                        ((PublicKeyPacket) (this.body))._fetchInstances();
                        break;
                    }
                    case SIGNATURE_PACKET: {
                        ((SignaturePacket) (this.body))._fetchInstances();
                        break;
                    }
                    case USER_ID_PACKET: {
                        ((UserIdPacket) (this.body))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            switch (_parent().lenType()) {
            case 0: {
                this._io.writeU1(((Number) (this.len)).intValue());
                break;
            }
            case 1: {
                this._io.writeU2be(((Number) (this.len)).intValue());
                break;
            }
            case 2: {
                this._io.writeU4be(this.len);
                break;
            }
            }
            {
                PacketTags on = _parent().packetTypeOld();
                if (on != null) {
                    switch (_parent().packetTypeOld()) {
                    case PUBLIC_KEY_PACKET: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len()));
                            final OldPacket _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != len())
                                        throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((PublicKeyPacket) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case PUBLIC_SUBKEY_PACKET: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len()));
                            final OldPacket _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != len())
                                        throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((PublicKeyPacket) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SECRET_KEY_PACKET: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len()));
                            final OldPacket _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != len())
                                        throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SecretKeyPacket) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SECRET_SUBKEY_PACKET: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len()));
                            final OldPacket _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != len())
                                        throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((PublicKeyPacket) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SIGNATURE_PACKET: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len()));
                            final OldPacket _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != len())
                                        throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SignaturePacket) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case USER_ID_PACKET: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len()));
                            final OldPacket _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != len())
                                        throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((UserIdPacket) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                }
            }
        }

        public void _check() {
            switch (_parent().lenType()) {
            case 0: {
                break;
            }
            case 1: {
                break;
            }
            case 2: {
                break;
            }
            }
            {
                PacketTags on = _parent().packetTypeOld();
                if (on != null) {
                    switch (_parent().packetTypeOld()) {
                    case PUBLIC_KEY_PACKET: {
                        if (!Objects.equals(((OpenpgpMessage.PublicKeyPacket) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((OpenpgpMessage.PublicKeyPacket) (this.body))._root());
                        if (!Objects.equals(((OpenpgpMessage.PublicKeyPacket) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((OpenpgpMessage.PublicKeyPacket) (this.body))._parent());
                        break;
                    }
                    case PUBLIC_SUBKEY_PACKET: {
                        if (!Objects.equals(((OpenpgpMessage.PublicKeyPacket) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((OpenpgpMessage.PublicKeyPacket) (this.body))._root());
                        if (!Objects.equals(((OpenpgpMessage.PublicKeyPacket) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((OpenpgpMessage.PublicKeyPacket) (this.body))._parent());
                        break;
                    }
                    case SECRET_KEY_PACKET: {
                        if (!Objects.equals(((OpenpgpMessage.SecretKeyPacket) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((OpenpgpMessage.SecretKeyPacket) (this.body))._root());
                        if (!Objects.equals(((OpenpgpMessage.SecretKeyPacket) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((OpenpgpMessage.SecretKeyPacket) (this.body))._parent());
                        break;
                    }
                    case SECRET_SUBKEY_PACKET: {
                        if (!Objects.equals(((OpenpgpMessage.PublicKeyPacket) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((OpenpgpMessage.PublicKeyPacket) (this.body))._root());
                        if (!Objects.equals(((OpenpgpMessage.PublicKeyPacket) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((OpenpgpMessage.PublicKeyPacket) (this.body))._parent());
                        break;
                    }
                    case SIGNATURE_PACKET: {
                        if (!Objects.equals(((OpenpgpMessage.SignaturePacket) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((OpenpgpMessage.SignaturePacket) (this.body))._root());
                        if (!Objects.equals(((OpenpgpMessage.SignaturePacket) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((OpenpgpMessage.SignaturePacket) (this.body))._parent());
                        break;
                    }
                    case USER_ID_PACKET: {
                        if (!Objects.equals(((OpenpgpMessage.UserIdPacket) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((OpenpgpMessage.UserIdPacket) (this.body))._root());
                        if (!Objects.equals(((OpenpgpMessage.UserIdPacket) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((OpenpgpMessage.UserIdPacket) (this.body))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.body)).length != len())
                            throw new ConsistencyError("body", len(), ((byte[]) (this.body)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.body)).length != len())
                        throw new ConsistencyError("body", len(), ((byte[]) (this.body)).length);
                }
            }
            _dirty = false;
        }
        private Long len;
        private Object body;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Packet _parent;
        private byte[] _raw_body;
        public Long len() { return len; }
        public void setLen(Long _v) { _dirty = true; len = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Packet _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Packet _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class Packet extends KaitaiStruct.ReadWrite {
        public static Packet fromFile(String fileName) throws IOException {
            return new Packet(new ByteBufferKaitaiStream(fileName));
        }
        public Packet() {
            this(null, null, null);
        }

        public Packet(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Packet(KaitaiStream _io, OpenpgpMessage _parent) {
            this(_io, _parent, null);
        }

        public Packet(KaitaiStream _io, OpenpgpMessage _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.one = this._io.readBitsIntBe(1) != 0;
            this.newPacketFormat = this._io.readBitsIntBe(1) != 0;
            if (newPacketFormat()) {
                this.packetTypeNew = OpenpgpMessage.PacketTags.byId(this._io.readBitsIntBe(6));
            }
            if (!(newPacketFormat())) {
                this.packetTypeOld = OpenpgpMessage.PacketTags.byId(this._io.readBitsIntBe(4));
            }
            if (!(newPacketFormat())) {
                this.lenType = this._io.readBitsIntBe(2);
            }
            {
                boolean on = newPacketFormat();
                if (on == false) {
                    this.body = new OldPacket(this._io, this, _root);
                    this.body._read();
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (newPacketFormat()) {
            }
            if (!(newPacketFormat())) {
            }
            if (!(newPacketFormat())) {
            }
            {
                boolean on = newPacketFormat();
                if (on == false) {
                    this.body._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.one ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.newPacketFormat ? 1 : 0));
            if (newPacketFormat()) {
                this._io.writeBitsIntBe(6, ((Number) (this.packetTypeNew.id())).longValue());
            }
            if (!(newPacketFormat())) {
                this._io.writeBitsIntBe(4, ((Number) (this.packetTypeOld.id())).longValue());
            }
            if (!(newPacketFormat())) {
                this._io.writeBitsIntBe(2, this.lenType);
            }
            {
                boolean on = newPacketFormat();
                if (on == false) {
                    this.body._write_Seq(this._io);
                }
            }
        }

        public void _check() {
            if (newPacketFormat()) {
            }
            if (!(newPacketFormat())) {
            }
            if (!(newPacketFormat())) {
            }
            {
                boolean on = newPacketFormat();
                if (on == false) {
                    if (!Objects.equals(this.body._root(), _root()))
                        throw new ConsistencyError("body", _root(), this.body._root());
                    if (!Objects.equals(this.body._parent(), this))
                        throw new ConsistencyError("body", this, this.body._parent());
                }
            }
            _dirty = false;
        }
        private boolean one;
        private boolean newPacketFormat;
        private PacketTags packetTypeNew;
        private PacketTags packetTypeOld;
        private Long lenType;
        private OldPacket body;
        private OpenpgpMessage _root;
        private OpenpgpMessage _parent;
        public boolean one() { return one; }
        public void setOne(boolean _v) { _dirty = true; one = _v; }
        public boolean newPacketFormat() { return newPacketFormat; }
        public void setNewPacketFormat(boolean _v) { _dirty = true; newPacketFormat = _v; }
        public PacketTags packetTypeNew() { return packetTypeNew; }
        public void setPacketTypeNew(PacketTags _v) { _dirty = true; packetTypeNew = _v; }
        public PacketTags packetTypeOld() { return packetTypeOld; }
        public void setPacketTypeOld(PacketTags _v) { _dirty = true; packetTypeOld = _v; }
        public Long lenType() { return lenType; }
        public void setLenType(Long _v) { _dirty = true; lenType = _v; }
        public OldPacket body() { return body; }
        public void setBody(OldPacket _v) { _dirty = true; body = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage _parent() { return _parent; }
        public void set_parent(OpenpgpMessage _v) { _dirty = true; _parent = _v; }
    }
    public static class PolicyUri extends KaitaiStruct.ReadWrite {
        public static PolicyUri fromFile(String fileName) throws IOException {
            return new PolicyUri(new ByteBufferKaitaiStream(fileName));
        }
        public PolicyUri() {
            this(null, null, null);
        }

        public PolicyUri(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PolicyUri(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public PolicyUri(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.uri = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.uri).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("uri", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private String uri;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public String uri() { return uri; }
        public void setUri(String _v) { _dirty = true; uri = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class PreferredCompressionAlgorithms extends KaitaiStruct.ReadWrite {
        public static PreferredCompressionAlgorithms fromFile(String fileName) throws IOException {
            return new PreferredCompressionAlgorithms(new ByteBufferKaitaiStream(fileName));
        }
        public PreferredCompressionAlgorithms() {
            this(null, null, null);
        }

        public PreferredCompressionAlgorithms(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PreferredCompressionAlgorithms(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public PreferredCompressionAlgorithms(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.algorithm = new ArrayList<CompressionAlgorithms>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.algorithm.add(OpenpgpMessage.CompressionAlgorithms.byId(this._io.readU1()));
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.algorithm.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.algorithm.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("algorithm", 0, this._io.size() - this._io.pos());
                this._io.writeU1(((Number) (this.algorithm.get(((Number) (i)).intValue()).id())).intValue());
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("algorithm", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.algorithm.size(); i++) {
            }
            _dirty = false;
        }
        private List<CompressionAlgorithms> algorithm;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public List<CompressionAlgorithms> algorithm() { return algorithm; }
        public void setAlgorithm(List<CompressionAlgorithms> _v) { _dirty = true; algorithm = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class PreferredHashAlgorithms extends KaitaiStruct.ReadWrite {
        public static PreferredHashAlgorithms fromFile(String fileName) throws IOException {
            return new PreferredHashAlgorithms(new ByteBufferKaitaiStream(fileName));
        }
        public PreferredHashAlgorithms() {
            this(null, null, null);
        }

        public PreferredHashAlgorithms(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PreferredHashAlgorithms(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public PreferredHashAlgorithms(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.algorithm = new ArrayList<HashAlgorithms>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.algorithm.add(OpenpgpMessage.HashAlgorithms.byId(this._io.readU1()));
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.algorithm.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.algorithm.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("algorithm", 0, this._io.size() - this._io.pos());
                this._io.writeU1(((Number) (this.algorithm.get(((Number) (i)).intValue()).id())).intValue());
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("algorithm", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.algorithm.size(); i++) {
            }
            _dirty = false;
        }
        private List<HashAlgorithms> algorithm;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public List<HashAlgorithms> algorithm() { return algorithm; }
        public void setAlgorithm(List<HashAlgorithms> _v) { _dirty = true; algorithm = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class PreferredKeyServer extends KaitaiStruct.ReadWrite {
        public static PreferredKeyServer fromFile(String fileName) throws IOException {
            return new PreferredKeyServer(new ByteBufferKaitaiStream(fileName));
        }
        public PreferredKeyServer() {
            this(null, null, null);
        }

        public PreferredKeyServer(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PreferredKeyServer(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public PreferredKeyServer(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.uri = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.uri).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("uri", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private String uri;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public String uri() { return uri; }
        public void setUri(String _v) { _dirty = true; uri = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class PrimaryUserId extends KaitaiStruct.ReadWrite {
        public static PrimaryUserId fromFile(String fileName) throws IOException {
            return new PrimaryUserId(new ByteBufferKaitaiStream(fileName));
        }
        public PrimaryUserId() {
            this(null, null, null);
        }

        public PrimaryUserId(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PrimaryUserId(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public PrimaryUserId(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.userId = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.userId);
        }

        public void _check() {
            _dirty = false;
        }
        private int userId;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public int userId() { return userId; }
        public void setUserId(int _v) { _dirty = true; userId = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class PublicKeyPacket extends KaitaiStruct.ReadWrite {
        public static PublicKeyPacket fromFile(String fileName) throws IOException {
            return new PublicKeyPacket(new ByteBufferKaitaiStream(fileName));
        }
        public PublicKeyPacket() {
            this(null, null, null);
        }

        public PublicKeyPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PublicKeyPacket(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public PublicKeyPacket(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.version = this._io.readU1();
            this.timestamp = this._io.readU4be();
            this.publicKeyAlgorithm = OpenpgpMessage.PublicKeyAlgorithms.byId(this._io.readU1());
            this.lenAlg = this._io.readU2be();
            this.rsaN = this._io.readBytes(lenAlg() / 8);
            this.padding = this._io.readU2be();
            this.rsaE = this._io.readBytes(3);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.version);
            this._io.writeU4be(this.timestamp);
            this._io.writeU1(((Number) (this.publicKeyAlgorithm.id())).intValue());
            this._io.writeU2be(this.lenAlg);
            this._io.writeBytes(this.rsaN);
            this._io.writeU2be(this.padding);
            this._io.writeBytes(this.rsaE);
        }

        public void _check() {
            if (this.rsaN.length != lenAlg() / 8)
                throw new ConsistencyError("rsa_n", lenAlg() / 8, this.rsaN.length);
            if (this.rsaE.length != 3)
                throw new ConsistencyError("rsa_e", 3, this.rsaE.length);
            _dirty = false;
        }
        private int version;
        private long timestamp;
        private PublicKeyAlgorithms publicKeyAlgorithm;
        private int lenAlg;
        private byte[] rsaN;
        private int padding;
        private byte[] rsaE;
        private OpenpgpMessage _root;
        private KaitaiStruct.ReadWrite _parent;
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }
        public long timestamp() { return timestamp; }
        public void setTimestamp(long _v) { _dirty = true; timestamp = _v; }
        public PublicKeyAlgorithms publicKeyAlgorithm() { return publicKeyAlgorithm; }
        public void setPublicKeyAlgorithm(PublicKeyAlgorithms _v) { _dirty = true; publicKeyAlgorithm = _v; }
        public int lenAlg() { return lenAlg; }
        public void setLenAlg(int _v) { _dirty = true; lenAlg = _v; }
        public byte[] rsaN() { return rsaN; }
        public void setRsaN(byte[] _v) { _dirty = true; rsaN = _v; }
        public int padding() { return padding; }
        public void setPadding(int _v) { _dirty = true; padding = _v; }
        public byte[] rsaE() { return rsaE; }
        public void setRsaE(byte[] _v) { _dirty = true; rsaE = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class ReasonForRevocation extends KaitaiStruct.ReadWrite {
        public static ReasonForRevocation fromFile(String fileName) throws IOException {
            return new ReasonForRevocation(new ByteBufferKaitaiStream(fileName));
        }
        public ReasonForRevocation() {
            this(null, null, null);
        }

        public ReasonForRevocation(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ReasonForRevocation(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public ReasonForRevocation(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.revocationCode = OpenpgpMessage.RevocationCodes.byId(this._io.readU1());
            this.reason = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.revocationCode.id())).intValue());
            this._io.writeBytes((this.reason).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("reason", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private RevocationCodes revocationCode;
        private String reason;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public RevocationCodes revocationCode() { return revocationCode; }
        public void setRevocationCode(RevocationCodes _v) { _dirty = true; revocationCode = _v; }
        public String reason() { return reason; }
        public void setReason(String _v) { _dirty = true; reason = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class RegularExpression extends KaitaiStruct.ReadWrite {
        public static RegularExpression fromFile(String fileName) throws IOException {
            return new RegularExpression(new ByteBufferKaitaiStream(fileName));
        }
        public RegularExpression() {
            this(null, null, null);
        }

        public RegularExpression(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RegularExpression(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public RegularExpression(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.regex = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.regex).getBytes(Charset.forName("UTF-8")));
            this._io.writeU1(0);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.regex).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("regex", -1, KaitaiStream.byteArrayIndexOf((this.regex).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            _dirty = false;
        }
        private String regex;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public String regex() { return regex; }
        public void setRegex(String _v) { _dirty = true; regex = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class Revocable extends KaitaiStruct.ReadWrite {
        public static Revocable fromFile(String fileName) throws IOException {
            return new Revocable(new ByteBufferKaitaiStream(fileName));
        }
        public Revocable() {
            this(null, null, null);
        }

        public Revocable(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Revocable(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public Revocable(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.revocable = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.revocable);
        }

        public void _check() {
            _dirty = false;
        }
        private int revocable;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public int revocable() { return revocable; }
        public void setRevocable(int _v) { _dirty = true; revocable = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class RevocationKey extends KaitaiStruct.ReadWrite {
        public static RevocationKey fromFile(String fileName) throws IOException {
            return new RevocationKey(new ByteBufferKaitaiStream(fileName));
        }
        public RevocationKey() {
            this(null, null, null);
        }

        public RevocationKey(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RevocationKey(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public RevocationKey(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.class = this._io.readU1();
            this.publicKeyAlgorithm = OpenpgpMessage.PublicKeyAlgorithms.byId(this._io.readU1());
            this.fingerprint = this._io.readBytes(20);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.class);
            this._io.writeU1(((Number) (this.publicKeyAlgorithm.id())).intValue());
            this._io.writeBytes(this.fingerprint);
        }

        public void _check() {
            if (this.fingerprint.length != 20)
                throw new ConsistencyError("fingerprint", 20, this.fingerprint.length);
            _dirty = false;
        }
        private int class;
        private PublicKeyAlgorithms publicKeyAlgorithm;
        private byte[] fingerprint;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public int class() { return class; }
        public void setClass(int _v) { _dirty = true; class = _v; }
        public PublicKeyAlgorithms publicKeyAlgorithm() { return publicKeyAlgorithm; }
        public void setPublicKeyAlgorithm(PublicKeyAlgorithms _v) { _dirty = true; publicKeyAlgorithm = _v; }
        public byte[] fingerprint() { return fingerprint; }
        public void setFingerprint(byte[] _v) { _dirty = true; fingerprint = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class SecretKeyPacket extends KaitaiStruct.ReadWrite {
        public static SecretKeyPacket fromFile(String fileName) throws IOException {
            return new SecretKeyPacket(new ByteBufferKaitaiStream(fileName));
        }
        public SecretKeyPacket() {
            this(null, null, null);
        }

        public SecretKeyPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SecretKeyPacket(KaitaiStream _io, OpenpgpMessage.OldPacket _parent) {
            this(_io, _parent, null);
        }

        public SecretKeyPacket(KaitaiStream _io, OpenpgpMessage.OldPacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.publicKey = new PublicKeyPacket(this._io, this, _root);
            this.publicKey._read();
            this.stringToKey = this._io.readU1();
            if (stringToKey() >= 254) {
                this.symmetricEncryptionAlgorithm = OpenpgpMessage.SymmetricKeyAlgorithm.byId(this._io.readU1());
            }
            this.secretKey = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.publicKey._fetchInstances();
            if (stringToKey() >= 254) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.publicKey._write_Seq(this._io);
            this._io.writeU1(this.stringToKey);
            if (stringToKey() >= 254) {
                this._io.writeU1(((Number) (this.symmetricEncryptionAlgorithm.id())).intValue());
            }
            this._io.writeBytes(this.secretKey);
            if (!(this._io.isEof()))
                throw new ConsistencyError("secret_key", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (!Objects.equals(this.publicKey._root(), _root()))
                throw new ConsistencyError("public_key", _root(), this.publicKey._root());
            if (!Objects.equals(this.publicKey._parent(), this))
                throw new ConsistencyError("public_key", this, this.publicKey._parent());
            if (stringToKey() >= 254) {
            }
            _dirty = false;
        }
        private PublicKeyPacket publicKey;
        private int stringToKey;
        private SymmetricKeyAlgorithm symmetricEncryptionAlgorithm;
        private byte[] secretKey;
        private OpenpgpMessage _root;
        private OpenpgpMessage.OldPacket _parent;
        public PublicKeyPacket publicKey() { return publicKey; }
        public void setPublicKey(PublicKeyPacket _v) { _dirty = true; publicKey = _v; }
        public int stringToKey() { return stringToKey; }
        public void setStringToKey(int _v) { _dirty = true; stringToKey = _v; }
        public SymmetricKeyAlgorithm symmetricEncryptionAlgorithm() { return symmetricEncryptionAlgorithm; }
        public void setSymmetricEncryptionAlgorithm(SymmetricKeyAlgorithm _v) { _dirty = true; symmetricEncryptionAlgorithm = _v; }
        public byte[] secretKey() { return secretKey; }
        public void setSecretKey(byte[] _v) { _dirty = true; secretKey = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.OldPacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.OldPacket _v) { _dirty = true; _parent = _v; }
    }
    public static class SignatureCreationTime extends KaitaiStruct.ReadWrite {
        public static SignatureCreationTime fromFile(String fileName) throws IOException {
            return new SignatureCreationTime(new ByteBufferKaitaiStream(fileName));
        }
        public SignatureCreationTime() {
            this(null, null, null);
        }

        public SignatureCreationTime(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SignatureCreationTime(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public SignatureCreationTime(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.time = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.time);
        }

        public void _check() {
            _dirty = false;
        }
        private long time;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public long time() { return time; }
        public void setTime(long _v) { _dirty = true; time = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class SignatureExpirationTime extends KaitaiStruct.ReadWrite {
        public static SignatureExpirationTime fromFile(String fileName) throws IOException {
            return new SignatureExpirationTime(new ByteBufferKaitaiStream(fileName));
        }
        public SignatureExpirationTime() {
            this(null, null, null);
        }

        public SignatureExpirationTime(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SignatureExpirationTime(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public SignatureExpirationTime(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.time = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.time);
        }

        public void _check() {
            _dirty = false;
        }
        private long time;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public long time() { return time; }
        public void setTime(long _v) { _dirty = true; time = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class SignaturePacket extends KaitaiStruct.ReadWrite {
        public static SignaturePacket fromFile(String fileName) throws IOException {
            return new SignaturePacket(new ByteBufferKaitaiStream(fileName));
        }
        public SignaturePacket() {
            this(null, null, null);
        }

        public SignaturePacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SignaturePacket(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public SignaturePacket(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.version = this._io.readU1();
            this.signatureType = this._io.readU1();
            this.publicKeyAlgorithm = OpenpgpMessage.PublicKeyAlgorithms.byId(this._io.readU1());
            this.hashAlgorithm = OpenpgpMessage.HashAlgorithms.byId(this._io.readU1());
            this.lenHashedSubpacket = this._io.readU2be();
            this._raw_hashedSubpackets = this._io.readBytes(lenHashedSubpacket());
            KaitaiStream _io__raw_hashedSubpackets = new ByteBufferKaitaiStream(this._raw_hashedSubpackets);
            this.hashedSubpackets = new Subpackets(_io__raw_hashedSubpackets, this, _root);
            this.hashedSubpackets._read();
            this.lenUnhashedSubpacket = this._io.readU2be();
            this._raw_unhashedSubpackets = this._io.readBytes(lenUnhashedSubpacket());
            KaitaiStream _io__raw_unhashedSubpackets = new ByteBufferKaitaiStream(this._raw_unhashedSubpackets);
            this.unhashedSubpackets = new Subpackets(_io__raw_unhashedSubpackets, this, _root);
            this.unhashedSubpackets._read();
            this.leftSignedHash = this._io.readU2be();
            this.rsaN = this._io.readU2be();
            this.signature = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.hashedSubpackets._fetchInstances();
            this.unhashedSubpackets._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.version);
            this._io.writeU1(this.signatureType);
            this._io.writeU1(((Number) (this.publicKeyAlgorithm.id())).intValue());
            this._io.writeU1(((Number) (this.hashAlgorithm.id())).intValue());
            this._io.writeU2be(this.lenHashedSubpacket);
            final KaitaiStream _io__raw_hashedSubpackets = new ByteBufferKaitaiStream(lenHashedSubpacket());
            this._io.addChildStream(_io__raw_hashedSubpackets);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenHashedSubpacket()));
                final SignaturePacket _this = this;
                _io__raw_hashedSubpackets.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_hashedSubpackets = _io__raw_hashedSubpackets.toByteArray();
                        if (_this._raw_hashedSubpackets.length != lenHashedSubpacket())
                            throw new ConsistencyError("raw(hashed_subpackets)", lenHashedSubpacket(), _this._raw_hashedSubpackets.length);
                        parent.writeBytes(_this._raw_hashedSubpackets);
                    }
                });
            }
            this.hashedSubpackets._write_Seq(_io__raw_hashedSubpackets);
            this._io.writeU2be(this.lenUnhashedSubpacket);
            final KaitaiStream _io__raw_unhashedSubpackets = new ByteBufferKaitaiStream(lenUnhashedSubpacket());
            this._io.addChildStream(_io__raw_unhashedSubpackets);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenUnhashedSubpacket()));
                final SignaturePacket _this = this;
                _io__raw_unhashedSubpackets.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_unhashedSubpackets = _io__raw_unhashedSubpackets.toByteArray();
                        if (_this._raw_unhashedSubpackets.length != lenUnhashedSubpacket())
                            throw new ConsistencyError("raw(unhashed_subpackets)", lenUnhashedSubpacket(), _this._raw_unhashedSubpackets.length);
                        parent.writeBytes(_this._raw_unhashedSubpackets);
                    }
                });
            }
            this.unhashedSubpackets._write_Seq(_io__raw_unhashedSubpackets);
            this._io.writeU2be(this.leftSignedHash);
            this._io.writeU2be(this.rsaN);
            this._io.writeBytes(this.signature);
            if (!(this._io.isEof()))
                throw new ConsistencyError("signature", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (!Objects.equals(this.hashedSubpackets._root(), _root()))
                throw new ConsistencyError("hashed_subpackets", _root(), this.hashedSubpackets._root());
            if (!Objects.equals(this.hashedSubpackets._parent(), this))
                throw new ConsistencyError("hashed_subpackets", this, this.hashedSubpackets._parent());
            if (!Objects.equals(this.unhashedSubpackets._root(), _root()))
                throw new ConsistencyError("unhashed_subpackets", _root(), this.unhashedSubpackets._root());
            if (!Objects.equals(this.unhashedSubpackets._parent(), this))
                throw new ConsistencyError("unhashed_subpackets", this, this.unhashedSubpackets._parent());
            _dirty = false;
        }
        private int version;
        private int signatureType;
        private PublicKeyAlgorithms publicKeyAlgorithm;
        private HashAlgorithms hashAlgorithm;
        private int lenHashedSubpacket;
        private Subpackets hashedSubpackets;
        private int lenUnhashedSubpacket;
        private Subpackets unhashedSubpackets;
        private int leftSignedHash;
        private int rsaN;
        private byte[] signature;
        private OpenpgpMessage _root;
        private KaitaiStruct.ReadWrite _parent;
        private byte[] _raw_hashedSubpackets;
        private byte[] _raw_unhashedSubpackets;
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }
        public int signatureType() { return signatureType; }
        public void setSignatureType(int _v) { _dirty = true; signatureType = _v; }
        public PublicKeyAlgorithms publicKeyAlgorithm() { return publicKeyAlgorithm; }
        public void setPublicKeyAlgorithm(PublicKeyAlgorithms _v) { _dirty = true; publicKeyAlgorithm = _v; }
        public HashAlgorithms hashAlgorithm() { return hashAlgorithm; }
        public void setHashAlgorithm(HashAlgorithms _v) { _dirty = true; hashAlgorithm = _v; }
        public int lenHashedSubpacket() { return lenHashedSubpacket; }
        public void setLenHashedSubpacket(int _v) { _dirty = true; lenHashedSubpacket = _v; }
        public Subpackets hashedSubpackets() { return hashedSubpackets; }
        public void setHashedSubpackets(Subpackets _v) { _dirty = true; hashedSubpackets = _v; }
        public int lenUnhashedSubpacket() { return lenUnhashedSubpacket; }
        public void setLenUnhashedSubpacket(int _v) { _dirty = true; lenUnhashedSubpacket = _v; }
        public Subpackets unhashedSubpackets() { return unhashedSubpackets; }
        public void setUnhashedSubpackets(Subpackets _v) { _dirty = true; unhashedSubpackets = _v; }
        public int leftSignedHash() { return leftSignedHash; }
        public void setLeftSignedHash(int _v) { _dirty = true; leftSignedHash = _v; }
        public int rsaN() { return rsaN; }
        public void setRsaN(int _v) { _dirty = true; rsaN = _v; }
        public byte[] signature() { return signature; }
        public void setSignature(byte[] _v) { _dirty = true; signature = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_hashedSubpackets() { return _raw_hashedSubpackets; }
        public void set_raw_HashedSubpackets(byte[] _v) { _dirty = true; _raw_hashedSubpackets = _v; }
        public byte[] _raw_unhashedSubpackets() { return _raw_unhashedSubpackets; }
        public void set_raw_UnhashedSubpackets(byte[] _v) { _dirty = true; _raw_unhashedSubpackets = _v; }
    }
    public static class SignatureTarget extends KaitaiStruct.ReadWrite {
        public static SignatureTarget fromFile(String fileName) throws IOException {
            return new SignatureTarget(new ByteBufferKaitaiStream(fileName));
        }
        public SignatureTarget() {
            this(null, null, null);
        }

        public SignatureTarget(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SignatureTarget(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public SignatureTarget(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.publicKeyAlgorithm = OpenpgpMessage.PublicKeyAlgorithms.byId(this._io.readU1());
            this.hashAlgorithm = OpenpgpMessage.HashAlgorithms.byId(this._io.readU1());
            this.hash = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.publicKeyAlgorithm.id())).intValue());
            this._io.writeU1(((Number) (this.hashAlgorithm.id())).intValue());
            this._io.writeBytes(this.hash);
            if (!(this._io.isEof()))
                throw new ConsistencyError("hash", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private PublicKeyAlgorithms publicKeyAlgorithm;
        private HashAlgorithms hashAlgorithm;
        private byte[] hash;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public PublicKeyAlgorithms publicKeyAlgorithm() { return publicKeyAlgorithm; }
        public void setPublicKeyAlgorithm(PublicKeyAlgorithms _v) { _dirty = true; publicKeyAlgorithm = _v; }
        public HashAlgorithms hashAlgorithm() { return hashAlgorithm; }
        public void setHashAlgorithm(HashAlgorithms _v) { _dirty = true; hashAlgorithm = _v; }
        public byte[] hash() { return hash; }
        public void setHash(byte[] _v) { _dirty = true; hash = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class SignersUserId extends KaitaiStruct.ReadWrite {
        public static SignersUserId fromFile(String fileName) throws IOException {
            return new SignersUserId(new ByteBufferKaitaiStream(fileName));
        }
        public SignersUserId() {
            this(null, null, null);
        }

        public SignersUserId(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SignersUserId(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public SignersUserId(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.userId = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.userId).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("user_id", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private String userId;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public String userId() { return userId; }
        public void setUserId(String _v) { _dirty = true; userId = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class Subpacket extends KaitaiStruct.ReadWrite {
        public static Subpacket fromFile(String fileName) throws IOException {
            return new Subpacket(new ByteBufferKaitaiStream(fileName));
        }
        public Subpacket() {
            this(null, null, null);
        }

        public Subpacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Subpacket(KaitaiStream _io, OpenpgpMessage.Subpackets _parent) {
            this(_io, _parent, null);
        }

        public Subpacket(KaitaiStream _io, OpenpgpMessage.Subpackets _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = new LenSubpacket(this._io, this, _root);
            this.len._read();
            this.subpacketType = OpenpgpMessage.SubpacketTypes.byId(this._io.readU1());
            {
                SubpacketTypes on = subpacketType();
                if (on != null) {
                    switch (subpacketType()) {
                    case EMBEDDED_SIGNATURE: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new EmbeddedSignature(_io__raw_content, this, _root);
                        ((EmbeddedSignature) (this.content))._read();
                        break;
                    }
                    case EXPORTABLE_CERTIFICATION: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new ExportableCertification(_io__raw_content, this, _root);
                        ((ExportableCertification) (this.content))._read();
                        break;
                    }
                    case FEATURES: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new Features(_io__raw_content, this, _root);
                        ((Features) (this.content))._read();
                        break;
                    }
                    case ISSUER: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new Issuer(_io__raw_content, this, _root);
                        ((Issuer) (this.content))._read();
                        break;
                    }
                    case KEY_EXPIRATION_TIME: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new KeyExpirationTime(_io__raw_content, this, _root);
                        ((KeyExpirationTime) (this.content))._read();
                        break;
                    }
                    case KEY_FLAGS: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new KeyFlags(_io__raw_content, this, _root);
                        ((KeyFlags) (this.content))._read();
                        break;
                    }
                    case KEY_SERVER_PREFERENCES: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new KeyServerPreferences(_io__raw_content, this, _root);
                        ((KeyServerPreferences) (this.content))._read();
                        break;
                    }
                    case NOTATION_DATA: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new NotationData(_io__raw_content, this, _root);
                        ((NotationData) (this.content))._read();
                        break;
                    }
                    case POLICY_URI: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new PolicyUri(_io__raw_content, this, _root);
                        ((PolicyUri) (this.content))._read();
                        break;
                    }
                    case PREFERRED_COMPRESSION_ALGORITHMS: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new PreferredCompressionAlgorithms(_io__raw_content, this, _root);
                        ((PreferredCompressionAlgorithms) (this.content))._read();
                        break;
                    }
                    case PREFERRED_HASH_ALGORITHMS: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new PreferredHashAlgorithms(_io__raw_content, this, _root);
                        ((PreferredHashAlgorithms) (this.content))._read();
                        break;
                    }
                    case PREFERRED_KEY_SERVER: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new PreferredKeyServer(_io__raw_content, this, _root);
                        ((PreferredKeyServer) (this.content))._read();
                        break;
                    }
                    case PRIMARY_USER_ID: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new PrimaryUserId(_io__raw_content, this, _root);
                        ((PrimaryUserId) (this.content))._read();
                        break;
                    }
                    case REASON_FOR_REVOCATION: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new ReasonForRevocation(_io__raw_content, this, _root);
                        ((ReasonForRevocation) (this.content))._read();
                        break;
                    }
                    case REGULAR_EXPRESSION: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new RegularExpression(_io__raw_content, this, _root);
                        ((RegularExpression) (this.content))._read();
                        break;
                    }
                    case REVOCABLE: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new Revocable(_io__raw_content, this, _root);
                        ((Revocable) (this.content))._read();
                        break;
                    }
                    case REVOCATION_KEY: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new RevocationKey(_io__raw_content, this, _root);
                        ((RevocationKey) (this.content))._read();
                        break;
                    }
                    case SIGNATURE_CREATION_TIME: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new SignatureCreationTime(_io__raw_content, this, _root);
                        ((SignatureCreationTime) (this.content))._read();
                        break;
                    }
                    case SIGNATURE_EXPIRATION_TIME: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new SignatureExpirationTime(_io__raw_content, this, _root);
                        ((SignatureExpirationTime) (this.content))._read();
                        break;
                    }
                    case SIGNATURE_TARGET: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new SignatureTarget(_io__raw_content, this, _root);
                        ((SignatureTarget) (this.content))._read();
                        break;
                    }
                    case SIGNERS_USER_ID: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new SignersUserId(_io__raw_content, this, _root);
                        ((SignersUserId) (this.content))._read();
                        break;
                    }
                    case TRUST_SIGNATURE: {
                        this._raw_content = this._io.readBytes(len().len() - 1);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new TrustSignature(_io__raw_content, this, _root);
                        ((TrustSignature) (this.content))._read();
                        break;
                    }
                    default: {
                        this.content = this._io.readBytes(len().len() - 1);
                        break;
                    }
                    }
                } else {
                    this.content = this._io.readBytes(len().len() - 1);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.len._fetchInstances();
            {
                SubpacketTypes on = subpacketType();
                if (on != null) {
                    switch (subpacketType()) {
                    case EMBEDDED_SIGNATURE: {
                        ((EmbeddedSignature) (this.content))._fetchInstances();
                        break;
                    }
                    case EXPORTABLE_CERTIFICATION: {
                        ((ExportableCertification) (this.content))._fetchInstances();
                        break;
                    }
                    case FEATURES: {
                        ((Features) (this.content))._fetchInstances();
                        break;
                    }
                    case ISSUER: {
                        ((Issuer) (this.content))._fetchInstances();
                        break;
                    }
                    case KEY_EXPIRATION_TIME: {
                        ((KeyExpirationTime) (this.content))._fetchInstances();
                        break;
                    }
                    case KEY_FLAGS: {
                        ((KeyFlags) (this.content))._fetchInstances();
                        break;
                    }
                    case KEY_SERVER_PREFERENCES: {
                        ((KeyServerPreferences) (this.content))._fetchInstances();
                        break;
                    }
                    case NOTATION_DATA: {
                        ((NotationData) (this.content))._fetchInstances();
                        break;
                    }
                    case POLICY_URI: {
                        ((PolicyUri) (this.content))._fetchInstances();
                        break;
                    }
                    case PREFERRED_COMPRESSION_ALGORITHMS: {
                        ((PreferredCompressionAlgorithms) (this.content))._fetchInstances();
                        break;
                    }
                    case PREFERRED_HASH_ALGORITHMS: {
                        ((PreferredHashAlgorithms) (this.content))._fetchInstances();
                        break;
                    }
                    case PREFERRED_KEY_SERVER: {
                        ((PreferredKeyServer) (this.content))._fetchInstances();
                        break;
                    }
                    case PRIMARY_USER_ID: {
                        ((PrimaryUserId) (this.content))._fetchInstances();
                        break;
                    }
                    case REASON_FOR_REVOCATION: {
                        ((ReasonForRevocation) (this.content))._fetchInstances();
                        break;
                    }
                    case REGULAR_EXPRESSION: {
                        ((RegularExpression) (this.content))._fetchInstances();
                        break;
                    }
                    case REVOCABLE: {
                        ((Revocable) (this.content))._fetchInstances();
                        break;
                    }
                    case REVOCATION_KEY: {
                        ((RevocationKey) (this.content))._fetchInstances();
                        break;
                    }
                    case SIGNATURE_CREATION_TIME: {
                        ((SignatureCreationTime) (this.content))._fetchInstances();
                        break;
                    }
                    case SIGNATURE_EXPIRATION_TIME: {
                        ((SignatureExpirationTime) (this.content))._fetchInstances();
                        break;
                    }
                    case SIGNATURE_TARGET: {
                        ((SignatureTarget) (this.content))._fetchInstances();
                        break;
                    }
                    case SIGNERS_USER_ID: {
                        ((SignersUserId) (this.content))._fetchInstances();
                        break;
                    }
                    case TRUST_SIGNATURE: {
                        ((TrustSignature) (this.content))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.len._write_Seq(this._io);
            this._io.writeU1(((Number) (this.subpacketType.id())).intValue());
            {
                SubpacketTypes on = subpacketType();
                if (on != null) {
                    switch (subpacketType()) {
                    case EMBEDDED_SIGNATURE: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((EmbeddedSignature) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case EXPORTABLE_CERTIFICATION: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((ExportableCertification) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case FEATURES: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((Features) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case ISSUER: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((Issuer) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case KEY_EXPIRATION_TIME: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((KeyExpirationTime) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case KEY_FLAGS: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((KeyFlags) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case KEY_SERVER_PREFERENCES: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((KeyServerPreferences) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case NOTATION_DATA: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((NotationData) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case POLICY_URI: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((PolicyUri) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case PREFERRED_COMPRESSION_ALGORITHMS: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((PreferredCompressionAlgorithms) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case PREFERRED_HASH_ALGORITHMS: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((PreferredHashAlgorithms) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case PREFERRED_KEY_SERVER: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((PreferredKeyServer) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case PRIMARY_USER_ID: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((PrimaryUserId) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case REASON_FOR_REVOCATION: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((ReasonForRevocation) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case REGULAR_EXPRESSION: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((RegularExpression) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case REVOCABLE: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((Revocable) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case REVOCATION_KEY: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((RevocationKey) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case SIGNATURE_CREATION_TIME: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((SignatureCreationTime) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case SIGNATURE_EXPIRATION_TIME: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((SignatureExpirationTime) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case SIGNATURE_TARGET: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((SignatureTarget) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case SIGNERS_USER_ID: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((SignersUserId) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case TRUST_SIGNATURE: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len().len() - 1);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len().len() - 1));
                            final Subpacket _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len().len() - 1)
                                        throw new ConsistencyError("raw(content)", len().len() - 1, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((TrustSignature) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.content)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.content)))));
                }
            }
        }

        public void _check() {
            if (!Objects.equals(this.len._root(), _root()))
                throw new ConsistencyError("len", _root(), this.len._root());
            if (!Objects.equals(this.len._parent(), this))
                throw new ConsistencyError("len", this, this.len._parent());
            {
                SubpacketTypes on = subpacketType();
                if (on != null) {
                    switch (subpacketType()) {
                    case EMBEDDED_SIGNATURE: {
                        if (!Objects.equals(((OpenpgpMessage.EmbeddedSignature) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.EmbeddedSignature) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.EmbeddedSignature) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.EmbeddedSignature) (this.content))._parent());
                        break;
                    }
                    case EXPORTABLE_CERTIFICATION: {
                        if (!Objects.equals(((OpenpgpMessage.ExportableCertification) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.ExportableCertification) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.ExportableCertification) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.ExportableCertification) (this.content))._parent());
                        break;
                    }
                    case FEATURES: {
                        if (!Objects.equals(((OpenpgpMessage.Features) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.Features) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.Features) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.Features) (this.content))._parent());
                        break;
                    }
                    case ISSUER: {
                        if (!Objects.equals(((OpenpgpMessage.Issuer) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.Issuer) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.Issuer) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.Issuer) (this.content))._parent());
                        break;
                    }
                    case KEY_EXPIRATION_TIME: {
                        if (!Objects.equals(((OpenpgpMessage.KeyExpirationTime) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.KeyExpirationTime) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.KeyExpirationTime) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.KeyExpirationTime) (this.content))._parent());
                        break;
                    }
                    case KEY_FLAGS: {
                        if (!Objects.equals(((OpenpgpMessage.KeyFlags) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.KeyFlags) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.KeyFlags) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.KeyFlags) (this.content))._parent());
                        break;
                    }
                    case KEY_SERVER_PREFERENCES: {
                        if (!Objects.equals(((OpenpgpMessage.KeyServerPreferences) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.KeyServerPreferences) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.KeyServerPreferences) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.KeyServerPreferences) (this.content))._parent());
                        break;
                    }
                    case NOTATION_DATA: {
                        if (!Objects.equals(((OpenpgpMessage.NotationData) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.NotationData) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.NotationData) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.NotationData) (this.content))._parent());
                        break;
                    }
                    case POLICY_URI: {
                        if (!Objects.equals(((OpenpgpMessage.PolicyUri) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.PolicyUri) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.PolicyUri) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.PolicyUri) (this.content))._parent());
                        break;
                    }
                    case PREFERRED_COMPRESSION_ALGORITHMS: {
                        if (!Objects.equals(((OpenpgpMessage.PreferredCompressionAlgorithms) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.PreferredCompressionAlgorithms) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.PreferredCompressionAlgorithms) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.PreferredCompressionAlgorithms) (this.content))._parent());
                        break;
                    }
                    case PREFERRED_HASH_ALGORITHMS: {
                        if (!Objects.equals(((OpenpgpMessage.PreferredHashAlgorithms) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.PreferredHashAlgorithms) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.PreferredHashAlgorithms) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.PreferredHashAlgorithms) (this.content))._parent());
                        break;
                    }
                    case PREFERRED_KEY_SERVER: {
                        if (!Objects.equals(((OpenpgpMessage.PreferredKeyServer) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.PreferredKeyServer) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.PreferredKeyServer) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.PreferredKeyServer) (this.content))._parent());
                        break;
                    }
                    case PRIMARY_USER_ID: {
                        if (!Objects.equals(((OpenpgpMessage.PrimaryUserId) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.PrimaryUserId) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.PrimaryUserId) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.PrimaryUserId) (this.content))._parent());
                        break;
                    }
                    case REASON_FOR_REVOCATION: {
                        if (!Objects.equals(((OpenpgpMessage.ReasonForRevocation) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.ReasonForRevocation) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.ReasonForRevocation) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.ReasonForRevocation) (this.content))._parent());
                        break;
                    }
                    case REGULAR_EXPRESSION: {
                        if (!Objects.equals(((OpenpgpMessage.RegularExpression) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.RegularExpression) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.RegularExpression) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.RegularExpression) (this.content))._parent());
                        break;
                    }
                    case REVOCABLE: {
                        if (!Objects.equals(((OpenpgpMessage.Revocable) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.Revocable) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.Revocable) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.Revocable) (this.content))._parent());
                        break;
                    }
                    case REVOCATION_KEY: {
                        if (!Objects.equals(((OpenpgpMessage.RevocationKey) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.RevocationKey) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.RevocationKey) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.RevocationKey) (this.content))._parent());
                        break;
                    }
                    case SIGNATURE_CREATION_TIME: {
                        if (!Objects.equals(((OpenpgpMessage.SignatureCreationTime) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.SignatureCreationTime) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.SignatureCreationTime) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.SignatureCreationTime) (this.content))._parent());
                        break;
                    }
                    case SIGNATURE_EXPIRATION_TIME: {
                        if (!Objects.equals(((OpenpgpMessage.SignatureExpirationTime) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.SignatureExpirationTime) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.SignatureExpirationTime) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.SignatureExpirationTime) (this.content))._parent());
                        break;
                    }
                    case SIGNATURE_TARGET: {
                        if (!Objects.equals(((OpenpgpMessage.SignatureTarget) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.SignatureTarget) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.SignatureTarget) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.SignatureTarget) (this.content))._parent());
                        break;
                    }
                    case SIGNERS_USER_ID: {
                        if (!Objects.equals(((OpenpgpMessage.SignersUserId) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.SignersUserId) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.SignersUserId) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.SignersUserId) (this.content))._parent());
                        break;
                    }
                    case TRUST_SIGNATURE: {
                        if (!Objects.equals(((OpenpgpMessage.TrustSignature) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((OpenpgpMessage.TrustSignature) (this.content))._root());
                        if (!Objects.equals(((OpenpgpMessage.TrustSignature) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((OpenpgpMessage.TrustSignature) (this.content))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.content)).length != len().len() - 1)
                            throw new ConsistencyError("content", len().len() - 1, ((byte[]) (this.content)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.content)).length != len().len() - 1)
                        throw new ConsistencyError("content", len().len() - 1, ((byte[]) (this.content)).length);
                }
            }
            _dirty = false;
        }
        private LenSubpacket len;
        private SubpacketTypes subpacketType;
        private Object content;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpackets _parent;
        private byte[] _raw_content;
        public LenSubpacket len() { return len; }
        public void setLen(LenSubpacket _v) { _dirty = true; len = _v; }
        public SubpacketTypes subpacketType() { return subpacketType; }
        public void setSubpacketType(SubpacketTypes _v) { _dirty = true; subpacketType = _v; }
        public Object content() { return content; }
        public void setContent(Object _v) { _dirty = true; content = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpackets _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpackets _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_content() { return _raw_content; }
        public void set_raw_Content(byte[] _v) { _dirty = true; _raw_content = _v; }
    }
    public static class Subpackets extends KaitaiStruct.ReadWrite {
        public static Subpackets fromFile(String fileName) throws IOException {
            return new Subpackets(new ByteBufferKaitaiStream(fileName));
        }
        public Subpackets() {
            this(null, null, null);
        }

        public Subpackets(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Subpackets(KaitaiStream _io, OpenpgpMessage.SignaturePacket _parent) {
            this(_io, _parent, null);
        }

        public Subpackets(KaitaiStream _io, OpenpgpMessage.SignaturePacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.subpacketss = new ArrayList<Subpacket>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Subpacket _t_subpacketss = new Subpacket(this._io, this, _root);
                    try {
                        _t_subpacketss._read();
                    } finally {
                        this.subpacketss.add(_t_subpacketss);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.subpacketss.size(); i++) {
                this.subpacketss.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.subpacketss.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("subpacketss", 0, this._io.size() - this._io.pos());
                this.subpacketss.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("subpacketss", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.subpacketss.size(); i++) {
                if (!Objects.equals(this.subpacketss.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("subpacketss", _root(), this.subpacketss.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.subpacketss.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("subpacketss", this, this.subpacketss.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Subpacket> subpacketss;
        private OpenpgpMessage _root;
        private OpenpgpMessage.SignaturePacket _parent;
        public List<Subpacket> subpacketss() { return subpacketss; }
        public void setSubpacketss(List<Subpacket> _v) { _dirty = true; subpacketss = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.SignaturePacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.SignaturePacket _v) { _dirty = true; _parent = _v; }
    }
    public static class TrustSignature extends KaitaiStruct.ReadWrite {
        public static TrustSignature fromFile(String fileName) throws IOException {
            return new TrustSignature(new ByteBufferKaitaiStream(fileName));
        }
        public TrustSignature() {
            this(null, null, null);
        }

        public TrustSignature(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TrustSignature(KaitaiStream _io, OpenpgpMessage.Subpacket _parent) {
            this(_io, _parent, null);
        }

        public TrustSignature(KaitaiStream _io, OpenpgpMessage.Subpacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.level = this._io.readU1();
            this.amount = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.level);
            this._io.writeU1(this.amount);
        }

        public void _check() {
            _dirty = false;
        }
        private int level;
        private int amount;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public int level() { return level; }
        public void setLevel(int _v) { _dirty = true; level = _v; }
        public int amount() { return amount; }
        public void setAmount(int _v) { _dirty = true; amount = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.Subpacket _v) { _dirty = true; _parent = _v; }
    }
    public static class UserIdPacket extends KaitaiStruct.ReadWrite {
        public static UserIdPacket fromFile(String fileName) throws IOException {
            return new UserIdPacket(new ByteBufferKaitaiStream(fileName));
        }
        public UserIdPacket() {
            this(null, null, null);
        }

        public UserIdPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public UserIdPacket(KaitaiStream _io, OpenpgpMessage.OldPacket _parent) {
            this(_io, _parent, null);
        }

        public UserIdPacket(KaitaiStream _io, OpenpgpMessage.OldPacket _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.userId = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.userId).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("user_id", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private String userId;
        private OpenpgpMessage _root;
        private OpenpgpMessage.OldPacket _parent;
        public String userId() { return userId; }
        public void setUserId(String _v) { _dirty = true; userId = _v; }
        public OpenpgpMessage _root() { return _root; }
        public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
        public OpenpgpMessage.OldPacket _parent() { return _parent; }
        public void set_parent(OpenpgpMessage.OldPacket _v) { _dirty = true; _parent = _v; }
    }
    private List<Packet> packets;
    private OpenpgpMessage _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Packet> packets() { return packets; }
    public void setPackets(List<Packet> _v) { _dirty = true; packets = _v; }
    public OpenpgpMessage _root() { return _root; }
    public void set_root(OpenpgpMessage _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
