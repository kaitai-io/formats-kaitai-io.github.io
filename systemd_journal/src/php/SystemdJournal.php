<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * systemd, a popular user-space system/service management suite on Linux,
 * offers logging functionality, storing incoming logs in a binary journal
 * format.
 * 
 * On live Linux system running systemd, these journals are typically located at:
 * 
 * * /run/log/journal/machine-id/*.journal (volatile, lost after reboot)
 * * /var/log/journal/machine-id/*.journal (persistent, but disabled by default on Debian / Ubuntu)
 */

namespace {
    class SystemdJournal extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \SystemdJournal $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_header = $this->_io->readBytes($this->lenHeader());
            $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
            $this->_m_header = new \SystemdJournal\Header($_io__raw_header, $this, $this->_root);
            $this->_m_objects = [];
            $n = $this->header()->numObjects();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_objects[] = new \SystemdJournal\JournalObject($this->_io, $this, $this->_root);
            }
        }
        protected $_m_lenHeader;

        /**
         * Header length is used to set substream size, as it thus required
         * prior to declaration of header.
         */
        public function lenHeader() {
            if ($this->_m_lenHeader !== null)
                return $this->_m_lenHeader;
            $_pos = $this->_io->pos();
            $this->_io->seek(88);
            $this->_m_lenHeader = $this->_io->readU8le();
            $this->_io->seek($_pos);
            return $this->_m_lenHeader;
        }
        protected $_m_dataHashTable;
        public function dataHashTable() {
            if ($this->_m_dataHashTable !== null)
                return $this->_m_dataHashTable;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->header()->ofsDataHashTable());
            $this->_m_dataHashTable = $this->_io->readBytes($this->header()->lenDataHashTable());
            $this->_io->seek($_pos);
            return $this->_m_dataHashTable;
        }
        protected $_m_fieldHashTable;
        public function fieldHashTable() {
            if ($this->_m_fieldHashTable !== null)
                return $this->_m_fieldHashTable;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->header()->ofsFieldHashTable());
            $this->_m_fieldHashTable = $this->_io->readBytes($this->header()->lenFieldHashTable());
            $this->_io->seek($_pos);
            return $this->_m_fieldHashTable;
        }
        protected $_m_header;
        protected $_m_objects;
        protected $_m__raw_header;
        public function header() { return $this->_m_header; }
        public function objects() { return $this->_m_objects; }
        public function _raw_header() { return $this->_m__raw_header; }
    }
}

