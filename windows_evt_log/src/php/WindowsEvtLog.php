<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * EVT files are Windows Event Log files written by older Windows
 * operating systems (2000, XP, 2003). They are used as binary log
 * files by several major Windows subsystems and
 * applications. Typically, several of them can be found in
 * `%WINDIR%\system32\config` directory:
 * 
 * * Application = `AppEvent.evt`
 * * System = `SysEvent.evt`
 * * Security = `SecEvent.evt`
 * 
 * Alternatively, one can export any system event log as distinct .evt
 * file using relevant option in Event Viewer application.
 * 
 * A Windows application can submit an entry into these logs using
 * [ReportEventA](https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa)
 * function of Windows API.
 * 
 * Internally, EVT files consist of a fixed-size header and event
 * records. There are several usage scenarios (non-wrapping vs wrapping
 * log files) which result in slightly different organization of
 * records.
 */

namespace {
    class WindowsEvtLog extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\WindowsEvtLog $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \WindowsEvtLog\Header($this->_io, $this, $this->_root);
            $this->_m_records = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_records[] = new \WindowsEvtLog\Record($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_header;
        protected $_m_records;
        public function header() { return $this->_m_header; }
        public function records() { return $this->_m_records; }
    }
}

namespace WindowsEvtLog {
    class CursorRecordBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\WindowsEvtLog\Record $_parent = null, ?\WindowsEvtLog $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(12);
            if (!($this->_m_magic == "\x22\x22\x22\x22\x33\x33\x33\x33\x44\x44\x44\x44")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x22\x22\x22\x22\x33\x33\x33\x33\x44\x44\x44\x44", $this->_m_magic, $this->_io, "/types/cursor_record_body/seq/0");
            }
            $this->_m_ofsFirstRecord = $this->_io->readU4le();
            $this->_m_ofsNextRecord = $this->_io->readU4le();
            $this->_m_idxNextRecord = $this->_io->readU4le();
            $this->_m_idxFirstRecord = $this->_io->readU4le();
        }
        protected $_m_magic;
        protected $_m_ofsFirstRecord;
        protected $_m_ofsNextRecord;
        protected $_m_idxNextRecord;
        protected $_m_idxFirstRecord;
        public function magic() { return $this->_m_magic; }
        public function ofsFirstRecord() { return $this->_m_ofsFirstRecord; }
        public function ofsNextRecord() { return $this->_m_ofsNextRecord; }
        public function idxNextRecord() { return $this->_m_idxNextRecord; }
        public function idxFirstRecord() { return $this->_m_idxFirstRecord; }
    }
}

namespace WindowsEvtLog {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\WindowsEvtLog $_parent = null, ?\WindowsEvtLog $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenHeader = $this->_io->readU4le();
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x4C\x66\x4C\x65")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4C\x66\x4C\x65", $this->_m_magic, $this->_io, "/types/header/seq/1");
            }
            $this->_m_versionMajor = $this->_io->readU4le();
            $this->_m_versionMinor = $this->_io->readU4le();
            $this->_m_ofsStart = $this->_io->readU4le();
            $this->_m_ofsEnd = $this->_io->readU4le();
            $this->_m_curRecIdx = $this->_io->readU4le();
            $this->_m_oldestRecIdx = $this->_io->readU4le();
            $this->_m_lenFileMax = $this->_io->readU4le();
            $this->_m_flags = new \WindowsEvtLog\Header\Flags($this->_io, $this, $this->_root);
            $this->_m_retention = $this->_io->readU4le();
            $this->_m_lenHeader2 = $this->_io->readU4le();
        }
        protected $_m_lenHeader;
        protected $_m_magic;
        protected $_m_versionMajor;
        protected $_m_versionMinor;
        protected $_m_ofsStart;
        protected $_m_ofsEnd;
        protected $_m_curRecIdx;
        protected $_m_oldestRecIdx;
        protected $_m_lenFileMax;
        protected $_m_flags;
        protected $_m_retention;
        protected $_m_lenHeader2;

        /**
         * Size of the header structure, must be 0x30.
         */
        public function lenHeader() { return $this->_m_lenHeader; }
        public function magic() { return $this->_m_magic; }
        public function versionMajor() { return $this->_m_versionMajor; }
        public function versionMinor() { return $this->_m_versionMinor; }

        /**
         * Offset of oldest record kept in this log file.
         */
        public function ofsStart() { return $this->_m_ofsStart; }

        /**
         * Offset of EOF log record, which is a placeholder for new record.
         */
        public function ofsEnd() { return $this->_m_ofsEnd; }

        /**
         * Index of current record, where a new submission would be
         * written to (normally there should to EOF log record there).
         */
        public function curRecIdx() { return $this->_m_curRecIdx; }

        /**
         * Index of oldest record in the log file
         */
        public function oldestRecIdx() { return $this->_m_oldestRecIdx; }

        /**
         * Total maximum size of the log file
         */
        public function lenFileMax() { return $this->_m_lenFileMax; }
        public function flags() { return $this->_m_flags; }
        public function retention() { return $this->_m_retention; }

        /**
         * Size of the header structure repeated again, and again it must be 0x30.
         */
        public function lenHeader2() { return $this->_m_lenHeader2; }
    }
}

