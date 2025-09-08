<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * [GNU gettext](https://www.gnu.org/software/gettext/) is a popular
 * solution in free/open source software world to do i18n/l10n of
 * software, by providing translated strings that will substitute
 * strings in original language (typically, English).
 * 
 * gettext .mo is a binary database format which stores these string
 * translation pairs in an efficient binary format, ready to be used by
 * gettext-enabled software. .mo format is a result of compilation of
 * text-based .po files using
 * [msgfmt](https://www.gnu.org/software/gettext/manual/html_node/msgfmt-Invocation.html#msgfmt-Invocation)
 * utility. The reverse conversion (.mo -> .po) is also possible using
 * [msgunfmt](https://www.gnu.org/software/gettext/manual/html_node/msgunfmt-Invocation.html#msgunfmt-Invocation)
 * decompiler utility.
 */

namespace {
    class GettextMo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\GettextMo $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_signature = $this->_io->readBytes(4);
            $this->_m_mo = new \GettextMo\Mo($this->_io, $this, $this->_root);
        }
        protected $_m_signature;
        protected $_m_mo;
        public function signature() { return $this->_m_signature; }
        public function mo() { return $this->_m_mo; }
    }
}

namespace GettextMo {
    class HashLookupIteration extends \Kaitai\Struct\Struct {
        public function __construct(int $idx, int $collisionStep, \Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\GettextMo $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_idx = $idx;
            $this->_m_collisionStep = $collisionStep;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_next;
        public function next() {
            if ($this->_m_next !== null)
                return $this->_m_next;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_next = new \GettextMo\HashLookupIteration($this->_root()->mo()->hashtableItems()[$this->nextIdx()]->val(), $this->collisionStep(), $this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_next;
        }
        protected $_m_nextIdx;
        public function nextIdx() {
            if ($this->_m_nextIdx !== null)
                return $this->_m_nextIdx;
            $this->_m_nextIdx = ($this->idx() + $this->collisionStep()) - ($this->idx() >= $this->_root()->mo()->numHashtableItems() - $this->collisionStep() ? $this->_root()->mo()->numHashtableItems() : 0);
            return $this->_m_nextIdx;
        }
        protected $_m_original;
        public function original() {
            if ($this->_m_original !== null)
                return $this->_m_original;
            $this->_m_original = $this->_root()->mo()->originals()[$this->idx()]->str();
            return $this->_m_original;
        }
        protected $_m_translation;
        public function translation() {
            if ($this->_m_translation !== null)
                return $this->_m_translation;
            $this->_m_translation = $this->_root()->mo()->translations()[$this->idx()]->str();
            return $this->_m_translation;
        }
        protected $_m_idx;
        protected $_m_collisionStep;
        public function idx() { return $this->_m_idx; }
        public function collisionStep() { return $this->_m_collisionStep; }
    }
}

/**
 * def lookup(s:str, t:gettext_mo.GettextMo):
 *   try:
 *     l=gettext_mo.GettextMo.HashtableLookup(s, string_hash(s), t._io, _parent=t, _root=t)
 *     e=l.entry
 *     while(not e.found):
 *       e=e.next
 *     return e.current
 *   except:
 *     raise Exception("Not found "+s+" in the hashtable!")
 * 
 * lookup(t.mo.originals[145].str, t)
 */

namespace GettextMo {
    class HashtableLookup extends \Kaitai\Struct\Struct {
        public function __construct(string $query, int $hash, \Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\GettextMo $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_query = $query;
            $this->_m_hash = $hash;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_collisionStep;
        public function collisionStep() {
            if ($this->_m_collisionStep !== null)
                return $this->_m_collisionStep;
            $this->_m_collisionStep = \Kaitai\Struct\Stream::mod($this->hash(), $this->_root()->mo()->numHashtableItems() - 2) + 1;
            return $this->_m_collisionStep;
        }
        protected $_m_entry;
        public function entry() {
            if ($this->_m_entry !== null)
                return $this->_m_entry;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_entry = new \GettextMo\LookupIteration($this->hashLookupIteration(), $this->query(), $this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_entry;
        }
        protected $_m_hashLookupIteration;
        public function hashLookupIteration() {
            if ($this->_m_hashLookupIteration !== null)
                return $this->_m_hashLookupIteration;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_hashLookupIteration = new \GettextMo\HashLookupIteration($this->_root()->mo()->hashtableItems()[$this->idx()]->val(), $this->collisionStep(), $this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_hashLookupIteration;
        }
        protected $_m_idx;
        public function idx() {
            if ($this->_m_idx !== null)
                return $this->_m_idx;
            $this->_m_idx = \Kaitai\Struct\Stream::mod($this->hash(), $this->_root()->mo()->numHashtableItems());
            return $this->_m_idx;
        }
        protected $_m_query;
        protected $_m_hash;
        public function query() { return $this->_m_query; }

        /**
         * def string_hash(s):
         *   s=s.encode("utf-8")
         *   h = 0
         *   for i in range(len(s)):
         *     h = h << 4
         *     h += s[i]
         *     tmp = h & 0xF0000000
         *     if tmp != 0:
         *       h ^= tmp
         *       h ^= tmp >> 24
         *   return h
         */
        public function hash() { return $this->_m_hash; }
    }
}

namespace GettextMo {
    class LookupIteration extends \Kaitai\Struct\Struct {
        public function __construct(\GettextMo\HashLookupIteration $current, string $query, \Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\GettextMo $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_current = $current;
            $this->_m_query = $query;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_found;
        public function found() {
            if ($this->_m_found !== null)
                return $this->_m_found;
            $this->_m_found = $this->query() == $this->current()->original();
            return $this->_m_found;
        }
        protected $_m_next;
        public function next() {
            if ($this->_m_next !== null)
                return $this->_m_next;
            if (!($this->found())) {
                $_pos = $this->_io->pos();
                $this->_io->seek(0);
                $this->_m_next = new \GettextMo\LookupIteration($this->current()->next(), $this->query(), $this->_io, $this, $this->_root);
                $this->_io->seek($_pos);
            }
            return $this->_m_next;
        }
        protected $_m_current;
        protected $_m_query;
        public function current() { return $this->_m_current; }
        public function query() { return $this->_m_query; }
    }
}

namespace GettextMo {
    class Mo extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\GettextMo $_parent = null, ?\GettextMo $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            switch ($this->_root()->signature()) {
                case "\xDE\x12\x04\x95":
                    $this->_m__is_le = true;
                    break;
                case "\x95\x04\x12\xDE":
                    $this->_m__is_le = false;
                    break;
            }

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_version = new \GettextMo\Mo\Version($this->_io, $this, $this->_root, $this->_m__is_le);
            $this->_m_numTranslations = $this->_io->readU4le();
            $this->_m_ofsOriginals = $this->_io->readU4le();
            $this->_m_ofsTranslations = $this->_io->readU4le();
            $this->_m_numHashtableItems = $this->_io->readU4le();
            $this->_m_ofsHashtableItems = $this->_io->readU4le();
        }

        private function _readBE() {
            $this->_m_version = new \GettextMo\Mo\Version($this->_io, $this, $this->_root, $this->_m__is_le);
            $this->_m_numTranslations = $this->_io->readU4be();
            $this->_m_ofsOriginals = $this->_io->readU4be();
            $this->_m_ofsTranslations = $this->_io->readU4be();
            $this->_m_numHashtableItems = $this->_io->readU4be();
            $this->_m_ofsHashtableItems = $this->_io->readU4be();
        }
        protected $_m_hashtableItems;
        public function hashtableItems() {
            if ($this->_m_hashtableItems !== null)
                return $this->_m_hashtableItems;
            if ($this->ofsHashtableItems() != 0) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->ofsHashtableItems());
                if ($this->_m__is_le) {
                    $this->_m_hashtableItems = [];
                    $n = $this->numHashtableItems();
                    for ($i = 0; $i < $n; $i++) {
                        $this->_m_hashtableItems[] = new \GettextMo\Mo\HashtableItem($io, $this, $this->_root, $this->_m__is_le);
                    }
                } else {
                    $this->_m_hashtableItems = [];
                    $n = $this->numHashtableItems();
                    for ($i = 0; $i < $n; $i++) {
                        $this->_m_hashtableItems[] = new \GettextMo\Mo\HashtableItem($io, $this, $this->_root, $this->_m__is_le);
                    }
                }
                $io->seek($_pos);
            }
            return $this->_m_hashtableItems;
        }
        protected $_m_originals;
        public function originals() {
            if ($this->_m_originals !== null)
                return $this->_m_originals;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsOriginals());
            if ($this->_m__is_le) {
                $this->_m_originals = [];
                $n = $this->numTranslations();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_originals[] = new \GettextMo\Mo\Descriptor($io, $this, $this->_root, $this->_m__is_le);
                }
            } else {
                $this->_m_originals = [];
                $n = $this->numTranslations();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_originals[] = new \GettextMo\Mo\Descriptor($io, $this, $this->_root, $this->_m__is_le);
                }
            }
            $io->seek($_pos);
            return $this->_m_originals;
        }
        protected $_m_translations;
        public function translations() {
            if ($this->_m_translations !== null)
                return $this->_m_translations;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsTranslations());
            if ($this->_m__is_le) {
                $this->_m_translations = [];
                $n = $this->numTranslations();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_translations[] = new \GettextMo\Mo\Descriptor($io, $this, $this->_root, $this->_m__is_le);
                }
            } else {
                $this->_m_translations = [];
                $n = $this->numTranslations();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_translations[] = new \GettextMo\Mo\Descriptor($io, $this, $this->_root, $this->_m__is_le);
                }
            }
            $io->seek($_pos);
            return $this->_m_translations;
        }
        protected $_m_version;
        protected $_m_numTranslations;
        protected $_m_ofsOriginals;
        protected $_m_ofsTranslations;
        protected $_m_numHashtableItems;
        protected $_m_ofsHashtableItems;
        public function version() { return $this->_m_version; }
        public function numTranslations() { return $this->_m_numTranslations; }
        public function ofsOriginals() { return $this->_m_ofsOriginals; }
        public function ofsTranslations() { return $this->_m_ofsTranslations; }
        public function numHashtableItems() { return $this->_m_numHashtableItems; }
        public function ofsHashtableItems() { return $this->_m_ofsHashtableItems; }
    }
}

