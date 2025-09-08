// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.StandardCharsets;
import java.util.List;


/**
 * The WebSocket protocol establishes a two-way communication channel via TCP.
 * Messages are made up of one or more dataframes, and are delineated by
 * frames with the `fin` bit set.
 */
public class Websocket extends KaitaiStruct {
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

    public Websocket(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Websocket(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Websocket(KaitaiStream _io, KaitaiStruct _parent, Websocket _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.initialFrame = new InitialFrame(this._io, this, _root);
        if (initialFrame().header().finished() != true) {
            this.trailingFrames = new ArrayList<Dataframe>();
            {
                Dataframe _it;
                int i = 0;
                do {
                    _it = new Dataframe(this._io, this, _root);
                    this.trailingFrames.add(_it);
                    i++;
                } while (!(_it.header().finished()));
            }
        }
    }

    public void _fetchInstances() {
        this.initialFrame._fetchInstances();
        if (initialFrame().header().finished() != true) {
            for (int i = 0; i < this.trailingFrames.size(); i++) {
                this.trailingFrames.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }
    public static class Dataframe extends KaitaiStruct {
        public static Dataframe fromFile(String fileName) throws IOException {
            return new Dataframe(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.header = new FrameHeader(this._io, this, _root);
            if (_root().initialFrame().header().opcode() != Websocket.Opcode.TEXT) {
                this.payloadBytes = this._io.readBytes(header().lenPayload());
            }
            if (_root().initialFrame().header().opcode() == Websocket.Opcode.TEXT) {
                this.payloadText = new String(this._io.readBytes(header().lenPayload()), StandardCharsets.UTF_8);
            }
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            if (_root().initialFrame().header().opcode() != Websocket.Opcode.TEXT) {
            }
            if (_root().initialFrame().header().opcode() == Websocket.Opcode.TEXT) {
            }
        }
        private FrameHeader header;
        private byte[] payloadBytes;
        private String payloadText;
        private Websocket _root;
        private Websocket _parent;
        public FrameHeader header() { return header; }
        public byte[] payloadBytes() { return payloadBytes; }
        public String payloadText() { return payloadText; }
        public Websocket _root() { return _root; }
        public Websocket _parent() { return _parent; }
    }
    public static class FrameHeader extends KaitaiStruct {
        public static FrameHeader fromFile(String fileName) throws IOException {
            return new FrameHeader(new ByteBufferKaitaiStream(fileName));
        }

        public FrameHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FrameHeader(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public FrameHeader(KaitaiStream _io, KaitaiStruct _parent, Websocket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
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
        }

        public void _fetchInstances() {
            if (lenPayloadPrimary() == 126) {
            }
            if (lenPayloadPrimary() == 127) {
            }
            if (isMasked()) {
            }
        }
        private Integer lenPayload;
        public Integer lenPayload() {
            if (this.lenPayload != null)
                return this.lenPayload;
            this.lenPayload = ((Number) ((lenPayloadPrimary() <= 125 ? lenPayloadPrimary() : (lenPayloadPrimary() == 126 ? lenPayloadExtended1() : lenPayloadExtended2())))).intValue();
            return this.lenPayload;
        }
        private boolean finished;
        private long reserved;
        private Opcode opcode;
        private boolean isMasked;
        private long lenPayloadPrimary;
        private Integer lenPayloadExtended1;
        private Long lenPayloadExtended2;
        private Long maskKey;
        private Websocket _root;
        private KaitaiStruct _parent;
        public boolean finished() { return finished; }
        public long reserved() { return reserved; }
        public Opcode opcode() { return opcode; }
        public boolean isMasked() { return isMasked; }
        public long lenPayloadPrimary() { return lenPayloadPrimary; }
        public Integer lenPayloadExtended1() { return lenPayloadExtended1; }
        public Long lenPayloadExtended2() { return lenPayloadExtended2; }
        public Long maskKey() { return maskKey; }
        public Websocket _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class InitialFrame extends KaitaiStruct {
        public static InitialFrame fromFile(String fileName) throws IOException {
            return new InitialFrame(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.header = new FrameHeader(this._io, this, _root);
            if (header().opcode() != Websocket.Opcode.TEXT) {
                this.payloadBytes = this._io.readBytes(header().lenPayload());
            }
            if (header().opcode() == Websocket.Opcode.TEXT) {
                this.payloadText = new String(this._io.readBytes(header().lenPayload()), StandardCharsets.UTF_8);
            }
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            if (header().opcode() != Websocket.Opcode.TEXT) {
            }
            if (header().opcode() == Websocket.Opcode.TEXT) {
            }
        }
        private FrameHeader header;
        private byte[] payloadBytes;
        private String payloadText;
        private Websocket _root;
        private Websocket _parent;
        public FrameHeader header() { return header; }
        public byte[] payloadBytes() { return payloadBytes; }
        public String payloadText() { return payloadText; }
        public Websocket _root() { return _root; }
        public Websocket _parent() { return _parent; }
    }
    private InitialFrame initialFrame;
    private List<Dataframe> trailingFrames;
    private Websocket _root;
    private KaitaiStruct _parent;
    public InitialFrame initialFrame() { return initialFrame; }
    public List<Dataframe> trailingFrames() { return trailingFrames; }
    public Websocket _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
