// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.nio.charset.Charset;


/**
 * Btrfs is a copy on write file system based on B-trees focusing on fault tolerance, repair and easy
 * administration. Btrfs is intended to address the lack of pooling, snapshots, checksums, and
 * integral multi-device spanning in Linux file systems.
 * Given any pair of subvolumes (or snapshots), Btrfs can generate a binary diff between them by
 * using the `btrfs send` command that can be replayed later by using `btrfs receive`, possibly on a
 * different Btrfs file system. The `btrfs send` command creates a set of data modifications required
 * for converting one subvolume into another.
 * This spec can be used to disassemble the binary diff created by the `btrfs send` command.
 * If you want a text representation you may want to checkout `btrfs receive --dump` instead.
 * @see <a href="https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.php/Design_notes_on_Send/Receive.html">Source</a>
 */
public class BtrfsStream extends KaitaiStruct {
    public static BtrfsStream fromFile(String fileName) throws IOException {
        return new BtrfsStream(new ByteBufferKaitaiStream(fileName));
    }

    public enum Command {
        UNSPEC(0),
        SUBVOL(1),
        SNAPSHOT(2),
        MKFILE(3),
        MKDIR(4),
        MKNOD(5),
        MKFIFO(6),
        MKSOCK(7),
        SYMLINK(8),
        RENAME(9),
        LINK(10),
        UNLINK(11),
        RMDIR(12),
        SET_XATTR(13),
        REMOVE_XATTR(14),
        WRITE(15),
        CLONE(16),
        TRUNCATE(17),
        CHMOD(18),
        CHOWN(19),
        UTIMES(20),
        END(21),
        UPDATE_EXTENT(22);

        private final long id;
        Command(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Command> byId = new HashMap<Long, Command>(23);
        static {
            for (Command e : Command.values())
                byId.put(e.id(), e);
        }
        public static Command byId(long id) { return byId.get(id); }
    }

    public enum Attribute {
        UNSPEC(0),
        UUID(1),
        CTRANSID(2),
        INO(3),
        SIZE(4),
        MODE(5),
        UID(6),
        GID(7),
        RDEV(8),
        CTIME(9),
        MTIME(10),
        ATIME(11),
        OTIME(12),
        XATTR_NAME(13),
        XATTR_DATA(14),
        PATH(15),
        PATH_TO(16),
        PATH_LINK(17),
        FILE_OFFSET(18),
        DATA(19),
        CLONE_UUID(20),
        CLONE_CTRANSID(21),
        CLONE_PATH(22),
        CLONE_OFFSET(23),
        CLONE_LEN(24);

        private final long id;
        Attribute(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Attribute> byId = new HashMap<Long, Attribute>(25);
        static {
            for (Attribute e : Attribute.values())
                byId.put(e.id(), e);
        }
        public static Attribute byId(long id) { return byId.get(id); }
    }

    public BtrfsStream(KaitaiStream _io) {
        this(_io, null, null);
    }

    public BtrfsStream(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public BtrfsStream(KaitaiStream _io, KaitaiStruct _parent, BtrfsStream _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new SendStreamHeader(this._io, this, _root);
        this.commands = new ArrayList<SendCommand>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.commands.add(new SendCommand(this._io, this, _root));
                i++;
            }
        }
    }
    public static class SendStreamHeader extends KaitaiStruct {
        public static SendStreamHeader fromFile(String fileName) throws IOException {
            return new SendStreamHeader(new ByteBufferKaitaiStream(fileName));
        }

        public SendStreamHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SendStreamHeader(KaitaiStream _io, BtrfsStream _parent) {
            this(_io, _parent, null);
        }

        public SendStreamHeader(KaitaiStream _io, BtrfsStream _parent, BtrfsStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(13);
            if (!(Arrays.equals(magic(), new byte[] { 98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0 }, magic(), _io(), "/types/send_stream_header/seq/0");
            }
            this.version = this._io.readU4le();
        }
        private byte[] magic;
        private long version;
        private BtrfsStream _root;
        private BtrfsStream _parent;
        public byte[] magic() { return magic; }
        public long version() { return version; }
        public BtrfsStream _root() { return _root; }
        public BtrfsStream _parent() { return _parent; }
    }
    public static class SendCommand extends KaitaiStruct {
        public static SendCommand fromFile(String fileName) throws IOException {
            return new SendCommand(new ByteBufferKaitaiStream(fileName));
        }

