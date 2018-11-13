<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * IVF is a simple container format for raw VP8 data, which is an open
 * and royalty-free video compression format, currently developed by
 * Google.
 * 
 * Test .ivf files are available at https://chromium.googlesource.com/webm/vp8-test-vectors
 */

class Vp8Ivf extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Vp8Ivf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic1 = $this->_io->ensureFixedContents("\x44\x4B\x49\x46");
        $this->_m_version = $this->_io->readU2le();
        $this->_m_lenHeader = $this->_io->readU2le();
        $this->_m_codec = $this->_io->ensureFixedContents("\x56\x50\x38\x30");
        $this->_m_width = $this->_io->readU2le();
        $this->_m_height = $this->_io->readU2le();
        $this->_m_framerate = $this->_io->readU4le();
        $this->_m_timescale = $this->_io->readU4le();
        $this->_m_numFrames = $this->_io->readU4le();
        $this->_m_unused = $this->_io->readU4le();
        $this->_m_imageData = [];
        $n = $this->numFrames();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_imageData[] = new \Vp8Ivf\Blocks($this->_io, $this, $this->_root);
        }
    }
    protected $_m_magic1;
    protected $_m_version;
    protected $_m_lenHeader;
    protected $_m_codec;
    protected $_m_width;
    protected $_m_height;
    protected $_m_framerate;
    protected $_m_timescale;
    protected $_m_numFrames;
    protected $_m_unused;
    protected $_m_imageData;

    /**
     * Magic Number of IVF Files
     */
    public function magic1() { return $this->_m_magic1; }

    /**
     * This should be 0
     */
    public function version() { return $this->_m_version; }

    /**
     * Normally the header length is 32 byte
     */
    public function lenHeader() { return $this->_m_lenHeader; }

    /**
     * Name of the codec e.g. 'VP80' for VP8
     */
    public function codec() { return $this->_m_codec; }

    /**
     * The (initial) width of the video, every keyframe may change the resolution
     */
    public function width() { return $this->_m_width; }

    /**
     * The (initial) height of the video, every keyframe may change the resolution
     */
    public function height() { return $this->_m_height; }

    /**
     * the (framerate * timescale) e.g. for 30 fps -> 30000
     */
    public function framerate() { return $this->_m_framerate; }

    /**
     * the timescale is a divider of the seconds (VPX is integer math only) mostly 1000
     */
    public function timescale() { return $this->_m_timescale; }

    /**
     * the number of frames (if not a camera stream)
     */
    public function numFrames() { return $this->_m_numFrames; }
    public function unused() { return $this->_m_unused; }
    public function imageData() { return $this->_m_imageData; }
}

namespace \Vp8Ivf;

class Blocks extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Vp8Ivf $_parent = null, \Vp8Ivf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entries = new \Vp8Ivf\Block($this->_io, $this, $this->_root);
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \Vp8Ivf;

class Block extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Vp8Ivf\Blocks $_parent = null, \Vp8Ivf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenFrame = $this->_io->readU4le();
        $this->_m_timestamp = $this->_io->readU8le();
        $this->_m_framedata = $this->_io->readBytes($this->lenFrame());
    }
    protected $_m_lenFrame;
    protected $_m_timestamp;
    protected $_m_framedata;

    /**
     * size of the frame data
     */
    public function lenFrame() { return $this->_m_lenFrame; }
    public function timestamp() { return $this->_m_timestamp; }
    public function framedata() { return $this->_m_framedata; }
}
