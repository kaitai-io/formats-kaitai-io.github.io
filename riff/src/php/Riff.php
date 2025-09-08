<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The Resource Interchange File Format (RIFF) is a generic file container format
 * for storing data in tagged chunks. It is primarily used to store multimedia
 * such as sound and video, though it may also be used to store any arbitrary data.
 * 
 * The Microsoft implementation is mostly known through container formats
 * like AVI, ANI and WAV, which use RIFF as their basis.
 */

namespace {
    class Riff extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Riff $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_chunk = new \Riff\Chunk($this->_io, $this, $this->_root);
        }
        protected $_m_chunkId;
        public function chunkId() {
            if ($this->_m_chunkId !== null)
                return $this->_m_chunkId;
            $this->_m_chunkId = $this->chunk()->id();
            return $this->_m_chunkId;
        }
        protected $_m_isRiffChunk;
        public function isRiffChunk() {
            if ($this->_m_isRiffChunk !== null)
                return $this->_m_isRiffChunk;
            $this->_m_isRiffChunk = $this->chunkId() == \Riff\Fourcc::RIFF;
            return $this->_m_isRiffChunk;
        }
        protected $_m_parentChunkData;
        public function parentChunkData() {
            if ($this->_m_parentChunkData !== null)
                return $this->_m_parentChunkData;
            if ($this->isRiffChunk()) {
                $io = $this->chunk()->dataSlot()->_io();
                $_pos = $io->pos();
                $io->seek(0);
                $this->_m_parentChunkData = new \Riff\ParentChunkData($io, $this, $this->_root);
                $io->seek($_pos);
            }
            return $this->_m_parentChunkData;
        }
        protected $_m_subchunks;
        public function subchunks() {
            if ($this->_m_subchunks !== null)
                return $this->_m_subchunks;
            if ($this->isRiffChunk()) {
                $io = $this->parentChunkData()->subchunksSlot()->_io();
                $_pos = $io->pos();
                $io->seek(0);
                $this->_m_subchunks = [];
                $i = 0;
                while (!$io->isEof()) {
                    $this->_m_subchunks[] = new \Riff\ChunkType($io, $this, $this->_root);
                    $i++;
                }
                $io->seek($_pos);
            }
            return $this->_m_subchunks;
        }
        protected $_m_chunk;
        public function chunk() { return $this->_m_chunk; }
    }
}

namespace Riff {
    class Chunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Riff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_id = $this->_io->readU4le();
            $this->_m_len = $this->_io->readU4le();
            $this->_m__raw_dataSlot = $this->_io->readBytes($this->len());
            $_io__raw_dataSlot = new \Kaitai\Struct\Stream($this->_m__raw_dataSlot);
            $this->_m_dataSlot = new \Riff\Chunk\Slot($_io__raw_dataSlot, $this, $this->_root);
            $this->_m_padByte = $this->_io->readBytes(\Kaitai\Struct\Stream::mod($this->len(), 2));
        }
        protected $_m_id;
        protected $_m_len;
        protected $_m_dataSlot;
        protected $_m_padByte;
        protected $_m__raw_dataSlot;
        public function id() { return $this->_m_id; }
        public function len() { return $this->_m_len; }
        public function dataSlot() { return $this->_m_dataSlot; }
        public function padByte() { return $this->_m_padByte; }
        public function _raw_dataSlot() { return $this->_m__raw_dataSlot; }
    }
}

namespace Riff\Chunk {
    class Slot extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Riff\Chunk $_parent = null, ?\Riff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
        }
    }
}

