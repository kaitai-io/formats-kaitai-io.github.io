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
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Arrays;


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
public class BtrfsStream extends KaitaiStruct.ReadWrite {
    public static BtrfsStream fromFile(String fileName) throws IOException {
        return new BtrfsStream(new ByteBufferKaitaiStream(fileName));
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
    public BtrfsStream() {
        this(null, null, null);
    }

    public BtrfsStream(KaitaiStream _io) {
        this(_io, null, null);
    }

    public BtrfsStream(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public BtrfsStream(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, BtrfsStream _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new SendStreamHeader(this._io, this, _root);
        this.header._read();
        this.commands = new ArrayList<SendCommand>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                SendCommand _t_commands = new SendCommand(this._io, this, _root);
                try {
                    _t_commands._read();
                } finally {
                    this.commands.add(_t_commands);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.commands.size(); i++) {
            this.commands.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        for (int i = 0; i < this.commands.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("commands", 0, this._io.size() - this._io.pos());
            this.commands.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("commands", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        for (int i = 0; i < this.commands.size(); i++) {
            if (!Objects.equals(this.commands.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("commands", _root(), this.commands.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.commands.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("commands", this, this.commands.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class SendCommand extends KaitaiStruct.ReadWrite {
        public static SendCommand fromFile(String fileName) throws IOException {
            return new SendCommand(new ByteBufferKaitaiStream(fileName));
        }
        public SendCommand() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lenData = this._io.readU4le();
            this.type = BtrfsStream.Command.byId(this._io.readU2le());
            this.checksum = this._io.readBytes(4);
            this._raw_data = this._io.readBytes(lenData());
            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
            this.data = new Tlvs(_io__raw_data, this, _root);
            this.data._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.data._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenData);
            this._io.writeU2le(((Number) (this.type.id())).intValue());
            this._io.writeBytes(this.checksum);
            final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
            this._io.addChildStream(_io__raw_data);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenData()));
                final SendCommand _this = this;
                _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_data = _io__raw_data.toByteArray();
                        if (_this._raw_data.length != lenData())
                            throw new ConsistencyError("raw(data)", lenData(), _this._raw_data.length);
                        parent.writeBytes(_this._raw_data);
                    }
                });
            }
            this.data._write_Seq(_io__raw_data);
        }

        public void _check() {
            if (this.checksum.length != 4)
                throw new ConsistencyError("checksum", 4, this.checksum.length);
            if (!Objects.equals(this.data._root(), _root()))
                throw new ConsistencyError("data", _root(), this.data._root());
            if (!Objects.equals(this.data._parent(), this))
                throw new ConsistencyError("data", this, this.data._parent());
            _dirty = false;
        }
        public static class String extends KaitaiStruct.ReadWrite {
            public static String fromFile(String fileName) throws IOException {
                return new String(new ByteBufferKaitaiStream(fileName));
            }
            public String() {
                this(null, null, null);
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
            }
            public void _read() {
                this.string = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytes((this.string).getBytes(Charset.forName("UTF-8")));
                if (!(this._io.isEof()))
                    throw new ConsistencyError("string", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                _dirty = false;
            }
            private String string;
            private BtrfsStream _root;
            private BtrfsStream.SendCommand.Tlv _parent;
            public String string() { return string; }
            public void setString(String _v) { _dirty = true; string = _v; }
            public BtrfsStream _root() { return _root; }
            public void set_root(BtrfsStream _v) { _dirty = true; _root = _v; }
            public BtrfsStream.SendCommand.Tlv _parent() { return _parent; }
            public void set_parent(BtrfsStream.SendCommand.Tlv _v) { _dirty = true; _parent = _v; }
        }
        public static class Timespec extends KaitaiStruct.ReadWrite {
            public static Timespec fromFile(String fileName) throws IOException {
                return new Timespec(new ByteBufferKaitaiStream(fileName));
            }
            public Timespec() {
                this(null, null, null);
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
            }
            public void _read() {
                this.tsSec = this._io.readS8le();
                this.tsNsec = this._io.readS4le();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeS8le(this.tsSec);
                this._io.writeS4le(this.tsNsec);
            }

            public void _check() {
                _dirty = false;
            }
            private long tsSec;
            private int tsNsec;
            private BtrfsStream _root;
            private BtrfsStream.SendCommand.Tlv _parent;
            public long tsSec() { return tsSec; }
            public void setTsSec(long _v) { _dirty = true; tsSec = _v; }
            public int tsNsec() { return tsNsec; }
            public void setTsNsec(int _v) { _dirty = true; tsNsec = _v; }
            public BtrfsStream _root() { return _root; }
            public void set_root(BtrfsStream _v) { _dirty = true; _root = _v; }
            public BtrfsStream.SendCommand.Tlv _parent() { return _parent; }
            public void set_parent(BtrfsStream.SendCommand.Tlv _v) { _dirty = true; _parent = _v; }
        }
        public static class Tlv extends KaitaiStruct.ReadWrite {
            public static Tlv fromFile(String fileName) throws IOException {
                return new Tlv(new ByteBufferKaitaiStream(fileName));
            }
            public Tlv() {
                this(null, null, null);
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
            }
            public void _read() {
                this.type = BtrfsStream.Attribute.byId(this._io.readU2le());
                this.length = this._io.readU2le();
                {
                    Attribute on = type();
                    if (on != null) {
                        switch (type()) {
                        case ATIME: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new Timespec(_io__raw_value, this, _root);
                            ((Timespec) (this.value))._read();
                            break;
                        }
                        case CLONE_CTRANSID: {
                            this.value = ((Object) (this._io.readU8le()));
                            break;
                        }
                        case CLONE_LEN: {
                            this.value = ((Object) (this._io.readU8le()));
                            break;
                        }
                        case CLONE_OFFSET: {
                            this.value = ((Object) (this._io.readU8le()));
                            break;
                        }
                        case CLONE_PATH: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new String(_io__raw_value, this, _root);
                            ((String) (this.value))._read();
                            break;
                        }
                        case CLONE_UUID: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new Uuid(_io__raw_value, this, _root);
                            ((Uuid) (this.value))._read();
                            break;
                        }
                        case CTIME: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new Timespec(_io__raw_value, this, _root);
                            ((Timespec) (this.value))._read();
                            break;
                        }
                        case CTRANSID: {
                            this.value = ((Object) (this._io.readU8le()));
                            break;
                        }
                        case FILE_OFFSET: {
                            this.value = ((Object) (this._io.readU8le()));
                            break;
                        }
                        case GID: {
                            this.value = ((Object) (this._io.readU8le()));
                            break;
                        }
                        case MODE: {
                            this.value = ((Object) (this._io.readU8le()));
                            break;
                        }
                        case MTIME: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new Timespec(_io__raw_value, this, _root);
                            ((Timespec) (this.value))._read();
                            break;
                        }
                        case OTIME: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new Timespec(_io__raw_value, this, _root);
                            ((Timespec) (this.value))._read();
                            break;
                        }
                        case PATH: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new String(_io__raw_value, this, _root);
                            ((String) (this.value))._read();
                            break;
                        }
                        case PATH_LINK: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new String(_io__raw_value, this, _root);
                            ((String) (this.value))._read();
                            break;
                        }
                        case PATH_TO: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new String(_io__raw_value, this, _root);
                            ((String) (this.value))._read();
                            break;
                        }
                        case RDEV: {
                            this.value = ((Object) (this._io.readU8le()));
                            break;
                        }
                        case SIZE: {
                            this.value = ((Object) (this._io.readU8le()));
                            break;
                        }
                        case UID: {
                            this.value = ((Object) (this._io.readU8le()));
                            break;
                        }
                        case UUID: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new Uuid(_io__raw_value, this, _root);
                            ((Uuid) (this.value))._read();
                            break;
                        }
                        case XATTR_NAME: {
                            this._raw_value = this._io.readBytes(length());
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new String(_io__raw_value, this, _root);
                            ((String) (this.value))._read();
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
                _dirty = false;
            }