namespace SystemdJournal {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SystemdJournal $_parent = null, \SystemdJournal $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_signature = $this->_io->readBytes(8);
            if (!($this->signature() == "\x4C\x50\x4B\x53\x48\x48\x52\x48")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4C\x50\x4B\x53\x48\x48\x52\x48", $this->signature(), $this->_io(), "/types/header/seq/0");
            }
            $this->_m_compatibleFlags = $this->_io->readU4le();
            $this->_m_incompatibleFlags = $this->_io->readU4le();
            $this->_m_state = $this->_io->readU1();
            $this->_m_reserved = $this->_io->readBytes(7);
            $this->_m_fileId = $this->_io->readBytes(16);
            $this->_m_machineId = $this->_io->readBytes(16);
            $this->_m_bootId = $this->_io->readBytes(16);
            $this->_m_seqnumId = $this->_io->readBytes(16);
            $this->_m_lenHeader = $this->_io->readU8le();
            $this->_m_lenArena = $this->_io->readU8le();
            $this->_m_ofsDataHashTable = $this->_io->readU8le();
            $this->_m_lenDataHashTable = $this->_io->readU8le();
            $this->_m_ofsFieldHashTable = $this->_io->readU8le();
            $this->_m_lenFieldHashTable = $this->_io->readU8le();
            $this->_m_ofsTailObject = $this->_io->readU8le();
            $this->_m_numObjects = $this->_io->readU8le();
            $this->_m_numEntries = $this->_io->readU8le();
            $this->_m_tailEntrySeqnum = $this->_io->readU8le();
            $this->_m_headEntrySeqnum = $this->_io->readU8le();
            $this->_m_ofsEntryArray = $this->_io->readU8le();
            $this->_m_headEntryRealtime = $this->_io->readU8le();
            $this->_m_tailEntryRealtime = $this->_io->readU8le();
            $this->_m_tailEntryMonotonic = $this->_io->readU8le();
            if (!($this->_io()->isEof())) {
                $this->_m_numData = $this->_io->readU8le();
            }
            if (!($this->_io()->isEof())) {
                $this->_m_numFields = $this->_io->readU8le();
            }
            if (!($this->_io()->isEof())) {
                $this->_m_numTags = $this->_io->readU8le();
            }
            if (!($this->_io()->isEof())) {
                $this->_m_numEntryArrays = $this->_io->readU8le();
            }
        }
        protected $_m_signature;
        protected $_m_compatibleFlags;
        protected $_m_incompatibleFlags;
        protected $_m_state;
        protected $_m_reserved;
        protected $_m_fileId;
        protected $_m_machineId;
        protected $_m_bootId;
        protected $_m_seqnumId;
        protected $_m_lenHeader;
        protected $_m_lenArena;
        protected $_m_ofsDataHashTable;
        protected $_m_lenDataHashTable;
        protected $_m_ofsFieldHashTable;
        protected $_m_lenFieldHashTable;
        protected $_m_ofsTailObject;
        protected $_m_numObjects;
        protected $_m_numEntries;
        protected $_m_tailEntrySeqnum;
        protected $_m_headEntrySeqnum;
        protected $_m_ofsEntryArray;
        protected $_m_headEntryRealtime;
        protected $_m_tailEntryRealtime;
        protected $_m_tailEntryMonotonic;
        protected $_m_numData;
        protected $_m_numFields;
        protected $_m_numTags;
        protected $_m_numEntryArrays;
        public function signature() { return $this->_m_signature; }
        public function compatibleFlags() { return $this->_m_compatibleFlags; }
        public function incompatibleFlags() { return $this->_m_incompatibleFlags; }
        public function state() { return $this->_m_state; }
        public function reserved() { return $this->_m_reserved; }
        public function fileId() { return $this->_m_fileId; }
        public function machineId() { return $this->_m_machineId; }
        public function bootId() { return $this->_m_bootId; }
        public function seqnumId() { return $this->_m_seqnumId; }
        public function lenHeader() { return $this->_m_lenHeader; }
        public function lenArena() { return $this->_m_lenArena; }
        public function ofsDataHashTable() { return $this->_m_ofsDataHashTable; }
        public function lenDataHashTable() { return $this->_m_lenDataHashTable; }
        public function ofsFieldHashTable() { return $this->_m_ofsFieldHashTable; }
        public function lenFieldHashTable() { return $this->_m_lenFieldHashTable; }
        public function ofsTailObject() { return $this->_m_ofsTailObject; }
        public function numObjects() { return $this->_m_numObjects; }
        public function numEntries() { return $this->_m_numEntries; }
        public function tailEntrySeqnum() { return $this->_m_tailEntrySeqnum; }
        public function headEntrySeqnum() { return $this->_m_headEntrySeqnum; }
        public function ofsEntryArray() { return $this->_m_ofsEntryArray; }
        public function headEntryRealtime() { return $this->_m_headEntryRealtime; }
        public function tailEntryRealtime() { return $this->_m_tailEntryRealtime; }
        public function tailEntryMonotonic() { return $this->_m_tailEntryMonotonic; }
        public function numData() { return $this->_m_numData; }
        public function numFields() { return $this->_m_numFields; }
        public function numTags() { return $this->_m_numTags; }
        public function numEntryArrays() { return $this->_m_numEntryArrays; }
    }
}

namespace SystemdJournal {
    class JournalObject extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \SystemdJournal $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_padding = $this->_io->readBytes(\Kaitai\Struct\Stream::mod((8 - $this->_io()->pos()), 8));
            $this->_m_objectType = $this->_io->readU1();
            $this->_m_flags = $this->_io->readU1();
            $this->_m_reserved = $this->_io->readBytes(6);
            $this->_m_lenObject = $this->_io->readU8le();
            switch ($this->objectType()) {
                case \SystemdJournal\JournalObject\ObjectTypes::DATA:
                    $this->_m__raw_payload = $this->_io->readBytes(($this->lenObject() - 16));
                    $_io__raw_payload = new \Kaitai\Struct\Stream($this->_m__raw_payload);
                    $this->_m_payload = new \SystemdJournal\DataObject($_io__raw_payload, $this, $this->_root);
                    break;
                default:
                    $this->_m_payload = $this->_io->readBytes(($this->lenObject() - 16));
                    break;
            }
        }
        protected $_m_padding;
        protected $_m_objectType;
        protected $_m_flags;
        protected $_m_reserved;
        protected $_m_lenObject;
        protected $_m_payload;
        protected $_m__raw_payload;
        public function padding() { return $this->_m_padding; }
        public function objectType() { return $this->_m_objectType; }
        public function flags() { return $this->_m_flags; }
        public function reserved() { return $this->_m_reserved; }
        public function lenObject() { return $this->_m_lenObject; }
        public function payload() { return $this->_m_payload; }
        public function _raw_payload() { return $this->_m__raw_payload; }
    }
}

