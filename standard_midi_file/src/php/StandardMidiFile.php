<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Standard MIDI file, typically knows just as "MID", is a standard way
 * to serialize series of MIDI events, which is a protocol used in many
 * music synthesizers to transfer music data: notes being played,
 * effects being applied, etc.
 * 
 * Internally, file consists of a header and series of tracks, every
 * track listing MIDI events with certain header designating time these
 * events are happening.
 * 
 * NOTE: Rarely, MIDI files employ certain stateful compression scheme
 * to avoid storing certain elements of further elements, instead
 * reusing them from events which happened earlier in the
 * stream. Kaitai Struct (as of v0.9) is currently unable to parse
 * these, but files employing this mechanism are relatively rare.
 */

class StandardMidiFile extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_hdr = new \StandardMidiFile\Header($this->_io, $this, $this->_root);
        $this->_m_tracks = [];
        $n = $this->hdr()->numTracks();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_tracks[] = new \StandardMidiFile\Track($this->_io, $this, $this->_root);
        }
    }
    protected $_m_hdr;
    protected $_m_tracks;
    public function hdr() { return $this->_m_hdr; }
    public function tracks() { return $this->_m_tracks; }
}

namespace \StandardMidiFile;

class TrackEvents extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \StandardMidiFile\Track $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_event = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_event[] = new \StandardMidiFile\TrackEvent($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_event;
    public function event() { return $this->_m_event; }
}

namespace \StandardMidiFile;

class TrackEvent extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \StandardMidiFile\TrackEvents $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_vTime = new \VlqBase128Be($this->_io);
        $this->_m_eventHeader = $this->_io->readU1();
        if ($this->eventHeader() == 255) {
            $this->_m_metaEventBody = new \StandardMidiFile\MetaEventBody($this->_io, $this, $this->_root);
        }
        if ($this->eventHeader() == 240) {
            $this->_m_sysexBody = new \StandardMidiFile\SysexEventBody($this->_io, $this, $this->_root);
        }
        switch ($this->eventType()) {
            case 224:
                $this->_m_eventBody = new \StandardMidiFile\PitchBendEvent($this->_io, $this, $this->_root);
                break;
            case 144:
                $this->_m_eventBody = new \StandardMidiFile\NoteOnEvent($this->_io, $this, $this->_root);
                break;
            case 208:
                $this->_m_eventBody = new \StandardMidiFile\ChannelPressureEvent($this->_io, $this, $this->_root);
                break;
            case 192:
                $this->_m_eventBody = new \StandardMidiFile\ProgramChangeEvent($this->_io, $this, $this->_root);
                break;
            case 160:
                $this->_m_eventBody = new \StandardMidiFile\PolyphonicPressureEvent($this->_io, $this, $this->_root);
                break;
            case 176:
                $this->_m_eventBody = new \StandardMidiFile\ControllerEvent($this->_io, $this, $this->_root);
                break;
            case 128:
                $this->_m_eventBody = new \StandardMidiFile\NoteOffEvent($this->_io, $this, $this->_root);
                break;
        }
    }
    protected $_m_eventType;
    public function eventType() {
        if ($this->_m_eventType !== null)
            return $this->_m_eventType;
        $this->_m_eventType = ($this->eventHeader() & 240);
        return $this->_m_eventType;
    }
    protected $_m_channel;
    public function channel() {
        if ($this->_m_channel !== null)
            return $this->_m_channel;
        if ($this->eventType() != 240) {
            $this->_m_channel = ($this->eventHeader() & 15);
        }
        return $this->_m_channel;
    }
    protected $_m_vTime;
    protected $_m_eventHeader;
    protected $_m_metaEventBody;
    protected $_m_sysexBody;
    protected $_m_eventBody;
    public function vTime() { return $this->_m_vTime; }
    public function eventHeader() { return $this->_m_eventHeader; }
    public function metaEventBody() { return $this->_m_metaEventBody; }
    public function sysexBody() { return $this->_m_sysexBody; }
    public function eventBody() { return $this->_m_eventBody; }
}

namespace \StandardMidiFile;

class PitchBendEvent extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \StandardMidiFile\TrackEvent $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_b1 = $this->_io->readU1();
        $this->_m_b2 = $this->_io->readU1();
    }
    protected $_m_bendValue;
    public function bendValue() {
        if ($this->_m_bendValue !== null)
            return $this->_m_bendValue;
        $this->_m_bendValue = ((($this->b2() << 7) + $this->b1()) - 16384);
        return $this->_m_bendValue;
    }
    protected $_m_adjBendValue;
    public function adjBendValue() {
        if ($this->_m_adjBendValue !== null)
            return $this->_m_adjBendValue;
        $this->_m_adjBendValue = ($this->bendValue() - 16384);
        return $this->_m_adjBendValue;
    }
    protected $_m_b1;
    protected $_m_b2;
    public function b1() { return $this->_m_b1; }
    public function b2() { return $this->_m_b2; }
}

namespace \StandardMidiFile;