namespace Riff {
    class ChunkType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Riff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            if ($this->chunkOfs() < 0) {
                $this->_m_saveChunkOfs = $this->_io->readBytes(0);
            }
            $this->_m_chunk = new \Riff\Chunk($this->_io, $this, $this->_root);
        }
        protected $_m_chunkData;
        public function chunkData() {
            if ($this->_m_chunkData !== null)
                return $this->_m_chunkData;
            $io = $this->chunk()->dataSlot()->_io();
            $_pos = $io->pos();
            $io->seek(0);
            switch ($this->chunkId()) {
                case \Riff\Fourcc::LIST:
                    $this->_m_chunkData = new \Riff\ListChunkData($io, $this, $this->_root);
                    break;
            }
            $io->seek($_pos);
            return $this->_m_chunkData;
        }
        protected $_m_chunkId;
        public function chunkId() {
            if ($this->_m_chunkId !== null)
                return $this->_m_chunkId;
            $this->_m_chunkId = $this->chunk()->id();
            return $this->_m_chunkId;
        }
        protected $_m_chunkIdReadable;
        public function chunkIdReadable() {
            if ($this->_m_chunkIdReadable !== null)
                return $this->_m_chunkIdReadable;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->chunkOfs());
            $this->_m_chunkIdReadable = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            $this->_io->seek($_pos);
            return $this->_m_chunkIdReadable;
        }
        protected $_m_chunkOfs;
        public function chunkOfs() {
            if ($this->_m_chunkOfs !== null)
                return $this->_m_chunkOfs;
            $this->_m_chunkOfs = $this->_io()->pos();
            return $this->_m_chunkOfs;
        }
        protected $_m_saveChunkOfs;
        protected $_m_chunk;
        public function saveChunkOfs() { return $this->_m_saveChunkOfs; }
        public function chunk() { return $this->_m_chunk; }
    }
}

/**
 * All registered subchunks in the INFO chunk are NULL-terminated strings,
 * but the unregistered might not be. By convention, the registered
 * chunk IDs are in uppercase and the unregistered IDs are in lowercase.
 * 
 * If the chunk ID of an INFO subchunk contains a lowercase
 * letter, this chunk is considered as unregistered and thus we can make
 * no assumptions about the type of data.
 */

namespace Riff {
    class InfoSubchunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Riff\ListChunkData $_parent = null, ?\Riff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            if ($this->chunkOfs() < 0) {
                $this->_m_saveChunkOfs = $this->_io->readBytes(0);
            }
            $this->_m_chunk = new \Riff\Chunk($this->_io, $this, $this->_root);
        }
        protected $_m_chunkData;
        public function chunkData() {
            if ($this->_m_chunkData !== null)
                return $this->_m_chunkData;
            $io = $this->chunk()->dataSlot()->_io();
            $_pos = $io->pos();
            $io->seek(0);
            switch ($this->isUnregisteredTag()) {
                case false:
                    $this->_m_chunkData = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "UTF-8");
                    break;
            }
            $io->seek($_pos);
            return $this->_m_chunkData;
        }
        protected $_m_chunkIdReadable;
        public function chunkIdReadable() {
            if ($this->_m_chunkIdReadable !== null)
                return $this->_m_chunkIdReadable;
            $this->_m_chunkIdReadable = \Kaitai\Struct\Stream::bytesToStr($this->idChars(), "ASCII");
            return $this->_m_chunkIdReadable;
        }
        protected $_m_chunkOfs;
        public function chunkOfs() {
            if ($this->_m_chunkOfs !== null)
                return $this->_m_chunkOfs;
            $this->_m_chunkOfs = $this->_io()->pos();
            return $this->_m_chunkOfs;
        }
        protected $_m_idChars;
        public function idChars() {
            if ($this->_m_idChars !== null)
                return $this->_m_idChars;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->chunkOfs());
            $this->_m_idChars = $this->_io->readBytes(4);
            $this->_io->seek($_pos);
            return $this->_m_idChars;
        }
        protected $_m_isUnregisteredTag;

        /**
         * Check if chunk_id contains lowercase characters ([a-z], ASCII 97 = a, ASCII 122 = z).
         */
        public function isUnregisteredTag() {
            if ($this->_m_isUnregisteredTag !== null)
                return $this->_m_isUnregisteredTag;
            $this->_m_isUnregisteredTag =  (( ((ord($this->idChars()[0]) >= 97) && (ord($this->idChars()[0]) <= 122)) ) || ( ((ord($this->idChars()[1]) >= 97) && (ord($this->idChars()[1]) <= 122)) ) || ( ((ord($this->idChars()[2]) >= 97) && (ord($this->idChars()[2]) <= 122)) ) || ( ((ord($this->idChars()[3]) >= 97) && (ord($this->idChars()[3]) <= 122)) )) ;
            return $this->_m_isUnregisteredTag;
        }
        protected $_m_saveChunkOfs;
        protected $_m_chunk;
        public function saveChunkOfs() { return $this->_m_saveChunkOfs; }
        public function chunk() { return $this->_m_chunk; }
    }
}