namespace SystemdJournal\JournalObject {
    class ObjectTypes {
        const UNUSED = 0;
        const DATA = 1;
        const FIELD = 2;
        const ENTRY = 3;
        const DATA_HASH_TABLE = 4;
        const FIELD_HASH_TABLE = 5;
        const ENTRY_ARRAY = 6;
        const TAG = 7;
    }
}

/**
 * Data objects are designed to carry log payload, typically in
 * form of a "key=value" string in `payload` attribute.
 */

namespace SystemdJournal {
    class DataObject extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SystemdJournal\JournalObject $_parent = null, \SystemdJournal $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_hash = $this->_io->readU8le();
            $this->_m_ofsNextHash = $this->_io->readU8le();
            $this->_m_ofsHeadField = $this->_io->readU8le();
            $this->_m_ofsEntry = $this->_io->readU8le();
            $this->_m_ofsEntryArray = $this->_io->readU8le();
            $this->_m_numEntries = $this->_io->readU8le();
            $this->_m_payload = $this->_io->readBytesFull();
        }
        protected $_m_nextHash;
        public function nextHash() {
            if ($this->_m_nextHash !== null)
                return $this->_m_nextHash;
            if ($this->ofsNextHash() != 0) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->ofsNextHash());
                $this->_m_nextHash = new \SystemdJournal\JournalObject($io, $this, $this->_root);
                $io->seek($_pos);
            }
            return $this->_m_nextHash;
        }
        protected $_m_headField;
        public function headField() {
            if ($this->_m_headField !== null)
                return $this->_m_headField;
            if ($this->ofsHeadField() != 0) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->ofsHeadField());
                $this->_m_headField = new \SystemdJournal\JournalObject($io, $this, $this->_root);
                $io->seek($_pos);
            }
            return $this->_m_headField;
        }
        protected $_m_entry;
        public function entry() {
            if ($this->_m_entry !== null)
                return $this->_m_entry;
            if ($this->ofsEntry() != 0) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->ofsEntry());
                $this->_m_entry = new \SystemdJournal\JournalObject($io, $this, $this->_root);
                $io->seek($_pos);
            }
            return $this->_m_entry;
        }
        protected $_m_entryArray;
        public function entryArray() {
            if ($this->_m_entryArray !== null)
                return $this->_m_entryArray;
            if ($this->ofsEntryArray() != 0) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->ofsEntryArray());
                $this->_m_entryArray = new \SystemdJournal\JournalObject($io, $this, $this->_root);
                $io->seek($_pos);
            }
            return $this->_m_entryArray;
        }
        protected $_m_hash;
        protected $_m_ofsNextHash;
        protected $_m_ofsHeadField;
        protected $_m_ofsEntry;
        protected $_m_ofsEntryArray;
        protected $_m_numEntries;
        protected $_m_payload;
        public function hash() { return $this->_m_hash; }
        public function ofsNextHash() { return $this->_m_ofsNextHash; }
        public function ofsHeadField() { return $this->_m_ofsHeadField; }
        public function ofsEntry() { return $this->_m_ofsEntry; }
        public function ofsEntryArray() { return $this->_m_ofsEntryArray; }
        public function numEntries() { return $this->_m_numEntries; }
        public function payload() { return $this->_m_payload; }
    }
}

namespace SystemdJournal {
    class State {

        /**
         * File is closed and thus not being written into right now
         */
        const OFFLINE = 0;

        /**
         * File is open and thus might be undergoing update at the moment
         */
        const ONLINE = 1;

        /**
         * File has been rotated, no further updates to this file are to be expected
         */
        const ARCHIVED = 2;
    }
}