class ProgramChangeEvent extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \StandardMidiFile\TrackEvent $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_program = $this->_io->readU1();
    }
    protected $_m_program;
    public function program() { return $this->_m_program; }
}

namespace \StandardMidiFile;

class NoteOnEvent extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \StandardMidiFile\TrackEvent $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_note = $this->_io->readU1();
        $this->_m_velocity = $this->_io->readU1();
    }
    protected $_m_note;
    protected $_m_velocity;
    public function note() { return $this->_m_note; }
    public function velocity() { return $this->_m_velocity; }
}

namespace \StandardMidiFile;

class PolyphonicPressureEvent extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \StandardMidiFile\TrackEvent $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_note = $this->_io->readU1();
        $this->_m_pressure = $this->_io->readU1();
    }
    protected $_m_note;
    protected $_m_pressure;
    public function note() { return $this->_m_note; }
    public function pressure() { return $this->_m_pressure; }
}

namespace \StandardMidiFile;

class Track extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \StandardMidiFile $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x4D\x54\x72\x6B");
        $this->_m_lenEvents = $this->_io->readU4be();
        $this->_m__raw_events = $this->_io->readBytes($this->lenEvents());
        $_io__raw_events = new \Kaitai\Struct\Stream($this->_m__raw_events);
        $this->_m_events = new \StandardMidiFile\TrackEvents($_io__raw_events, $this, $this->_root);
    }
    protected $_m_magic;
    protected $_m_lenEvents;
    protected $_m_events;
    protected $_m__raw_events;
    public function magic() { return $this->_m_magic; }
    public function lenEvents() { return $this->_m_lenEvents; }
    public function events() { return $this->_m_events; }
    public function _raw_events() { return $this->_m__raw_events; }
}

namespace \StandardMidiFile;

class MetaEventBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \StandardMidiFile\TrackEvent $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_metaType = $this->_io->readU1();
        $this->_m_len = new \VlqBase128Be($this->_io);
        $this->_m_body = $this->_io->readBytes($this->len()->value());
    }
    protected $_m_metaType;
    protected $_m_len;
    protected $_m_body;
    public function metaType() { return $this->_m_metaType; }
    public function len() { return $this->_m_len; }
    public function body() { return $this->_m_body; }
}

namespace \StandardMidiFile\MetaEventBody;

class MetaTypeEnum {
    const SEQUENCE_NUMBER = 0;
    const TEXT_EVENT = 1;
    const COPYRIGHT = 2;
    const SEQUENCE_TRACK_NAME = 3;
    const INSTRUMENT_NAME = 4;
    const LYRIC_TEXT = 5;
    const MARKER_TEXT = 6;
    const CUE_POINT = 7;
    const MIDI_CHANNEL_PREFIX_ASSIGNMENT = 32;
    const END_OF_TRACK = 47;
    const TEMPO = 81;
    const SMPTE_OFFSET = 84;
    const TIME_SIGNATURE = 88;
    const KEY_SIGNATURE = 89;
    const SEQUENCER_SPECIFIC_EVENT = 127;
}

namespace \StandardMidiFile;

class ControllerEvent extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \StandardMidiFile\TrackEvent $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_controller = $this->_io->readU1();
        $this->_m_value = $this->_io->readU1();
    }
    protected $_m_controller;
    protected $_m_value;
    public function controller() { return $this->_m_controller; }
    public function value() { return $this->_m_value; }
}

namespace \StandardMidiFile;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \StandardMidiFile $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x4D\x54\x68\x64");
        $this->_m_lenHeader = $this->_io->readU4be();
        $this->_m_format = $this->_io->readU2be();
        $this->_m_numTracks = $this->_io->readU2be();
        $this->_m_division = $this->_io->readS2be();
    }
    protected $_m_magic;
    protected $_m_lenHeader;
    protected $_m_format;
    protected $_m_numTracks;
    protected $_m_division;
    public function magic() { return $this->_m_magic; }
    public function lenHeader() { return $this->_m_lenHeader; }
    public function format() { return $this->_m_format; }
    public function numTracks() { return $this->_m_numTracks; }
    public function division() { return $this->_m_division; }
}

namespace \StandardMidiFile;

class SysexEventBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \StandardMidiFile\TrackEvent $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_len = new \VlqBase128Be($this->_io);
        $this->_m_data = $this->_io->readBytes($this->len()->value());
    }
    protected $_m_len;
    protected $_m_data;
    public function len() { return $this->_m_len; }
    public function data() { return $this->_m_data; }
}

namespace \StandardMidiFile;

class NoteOffEvent extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \StandardMidiFile\TrackEvent $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_note = $this->_io->readU1();
        $this->_m_velocity = $this->_io->readU1();
    }
    protected $_m_note;
    protected $_m_velocity;
    public function note() { return $this->_m_note; }
    public function velocity() { return $this->_m_velocity; }
}

namespace \StandardMidiFile;

class ChannelPressureEvent extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \StandardMidiFile\TrackEvent $_parent = null, \StandardMidiFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_pressure = $this->_io->readU1();
    }
    protected $_m_pressure;
    public function pressure() { return $this->_m_pressure; }
}
