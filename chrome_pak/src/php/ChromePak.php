<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Format mostly used by Google Chrome and various Android apps to store
 * resources such as translated strings, help messages and images.
 */

namespace {
    class ChromePak extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\ChromePak $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_version = $this->_io->readU4le();
            if (!( (($this->_m_version == 4) || ($this->_m_version == 5)) )) {
                throw new \Kaitai\Struct\Error\ValidationNotAnyOfError($this->_m_version, $this->_io, "/seq/0");
            }
            if ($this->version() == 4) {
                $this->_m_numResourcesV4 = $this->_io->readU4le();
            }
            $this->_m_encoding = $this->_io->readU1();
            if ($this->version() == 5) {
                $this->_m_v5Part = new \ChromePak\HeaderV5Part($this->_io, $this, $this->_root);
            }
            $this->_m_resources = [];
            $n = $this->numResources() + 1;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_resources[] = new \ChromePak\Resource($i, $i < $this->numResources(), $this->_io, $this, $this->_root);
            }
            $this->_m_aliases = [];
            $n = $this->numAliases();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_aliases[] = new \ChromePak\Alias($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numAliases;
        public function numAliases() {
            if ($this->_m_numAliases !== null)
                return $this->_m_numAliases;
            $this->_m_numAliases = ($this->version() == 5 ? $this->v5Part()->numAliases() : 0);
            return $this->_m_numAliases;
        }
        protected $_m_numResources;
        public function numResources() {
            if ($this->_m_numResources !== null)
                return $this->_m_numResources;
            $this->_m_numResources = ($this->version() == 5 ? $this->v5Part()->numResources() : $this->numResourcesV4());
            return $this->_m_numResources;
        }
        protected $_m_version;
        protected $_m_numResourcesV4;
        protected $_m_encoding;
        protected $_m_v5Part;
        protected $_m_resources;
        protected $_m_aliases;

        /**
         * only versions 4 and 5 are supported
         */
        public function version() { return $this->_m_version; }
        public function numResourcesV4() { return $this->_m_numResourcesV4; }

        /**
         * Character encoding of all text resources in the PAK file. Note that
         * the file can **always** contain binary resources, this only applies to
         * those that are supposed to hold text.
         * 
         * In practice, this will probably always be `encodings::utf8` - I haven't
         * seen any organic file that would state otherwise. `UTF8` is also usually
         * hardcoded in Python scripts from the GRIT repository that generate .pak
         * files (for example
         * [`pak_util.py:79`](https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/pak_util.py#79)).
         */
        public function encoding() { return $this->_m_encoding; }
        public function v5Part() { return $this->_m_v5Part; }

        /**
         * The length is calculated by looking at the offset of
         * the next item, so an extra entry is stored with id 0
         * and offset pointing to the end of the resources.
         */
        public function resources() { return $this->_m_resources; }
        public function aliases() { return $this->_m_aliases; }
    }
}

namespace ChromePak {
    class Alias extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ChromePak $_parent = null, ?\ChromePak $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_id = $this->_io->readU2le();
            $this->_m_resourceIdx = $this->_io->readU2le();
            if (!($this->_m_resourceIdx <= $this->_parent()->numResources() - 1)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->_parent()->numResources() - 1, $this->_m_resourceIdx, $this->_io, "/types/alias/seq/1");
            }
        }
        protected $_m_resource;
        public function resource() {
            if ($this->_m_resource !== null)
                return $this->_m_resource;
            $this->_m_resource = $this->_parent()->resources()[$this->resourceIdx()];
            return $this->_m_resource;
        }
        protected $_m_id;
        protected $_m_resourceIdx;
        public function id() { return $this->_m_id; }
        public function resourceIdx() { return $this->_m_resourceIdx; }
    }
}

namespace ChromePak {
    class HeaderV5Part extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ChromePak $_parent = null, ?\ChromePak $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_encodingPadding = $this->_io->readBytes(3);
            $this->_m_numResources = $this->_io->readU2le();
            $this->_m_numAliases = $this->_io->readU2le();
        }
        protected $_m_encodingPadding;
        protected $_m_numResources;
        protected $_m_numAliases;
        public function encodingPadding() { return $this->_m_encodingPadding; }
        public function numResources() { return $this->_m_numResources; }
        public function numAliases() { return $this->_m_numAliases; }
    }
}

namespace ChromePak {
    class Resource extends \Kaitai\Struct\Struct {
        public function __construct(int $idx, bool $hasBody, \Kaitai\Struct\Stream $_io, ?\ChromePak $_parent = null, ?\ChromePak $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_idx = $idx;
            $this->_m_hasBody = $hasBody;
            $this->_read();
        }

        private function _read() {
            $this->_m_id = $this->_io->readU2le();
            $this->_m_ofsBody = $this->_io->readU4le();
        }
        protected $_m_body;

        /**
         * MUST NOT be accessed until the next `resource` is parsed
         */
        public function body() {
            if ($this->_m_body !== null)
                return $this->_m_body;
            if ($this->hasBody()) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->ofsBody());
                $this->_m_body = $this->_io->readBytes($this->lenBody());
                $this->_io->seek($_pos);
            }
            return $this->_m_body;
        }
        protected $_m_lenBody;

        /**
         * MUST NOT be accessed until the next `resource` is parsed
         */
        public function lenBody() {
            if ($this->_m_lenBody !== null)
                return $this->_m_lenBody;
            if ($this->hasBody()) {
                $this->_m_lenBody = $this->_parent()->resources()[$this->idx() + 1]->ofsBody() - $this->ofsBody();
            }
            return $this->_m_lenBody;
        }
        protected $_m_id;
        protected $_m_ofsBody;
        protected $_m_idx;
        protected $_m_hasBody;
        public function id() { return $this->_m_id; }
        public function ofsBody() { return $this->_m_ofsBody; }
        public function idx() { return $this->_m_idx; }
        public function hasBody() { return $this->_m_hasBody; }
    }
}

namespace ChromePak {
    class Encodings {

        /**
         * file is not expected to contain any text resources
         */
        const BINARY = 0;

        /**
         * all text resources are encoded in UTF-8
         */
        const UTF8 = 1;

        /**
         * all text resources are encoded in UTF-16
         */
        const UTF16 = 2;

        private const _VALUES = [0 => true, 1 => true, 2 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
