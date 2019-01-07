<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * DCX is a simple extension of PCX image format allowing to bundle
 * many PCX images (typically, pages of a document) in one file. It saw
 * some limited use in DOS-era fax software, but was largely
 * superseeded with multi-page TIFFs and PDFs since then.
 */

class PcxDcx extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PcxDcx $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\xB1\x68\xDE\x3A");
        $this->_m_files = [];
        $i = 0;
        do {
            $_ = new \PcxDcx\PcxOffset($this->_io, $this, $this->_root);
            $this->_m_files[] = $_;
            $i++;
        } while (!($_->ofsBody() == 0));
    }
    protected $_m_magic;
    protected $_m_files;
    public function magic() { return $this->_m_magic; }
    public function files() { return $this->_m_files; }
}

namespace \PcxDcx;

class PcxOffset extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \PcxDcx $_parent = null, \PcxDcx $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_ofsBody = $this->_io->readU4le();
    }
    protected $_m_body;
    public function body() {
        if ($this->_m_body !== null)
            return $this->_m_body;
        if ($this->ofsBody() != 0) {
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsBody());
            $this->_m_body = new \Pcx($this->_io);
            $this->_io->seek($_pos);
        }
        return $this->_m_body;
    }
    protected $_m_ofsBody;
    public function ofsBody() { return $this->_m_ofsBody; }
}
