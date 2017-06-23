<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * GENMIDI.OP2 is a sound bank file used by players based on DMX sound
 * library to play MIDI files with General MIDI instruments using OPL2
 * sound chip (which was commonly installed on popular AdLib and Sound
 * Blaster sound cards).
 * 
 * Major users of DMX sound library include:
 * 
 * * Original Doom game engine (and games based on it: Heretic, Hexen, Strife, Chex Quest)
 * * Raptor: Call of the Shadows 
 */

class GenmidiOp2 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \GenmidiOp2 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x23\x4F\x50\x4C\x5F\x49\x49\x23");
        $this->_m_instruments = [];
        $n = 175;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_instruments[] = new \GenmidiOp2\InstrumentEntry($this->_io, $this, $this->_root);
        }
        $this->_m_instrumentNames = [];
        $n = 175;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_instrumentNames[] = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(32), 0), 0, false), "ASCII");
        }
    }
    protected $_m_magic;
    protected $_m_instruments;
    protected $_m_instrumentNames;
    public function magic() { return $this->_m_magic; }
    public function instruments() { return $this->_m_instruments; }
    public function instrumentNames() { return $this->_m_instrumentNames; }
}

namespace \GenmidiOp2;

class InstrumentEntry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \GenmidiOp2 $parent = null, \GenmidiOp2 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_flags = $this->_io->readU2le();
        $this->_m_finetune = $this->_io->readU1();
        $this->_m_note = $this->_io->readU1();
        $this->_m_instruments = [];
        $n = 2;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_instruments[] = new \GenmidiOp2\Instrument($this->_io, $this, $this->_root);
        }
    }
    protected $_m_flags;
    protected $_m_finetune;
    protected $_m_note;
    protected $_m_instruments;
    public function flags() { return $this->_m_flags; }
    public function finetune() { return $this->_m_finetune; }

    /**
     * MIDI note for fixed instruments, 0 otherwise
     */
    public function note() { return $this->_m_note; }
    public function instruments() { return $this->_m_instruments; }
}

namespace \GenmidiOp2;

class Instrument extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \GenmidiOp2\InstrumentEntry $parent = null, \GenmidiOp2 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_op1 = new \GenmidiOp2\OpSettings($this->_io, $this, $this->_root);
        $this->_m_feedback = $this->_io->readU1();
        $this->_m_op2 = new \GenmidiOp2\OpSettings($this->_io, $this, $this->_root);
        $this->_m_unused = $this->_io->readU1();
        $this->_m_baseNote = $this->_io->readS2le();
    }
    protected $_m_op1;
    protected $_m_feedback;
    protected $_m_op2;
    protected $_m_unused;
    protected $_m_baseNote;
    public function op1() { return $this->_m_op1; }

    /**
     * Feedback/AM-FM (both operators)
     */
    public function feedback() { return $this->_m_feedback; }
    public function op2() { return $this->_m_op2; }
    public function unused() { return $this->_m_unused; }

    /**
     * Base note offset
     */
    public function baseNote() { return $this->_m_baseNote; }
}

/**
 * OPL2 settings for one operator (carrier or modulator)
 */

namespace \GenmidiOp2;

class OpSettings extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \GenmidiOp2\Instrument $parent = null, \GenmidiOp2 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_tremVibr = $this->_io->readU1();
        $this->_m_attDec = $this->_io->readU1();
        $this->_m_sustRel = $this->_io->readU1();
        $this->_m_wave = $this->_io->readU1();
        $this->_m_scale = $this->_io->readU1();
        $this->_m_level = $this->_io->readU1();
    }
    protected $_m_tremVibr;
    protected $_m_attDec;
    protected $_m_sustRel;
    protected $_m_wave;
    protected $_m_scale;
    protected $_m_level;

    /**
     * Tremolo/vibrato/sustain/KSR/multi
     */
    public function tremVibr() { return $this->_m_tremVibr; }

    /**
     * Attack rate/decay rate
     */
    public function attDec() { return $this->_m_attDec; }

    /**
     * Sustain level/release rate
     */
    public function sustRel() { return $this->_m_sustRel; }

    /**
     * Waveform select
     */
    public function wave() { return $this->_m_wave; }

    /**
     * Key scale level
     */
    public function scale() { return $this->_m_scale; }

    /**
     * Output level
     */
    public function level() { return $this->_m_level; }
}