namespace Riff {
    class ListChunkData extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Riff\ChunkType $_parent = null, ?\Riff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            if ($this->parentChunkDataOfs() < 0) {
                $this->_m_saveParentChunkDataOfs = $this->_io->readBytes(0);
            }
            $this->_m_parentChunkData = new \Riff\ParentChunkData($this->_io, $this, $this->_root);
        }
        protected $_m_formType;
        public function formType() {
            if ($this->_m_formType !== null)
                return $this->_m_formType;
            $this->_m_formType = $this->parentChunkData()->formType();
            return $this->_m_formType;
        }
        protected $_m_formTypeReadable;
        public function formTypeReadable() {
            if ($this->_m_formTypeReadable !== null)
                return $this->_m_formTypeReadable;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->parentChunkDataOfs());
            $this->_m_formTypeReadable = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            $this->_io->seek($_pos);
            return $this->_m_formTypeReadable;
        }
        protected $_m_parentChunkDataOfs;
        public function parentChunkDataOfs() {
            if ($this->_m_parentChunkDataOfs !== null)
                return $this->_m_parentChunkDataOfs;
            $this->_m_parentChunkDataOfs = $this->_io()->pos();
            return $this->_m_parentChunkDataOfs;
        }
        protected $_m_subchunks;
        public function subchunks() {
            if ($this->_m_subchunks !== null)
                return $this->_m_subchunks;
            $io = $this->parentChunkData()->subchunksSlot()->_io();
            $_pos = $io->pos();
            $io->seek(0);
            $this->_m_subchunks = [];
            $i = 0;
            while (!$io->isEof()) {
                switch ($this->formType()) {
                    case \Riff\Fourcc::INFO:
                        $this->_m_subchunks[] = new \Riff\InfoSubchunk($io, $this, $this->_root);
                        break;
                    default:
                        $this->_m_subchunks[] = new \Riff\ChunkType($io, $this, $this->_root);
                        break;
                }
                $i++;
            }
            $io->seek($_pos);
            return $this->_m_subchunks;
        }
        protected $_m_saveParentChunkDataOfs;
        protected $_m_parentChunkData;
        public function saveParentChunkDataOfs() { return $this->_m_saveParentChunkDataOfs; }
        public function parentChunkData() { return $this->_m_parentChunkData; }
    }
}

namespace Riff {
    class ParentChunkData extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Riff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_formType = $this->_io->readU4le();
            $this->_m__raw_subchunksSlot = $this->_io->readBytesFull();
            $_io__raw_subchunksSlot = new \Kaitai\Struct\Stream($this->_m__raw_subchunksSlot);
            $this->_m_subchunksSlot = new \Riff\ParentChunkData\Slot($_io__raw_subchunksSlot, $this, $this->_root);
        }
        protected $_m_formType;
        protected $_m_subchunksSlot;
        protected $_m__raw_subchunksSlot;
        public function formType() { return $this->_m_formType; }
        public function subchunksSlot() { return $this->_m_subchunksSlot; }
        public function _raw_subchunksSlot() { return $this->_m__raw_subchunksSlot; }
    }
}

namespace Riff\ParentChunkData {
    class Slot extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Riff\ParentChunkData $_parent = null, ?\Riff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
        }
    }
}

namespace Riff {
    class Fourcc {
        const RIFF = 1179011410;
        const INFO = 1330007625;
        const LIST = 1414744396;

        private const _VALUES = [1179011410 => true, 1330007625 => true, 1414744396 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
