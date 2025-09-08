<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * You can get a dump for testing from this link:
 * <https://github.com/zhovner/mfdread/raw/master/dump.mfd>
 */

namespace {
    class MifareClassic extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_sectors = [];
            $this->_m_sectors = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m__raw_sectors[] = $this->_io->readBytes((($i >= 32 ? 4 : 1) * 4) * 16);
                $_io__raw_sectors = new \Kaitai\Struct\Stream(end($this->_m__raw_sectors));
                $this->_m_sectors[] = new \MifareClassic\Sector($i == 0, $_io__raw_sectors, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_sectors;
        protected $_m__raw_sectors;
        public function sectors() { return $this->_m_sectors; }
        public function _raw_sectors() { return $this->_m__raw_sectors; }
    }
}

namespace MifareClassic {
    class Key extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MifareClassic\Trailer $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_key = $this->_io->readBytes(6);
        }
        protected $_m_key;
        public function key() { return $this->_m_key; }
    }
}

namespace MifareClassic {
    class Manufacturer extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MifareClassic\Sector $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_nuid = $this->_io->readU4le();
            $this->_m_bcc = $this->_io->readU1();
            $this->_m_sak = $this->_io->readU1();
            $this->_m_atqa = $this->_io->readU2le();
            $this->_m_manufacturer = $this->_io->readBytes(8);
        }
        protected $_m_nuid;
        protected $_m_bcc;
        protected $_m_sak;
        protected $_m_atqa;
        protected $_m_manufacturer;

        /**
         * beware for 7bytes UID it goes over next fields
         */
        public function nuid() { return $this->_m_nuid; }
        public function bcc() { return $this->_m_bcc; }
        public function sak() { return $this->_m_sak; }
        public function atqa() { return $this->_m_atqa; }

        /**
         * may contain manufacture date as BCD
         */
        public function manufacturer() { return $this->_m_manufacturer; }
    }
}

namespace MifareClassic {
    class Sector extends \Kaitai\Struct\Struct {
        public function __construct(bool $hasManufacturer, \Kaitai\Struct\Stream $_io, ?\MifareClassic $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_hasManufacturer = $hasManufacturer;
            $this->_read();
        }

        private function _read() {
            if ($this->hasManufacturer()) {
                $this->_m_manufacturer = new \MifareClassic\Manufacturer($this->_io, $this, $this->_root);
            }
            $this->_m__raw_dataFiller = $this->_io->readBytes(($this->_io()->size() - $this->_io()->pos()) - 16);
            $_io__raw_dataFiller = new \Kaitai\Struct\Stream($this->_m__raw_dataFiller);
            $this->_m_dataFiller = new \MifareClassic\Sector\Filler($_io__raw_dataFiller, $this, $this->_root);
            $this->_m_trailer = new \MifareClassic\Trailer($this->_io, $this, $this->_root);
        }
        protected $_m_blockSize;
        public function blockSize() {
            if ($this->_m_blockSize !== null)
                return $this->_m_blockSize;
            $this->_m_blockSize = 16;
            return $this->_m_blockSize;
        }
        protected $_m_blocks;
        public function blocks() {
            if ($this->_m_blocks !== null)
                return $this->_m_blocks;
            $io = $this->dataFiller()->_io();
            $_pos = $io->pos();
            $io->seek(0);
            $this->_m_blocks = [];
            $i = 0;
            while (!$io->isEof()) {
                $this->_m_blocks[] = $io->readBytes($this->blockSize());
                $i++;
            }
            $io->seek($_pos);
            return $this->_m_blocks;
        }
        protected $_m_data;
        public function data() {
            if ($this->_m_data !== null)
                return $this->_m_data;
            $this->_m_data = $this->dataFiller()->data();
            return $this->_m_data;
        }
        protected $_m_values;
        public function values() {
            if ($this->_m_values !== null)
                return $this->_m_values;
            $io = $this->dataFiller()->_io();
            $_pos = $io->pos();
            $io->seek(0);
            $this->_m_values = new \MifareClassic\Sector\Values($io, $this, $this->_root);
            $io->seek($_pos);
            return $this->_m_values;
        }
        protected $_m_manufacturer;
        protected $_m_dataFiller;
        protected $_m_trailer;
        protected $_m_hasManufacturer;
        protected $_m__raw_dataFiller;
        public function manufacturer() { return $this->_m_manufacturer; }
        public function dataFiller() { return $this->_m_dataFiller; }
        public function trailer() { return $this->_m_trailer; }
        public function hasManufacturer() { return $this->_m_hasManufacturer; }
        public function _raw_dataFiller() { return $this->_m__raw_dataFiller; }
    }
}