        public SendCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SendCommand(KaitaiStream _io, BtrfsStream _parent) {
            this(_io, _parent, null);
        }

        public SendCommand(KaitaiStream _io, BtrfsStream _parent, BtrfsStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenData = this._io.readU4le();
            this.type = BtrfsStream.Command.byId(this._io.readU2le());
            this.checksum = this._io.readBytes(4);
            this._raw_data = this._io.readBytes(lenData());
            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
            this.data = new Tlvs(_io__raw_data, this, _root);
        }
        public static class Tlv extends KaitaiStruct {
            public static Tlv fromFile(String fileName) throws IOException {
                return new Tlv(new ByteBufferKaitaiStream(fileName));
            }

            public Tlv(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Tlv(KaitaiStream _io, BtrfsStream.SendCommand.Tlvs _parent) {
                this(_io, _parent, null);
            }

            public Tlv(KaitaiStream _io, BtrfsStream.SendCommand.Tlvs _parent, BtrfsStream _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.type = BtrfsStream.Attribute.byId(this._io.readU2le());
                this.length = this._io.readU2le();
                {
                    Attribute on = type();
                    if (on != null) {
                        switch (type()) {
                        case CTRANSID: {
                            this.value = (Object) (this._io.readU8le());
                            break;
                        }
                        case SIZE: {
                            this.value = (Object) (this._io.readU8le());
                            break;
                        }
                        case CLONE_UUID: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new Uuid(_io__raw_value, this, _root);
                            break;
                        }
                        case FILE_OFFSET: {
                            this.value = (Object) (this._io.readU8le());
                            break;
                        }
                        case OTIME: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new Timespec(_io__raw_value, this, _root);
                            break;
                        }
                        case UID: {
                            this.value = (Object) (this._io.readU8le());
                            break;
                        }
                        case ATIME: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new Timespec(_io__raw_value, this, _root);
                            break;
                        }
                        case CTIME: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new Timespec(_io__raw_value, this, _root);
                            break;
                        }
                        case UUID: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new Uuid(_io__raw_value, this, _root);
                            break;
                        }
                        case CLONE_LEN: {
                            this.value = (Object) (this._io.readU8le());
                            break;
                        }
                        case XATTR_NAME: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new String(_io__raw_value, this, _root);
                            break;
                        }
                        case CLONE_CTRANSID: {
                            this.value = (Object) (this._io.readU8le());
                            break;
                        }
                        case MODE: {
                            this.value = (Object) (this._io.readU8le());
                            break;
                        }
                        case MTIME: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new Timespec(_io__raw_value, this, _root);
                            break;
                        }
                        case PATH_LINK: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new String(_io__raw_value, this, _root);
                            break;
                        }
                        case RDEV: {
                            this.value = (Object) (this._io.readU8le());
                            break;
                        }
                        case PATH_TO: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new String(_io__raw_value, this, _root);
                            break;
                        }
                        case PATH: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new String(_io__raw_value, this, _root);
                            break;
                        }
                        case CLONE_OFFSET: {
                            this.value = (Object) (this._io.readU8le());
                            break;
                        }
                        case GID: {
                            this.value = (Object) (this._io.readU8le());
                            break;
                        }
                        case CLONE_PATH: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new String(_io__raw_value, this, _root);
                            break;
                        }
                        default: {
                            this.value = this._io.readBytes(length());
                            break;
                        }
                        }
                    } else {
                        this.value = this._io.readBytes(length());
                    }
                }
            }
            private Attribute type;
            private int length;
            private Object value;
            private BtrfsStream _root;
            private BtrfsStream.SendCommand.Tlvs _parent;
            private byte[] _raw_value;
            public Attribute type() { return type; }
            public int length() { return length; }
            public Object value() { return value; }
            public BtrfsStream _root() { return _root; }
            public BtrfsStream.SendCommand.Tlvs _parent() { return _parent; }
            public byte[] _raw_value() { return _raw_value; }
        }
        public static class Uuid extends KaitaiStruct {
            public static Uuid fromFile(String fileName) throws IOException {
                return new Uuid(new ByteBufferKaitaiStream(fileName));
            }

            public Uuid(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Uuid(KaitaiStream _io, BtrfsStream.SendCommand.Tlv _parent) {
                this(_io, _parent, null);
            }

            public Uuid(KaitaiStream _io, BtrfsStream.SendCommand.Tlv _parent, BtrfsStream _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.uuid = this._io.readBytes(16);
            }
            private byte[] uuid;
            private BtrfsStream _root;
            private BtrfsStream.SendCommand.Tlv _parent;
            public byte[] uuid() { return uuid; }
            public BtrfsStream _root() { return _root; }
            public BtrfsStream.SendCommand.Tlv _parent() { return _parent; }
        }
        public static class Tlvs extends KaitaiStruct {
            public static Tlvs fromFile(String fileName) throws IOException {
                return new Tlvs(new ByteBufferKaitaiStream(fileName));
            }

            public Tlvs(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Tlvs(KaitaiStream _io, BtrfsStream.SendCommand _parent) {
                this(_io, _parent, null);
            }

            public Tlvs(KaitaiStream _io, BtrfsStream.SendCommand _parent, BtrfsStream _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.tlv = new ArrayList<Tlv>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.tlv.add(new Tlv(this._io, this, _root));
                        i++;
                    }
                }
            }
            private ArrayList<Tlv> tlv;
            private BtrfsStream _root;
            private BtrfsStream.SendCommand _parent;
            public ArrayList<Tlv> tlv() { return tlv; }
            public BtrfsStream _root() { return _root; }
            public BtrfsStream.SendCommand _parent() { return _parent; }
        }
        public static class String extends KaitaiStruct {
            public static String fromFile(String fileName) throws IOException {
                return new String(new ByteBufferKaitaiStream(fileName));
            }

            public String(KaitaiStream _io) {
                this(_io, null, null);
            }

            public String(KaitaiStream _io, BtrfsStream.SendCommand.Tlv _parent) {
                this(_io, _parent, null);
            }

            public String(KaitaiStream _io, BtrfsStream.SendCommand.Tlv _parent, BtrfsStream _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.string = new String(this._io.readBytesFull(), Charset.forName("UTF-8"));
            }
            private String string;
            private BtrfsStream _root;
            private BtrfsStream.SendCommand.Tlv _parent;
            public String string() { return string; }
            public BtrfsStream _root() { return _root; }
            public BtrfsStream.SendCommand.Tlv _parent() { return _parent; }
        }
        public static class Timespec extends KaitaiStruct {
            public static Timespec fromFile(String fileName) throws IOException {
                return new Timespec(new ByteBufferKaitaiStream(fileName));
            }

            public Timespec(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Timespec(KaitaiStream _io, BtrfsStream.SendCommand.Tlv _parent) {
                this(_io, _parent, null);
            }

            public Timespec(KaitaiStream _io, BtrfsStream.SendCommand.Tlv _parent, BtrfsStream _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.tsSec = this._io.readS8le();
                this.tsNsec = this._io.readS4le();
            }
            private long tsSec;
            private int tsNsec;
            private BtrfsStream _root;
            private BtrfsStream.SendCommand.Tlv _parent;
            public long tsSec() { return tsSec; }
            public int tsNsec() { return tsNsec; }
            public BtrfsStream _root() { return _root; }
            public BtrfsStream.SendCommand.Tlv _parent() { return _parent; }
        }
        private long lenData;
        private Command type;
        private byte[] checksum;
        private Tlvs data;
        private BtrfsStream _root;
        private BtrfsStream _parent;
        private byte[] _raw_data;
        public long lenData() { return lenData; }
        public Command type() { return type; }

        /**
         * CRC32 checksum of a whole send command, including the header, with this attribute set to 0.
         */
        public byte[] checksum() { return checksum; }
        public Tlvs data() { return data; }
        public BtrfsStream _root() { return _root; }
        public BtrfsStream _parent() { return _parent; }
        public byte[] _raw_data() { return _raw_data; }
    }
    private SendStreamHeader header;
    private ArrayList<SendCommand> commands;
    private BtrfsStream _root;
    private KaitaiStruct _parent;
    public SendStreamHeader header() { return header; }
    public ArrayList<SendCommand> commands() { return commands; }
    public BtrfsStream _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