namespace GettextMo\Mo {
    class Descriptor extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\GettextMo\Mo $_parent = null, ?\GettextMo $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_lenStr = $this->_io->readU4le();
            $this->_m_ofsStr = $this->_io->readU4le();
        }

        private function _readBE() {
            $this->_m_lenStr = $this->_io->readU4be();
            $this->_m_ofsStr = $this->_io->readU4be();
        }
        protected $_m_str;
        public function str() {
            if ($this->_m_str !== null)
                return $this->_m_str;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsStr());
            if ($this->_m__is_le) {
                $this->_m_str = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($io->readBytes($this->lenStr()), 0, false), "UTF-8");
            } else {
                $this->_m_str = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($io->readBytes($this->lenStr()), 0, false), "UTF-8");
            }
            $io->seek($_pos);
            return $this->_m_str;
        }
        protected $_m_lenStr;
        protected $_m_ofsStr;
        public function lenStr() { return $this->_m_lenStr; }
        public function ofsStr() { return $this->_m_ofsStr; }
    }
}

namespace GettextMo\Mo {
    class HashtableItem extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\GettextMo\Mo $_parent = null, ?\GettextMo $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_rawVal = $this->_io->readU4le();
        }

        private function _readBE() {
            $this->_m_rawVal = $this->_io->readU4be();
        }
        protected $_m_isSystemDependent;
        public function isSystemDependent() {
            if ($this->_m_isSystemDependent !== null)
                return $this->_m_isSystemDependent;
            if ($this->rawVal() != 0) {
                $this->_m_isSystemDependent = ($this->val1() & $this->mask()) == 1;
            }
            return $this->_m_isSystemDependent;
        }
        protected $_m_mask;
        public function mask() {
            if ($this->_m_mask !== null)
                return $this->_m_mask;
            $this->_m_mask = 2147483648;
            return $this->_m_mask;
        }
        protected $_m_val;
        public function val() {
            if ($this->_m_val !== null)
                return $this->_m_val;
            if ($this->rawVal() != 0) {
                $this->_m_val = $this->val1() & ~($this->mask());
            }
            return $this->_m_val;
        }
        protected $_m_val1;
        public function val1() {
            if ($this->_m_val1 !== null)
                return $this->_m_val1;
            if ($this->rawVal() != 0) {
                $this->_m_val1 = $this->rawVal() - 1;
            }
            return $this->_m_val1;
        }
        protected $_m_rawVal;
        public function rawVal() { return $this->_m_rawVal; }
    }
}

namespace GettextMo\Mo {
    class Version extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\GettextMo\Mo $_parent = null, ?\GettextMo $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_versionRaw = $this->_io->readU4le();
        }

        private function _readBE() {
            $this->_m_versionRaw = $this->_io->readU4be();
        }
        protected $_m_major;
        public function major() {
            if ($this->_m_major !== null)
                return $this->_m_major;
            $this->_m_major = $this->versionRaw() >> 16;
            return $this->_m_major;
        }
        protected $_m_minor;
        public function minor() {
            if ($this->_m_minor !== null)
                return $this->_m_minor;
            $this->_m_minor = $this->versionRaw() & 65535;
            return $this->_m_minor;
        }
        protected $_m_versionRaw;
        public function versionRaw() { return $this->_m_versionRaw; }
    }
}