/**
 * only to create _io
 */

namespace MifareClassic\Sector {
    class Filler extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MifareClassic\Sector $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_data = $this->_io->readBytes($this->_io()->size());
        }
        protected $_m_data;
        public function data() { return $this->_m_data; }
    }
}

namespace MifareClassic\Sector {
    class Values extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MifareClassic\Sector $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_values = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_values[] = new \MifareClassic\Sector\Values\ValueBlock($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_values;
        public function values() { return $this->_m_values; }
    }
}

namespace MifareClassic\Sector\Values {
    class ValueBlock extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MifareClassic\Sector\Values $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_valuez = [];
            $n = 3;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_valuez[] = $this->_io->readU4le();
            }
            $this->_m_addrz = [];
            $n = 4;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_addrz[] = $this->_io->readU1();
            }
        }
        protected $_m_addr;
        public function addr() {
            if ($this->_m_addr !== null)
                return $this->_m_addr;
            if ($this->valid()) {
                $this->_m_addr = $this->addrz()[0];
            }
            return $this->_m_addr;
        }
        protected $_m_addrValid;
        public function addrValid() {
            if ($this->_m_addrValid !== null)
                return $this->_m_addrValid;
            $this->_m_addrValid =  (($this->addrz()[0] == ~($this->addrz()[1])) && ($this->addrz()[0] == $this->addrz()[2]) && ($this->addrz()[1] == $this->addrz()[3])) ;
            return $this->_m_addrValid;
        }
        protected $_m_valid;
        public function valid() {
            if ($this->_m_valid !== null)
                return $this->_m_valid;
            $this->_m_valid =  (($this->valueValid()) && ($this->addrValid())) ;
            return $this->_m_valid;
        }
        protected $_m_value;
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            if ($this->valid()) {
                $this->_m_value = $this->valuez()[0];
            }
            return $this->_m_value;
        }
        protected $_m_valueValid;
        public function valueValid() {
            if ($this->_m_valueValid !== null)
                return $this->_m_valueValid;
            $this->_m_valueValid =  (($this->valuez()[0] == ~($this->valuez()[1])) && ($this->valuez()[0] == $this->valuez()[2])) ;
            return $this->_m_valueValid;
        }
        protected $_m_valuez;
        protected $_m_addrz;
        public function valuez() { return $this->_m_valuez; }
        public function addrz() { return $this->_m_addrz; }
    }
}

namespace MifareClassic {
    class Trailer extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MifareClassic\Sector $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_keyA = new \MifareClassic\Key($this->_io, $this, $this->_root);
            $this->_m__raw_accessBits = $this->_io->readBytes(3);
            $_io__raw_accessBits = new \Kaitai\Struct\Stream($this->_m__raw_accessBits);
            $this->_m_accessBits = new \MifareClassic\Trailer\AccessConditions($_io__raw_accessBits, $this, $this->_root);
            $this->_m_userByte = $this->_io->readU1();
            $this->_m_keyB = new \MifareClassic\Key($this->_io, $this, $this->_root);
        }
        protected $_m_acBits;
        public function acBits() {
            if ($this->_m_acBits !== null)
                return $this->_m_acBits;
            $this->_m_acBits = 3;
            return $this->_m_acBits;
        }
        protected $_m_acCountOfChunks;
        public function acCountOfChunks() {
            if ($this->_m_acCountOfChunks !== null)
                return $this->_m_acCountOfChunks;
            $this->_m_acCountOfChunks = $this->acBits() * 2;
            return $this->_m_acCountOfChunks;
        }
        protected $_m_acsInSector;
        public function acsInSector() {
            if ($this->_m_acsInSector !== null)
                return $this->_m_acsInSector;
            $this->_m_acsInSector = 4;
            return $this->_m_acsInSector;
        }
        protected $_m_keyA;
        protected $_m_accessBits;
        protected $_m_userByte;
        protected $_m_keyB;
        protected $_m__raw_accessBits;
        public function keyA() { return $this->_m_keyA; }
        public function accessBits() { return $this->_m_accessBits; }
        public function userByte() { return $this->_m_userByte; }
        public function keyB() { return $this->_m_keyB; }
        public function _raw_accessBits() { return $this->_m__raw_accessBits; }
    }
}