            public void _fetchInstances() {
                {
                    Attribute on = type();
                    if (on != null) {
                        switch (type()) {
                        case ATIME: {
                            ((Timespec) (this.value))._fetchInstances();
                            break;
                        }
                        case CLONE_CTRANSID: {
                            break;
                        }
                        case CLONE_LEN: {
                            break;
                        }
                        case CLONE_OFFSET: {
                            break;
                        }
                        case CLONE_PATH: {
                            ((String) (this.value))._fetchInstances();
                            break;
                        }
                        case CLONE_UUID: {
                            ((Uuid) (this.value))._fetchInstances();
                            break;
                        }
                        case CTIME: {
                            ((Timespec) (this.value))._fetchInstances();
                            break;
                        }
                        case CTRANSID: {
                            break;
                        }
                        case FILE_OFFSET: {
                            break;
                        }
                        case GID: {
                            break;
                        }
                        case MODE: {
                            break;
                        }
                        case MTIME: {
                            ((Timespec) (this.value))._fetchInstances();
                            break;
                        }
                        case OTIME: {
                            ((Timespec) (this.value))._fetchInstances();
                            break;
                        }
                        case PATH: {
                            ((String) (this.value))._fetchInstances();
                            break;
                        }
                        case PATH_LINK: {
                            ((String) (this.value))._fetchInstances();
                            break;
                        }
                        case PATH_TO: {
                            ((String) (this.value))._fetchInstances();
                            break;
                        }
                        case RDEV: {
                            break;
                        }
                        case SIZE: {
                            break;
                        }
                        case UID: {
                            break;
                        }
                        case UUID: {
                            ((Uuid) (this.value))._fetchInstances();
                            break;
                        }
                        case XATTR_NAME: {
                            ((String) (this.value))._fetchInstances();
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
                this._io.writeU2le(((Number) (this.type.id())).intValue());
                this._io.writeU2le(this.length);
                {
                    Attribute on = type();
                    if (on != null) {
                        switch (type()) {
                        case ATIME: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length()));
                                final Tlv _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length())
                                            throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((Timespec) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        case CLONE_CTRANSID: {
                            this._io.writeU8le(((Number) (this.value)).longValue());
                            break;
                        }
                        case CLONE_LEN: {
                            this._io.writeU8le(((Number) (this.value)).longValue());
                            break;
                        }
                        case CLONE_OFFSET: {
                            this._io.writeU8le(((Number) (this.value)).longValue());
                            break;
                        }
                        case CLONE_PATH: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length()));
                                final Tlv _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length())
                                            throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((String) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        case CLONE_UUID: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length()));
                                final Tlv _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length())
                                            throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((Uuid) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        case CTIME: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length()));
                                final Tlv _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length())
                                            throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((Timespec) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        case CTRANSID: {
                            this._io.writeU8le(((Number) (this.value)).longValue());
                            break;
                        }
                        case FILE_OFFSET: {
                            this._io.writeU8le(((Number) (this.value)).longValue());
                            break;
                        }
                        case GID: {
                            this._io.writeU8le(((Number) (this.value)).longValue());
                            break;
                        }
                        case MODE: {
                            this._io.writeU8le(((Number) (this.value)).longValue());
                            break;
                        }
                        case MTIME: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length()));
                                final Tlv _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length())
                                            throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((Timespec) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        case OTIME: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length()));
                                final Tlv _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length())
                                            throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((Timespec) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        case PATH: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length()));
                                final Tlv _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length())
                                            throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((String) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        case PATH_LINK: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length()));
                                final Tlv _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length())
                                            throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((String) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        case PATH_TO: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length()));
                                final Tlv _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length())
                                            throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((String) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        case RDEV: {
                            this._io.writeU8le(((Number) (this.value)).longValue());
                            break;
                        }
                        case SIZE: {
                            this._io.writeU8le(((Number) (this.value)).longValue());
                            break;
                        }
                        case UID: {
                            this._io.writeU8le(((Number) (this.value)).longValue());
                            break;
                        }
                        case UUID: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length()));
                                final Tlv _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length())
                                            throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((Uuid) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        case XATTR_NAME: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length()));
                                final Tlv _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length())
                                            throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((String) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        default: {
                            this._io.writeBytes(((byte[]) (((byte[]) (this.value)))));
                            break;
                        }
                        }
                    } else {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.value)))));
                    }
                }
            }

            public void _check() {
                {
                    Attribute on = type();
                    if (on != null) {
                        switch (type()) {
                        case ATIME: {
                            if (!Objects.equals(((BtrfsStream.SendCommand.Timespec) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((BtrfsStream.SendCommand.Timespec) (this.value))._root());
                            if (!Objects.equals(((BtrfsStream.SendCommand.Timespec) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((BtrfsStream.SendCommand.Timespec) (this.value))._parent());
                            break;
                        }
                        case CLONE_CTRANSID: {
                            break;
                        }
                        case CLONE_LEN: {
                            break;
                        }
                        case CLONE_OFFSET: {
                            break;
                        }
                        case CLONE_PATH: {
                            if (!Objects.equals(((BtrfsStream.SendCommand.String) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((BtrfsStream.SendCommand.String) (this.value))._root());
                            if (!Objects.equals(((BtrfsStream.SendCommand.String) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((BtrfsStream.SendCommand.String) (this.value))._parent());
                            break;
                        }
                        case CLONE_UUID: {
                            if (!Objects.equals(((BtrfsStream.SendCommand.Uuid) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((BtrfsStream.SendCommand.Uuid) (this.value))._root());
                            if (!Objects.equals(((BtrfsStream.SendCommand.Uuid) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((BtrfsStream.SendCommand.Uuid) (this.value))._parent());
                            break;
                        }
                        case CTIME: {
                            if (!Objects.equals(((BtrfsStream.SendCommand.Timespec) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((BtrfsStream.SendCommand.Timespec) (this.value))._root());
                            if (!Objects.equals(((BtrfsStream.SendCommand.Timespec) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((BtrfsStream.SendCommand.Timespec) (this.value))._parent());
                            break;
                        }
                        case CTRANSID: {
                            break;
                        }
                        case FILE_OFFSET: {
                            break;
                        }
                        case GID: {
                            break;
                        }
                        case MODE: {
                            break;
                        }
                        case MTIME: {
                            if (!Objects.equals(((BtrfsStream.SendCommand.Timespec) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((BtrfsStream.SendCommand.Timespec) (this.value))._root());
                            if (!Objects.equals(((BtrfsStream.SendCommand.Timespec) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((BtrfsStream.SendCommand.Timespec) (this.value))._parent());
                            break;
                        }
                        case OTIME: {
                            if (!Objects.equals(((BtrfsStream.SendCommand.Timespec) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((BtrfsStream.SendCommand.Timespec) (this.value))._root());
                            if (!Objects.equals(((BtrfsStream.SendCommand.Timespec) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((BtrfsStream.SendCommand.Timespec) (this.value))._parent());
                            break;
                        }
                        case PATH: {
                            if (!Objects.equals(((BtrfsStream.SendCommand.String) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((BtrfsStream.SendCommand.String) (this.value))._root());
                            if (!Objects.equals(((BtrfsStream.SendCommand.String) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((BtrfsStream.SendCommand.String) (this.value))._parent());
                            break;
                        }
                        case PATH_LINK: {
                            if (!Objects.equals(((BtrfsStream.SendCommand.String) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((BtrfsStream.SendCommand.String) (this.value))._root());
                            if (!Objects.equals(((BtrfsStream.SendCommand.String) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((BtrfsStream.SendCommand.String) (this.value))._parent());
                            break;
                        }
                        case PATH_TO: {
                            if (!Objects.equals(((BtrfsStream.SendCommand.String) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((BtrfsStream.SendCommand.String) (this.value))._root());
                            if (!Objects.equals(((BtrfsStream.SendCommand.String) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((BtrfsStream.SendCommand.String) (this.value))._parent());
                            break;
                        }
                        case RDEV: {
                            break;
                        }
                        case SIZE: {
                            break;
                        }
                        case UID: {
                            break;
                        }
                        case UUID: {
                            if (!Objects.equals(((BtrfsStream.SendCommand.Uuid) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((BtrfsStream.SendCommand.Uuid) (this.value))._root());
                            if (!Objects.equals(((BtrfsStream.SendCommand.Uuid) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((BtrfsStream.SendCommand.Uuid) (this.value))._parent());
                            break;
                        }
                        case XATTR_NAME: {
                            if (!Objects.equals(((BtrfsStream.SendCommand.String) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((BtrfsStream.SendCommand.String) (this.value))._root());
                            if (!Objects.equals(((BtrfsStream.SendCommand.String) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((BtrfsStream.SendCommand.String) (this.value))._parent());
                            break;
                        }
                        default: {
                            if (((byte[]) (this.value)).length != length())
                                throw new ConsistencyError("value", length(), ((byte[]) (this.value)).length);
                            break;
                        }
                        }
                    } else {
                        if (((byte[]) (this.value)).length != length())
                            throw new ConsistencyError("value", length(), ((byte[]) (this.value)).length);
                    }
                }
                _dirty = false;
            }
            private Attribute type;
            private int length;
            private Object value;
            private BtrfsStream _root;
            private BtrfsStream.SendCommand.Tlvs _parent;
            private byte[] _raw_value;
            public Attribute type() { return type; }
            public void setType(Attribute _v) { _dirty = true; type = _v; }
            public int length() { return length; }
            public void setLength(int _v) { _dirty = true; length = _v; }
            public Object value() { return value; }
            public void setValue(Object _v) { _dirty = true; value = _v; }
            public BtrfsStream _root() { return _root; }
            public void set_root(BtrfsStream _v) { _dirty = true; _root = _v; }
            public BtrfsStream.SendCommand.Tlvs _parent() { return _parent; }
            public void set_parent(BtrfsStream.SendCommand.Tlvs _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_value() { return _raw_value; }
            public void set_raw_Value(byte[] _v) { _dirty = true; _raw_value = _v; }
        }
        public static class Tlvs extends KaitaiStruct.ReadWrite {
            public static Tlvs fromFile(String fileName) throws IOException {
                return new Tlvs(new ByteBufferKaitaiStream(fileName));
            }
            public Tlvs() {
                this(null, null, null);
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
            }
            public void _read() {
                this.tlv = new ArrayList<Tlv>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        Tlv _t_tlv = new Tlv(this._io, this, _root);
                        try {
                            _t_tlv._read();
                        } finally {
                            this.tlv.add(_t_tlv);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.tlv.size(); i++) {
                    this.tlv.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                for (int i = 0; i < this.tlv.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("tlv", 0, this._io.size() - this._io.pos());
                    this.tlv.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("tlv", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                for (int i = 0; i < this.tlv.size(); i++) {
                    if (!Objects.equals(this.tlv.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("tlv", _root(), this.tlv.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.tlv.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("tlv", this, this.tlv.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            private List<Tlv> tlv;
            private BtrfsStream _root;
            private BtrfsStream.SendCommand _parent;
            public List<Tlv> tlv() { return tlv; }
            public void setTlv(List<Tlv> _v) { _dirty = true; tlv = _v; }
            public BtrfsStream _root() { return _root; }
            public void set_root(BtrfsStream _v) { _dirty = true; _root = _v; }
            public BtrfsStream.SendCommand _parent() { return _parent; }
            public void set_parent(BtrfsStream.SendCommand _v) { _dirty = true; _parent = _v; }
        }
        public static class Uuid extends KaitaiStruct.ReadWrite {
            public static Uuid fromFile(String fileName) throws IOException {
                return new Uuid(new ByteBufferKaitaiStream(fileName));
            }
            public Uuid() {
                this(null, null, null);
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
            }
            public void _read() {
                this.uuid = this._io.readBytes(16);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytes(this.uuid);
            }

            public void _check() {
                if (this.uuid.length != 16)
                    throw new ConsistencyError("uuid", 16, this.uuid.length);
                _dirty = false;
            }
            private byte[] uuid;
            private BtrfsStream _root;
            private BtrfsStream.SendCommand.Tlv _parent;
            public byte[] uuid() { return uuid; }
            public void setUuid(byte[] _v) { _dirty = true; uuid = _v; }
            public BtrfsStream _root() { return _root; }
            public void set_root(BtrfsStream _v) { _dirty = true; _root = _v; }
            public BtrfsStream.SendCommand.Tlv _parent() { return _parent; }
            public void set_parent(BtrfsStream.SendCommand.Tlv _v) { _dirty = true; _parent = _v; }
        }
        private long lenData;
        private Command type;
        private byte[] checksum;
        private Tlvs data;
        private BtrfsStream _root;
        private BtrfsStream _parent;
        private byte[] _raw_data;
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }
        public Command type() { return type; }
        public void setType(Command _v) { _dirty = true; type = _v; }

        /**
         * CRC32 checksum of a whole send command, including the header, with this attribute set to 0.
         */
        public byte[] checksum() { return checksum; }
        public void setChecksum(byte[] _v) { _dirty = true; checksum = _v; }
        public Tlvs data() { return data; }
        public void setData(Tlvs _v) { _dirty = true; data = _v; }
        public BtrfsStream _root() { return _root; }
        public void set_root(BtrfsStream _v) { _dirty = true; _root = _v; }
        public BtrfsStream _parent() { return _parent; }
        public void set_parent(BtrfsStream _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_data() { return _raw_data; }
        public void set_raw_Data(byte[] _v) { _dirty = true; _raw_data = _v; }
    }
    public static class SendStreamHeader extends KaitaiStruct.ReadWrite {
        public static SendStreamHeader fromFile(String fileName) throws IOException {
            return new SendStreamHeader(new ByteBufferKaitaiStream(fileName));
        }
        public SendStreamHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.magic = this._io.readBytes(13);
            if (!(Arrays.equals(this.magic, new byte[] { 98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0 }, this.magic, this._io, "/types/send_stream_header/seq/0");
            }
            this.version = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4le(this.version);
        }

        public void _check() {
            if (this.magic.length != 13)
                throw new ConsistencyError("magic", 13, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0 }, this.magic, null, "/types/send_stream_header/seq/0");
            }
            _dirty = false;
        }
        private byte[] magic;
        private long version;
        private BtrfsStream _root;
        private BtrfsStream _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public long version() { return version; }
        public void setVersion(long _v) { _dirty = true; version = _v; }
        public BtrfsStream _root() { return _root; }
        public void set_root(BtrfsStream _v) { _dirty = true; _root = _v; }
        public BtrfsStream _parent() { return _parent; }
        public void set_parent(BtrfsStream _v) { _dirty = true; _parent = _v; }
    }
    private SendStreamHeader header;
    private List<SendCommand> commands;
    private BtrfsStream _root;
    private KaitaiStruct.ReadWrite _parent;
    public SendStreamHeader header() { return header; }
    public void setHeader(SendStreamHeader _v) { _dirty = true; header = _v; }
    public List<SendCommand> commands() { return commands; }
    public void setCommands(List<SendCommand> _v) { _dirty = true; commands = _v; }
    public BtrfsStream _root() { return _root; }
    public void set_root(BtrfsStream _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
