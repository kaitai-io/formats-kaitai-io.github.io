// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * The OpenPGP Message Format is a format to store encryption and signature keys for emails.
 * @see <a href="https://tools.ietf.org/html/rfc4880">Source</a>
 */
public class OpenpgpMessage extends KaitaiStruct {
    public static OpenpgpMessage fromFile(String fileName) throws IOException {
        return new OpenpgpMessage(new ByteBufferKaitaiStream(fileName));
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

    public enum HashAlgorithms {
        MD5(1),
        SHA1(2),
        RIPEMD160(3),
        RESERVED_4(4),
        RESERVED_5(5),
        RESERVED_6(6),
        RESERVED_7(7),
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

    public enum SymmetricKeyAlgorithm {
        PLAIN(0),
        IDEA(1),
        TRIPLE_DES(2),
        CAST5(3),
        BLOWFISCH(4),
        RESERVED_5(5),
        RESERVED_6(6),
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

    public enum SubpacketTypes {
        RESERVED(0),
        RESERVED(1),
        SIGNATURE_CREATION_TIME(2),
        SIGNATURE_EXPIRATION_TIME(3),
        EXPORTABLE_CERTIFICATION(4),
        TRUST_SIGNATURE(5),
        REGULAR_EXPRESSION(6),
        REVOCABLE(7),
        RESERVED(8),
        KEY_EXPIRATION_TIME(9),
        PLACEHOLDER_FOR_BACKWARD_COMPATIBILITY(10),
        PREFERRED_SYMMETRIC_ALGORITHMS(11),
        REVOCATION_KEY(12),
        RESERVED(13),
        RESERVED(14),
        RESERVED(15),
        ISSUER(16),
        RESERVED(17),
        RESERVED(18),
        RESERVED(19),
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

    public OpenpgpMessage(KaitaiStream _io) {
        this(_io, null, null);
    }

    public OpenpgpMessage(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public OpenpgpMessage(KaitaiStream _io, KaitaiStruct _parent, OpenpgpMessage _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.packets = new ArrayList<Packet>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.packets.add(new Packet(this._io, this, _root));
                i++;
            }
        }
    }
    public static class PreferredHashAlgorithms extends KaitaiStruct {
        public static PreferredHashAlgorithms fromFile(String fileName) throws IOException {
            return new PreferredHashAlgorithms(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.algorithm = new ArrayList<HashAlgorithms>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.algorithm.add(OpenpgpMessage.HashAlgorithms.byId(this._io.readU1()));
                    i++;
                }
            }
        }
        private ArrayList<HashAlgorithms> algorithm;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public ArrayList<HashAlgorithms> algorithm() { return algorithm; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class PreferredCompressionAlgorithms extends KaitaiStruct {
        public static PreferredCompressionAlgorithms fromFile(String fileName) throws IOException {
            return new PreferredCompressionAlgorithms(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.algorithm = new ArrayList<CompressionAlgorithms>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.algorithm.add(OpenpgpMessage.CompressionAlgorithms.byId(this._io.readU1()));
                    i++;
                }
            }
        }
        private ArrayList<CompressionAlgorithms> algorithm;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public ArrayList<CompressionAlgorithms> algorithm() { return algorithm; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class SignersUserId extends KaitaiStruct {
        public static SignersUserId fromFile(String fileName) throws IOException {
            return new SignersUserId(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.userId = new String(this._io.readBytesFull(), Charset.forName("UTF-8"));
        }
        private String userId;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public String userId() { return userId; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class SecretKeyPacket extends KaitaiStruct {
        public static SecretKeyPacket fromFile(String fileName) throws IOException {
            return new SecretKeyPacket(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.publicKey = new PublicKeyPacket(this._io, this, _root);
            this.stringToKey = this._io.readU1();
            if (stringToKey() >= 254) {
                this.symmetricEncryptionAlgorithm = OpenpgpMessage.SymmetricKeyAlgorithm.byId(this._io.readU1());
            }
            this.secretKey = this._io.readBytesFull();
        }
        private PublicKeyPacket publicKey;
        private int stringToKey;
        private SymmetricKeyAlgorithm symmetricEncryptionAlgorithm;
        private byte[] secretKey;
        private OpenpgpMessage _root;
        private OpenpgpMessage.OldPacket _parent;
        public PublicKeyPacket publicKey() { return publicKey; }
        public int stringToKey() { return stringToKey; }
        public SymmetricKeyAlgorithm symmetricEncryptionAlgorithm() { return symmetricEncryptionAlgorithm; }
        public byte[] secretKey() { return secretKey; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.OldPacket _parent() { return _parent; }
    }
    public static class KeyServerPreferences extends KaitaiStruct {
        public static KeyServerPreferences fromFile(String fileName) throws IOException {
            return new KeyServerPreferences(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.flag = new ArrayList<ServerFlags>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.flag.add(OpenpgpMessage.ServerFlags.byId(this._io.readU1()));
                    i++;
                }
            }
        }
        private ArrayList<ServerFlags> flag;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public ArrayList<ServerFlags> flag() { return flag; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class RegularExpression extends KaitaiStruct {
        public static RegularExpression fromFile(String fileName) throws IOException {
            return new RegularExpression(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.regex = new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("UTF-8"));
        }
        private String regex;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public String regex() { return regex; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class Subpackets extends KaitaiStruct {
        public static Subpackets fromFile(String fileName) throws IOException {
            return new Subpackets(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.subpacketss = new ArrayList<Subpacket>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.subpacketss.add(new Subpacket(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<Subpacket> subpacketss;
        private OpenpgpMessage _root;
        private OpenpgpMessage.SignaturePacket _parent;
        public ArrayList<Subpacket> subpacketss() { return subpacketss; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.SignaturePacket _parent() { return _parent; }
    }
    public static class RevocationKey extends KaitaiStruct {
        public static RevocationKey fromFile(String fileName) throws IOException {
            return new RevocationKey(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.class = this._io.readU1();
            this.publicKeyAlgorithm = OpenpgpMessage.PublicKeyAlgorithms.byId(this._io.readU1());
            this.fingerprint = this._io.readBytes(20);
        }
        private int class;
        private PublicKeyAlgorithms publicKeyAlgorithm;
        private byte[] fingerprint;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public int class() { return class; }
        public PublicKeyAlgorithms publicKeyAlgorithm() { return publicKeyAlgorithm; }
        public byte[] fingerprint() { return fingerprint; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class UserIdPacket extends KaitaiStruct {
        public static UserIdPacket fromFile(String fileName) throws IOException {
            return new UserIdPacket(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.userId = new String(this._io.readBytesFull(), Charset.forName("UTF-8"));
        }
        private String userId;
        private OpenpgpMessage _root;
        private OpenpgpMessage.OldPacket _parent;
        public String userId() { return userId; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.OldPacket _parent() { return _parent; }
    }
    public static class PolicyUri extends KaitaiStruct {
        public static PolicyUri fromFile(String fileName) throws IOException {
            return new PolicyUri(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.uri = new String(this._io.readBytesFull(), Charset.forName("UTF-8"));
        }
        private String uri;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public String uri() { return uri; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class SignatureTarget extends KaitaiStruct {
        public static SignatureTarget fromFile(String fileName) throws IOException {
            return new SignatureTarget(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.publicKeyAlgorithm = OpenpgpMessage.PublicKeyAlgorithms.byId(this._io.readU1());
            this.hashAlgorithm = OpenpgpMessage.HashAlgorithms.byId(this._io.readU1());
            this.hash = this._io.readBytesFull();
        }
        private PublicKeyAlgorithms publicKeyAlgorithm;
        private HashAlgorithms hashAlgorithm;
        private byte[] hash;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public PublicKeyAlgorithms publicKeyAlgorithm() { return publicKeyAlgorithm; }
        public HashAlgorithms hashAlgorithm() { return hashAlgorithm; }
        public byte[] hash() { return hash; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class KeyFlags extends KaitaiStruct {
        public static KeyFlags fromFile(String fileName) throws IOException {
            return new KeyFlags(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.flag = new ArrayList<KeyFlags>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.flag.add(.byId(this._io.readU1()));
                    i++;
                }
            }
        }
        private ArrayList<KeyFlags> flag;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public ArrayList<KeyFlags> flag() { return flag; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class Features extends KaitaiStruct {
        public static Features fromFile(String fileName) throws IOException {
            return new Features(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.flags = this._io.readBytesFull();
        }
        private byte[] flags;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public byte[] flags() { return flags; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class PrimaryUserId extends KaitaiStruct {
        public static PrimaryUserId fromFile(String fileName) throws IOException {
            return new PrimaryUserId(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.userId = this._io.readU1();
        }
        private int userId;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public int userId() { return userId; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class Subpacket extends KaitaiStruct {
        public static Subpacket fromFile(String fileName) throws IOException {
            return new Subpacket(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.len = new LenSubpacket(this._io, this, _root);
            this.subpacketType = OpenpgpMessage.SubpacketTypes.byId(this._io.readU1());
            {
                SubpacketTypes on = subpacketType();
                if (on != null) {
                    switch (subpacketType()) {
                    case PREFERRED_KEY_SERVER: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new PreferredKeyServer(_io__raw_content, this, _root);
                        break;
                    }
                    case ISSUER: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new Issuer(_io__raw_content, this, _root);
                        break;
                    }
                    case REVOCABLE: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new Revocable(_io__raw_content, this, _root);
                        break;
                    }
                    case SIGNATURE_TARGET: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new SignatureTarget(_io__raw_content, this, _root);
                        break;
                    }
                    case REGULAR_EXPRESSION: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new RegularExpression(_io__raw_content, this, _root);
                        break;
                    }
                    case EXPORTABLE_CERTIFICATION: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new ExportableCertification(_io__raw_content, this, _root);
                        break;
                    }
                    case REASON_FOR_REVOCATION: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new ReasonForRevocation(_io__raw_content, this, _root);
                        break;
                    }
                    case KEY_SERVER_PREFERENCES: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new KeyServerPreferences(_io__raw_content, this, _root);
                        break;
                    }
                    case SIGNATURE_CREATION_TIME: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new SignatureCreationTime(_io__raw_content, this, _root);
                        break;
                    }
                    case PREFERRED_HASH_ALGORITHMS: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new PreferredHashAlgorithms(_io__raw_content, this, _root);
                        break;
                    }
                    case TRUST_SIGNATURE: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new TrustSignature(_io__raw_content, this, _root);
                        break;
                    }
                    case KEY_EXPIRATION_TIME: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new KeyExpirationTime(_io__raw_content, this, _root);
                        break;
                    }
                    case KEY_FLAGS: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new KeyFlags(_io__raw_content, this, _root);
                        break;
                    }
                    case SIGNATURE_EXPIRATION_TIME: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new SignatureExpirationTime(_io__raw_content, this, _root);
                        break;
                    }
                    case FEATURES: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new Features(_io__raw_content, this, _root);
                        break;
                    }
                    case SIGNERS_USER_ID: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new SignersUserId(_io__raw_content, this, _root);
                        break;
                    }
                    case NOTATION_DATA: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new NotationData(_io__raw_content, this, _root);
                        break;
                    }
                    case REVOCATION_KEY: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new RevocationKey(_io__raw_content, this, _root);
                        break;
                    }
                    case PREFERRED_COMPRESSION_ALGORITHMS: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new PreferredCompressionAlgorithms(_io__raw_content, this, _root);
                        break;
                    }
                    case POLICY_URI: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new PolicyUri(_io__raw_content, this, _root);
                        break;
                    }
                    case PRIMARY_USER_ID: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new PrimaryUserId(_io__raw_content, this, _root);
                        break;
                    }
                    case EMBEDDED_SIGNATURE: {
                        this._raw_content = this._io.readBytes((len().len() - 1));
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new EmbeddedSignature(_io__raw_content, this, _root);
                        break;
                    }
                    default: {
                        this.content = this._io.readBytes((len().len() - 1));
                        break;
                    }
                    }
                } else {
                    this.content = this._io.readBytes((len().len() - 1));
                }
            }
        }
        private LenSubpacket len;
        private SubpacketTypes subpacketType;
        private Object content;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpackets _parent;
        private byte[] _raw_content;
        public LenSubpacket len() { return len; }
        public SubpacketTypes subpacketType() { return subpacketType; }
        public Object content() { return content; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpackets _parent() { return _parent; }
        public byte[] _raw_content() { return _raw_content; }
    }
    public static class OldPacket extends KaitaiStruct {
        public static OldPacket fromFile(String fileName) throws IOException {
            return new OldPacket(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            switch (_parent().lenType()) {
            case 0: {
                this.len = (long) (this._io.readU1());
                break;
            }
            case 1: {
                this.len = (long) (this._io.readU2be());
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
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new PublicKeyPacket(_io__raw_body, this, _root);
                        break;
                    }
                    case PUBLIC_SUBKEY_PACKET: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new PublicKeyPacket(_io__raw_body, this, _root);
                        break;
                    }
                    case USER_ID_PACKET: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new UserIdPacket(_io__raw_body, this, _root);
                        break;
                    }
                    case SIGNATURE_PACKET: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new SignaturePacket(_io__raw_body, this, _root);
                        break;
                    }
                    case SECRET_SUBKEY_PACKET: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new PublicKeyPacket(_io__raw_body, this, _root);
                        break;
                    }
                    case SECRET_KEY_PACKET: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new SecretKeyPacket(_io__raw_body, this, _root);
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
        }
        private Long len;
        private Object body;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Packet _parent;
        private byte[] _raw_body;
        public Long len() { return len; }
        public Object body() { return body; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Packet _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }
    public static class Issuer extends KaitaiStruct {
        public static Issuer fromFile(String fileName) throws IOException {
            return new Issuer(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.keyid = this._io.readU8be();
        }
        private long keyid;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public long keyid() { return keyid; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class ExportableCertification extends KaitaiStruct {
        public static ExportableCertification fromFile(String fileName) throws IOException {
            return new ExportableCertification(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.exportable = this._io.readU1();
        }
        private int exportable;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public int exportable() { return exportable; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class SignatureExpirationTime extends KaitaiStruct {
        public static SignatureExpirationTime fromFile(String fileName) throws IOException {
            return new SignatureExpirationTime(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.time = this._io.readU4be();
        }
        private long time;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public long time() { return time; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class SignatureCreationTime extends KaitaiStruct {
        public static SignatureCreationTime fromFile(String fileName) throws IOException {
            return new SignatureCreationTime(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.time = this._io.readU4be();
        }
        private long time;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public long time() { return time; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class SignaturePacket extends KaitaiStruct {
        public static SignaturePacket fromFile(String fileName) throws IOException {
            return new SignaturePacket(new ByteBufferKaitaiStream(fileName));
        }

        public SignaturePacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SignaturePacket(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public SignaturePacket(KaitaiStream _io, KaitaiStruct _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readU1();
            this.signatureType = this._io.readU1();
            this.publicKeyAlgorithm = OpenpgpMessage.PublicKeyAlgorithms.byId(this._io.readU1());
            this.hashAlgorithm = OpenpgpMessage.HashAlgorithms.byId(this._io.readU1());
            this.lenHashedSubpacket = this._io.readU2be();
            this._raw_hashedSubpackets = this._io.readBytes(lenHashedSubpacket());
            KaitaiStream _io__raw_hashedSubpackets = new ByteBufferKaitaiStream(_raw_hashedSubpackets);
            this.hashedSubpackets = new Subpackets(_io__raw_hashedSubpackets, this, _root);
            this.lenUnhashedSubpacket = this._io.readU2be();
            this._raw_unhashedSubpackets = this._io.readBytes(lenUnhashedSubpacket());
            KaitaiStream _io__raw_unhashedSubpackets = new ByteBufferKaitaiStream(_raw_unhashedSubpackets);
            this.unhashedSubpackets = new Subpackets(_io__raw_unhashedSubpackets, this, _root);
            this.leftSignedHash = this._io.readU2be();
            this.rsaN = this._io.readU2be();
            this.signature = this._io.readBytesFull();
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
        private KaitaiStruct _parent;
        private byte[] _raw_hashedSubpackets;
        private byte[] _raw_unhashedSubpackets;
        public int version() { return version; }
        public int signatureType() { return signatureType; }
        public PublicKeyAlgorithms publicKeyAlgorithm() { return publicKeyAlgorithm; }
        public HashAlgorithms hashAlgorithm() { return hashAlgorithm; }
        public int lenHashedSubpacket() { return lenHashedSubpacket; }
        public Subpackets hashedSubpackets() { return hashedSubpackets; }
        public int lenUnhashedSubpacket() { return lenUnhashedSubpacket; }
        public Subpackets unhashedSubpackets() { return unhashedSubpackets; }
        public int leftSignedHash() { return leftSignedHash; }
        public int rsaN() { return rsaN; }
        public byte[] signature() { return signature; }
        public OpenpgpMessage _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
        public byte[] _raw_hashedSubpackets() { return _raw_hashedSubpackets; }
        public byte[] _raw_unhashedSubpackets() { return _raw_unhashedSubpackets; }
    }
    public static class Revocable extends KaitaiStruct {
        public static Revocable fromFile(String fileName) throws IOException {
            return new Revocable(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.revocable = this._io.readU1();
        }
        private int revocable;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public int revocable() { return revocable; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class EmbeddedSignature extends KaitaiStruct {
        public static EmbeddedSignature fromFile(String fileName) throws IOException {
            return new EmbeddedSignature(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.signaturePacket = new SignaturePacket(this._io, this, _root);
        }
        private SignaturePacket signaturePacket;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public SignaturePacket signaturePacket() { return signaturePacket; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class PreferredKeyServer extends KaitaiStruct {
        public static PreferredKeyServer fromFile(String fileName) throws IOException {
            return new PreferredKeyServer(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.uri = new String(this._io.readBytesFull(), Charset.forName("UTF-8"));
        }
        private String uri;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public String uri() { return uri; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class ReasonForRevocation extends KaitaiStruct {
        public static ReasonForRevocation fromFile(String fileName) throws IOException {
            return new ReasonForRevocation(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.revocationCode = OpenpgpMessage.RevocationCodes.byId(this._io.readU1());
            this.reason = new String(this._io.readBytesFull(), Charset.forName("UTF-8"));
        }
        private RevocationCodes revocationCode;
        private String reason;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public RevocationCodes revocationCode() { return revocationCode; }
        public String reason() { return reason; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class LenSubpacket extends KaitaiStruct {
        public static LenSubpacket fromFile(String fileName) throws IOException {
            return new LenSubpacket(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.firstOctet = this._io.readU1();
            if ( ((firstOctet() >= 192) && (firstOctet() < 255)) ) {
                this.secondOctet = this._io.readU1();
            }
            if (firstOctet() == 255) {
                this.scalar = this._io.readU4be();
            }
        }
        private Integer len;
        public Integer len() {
            if (this.len != null)
                return this.len;
            int _tmp = (int) ((firstOctet() < 192 ? firstOctet() : ( ((firstOctet() >= 192) && (firstOctet() < 255))  ? ((((firstOctet() - 192) << 8) + secondOctet()) + 192) : scalar())));
            this.len = _tmp;
            return this.len;
        }
        private int firstOctet;
        private Integer secondOctet;
        private Long scalar;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public int firstOctet() { return firstOctet; }
        public Integer secondOctet() { return secondOctet; }
        public Long scalar() { return scalar; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class NotationData extends KaitaiStruct {
        public static NotationData fromFile(String fileName) throws IOException {
            return new NotationData(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.flags = this._io.readBytes(4);
            this.lenName = this._io.readU2be();
            this.lenValue = this._io.readU2be();
            this.name = this._io.readBytes(lenName());
            this.value = this._io.readBytes(lenValue());
        }
        private byte[] flags;
        private int lenName;
        private int lenValue;
        private byte[] name;
        private byte[] value;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public byte[] flags() { return flags; }
        public int lenName() { return lenName; }
        public int lenValue() { return lenValue; }
        public byte[] name() { return name; }
        public byte[] value() { return value; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class PublicKeyPacket extends KaitaiStruct {
        public static PublicKeyPacket fromFile(String fileName) throws IOException {
            return new PublicKeyPacket(new ByteBufferKaitaiStream(fileName));
        }

        public PublicKeyPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PublicKeyPacket(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public PublicKeyPacket(KaitaiStream _io, KaitaiStruct _parent, OpenpgpMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readU1();
            this.timestamp = this._io.readU4be();
            this.publicKeyAlgorithm = OpenpgpMessage.PublicKeyAlgorithms.byId(this._io.readU1());
            this.lenAlg = this._io.readU2be();
            this.rsaN = this._io.readBytes((lenAlg() / 8));
            this.padding = this._io.readU2be();
            this.rsaE = this._io.readBytes(3);
        }
        private int version;
        private long timestamp;
        private PublicKeyAlgorithms publicKeyAlgorithm;
        private int lenAlg;
        private byte[] rsaN;
        private int padding;
        private byte[] rsaE;
        private OpenpgpMessage _root;
        private KaitaiStruct _parent;
        public int version() { return version; }
        public long timestamp() { return timestamp; }
        public PublicKeyAlgorithms publicKeyAlgorithm() { return publicKeyAlgorithm; }
        public int lenAlg() { return lenAlg; }
        public byte[] rsaN() { return rsaN; }
        public int padding() { return padding; }
        public byte[] rsaE() { return rsaE; }
        public OpenpgpMessage _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class KeyExpirationTime extends KaitaiStruct {
        public static KeyExpirationTime fromFile(String fileName) throws IOException {
            return new KeyExpirationTime(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.time = this._io.readU4be();
        }
        private long time;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public long time() { return time; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    public static class Packet extends KaitaiStruct {
        public static Packet fromFile(String fileName) throws IOException {
            return new Packet(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.one = this._io.readBitsInt(1) != 0;
            this.newPacketFormat = this._io.readBitsInt(1) != 0;
            if (newPacketFormat()) {
                this.packetTypeNew = OpenpgpMessage.PacketTags.byId(this._io.readBitsInt(6));
            }
            if (!(newPacketFormat())) {
                this.packetTypeOld = OpenpgpMessage.PacketTags.byId(this._io.readBitsInt(4));
            }
            if (!(newPacketFormat())) {
                this.lenType = this._io.readBitsInt(2);
            }
            this._io.alignToByte();
            {
                boolean on = newPacketFormat();
                if (on == false) {
                    this.body = new OldPacket(this._io, this, _root);
                }
            }
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
        public boolean newPacketFormat() { return newPacketFormat; }
        public PacketTags packetTypeNew() { return packetTypeNew; }
        public PacketTags packetTypeOld() { return packetTypeOld; }
        public Long lenType() { return lenType; }
        public OldPacket body() { return body; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage _parent() { return _parent; }
    }
    public static class TrustSignature extends KaitaiStruct {
        public static TrustSignature fromFile(String fileName) throws IOException {
            return new TrustSignature(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.level = this._io.readU1();
            this.amount = this._io.readU1();
        }
        private int level;
        private int amount;
        private OpenpgpMessage _root;
        private OpenpgpMessage.Subpacket _parent;
        public int level() { return level; }
        public int amount() { return amount; }
        public OpenpgpMessage _root() { return _root; }
        public OpenpgpMessage.Subpacket _parent() { return _parent; }
    }
    private ArrayList<Packet> packets;
    private OpenpgpMessage _root;
    private KaitaiStruct _parent;
    public ArrayList<Packet> packets() { return packets; }
    public OpenpgpMessage _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