namespace MifareClassic\Trailer {
    class AccessConditions extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MifareClassic\Trailer $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_rawChunks = [];
            $n = $this->_parent()->acCountOfChunks();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_rawChunks[] = $this->_io->readBitsIntBe(4);
            }
        }
        protected $_m_acsRaw;
        public function acsRaw() {
            if ($this->_m_acsRaw !== null)
                return $this->_m_acsRaw;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_acsRaw = [];
            $n = $this->_parent()->acsInSector();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_acsRaw[] = new \MifareClassic\Trailer\AccessConditions\Ac($i, $this->_io, $this, $this->_root);
            }
            $this->_io->seek($_pos);
            return $this->_m_acsRaw;
        }
        protected $_m_chunks;
        public function chunks() {
            if ($this->_m_chunks !== null)
                return $this->_m_chunks;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_chunks = [];
            $n = $this->_parent()->acBits();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_chunks[] = new \MifareClassic\Trailer\AccessConditions\ValidChunk($this->rawChunks()[$this->remaps()[$i]->invChunkNo()], $this->rawChunks()[$this->remaps()[$i]->chunkNo()], $this->_io, $this, $this->_root);
            }
            $this->_io->seek($_pos);
            return $this->_m_chunks;
        }
        protected $_m_dataAcs;
        public function dataAcs() {
            if ($this->_m_dataAcs !== null)
                return $this->_m_dataAcs;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_dataAcs = [];
            $n = $this->_parent()->acsInSector() - 1;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_dataAcs[] = new \MifareClassic\Trailer\AccessConditions\DataAc($this->acsRaw()[$i], $this->_io, $this, $this->_root);
            }
            $this->_io->seek($_pos);
            return $this->_m_dataAcs;
        }
        protected $_m_remaps;
        public function remaps() {
            if ($this->_m_remaps !== null)
                return $this->_m_remaps;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_remaps = [];
            $n = $this->_parent()->acBits();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_remaps[] = new \MifareClassic\Trailer\AccessConditions\ChunkBitRemap($i, $this->_io, $this, $this->_root);
            }
            $this->_io->seek($_pos);
            return $this->_m_remaps;
        }
        protected $_m_trailerAc;
        public function trailerAc() {
            if ($this->_m_trailerAc !== null)
                return $this->_m_trailerAc;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_trailerAc = new \MifareClassic\Trailer\AccessConditions\TrailerAc($this->acsRaw()[$this->_parent()->acsInSector() - 1], $this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_trailerAc;
        }
        protected $_m_rawChunks;
        public function rawChunks() { return $this->_m_rawChunks; }
    }
}

namespace MifareClassic\Trailer\AccessConditions {
    class Ac extends \Kaitai\Struct\Struct {
        public function __construct(int $index, \Kaitai\Struct\Stream $_io, ?\MifareClassic\Trailer\AccessConditions $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_index = $index;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_bits;
        public function bits() {
            if ($this->_m_bits !== null)
                return $this->_m_bits;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_bits = [];
            $n = $this->_parent()->_parent()->acBits();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_bits[] = new \MifareClassic\Trailer\AccessConditions\Ac\AcBit($this->index(), $this->_parent()->chunks()[$i]->chunk(), $this->_io, $this, $this->_root);
            }
            $this->_io->seek($_pos);
            return $this->_m_bits;
        }
        protected $_m_invShiftVal;
        public function invShiftVal() {
            if ($this->_m_invShiftVal !== null)
                return $this->_m_invShiftVal;
            $this->_m_invShiftVal = ($this->bits()[0]->n() << 2 | $this->bits()[1]->n() << 1) | $this->bits()[2]->n();
            return $this->_m_invShiftVal;
        }
        protected $_m_val;

