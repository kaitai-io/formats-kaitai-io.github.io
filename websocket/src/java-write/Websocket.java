// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * The WebSocket protocol establishes a two-way communication channel via TCP.
 * Messages are made up of one or more dataframes, and are delineated by
 * frames with the `fin` bit set.
 */
public class Websocket extends KaitaiStruct.ReadWrite {
    public static Websocket fromFile(String fileName) throws IOException {
        return new Websocket(new ByteBufferKaitaiStream(fileName));
    }

    public enum Opcode {
        CONTINUATION(0),
        TEXT(1),
        BINARY(2),
        RESERVED_3(3),
        RESERVED_4(4),
        RESERVED_5(5),
        RESERVED_6(6),
        RESERVED_7(7),
        CLOSE(8),
        PING(9),
        PONG(10),
        RESERVED_CONTROL_B(11),
        RESERVED_CONTROL_C(12),
        RESERVED_CONTROL_D(13),
        RESERVED_CONTROL_E(14),
        RESERVED_CONTROL_F(15);

        private final long id;
        Opcode(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Opcode> byId = new HashMap<Long, Opcode>(16);
        static {
            for (Opcode e : Opcode.values())
                byId.put(e.id(), e);
        }
        public static Opcode byId(long id) { return byId.get(id); }
    }
    public Websocket() {
        this(null, null, null);
    }

