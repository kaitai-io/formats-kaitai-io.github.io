// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.Arrays;

public class IcmpPacket extends KaitaiStruct.ReadWrite {
    public static IcmpPacket fromFile(String fileName) throws IOException {
        return new IcmpPacket(new ByteBufferKaitaiStream(fileName));
    }

    public enum IcmpTypeEnum {
        ECHO_REPLY(0),
        DESTINATION_UNREACHABLE(3),
        SOURCE_QUENCH(4),
        REDIRECT(5),
        ECHO(8),
        TIME_EXCEEDED(11);

        private final long id;
        IcmpTypeEnum(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, IcmpTypeEnum> byId = new HashMap<Long, IcmpTypeEnum>(6);
        static {
            for (IcmpTypeEnum e : IcmpTypeEnum.values())
                byId.put(e.id(), e);
        }
        public static IcmpTypeEnum byId(long id) { return byId.get(id); }
    }
    public IcmpPacket() {
        this(null, null, null);
    }

    public IcmpPacket(KaitaiStream _io) {
        this(_io, null, null);
    }

    public IcmpPacket(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public IcmpPacket(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, IcmpPacket _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.icmpType = IcmpTypeEnum.byId(this._io.readU1());
        if (icmpType() == IcmpTypeEnum.DESTINATION_UNREACHABLE) {
            this.destinationUnreachable = new DestinationUnreachableMsg(this._io, this, _root);
            this.destinationUnreachable._read();
        }
        if (icmpType() == IcmpTypeEnum.TIME_EXCEEDED) {
            this.timeExceeded = new TimeExceededMsg(this._io, this, _root);
            this.timeExceeded._read();
        }
        if ( ((icmpType() == IcmpTypeEnum.ECHO) || (icmpType() == IcmpTypeEnum.ECHO_REPLY)) ) {
            this.echo = new EchoMsg(this._io, this, _root);
            this.echo._read();
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        if (icmpType() == IcmpTypeEnum.DESTINATION_UNREACHABLE) {
            this.destinationUnreachable._fetchInstances();
        }
        if (icmpType() == IcmpTypeEnum.TIME_EXCEEDED) {
            this.timeExceeded._fetchInstances();
        }
        if ( ((icmpType() == IcmpTypeEnum.ECHO) || (icmpType() == IcmpTypeEnum.ECHO_REPLY)) ) {
            this.echo._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU1(((Number) (this.icmpType.id())).intValue());
        if (icmpType() == IcmpTypeEnum.DESTINATION_UNREACHABLE) {
            this.destinationUnreachable._write_Seq(this._io);
        }
        if (icmpType() == IcmpTypeEnum.TIME_EXCEEDED) {
            this.timeExceeded._write_Seq(this._io);
        }
        if ( ((icmpType() == IcmpTypeEnum.ECHO) || (icmpType() == IcmpTypeEnum.ECHO_REPLY)) ) {
            this.echo._write_Seq(this._io);
        }
    }

    public void _check() {
        if (icmpType() == IcmpTypeEnum.DESTINATION_UNREACHABLE) {
            if (!Objects.equals(this.destinationUnreachable._root(), _root()))
                throw new ConsistencyError("destination_unreachable", _root(), this.destinationUnreachable._root());
            if (!Objects.equals(this.destinationUnreachable._parent(), this))
                throw new ConsistencyError("destination_unreachable", this, this.destinationUnreachable._parent());
        }
        if (icmpType() == IcmpTypeEnum.TIME_EXCEEDED) {
            if (!Objects.equals(this.timeExceeded._root(), _root()))
                throw new ConsistencyError("time_exceeded", _root(), this.timeExceeded._root());
            if (!Objects.equals(this.timeExceeded._parent(), this))
                throw new ConsistencyError("time_exceeded", this, this.timeExceeded._parent());
        }
        if ( ((icmpType() == IcmpTypeEnum.ECHO) || (icmpType() == IcmpTypeEnum.ECHO_REPLY)) ) {
            if (!Objects.equals(this.echo._root(), _root()))
                throw new ConsistencyError("echo", _root(), this.echo._root());
            if (!Objects.equals(this.echo._parent(), this))
                throw new ConsistencyError("echo", this, this.echo._parent());
        }
        _dirty = false;
    }
    public static class DestinationUnreachableMsg extends KaitaiStruct.ReadWrite {
        public static DestinationUnreachableMsg fromFile(String fileName) throws IOException {
            return new DestinationUnreachableMsg(new ByteBufferKaitaiStream(fileName));
        }

        public enum DestinationUnreachableCode {
            NET_UNREACHABLE(0),
            HOST_UNREACHABLE(1),
            PROTOCOL_UNREACHABLE(2),
            PORT_UNREACHABLE(3),
            FRAGMENTATION_NEEDED_AND_DF_SET(4),
            SOURCE_ROUTE_FAILED(5),
            DST_NET_UNKOWN(6),
            SDT_HOST_UNKOWN(7),
            SRC_ISOLATED(8),
            NET_PROHIBITED_BY_ADMIN(9),
            HOST_PROHIBITED_BY_ADMIN(10),
            NET_UNREACHABLE_FOR_TOS(11),
            HOST_UNREACHABLE_FOR_TOS(12),
            COMMUNICATION_PROHIBITED_BY_ADMIN(13),
            HOST_PRECEDENCE_VIOLATION(14),
            PRECEDENCE_CUTTOFF_IN_EFFECT(15);

            private final long id;
            DestinationUnreachableCode(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DestinationUnreachableCode> byId = new HashMap<Long, DestinationUnreachableCode>(16);
            static {
                for (DestinationUnreachableCode e : DestinationUnreachableCode.values())
                    byId.put(e.id(), e);
            }
            public static DestinationUnreachableCode byId(long id) { return byId.get(id); }
        }
        public DestinationUnreachableMsg() {
            this(null, null, null);
        }

        public DestinationUnreachableMsg(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DestinationUnreachableMsg(KaitaiStream _io, IcmpPacket _parent) {
            this(_io, _parent, null);
        }

        public DestinationUnreachableMsg(KaitaiStream _io, IcmpPacket _parent, IcmpPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.code = DestinationUnreachableCode.byId(this._io.readU1());
            this.checksum = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.code.id())).intValue());
            this._io.writeU2be(this.checksum);
        }

        public void _check() {
            _dirty = false;
        }
        private DestinationUnreachableCode code;
        private int checksum;
        private IcmpPacket _root;
        private IcmpPacket _parent;
        public DestinationUnreachableCode code() { return code; }
        public void setCode(DestinationUnreachableCode _v) { _dirty = true; code = _v; }
        public int checksum() { return checksum; }
        public void setChecksum(int _v) { _dirty = true; checksum = _v; }
        public IcmpPacket _root() { return _root; }
        public void set_root(IcmpPacket _v) { _dirty = true; _root = _v; }
        public IcmpPacket _parent() { return _parent; }
        public void set_parent(IcmpPacket _v) { _dirty = true; _parent = _v; }
    }
    public static class EchoMsg extends KaitaiStruct.ReadWrite {
        public static EchoMsg fromFile(String fileName) throws IOException {
            return new EchoMsg(new ByteBufferKaitaiStream(fileName));
        }
        public EchoMsg() {
            this(null, null, null);
        }

        public EchoMsg(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EchoMsg(KaitaiStream _io, IcmpPacket _parent) {
            this(_io, _parent, null);
        }

        public EchoMsg(KaitaiStream _io, IcmpPacket _parent, IcmpPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.code = this._io.readBytes(1);
            if (!(Arrays.equals(this.code, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.code, this._io, "/types/echo_msg/seq/0");
            }
            this.checksum = this._io.readU2be();
            this.identifier = this._io.readU2be();
            this.seqNum = this._io.readU2be();
            this.data = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.code);
            this._io.writeU2be(this.checksum);
            this._io.writeU2be(this.identifier);
            this._io.writeU2be(this.seqNum);
            this._io.writeBytes(this.data);
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (this.code.length != 1)
                throw new ConsistencyError("code", 1, this.code.length);
            if (!(Arrays.equals(this.code, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.code, null, "/types/echo_msg/seq/0");
            }
            _dirty = false;
        }
        private byte[] code;
        private int checksum;
        private int identifier;
        private int seqNum;
        private byte[] data;
        private IcmpPacket _root;
        private IcmpPacket _parent;
        public byte[] code() { return code; }
        public void setCode(byte[] _v) { _dirty = true; code = _v; }
        public int checksum() { return checksum; }
        public void setChecksum(int _v) { _dirty = true; checksum = _v; }
        public int identifier() { return identifier; }
        public void setIdentifier(int _v) { _dirty = true; identifier = _v; }
        public int seqNum() { return seqNum; }
        public void setSeqNum(int _v) { _dirty = true; seqNum = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public IcmpPacket _root() { return _root; }
        public void set_root(IcmpPacket _v) { _dirty = true; _root = _v; }
        public IcmpPacket _parent() { return _parent; }
        public void set_parent(IcmpPacket _v) { _dirty = true; _parent = _v; }
    }
    public static class TimeExceededMsg extends KaitaiStruct.ReadWrite {
        public static TimeExceededMsg fromFile(String fileName) throws IOException {
            return new TimeExceededMsg(new ByteBufferKaitaiStream(fileName));
        }

        public enum TimeExceededCode {
            TIME_TO_LIVE_EXCEEDED_IN_TRANSIT(0),
            FRAGMENT_REASSEMBLY_TIME_EXCEEDED(1);

            private final long id;
            TimeExceededCode(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, TimeExceededCode> byId = new HashMap<Long, TimeExceededCode>(2);
            static {
                for (TimeExceededCode e : TimeExceededCode.values())
                    byId.put(e.id(), e);
            }
            public static TimeExceededCode byId(long id) { return byId.get(id); }
        }
        public TimeExceededMsg() {
            this(null, null, null);
        }

        public TimeExceededMsg(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TimeExceededMsg(KaitaiStream _io, IcmpPacket _parent) {
            this(_io, _parent, null);
        }

        public TimeExceededMsg(KaitaiStream _io, IcmpPacket _parent, IcmpPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.code = TimeExceededCode.byId(this._io.readU1());
            this.checksum = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.code.id())).intValue());
            this._io.writeU2be(this.checksum);
        }

        public void _check() {
            _dirty = false;
        }
        private TimeExceededCode code;
        private int checksum;
        private IcmpPacket _root;
        private IcmpPacket _parent;
        public TimeExceededCode code() { return code; }
        public void setCode(TimeExceededCode _v) { _dirty = true; code = _v; }
        public int checksum() { return checksum; }
        public void setChecksum(int _v) { _dirty = true; checksum = _v; }
        public IcmpPacket _root() { return _root; }
        public void set_root(IcmpPacket _v) { _dirty = true; _root = _v; }
        public IcmpPacket _parent() { return _parent; }
        public void set_parent(IcmpPacket _v) { _dirty = true; _parent = _v; }
    }
    private IcmpTypeEnum icmpType;
    private DestinationUnreachableMsg destinationUnreachable;
    private TimeExceededMsg timeExceeded;
    private EchoMsg echo;
    private IcmpPacket _root;
    private KaitaiStruct.ReadWrite _parent;
    public IcmpTypeEnum icmpType() { return icmpType; }
    public void setIcmpType(IcmpTypeEnum _v) { _dirty = true; icmpType = _v; }
    public DestinationUnreachableMsg destinationUnreachable() { return destinationUnreachable; }
    public void setDestinationUnreachable(DestinationUnreachableMsg _v) { _dirty = true; destinationUnreachable = _v; }
    public TimeExceededMsg timeExceeded() { return timeExceeded; }
    public void setTimeExceeded(TimeExceededMsg _v) { _dirty = true; timeExceeded = _v; }
    public EchoMsg echo() { return echo; }
    public void setEcho(EchoMsg _v) { _dirty = true; echo = _v; }
    public IcmpPacket _root() { return _root; }
    public void set_root(IcmpPacket _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