namespace WindowsEvtLog\Header {
    class Flags extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\WindowsEvtLog\Header $_parent = null, ?\WindowsEvtLog $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readBitsIntBe(28);
            $this->_m_archive = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_logFull = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_wrap = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_dirty = $this->_io->readBitsIntBe(1) != 0;
        }
        protected $_m_reserved;
        protected $_m_archive;
        protected $_m_logFull;
        protected $_m_wrap;
        protected $_m_dirty;
        public function reserved() { return $this->_m_reserved; }

        /**
         * True if archive attribute has been set for this log file.
         */
        public function archive() { return $this->_m_archive; }

        /**
         * True if last write operation failed due to log being full.
         */
        public function logFull() { return $this->_m_logFull; }

        /**
         * True if wrapping of record has occured.
         */
        public function wrap() { return $this->_m_wrap; }

        /**
         * True if write operation was in progress, but log file
         * wasn't properly closed.
         */
        public function dirty() { return $this->_m_dirty; }
    }
}

namespace WindowsEvtLog {
    class Record extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\WindowsEvtLog $_parent = null, ?\WindowsEvtLog $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenRecord = $this->_io->readU4le();
            $this->_m_type = $this->_io->readU4le();
            switch ($this->type()) {
                case 1699505740:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenRecord() - 12);
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \WindowsEvtLog\RecordBody($_io__raw_body, $this, $this->_root);
                    break;
                case 286331153:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenRecord() - 12);
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \WindowsEvtLog\CursorRecordBody($_io__raw_body, $this, $this->_root);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes($this->lenRecord() - 12);
                    break;
            }
            $this->_m_lenRecord2 = $this->_io->readU4le();
        }
        protected $_m_lenRecord;
        protected $_m_type;
        protected $_m_body;
        protected $_m_lenRecord2;
        protected $_m__raw_body;

        /**
         * Size of whole record, including all headers, footers and data
         */
        public function lenRecord() { return $this->_m_lenRecord; }

        /**
         * Type of record. Normal log records specify "LfLe"
         * (0x654c664c) in this field, cursor records use 0x11111111.
         */
        public function type() { return $this->_m_type; }

        /**
         * Record body interpretation depends on type of record. Body
         * size is specified in a way that it won't include a 8-byte
         * "header" (`len_record` + `type`) and a "footer"
         * (`len_record2`).
         */
        public function body() { return $this->_m_body; }

        /**
         * Size of whole record again.
         */
        public function lenRecord2() { return $this->_m_lenRecord2; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace WindowsEvtLog {
    class RecordBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\WindowsEvtLog\Record $_parent = null, ?\WindowsEvtLog $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_idx = $this->_io->readU4le();
            $this->_m_timeGenerated = $this->_io->readU4le();
            $this->_m_timeWritten = $this->_io->readU4le();
            $this->_m_eventId = $this->_io->readU4le();
            $this->_m_eventType = $this->_io->readU2le();
            $this->_m_numStrings = $this->_io->readU2le();
            $this->_m_eventCategory = $this->_io->readU2le();
            $this->_m_reserved = $this->_io->readBytes(6);
            $this->_m_ofsStrings = $this->_io->readU4le();
            $this->_m_lenUserSid = $this->_io->readU4le();
            $this->_m_ofsUserSid = $this->_io->readU4le();
            $this->_m_lenData = $this->_io->readU4le();
            $this->_m_ofsData = $this->_io->readU4le();
        }
        protected $_m_data;
        public function data() {
            if ($this->_m_data !== null)
                return $this->_m_data;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsData() - 8);
            $this->_m_data = $this->_io->readBytes($this->lenData());
            $this->_io->seek($_pos);
            return $this->_m_data;
        }
        protected $_m_userSid;
        public function userSid() {
            if ($this->_m_userSid !== null)
                return $this->_m_userSid;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsUserSid() - 8);
            $this->_m_userSid = $this->_io->readBytes($this->lenUserSid());
            $this->_io->seek($_pos);
            return $this->_m_userSid;
        }
        protected $_m_idx;
        protected $_m_timeGenerated;
        protected $_m_timeWritten;
        protected $_m_eventId;
        protected $_m_eventType;
        protected $_m_numStrings;
        protected $_m_eventCategory;
        protected $_m_reserved;
        protected $_m_ofsStrings;
        protected $_m_lenUserSid;
        protected $_m_ofsUserSid;
        protected $_m_lenData;
        protected $_m_ofsData;

        /**
         * Index of record in the file.
         */
        public function idx() { return $this->_m_idx; }

        /**
         * Time when this record was generated, POSIX timestamp format.
         */
        public function timeGenerated() { return $this->_m_timeGenerated; }

        /**
         * Time when thsi record was written into the log file, POSIX timestamp format.
         */
        public function timeWritten() { return $this->_m_timeWritten; }

        /**
         * Identifier of an event, meaning is specific to particular
         * source of events / event type.
         */
        public function eventId() { return $this->_m_eventId; }

        /**
         * Type of event.
         */
        public function eventType() { return $this->_m_eventType; }

        /**
         * Number of strings present in the log.
         */
        public function numStrings() { return $this->_m_numStrings; }
        public function eventCategory() { return $this->_m_eventCategory; }
        public function reserved() { return $this->_m_reserved; }

        /**
         * Offset of strings present in the log
         */
        public function ofsStrings() { return $this->_m_ofsStrings; }
        public function lenUserSid() { return $this->_m_lenUserSid; }
        public function ofsUserSid() { return $this->_m_ofsUserSid; }
        public function lenData() { return $this->_m_lenData; }
        public function ofsData() { return $this->_m_ofsData; }
    }
}

namespace WindowsEvtLog\RecordBody {
    class EventTypes {
        const ERROR = 1;
        const AUDIT_FAILURE = 2;
        const AUDIT_SUCCESS = 3;
        const INFO = 4;
        const WARNING = 5;

        private const _VALUES = [1 => true, 2 => true, 3 => true, 4 => true, 5 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
