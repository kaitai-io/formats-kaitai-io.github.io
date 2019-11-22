<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Android apps using directly or indirectly OpenGL cache compiled shaders into com.android.opengl.shaders_cache file.
 */

class AndroidOpenglShadersCache extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \AndroidOpenglShadersCache $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_signature = $this->_io->ensureFixedContents("\x45\x47\x4C\x24");
        $this->_m_crc32 = $this->_io->readU4le();
        $this->_m__raw_contents = $this->_io->readBytesFull();
        $io = new \Kaitai\Struct\Stream($this->_m__raw_contents);
        $this->_m_contents = new \AndroidOpenglShadersCache\Cache($io, $this, $this->_root);
    }
    protected $_m_signature;
    protected $_m_crc32;
    protected $_m_contents;
    protected $_m__raw_contents;
    public function signature() { return $this->_m_signature; }

    /**
     * crc32 of `contents`
     */
    public function crc32() { return $this->_m_crc32; }
    public function contents() { return $this->_m_contents; }
    public function _raw_contents() { return $this->_m__raw_contents; }
}

namespace \AndroidOpenglShadersCache;

class Alignment extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \AndroidOpenglShadersCache $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_alignment = $this->_io->readBytes((($this->_io()->pos() + 3) & (~3 - $this->_io()->pos())));
    }
    protected $_m_alignment;

    /**
     * garbage from memory
     */
    public function alignment() { return $this->_m_alignment; }
}

namespace \AndroidOpenglShadersCache;

class String extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AndroidOpenglShadersCache\Cache $_parent = null, \AndroidOpenglShadersCache $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_length = $this->_io->readU4le();
        $this->_m_str = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes($this->length()), 0, false), "ascii");
        $this->_m_alignment = new \AndroidOpenglShadersCache\Alignment($this->_io, $this, $this->_root);
    }
    protected $_m_length;
    protected $_m_str;
    protected $_m_alignment;
    public function length() { return $this->_m_length; }
    public function str() { return $this->_m_str; }
    public function alignment() { return $this->_m_alignment; }
}

namespace \AndroidOpenglShadersCache;

class Cache extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AndroidOpenglShadersCache $_parent = null, \AndroidOpenglShadersCache $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_signature = $this->_io->ensureFixedContents("\x24\x62\x42\x5F");
        $this->_m_version = $this->_io->readU4le();
        $this->_m_deviceVersion = $this->_io->readU4le();
        $this->_m_countOfEntries = $this->_io->readU4le();
        if ($this->version() >= 3) {
            $this->_m_buildId = new \AndroidOpenglShadersCache\String($this->_io, $this, $this->_root);
        }
        $this->_m_entries = [];
        $n = $this->countOfEntries();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_entries[] = new \AndroidOpenglShadersCache\Cache\Entry($this->_io, $this, $this->_root);
        }
    }
    protected $_m_signature;
    protected $_m_version;
    protected $_m_deviceVersion;
    protected $_m_countOfEntries;
    protected $_m_buildId;
    protected $_m_entries;
    public function signature() { return $this->_m_signature; }
    public function version() { return $this->_m_version; }
    public function deviceVersion() { return $this->_m_deviceVersion; }
    public function countOfEntries() { return $this->_m_countOfEntries; }
    public function buildId() { return $this->_m_buildId; }
    public function entries() { return $this->_m_entries; }
}

namespace \AndroidOpenglShadersCache\Cache;

class Entry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AndroidOpenglShadersCache\Cache $_parent = null, \AndroidOpenglShadersCache $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_keySize = $this->_io->readU4le();
        $this->_m_valueSize = $this->_io->readU4le();
        $this->_m_key = $this->_io->readBytes($this->keySize());
        $this->_m_value = $this->_io->readBytes($this->valueSize());
        $this->_m_alignment = new \AndroidOpenglShadersCache\Alignment($this->_io, $this, $this->_root);
    }
    protected $_m_keySize;
    protected $_m_valueSize;
    protected $_m_key;
    protected $_m_value;
    protected $_m_alignment;
    public function keySize() { return $this->_m_keySize; }
    public function valueSize() { return $this->_m_valueSize; }
    public function key() { return $this->_m_key; }
    public function value() { return $this->_m_value; }
    public function alignment() { return $this->_m_alignment; }
}