        /**
         * c3 c2 c1
         */
        public function val() {
            if ($this->_m_val !== null)
                return $this->_m_val;
            $this->_m_val = ($this->bits()[2]->n() << 2 | $this->bits()[1]->n() << 1) | $this->bits()[0]->n();
            return $this->_m_val;
        }
        protected $_m_index;
        public function index() { return $this->_m_index; }
    }
}

namespace MifareClassic\Trailer\AccessConditions\Ac {
    class AcBit extends \Kaitai\Struct\Struct {
        public function __construct(int $i, int $chunk, \Kaitai\Struct\Stream $_io, ?\MifareClassic\Trailer\AccessConditions\Ac $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_i = $i;
            $this->_m_chunk = $chunk;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_b;
        public function b() {
            if ($this->_m_b !== null)
                return $this->_m_b;
            $this->_m_b = $this->n() == 1;
            return $this->_m_b;
        }
        protected $_m_n;
        public function n() {
            if ($this->_m_n !== null)
                return $this->_m_n;
            $this->_m_n = $this->chunk() >> $this->i() & 1;
            return $this->_m_n;
        }
        protected $_m_i;
        protected $_m_chunk;
        public function i() { return $this->_m_i; }
        public function chunk() { return $this->_m_chunk; }
    }
}

namespace MifareClassic\Trailer\AccessConditions {
    class ChunkBitRemap extends \Kaitai\Struct\Struct {
        public function __construct(int $bitNo, \Kaitai\Struct\Stream $_io, ?\MifareClassic\Trailer\AccessConditions $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_bitNo = $bitNo;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_chunkNo;
        public function chunkNo() {
            if ($this->_m_chunkNo !== null)
                return $this->_m_chunkNo;
            $this->_m_chunkNo = \Kaitai\Struct\Stream::mod(($this->invChunkNo() + $this->shiftValue()) + $this->_parent()->_parent()->acCountOfChunks(), $this->_parent()->_parent()->acCountOfChunks());
            return $this->_m_chunkNo;
        }
        protected $_m_invChunkNo;
        public function invChunkNo() {
            if ($this->_m_invChunkNo !== null)
                return $this->_m_invChunkNo;
            $this->_m_invChunkNo = $this->bitNo() + $this->shiftValue();
            return $this->_m_invChunkNo;
        }
        protected $_m_shiftValue;
        public function shiftValue() {
            if ($this->_m_shiftValue !== null)
                return $this->_m_shiftValue;
            $this->_m_shiftValue = ($this->bitNo() == 1 ? -1 : 1);
            return $this->_m_shiftValue;
        }
        protected $_m_bitNo;
        public function bitNo() { return $this->_m_bitNo; }
    }
}

namespace MifareClassic\Trailer\AccessConditions {
    class DataAc extends \Kaitai\Struct\Struct {
        public function __construct(\MifareClassic\Trailer\AccessConditions\Ac $ac, \Kaitai\Struct\Stream $_io, ?\MifareClassic\Trailer\AccessConditions $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_ac = $ac;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_decrementAvailable;
        public function decrementAvailable() {
            if ($this->_m_decrementAvailable !== null)
                return $this->_m_decrementAvailable;
            $this->_m_decrementAvailable =  (( (($this->ac()->bits()[1]->b()) || (!($this->ac()->bits()[0]->b()))) ) && (!($this->ac()->bits()[2]->b()))) ;
            return $this->_m_decrementAvailable;
        }
        protected $_m_incrementAvailable;
        public function incrementAvailable() {
            if ($this->_m_incrementAvailable !== null)
                return $this->_m_incrementAvailable;
            $this->_m_incrementAvailable =  (( ((!($this->ac()->bits()[0]->b())) && (!($this->readKeyARequired())) && (!($this->readKeyBRequired()))) ) || ( ((!($this->ac()->bits()[0]->b())) && ($this->readKeyARequired()) && ($this->readKeyBRequired())) )) ;
            return $this->_m_incrementAvailable;
        }
        protected $_m_readKeyARequired;
        public function readKeyARequired() {
            if ($this->_m_readKeyARequired !== null)
                return $this->_m_readKeyARequired;
            $this->_m_readKeyARequired = $this->ac()->val() <= 4;
            return $this->_m_readKeyARequired;
        }
        protected $_m_readKeyBRequired;
        public function readKeyBRequired() {
            if ($this->_m_readKeyBRequired !== null)
                return $this->_m_readKeyBRequired;
            $this->_m_readKeyBRequired = $this->ac()->val() <= 6;
            return $this->_m_readKeyBRequired;
        }
        protected $_m_writeKeyARequired;
        public function writeKeyARequired() {
            if ($this->_m_writeKeyARequired !== null)
                return $this->_m_writeKeyARequired;
            $this->_m_writeKeyARequired = $this->ac()->val() == 0;
            return $this->_m_writeKeyARequired;
        }
        protected $_m_writeKeyBRequired;
        public function writeKeyBRequired() {
            if ($this->_m_writeKeyBRequired !== null)
                return $this->_m_writeKeyBRequired;
            $this->_m_writeKeyBRequired =  (( ((!($this->readKeyARequired())) || ($this->readKeyBRequired())) ) && (!($this->ac()->bits()[0]->b()))) ;
            return $this->_m_writeKeyBRequired;
        }
        protected $_m_ac;
        public function ac() { return $this->_m_ac; }
    }
}

namespace MifareClassic\Trailer\AccessConditions {
    class TrailerAc extends \Kaitai\Struct\Struct {
        public function __construct(\MifareClassic\Trailer\AccessConditions\Ac $ac, \Kaitai\Struct\Stream $_io, ?\MifareClassic\Trailer\AccessConditions $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_ac = $ac;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_canReadKeyB;

        /**
         * key A is required
         */
        public function canReadKeyB() {
            if ($this->_m_canReadKeyB !== null)
                return $this->_m_canReadKeyB;
            $this->_m_canReadKeyB = $this->ac()->invShiftVal() <= 2;
            return $this->_m_canReadKeyB;
        }
        protected $_m_canWriteAccessBits;
        public function canWriteAccessBits() {
            if ($this->_m_canWriteAccessBits !== null)
                return $this->_m_canWriteAccessBits;
            $this->_m_canWriteAccessBits = $this->ac()->bits()[2]->b();
            return $this->_m_canWriteAccessBits;
        }
        protected $_m_canWriteKeys;
        public function canWriteKeys() {
            if ($this->_m_canWriteKeys !== null)
                return $this->_m_canWriteKeys;
            $this->_m_canWriteKeys =  ((\Kaitai\Struct\Stream::mod($this->ac()->invShiftVal() + 1, 3) != 0) && ($this->ac()->invShiftVal() < 6)) ;
            return $this->_m_canWriteKeys;
        }
        protected $_m_keyBControlsWrite;
        public function keyBControlsWrite() {
            if ($this->_m_keyBControlsWrite !== null)
                return $this->_m_keyBControlsWrite;
            $this->_m_keyBControlsWrite = !($this->canReadKeyB());
            return $this->_m_keyBControlsWrite;
        }
        protected $_m_ac;
        public function ac() { return $this->_m_ac; }
    }
}

namespace MifareClassic\Trailer\AccessConditions {
    class ValidChunk extends \Kaitai\Struct\Struct {
        public function __construct(int $invChunk, int $chunk, \Kaitai\Struct\Stream $_io, ?\MifareClassic\Trailer\AccessConditions $_parent = null, ?\MifareClassic $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_invChunk = $invChunk;
            $this->_m_chunk = $chunk;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_valid;
        public function valid() {
            if ($this->_m_valid !== null)
                return $this->_m_valid;
            $this->_m_valid = ($this->invChunk() ^ $this->chunk()) == 15;
            return $this->_m_valid;
        }
        protected $_m_invChunk;
        protected $_m_chunk;
        public function invChunk() { return $this->_m_invChunk; }

        /**
         * c3 c2 c1 c0
         */
        public function chunk() { return $this->_m_chunk; }
    }
}