    public Websocket(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Websocket(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Websocket(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Websocket _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.initialFrame = new InitialFrame(this._io, this, _root);
        this.initialFrame._read();
        if (initialFrame().header().finished() != true) {
            this.trailingFrames = new ArrayList<Dataframe>();
            {
                Dataframe _it;
                int i = 0;
                do {
                    Dataframe _t_trailingFrames = new Dataframe(this._io, this, _root);
                    try {
                        _t_trailingFrames._read();
                    } finally {
                        _it = _t_trailingFrames;
                        this.trailingFrames.add(_it);
                    }
                    i++;
                } while (!(_it.header().finished()));
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.initialFrame._fetchInstances();
        if (initialFrame().header().finished() != true) {
            for (int i = 0; i < this.trailingFrames.size(); i++) {
                this.trailingFrames.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.initialFrame._write_Seq(this._io);
        if (initialFrame().header().finished() != true) {
            for (int i = 0; i < this.trailingFrames.size(); i++) {
                this.trailingFrames.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }
    }

    public void _check() {
        if (!Objects.equals(this.initialFrame._root(), _root()))
            throw new ConsistencyError("initial_frame", _root(), this.initialFrame._root());
        if (!Objects.equals(this.initialFrame._parent(), this))
            throw new ConsistencyError("initial_frame", this, this.initialFrame._parent());
        if (initialFrame().header().finished() != true) {
            if (this.trailingFrames.size() == 0)
                throw new ConsistencyError("trailing_frames", 0, this.trailingFrames.size());
            for (int i = 0; i < this.trailingFrames.size(); i++) {
                if (!Objects.equals(this.trailingFrames.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("trailing_frames", _root(), this.trailingFrames.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.trailingFrames.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("trailing_frames", this, this.trailingFrames.get(((Number) (i)).intValue())._parent());
                {
                    Dataframe _it = this.trailingFrames.get(((Number) (i)).intValue());
                    if (_it.header().finished() != (i == this.trailingFrames.size() - 1))
                        throw new ConsistencyError("trailing_frames", i == this.trailingFrames.size() - 1, _it.header().finished());
                }
            }
        }
        _dirty = false;
    }
    public static class Dataframe extends KaitaiStruct.ReadWrite {
        public static Dataframe fromFile(String fileName) throws IOException {
            return new Dataframe(new ByteBufferKaitaiStream(fileName));
        }
        public Dataframe() {
            this(null, null, null);
        }

        public Dataframe(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Dataframe(KaitaiStream _io, Websocket _parent) {
            this(_io, _parent, null);
        }

        public Dataframe(KaitaiStream _io, Websocket _parent, Websocket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.header = new FrameHeader(this._io, this, _root);
            this.header._read();
            if (_root().initialFrame().header().opcode() != Websocket.Opcode.TEXT) {
                this.payloadBytes = this._io.readBytes(header().lenPayload());
            }
            if (_root().initialFrame().header().opcode() == Websocket.Opcode.TEXT) {
                this.payloadText = new String(this._io.readBytes(header().lenPayload()), StandardCharsets.UTF_8);
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            if (_root().initialFrame().header().opcode() != Websocket.Opcode.TEXT) {
            }
            if (_root().initialFrame().header().opcode() == Websocket.Opcode.TEXT) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            if (_root().initialFrame().header().opcode() != Websocket.Opcode.TEXT) {
                this._io.writeBytes(this.payloadBytes);
            }
            if (_root().initialFrame().header().opcode() == Websocket.Opcode.TEXT) {
                this._io.writeBytes((this.payloadText).getBytes(Charset.forName("UTF-8")));
            }
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            if (_root().initialFrame().header().opcode() != Websocket.Opcode.TEXT) {
                if (this.payloadBytes.length != header().lenPayload())
                    throw new ConsistencyError("payload_bytes", header().lenPayload(), this.payloadBytes.length);
            }
            if (_root().initialFrame().header().opcode() == Websocket.Opcode.TEXT) {
                if ((this.payloadText).getBytes(Charset.forName("UTF-8")).length != header().lenPayload())
                    throw new ConsistencyError("payload_text", header().lenPayload(), (this.payloadText).getBytes(Charset.forName("UTF-8")).length);
            }
            _dirty = false;
        }
        private FrameHeader header;
        private byte[] payloadBytes;
        private String payloadText;
        private Websocket _root;
        private Websocket _parent;
        public FrameHeader header() { return header; }
        public void setHeader(FrameHeader _v) { _dirty = true; header = _v; }
        public byte[] payloadBytes() { return payloadBytes; }
        public void setPayloadBytes(byte[] _v) { _dirty = true; payloadBytes = _v; }
        public String payloadText() { return payloadText; }
        public void setPayloadText(String _v) { _dirty = true; payloadText = _v; }
        public Websocket _root() { return _root; }
        public void set_root(Websocket _v) { _dirty = true; _root = _v; }
        public Websocket _parent() { return _parent; }
        public void set_parent(Websocket _v) { _dirty = true; _parent = _v; }
    }
    public static class FrameHeader extends KaitaiStruct.ReadWrite {
        public static FrameHeader fromFile(String fileName) throws IOException {
            return new FrameHeader(new ByteBufferKaitaiStream(fileName));
        }
        public FrameHeader() {
            this(null, null, null);
        }

        public FrameHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FrameHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public FrameHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Websocket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.finished = this._io.readBitsIntBe(1) != 0;
            this.reserved = this._io.readBitsIntBe(3);
            this.opcode = Websocket.Opcode.byId(this._io.readBitsIntBe(4));
            this.isMasked = this._io.readBitsIntBe(1) != 0;
            this.lenPayloadPrimary = this._io.readBitsIntBe(7);
            if (lenPayloadPrimary() == 126) {
                this.lenPayloadExtended1 = this._io.readU2be();
            }
            if (lenPayloadPrimary() == 127) {
                this.lenPayloadExtended2 = this._io.readU4be();
            }
            if (isMasked()) {
                this.maskKey = this._io.readU4be();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (lenPayloadPrimary() == 126) {
            }
            if (lenPayloadPrimary() == 127) {
            }
            if (isMasked()) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.finished ? 1 : 0));
            this._io.writeBitsIntBe(3, this.reserved);
            this._io.writeBitsIntBe(4, ((Number) (this.opcode.id())).longValue());
            this._io.writeBitsIntBe(1, (this.isMasked ? 1 : 0));
            this._io.writeBitsIntBe(7, this.lenPayloadPrimary);
            if (lenPayloadPrimary() == 126) {
                this._io.writeU2be(this.lenPayloadExtended1);
            }
            if (lenPayloadPrimary() == 127) {
                this._io.writeU4be(this.lenPayloadExtended2);
            }
            if (isMasked()) {
                this._io.writeU4be(this.maskKey);
            }
        }

        public void _check() {
            if (lenPayloadPrimary() == 126) {
            }
            if (lenPayloadPrimary() == 127) {
            }
            if (isMasked()) {
            }
            _dirty = false;
        }
        private Integer lenPayload;
        public Integer lenPayload() {
            if (this.lenPayload != null)
                return this.lenPayload;
            this.lenPayload = ((Number) ((lenPayloadPrimary() <= 125 ? lenPayloadPrimary() : (lenPayloadPrimary() == 126 ? lenPayloadExtended1() : lenPayloadExtended2())))).intValue();
            return this.lenPayload;
        }
        public void _invalidateLenPayload() { this.lenPayload = null; }
        private boolean finished;
        private long reserved;
        private Opcode opcode;
        private boolean isMasked;
        private long lenPayloadPrimary;
        private Integer lenPayloadExtended1;
        private Long lenPayloadExtended2;
        private Long maskKey;
        private Websocket _root;
        private KaitaiStruct.ReadWrite _parent;
        public boolean finished() { return finished; }
        public void setFinished(boolean _v) { _dirty = true; finished = _v; }
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }
        public Opcode opcode() { return opcode; }
        public void setOpcode(Opcode _v) { _dirty = true; opcode = _v; }
        public boolean isMasked() { return isMasked; }
        public void setIsMasked(boolean _v) { _dirty = true; isMasked = _v; }
        public long lenPayloadPrimary() { return lenPayloadPrimary; }
        public void setLenPayloadPrimary(long _v) { _dirty = true; lenPayloadPrimary = _v; }
        public Integer lenPayloadExtended1() { return lenPayloadExtended1; }
        public void setLenPayloadExtended1(Integer _v) { _dirty = true; lenPayloadExtended1 = _v; }
        public Long lenPayloadExtended2() { return lenPayloadExtended2; }
        public void setLenPayloadExtended2(Long _v) { _dirty = true; lenPayloadExtended2 = _v; }
        public Long maskKey() { return maskKey; }
        public void setMaskKey(Long _v) { _dirty = true; maskKey = _v; }
        public Websocket _root() { return _root; }
        public void set_root(Websocket _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class InitialFrame extends KaitaiStruct.ReadWrite {
        public static InitialFrame fromFile(String fileName) throws IOException {
            return new InitialFrame(new ByteBufferKaitaiStream(fileName));
        }
        public InitialFrame() {
            this(null, null, null);
        }

        public InitialFrame(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InitialFrame(KaitaiStream _io, Websocket _parent) {
            this(_io, _parent, null);
        }

        public InitialFrame(KaitaiStream _io, Websocket _parent, Websocket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.header = new FrameHeader(this._io, this, _root);
            this.header._read();
            if (header().opcode() != Websocket.Opcode.TEXT) {
                this.payloadBytes = this._io.readBytes(header().lenPayload());
            }
            if (header().opcode() == Websocket.Opcode.TEXT) {
                this.payloadText = new String(this._io.readBytes(header().lenPayload()), StandardCharsets.UTF_8);
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            if (header().opcode() != Websocket.Opcode.TEXT) {
            }
            if (header().opcode() == Websocket.Opcode.TEXT) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            if (header().opcode() != Websocket.Opcode.TEXT) {
                this._io.writeBytes(this.payloadBytes);
            }
            if (header().opcode() == Websocket.Opcode.TEXT) {
                this._io.writeBytes((this.payloadText).getBytes(Charset.forName("UTF-8")));
            }
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            if (header().opcode() != Websocket.Opcode.TEXT) {
                if (this.payloadBytes.length != header().lenPayload())
                    throw new ConsistencyError("payload_bytes", header().lenPayload(), this.payloadBytes.length);
            }
            if (header().opcode() == Websocket.Opcode.TEXT) {
                if ((this.payloadText).getBytes(Charset.forName("UTF-8")).length != header().lenPayload())
                    throw new ConsistencyError("payload_text", header().lenPayload(), (this.payloadText).getBytes(Charset.forName("UTF-8")).length);
            }
            _dirty = false;
        }
        private FrameHeader header;
        private byte[] payloadBytes;
        private String payloadText;
        private Websocket _root;
        private Websocket _parent;
        public FrameHeader header() { return header; }
        public void setHeader(FrameHeader _v) { _dirty = true; header = _v; }
        public byte[] payloadBytes() { return payloadBytes; }
        public void setPayloadBytes(byte[] _v) { _dirty = true; payloadBytes = _v; }
        public String payloadText() { return payloadText; }
        public void setPayloadText(String _v) { _dirty = true; payloadText = _v; }
        public Websocket _root() { return _root; }
        public void set_root(Websocket _v) { _dirty = true; _root = _v; }
        public Websocket _parent() { return _parent; }
        public void set_parent(Websocket _v) { _dirty = true; _parent = _v; }
    }
    private InitialFrame initialFrame;
    private List<Dataframe> trailingFrames;
    private Websocket _root;
    private KaitaiStruct.ReadWrite _parent;
    public InitialFrame initialFrame() { return initialFrame; }
    public void setInitialFrame(InitialFrame _v) { _dirty = true; initialFrame = _v; }
    public List<Dataframe> trailingFrames() { return trailingFrames; }
    public void setTrailingFrames(List<Dataframe> _v) { _dirty = true; trailingFrames = _v; }
    public Websocket _root() { return _root; }
    public void set_root(Websocket _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
