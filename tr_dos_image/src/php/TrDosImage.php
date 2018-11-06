<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * .trd file is a raw dump of TR-DOS (ZX-Spectrum) floppy. .trd files are
 * headerless and contain consequent "logical tracks", each logical track
 * consists of 16 256-byte sectors.
 * 
 * Logical tracks are defined the same way as used by TR-DOS: for single-side
 * floppies it's just a physical track number, for two-side floppies sides are
 * interleaved, i.e. logical_track_num = (physical_track_num << 1) | side
 * 
 * So, this format definition is more for TR-DOS filesystem than for .trd files,
 * which are formatless.
 * 
 * Strings (file names, disk label, disk password) are padded with spaces and use
 * ZX Spectrum character set, including UDGs, block drawing chars and Basic
 * tokens. ASCII range is mostly standard ASCII, with few characters (^, `, DEL)
 * replaced with (up arrow, pound, copyright symbol).
 * 
 * .trd file can be smaller than actual floppy disk, if last logical tracks are
 * empty (contain no file data) they can be omitted.
 */

class TrDosImage extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \TrDosImage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_files = [];
        $i = 0;
        do {
            $_ = new \TrDosImage\File($this->_io, $this, $this->_root);
            $this->_m_files[] = $_;
            $i++;
        } while (!($_->isTerminator()));
    }
    protected $_m_volumeInfo;
    public function volumeInfo() {
        if ($this->_m_volumeInfo !== null)
            return $this->_m_volumeInfo;
        $_pos = $this->_io->pos();
        $this->_io->seek(2048);
        $this->_m_volumeInfo = new \TrDosImage\VolumeInfo($this->_io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_volumeInfo;
    }
    protected $_m_files;
    public function files() { return $this->_m_files; }
}

namespace \TrDosImage;

class VolumeInfo extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TrDosImage $_parent = null, \TrDosImage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_catalogEnd = $this->_io->ensureFixedContents("\x00");
        $this->_m_unused = $this->_io->readBytes(224);
        $this->_m_firstFreeSectorSector = $this->_io->readU1();
        $this->_m_firstFreeSectorTrack = $this->_io->readU1();
        $this->_m_diskType = $this->_io->readU1();
        $this->_m_numFiles = $this->_io->readU1();
        $this->_m_numFreeSectors = $this->_io->readU2le();
        $this->_m_trDosId = $this->_io->ensureFixedContents("\x10");
        $this->_m_unused2 = $this->_io->readBytes(2);
        $this->_m_password = $this->_io->readBytes(9);
        $this->_m_unused3 = $this->_io->readBytes(1);
        $this->_m_numDeletedFiles = $this->_io->readU1();
        $this->_m_label = $this->_io->readBytes(8);
        $this->_m_unused4 = $this->_io->readBytes(3);
    }
    protected $_m_numTracks;
    public function numTracks() {
        if ($this->_m_numTracks !== null)
            return $this->_m_numTracks;
        $this->_m_numTracks = (($this->diskType() & 1) != 0 ? 40 : 80);
        return $this->_m_numTracks;
    }
    protected $_m_numSides;
    public function numSides() {
        if ($this->_m_numSides !== null)
            return $this->_m_numSides;
        $this->_m_numSides = (($this->diskType() & 8) != 0 ? 1 : 2);
        return $this->_m_numSides;
    }
    protected $_m_catalogEnd;
    protected $_m_unused;
    protected $_m_firstFreeSectorSector;
    protected $_m_firstFreeSectorTrack;
    protected $_m_diskType;
    protected $_m_numFiles;
    protected $_m_numFreeSectors;
    protected $_m_trDosId;
    protected $_m_unused2;
    protected $_m_password;
    protected $_m_unused3;
    protected $_m_numDeletedFiles;
    protected $_m_label;
    protected $_m_unused4;
    public function catalogEnd() { return $this->_m_catalogEnd; }
    public function unused() { return $this->_m_unused; }
    public function firstFreeSectorSector() { return $this->_m_firstFreeSectorSector; }

    /**
     * track number is logical, for double-sided disks it's
     * (physical_track << 1) | side, the same way that tracks are stored
     * sequentially in .trd file
     */
    public function firstFreeSectorTrack() { return $this->_m_firstFreeSectorTrack; }
    public function diskType() { return $this->_m_diskType; }

    /**
     * Number of non-deleted files. Directory can have more than
     * number_of_files entries due to deleted files
     */
    public function numFiles() { return $this->_m_numFiles; }
    public function numFreeSectors() { return $this->_m_numFreeSectors; }
    public function trDosId() { return $this->_m_trDosId; }
    public function unused2() { return $this->_m_unused2; }
    public function password() { return $this->_m_password; }
    public function unused3() { return $this->_m_unused3; }
    public function numDeletedFiles() { return $this->_m_numDeletedFiles; }
    public function label() { return $this->_m_label; }
    public function unused4() { return $this->_m_unused4; }
}

namespace \TrDosImage;

class PositionAndLengthCode extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TrDosImage\File $_parent = null, \TrDosImage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_startAddress = $this->_io->readU2le();
        $this->_m_length = $this->_io->readU2le();
    }
    protected $_m_startAddress;
    protected $_m_length;

    /**
     * Default memory address to load this byte array into
     */
    public function startAddress() { return $this->_m_startAddress; }
    public function length() { return $this->_m_length; }
}

namespace \TrDosImage;

class Filename extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TrDosImage\File $_parent = null, \TrDosImage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = $this->_io->readBytes(8);
    }
    protected $_m_firstByte;
    public function firstByte() {
        if ($this->_m_firstByte !== null)
            return $this->_m_firstByte;
        $_pos = $this->_io->pos();
        $this->_io->seek(0);
        $this->_m_firstByte = $this->_io->readU1();
        $this->_io->seek($_pos);
        return $this->_m_firstByte;
    }
    protected $_m_name;
    public function name() { return $this->_m_name; }
}

namespace \TrDosImage;

class PositionAndLengthPrint extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TrDosImage\File $_parent = null, \TrDosImage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_extentNo = $this->_io->readU1();
        $this->_m_reserved = $this->_io->readU1();
        $this->_m_length = $this->_io->readU2le();
    }
    protected $_m_extentNo;
    protected $_m_reserved;
    protected $_m_length;
    public function extentNo() { return $this->_m_extentNo; }
    public function reserved() { return $this->_m_reserved; }
    public function length() { return $this->_m_length; }
}

namespace \TrDosImage;

class PositionAndLengthGeneric extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TrDosImage\File $_parent = null, \TrDosImage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved = $this->_io->readU2le();
        $this->_m_length = $this->_io->readU2le();
    }
    protected $_m_reserved;
    protected $_m_length;
    public function reserved() { return $this->_m_reserved; }
    public function length() { return $this->_m_length; }
}

namespace \TrDosImage;

class PositionAndLengthBasic extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TrDosImage\File $_parent = null, \TrDosImage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_programAndDataLength = $this->_io->readU2le();
        $this->_m_programLength = $this->_io->readU2le();
    }
    protected $_m_programAndDataLength;
    protected $_m_programLength;
    public function programAndDataLength() { return $this->_m_programAndDataLength; }
    public function programLength() { return $this->_m_programLength; }
}

namespace \TrDosImage;

class File extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TrDosImage $_parent = null, \TrDosImage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m__raw_name = $this->_io->readBytes(8);
        $io = new \Kaitai\Struct\Stream($this->_m__raw_name);
        $this->_m_name = new \TrDosImage\Filename($io, $this, $this->_root);
        $this->_m_extension = $this->_io->readU1();
        switch ($this->extension()) {
            case 66:
                $this->_m_positionAndLength = new \TrDosImage\PositionAndLengthBasic($this->_io, $this, $this->_root);
                break;
            case 67:
                $this->_m_positionAndLength = new \TrDosImage\PositionAndLengthCode($this->_io, $this, $this->_root);
                break;
            case 35:
                $this->_m_positionAndLength = new \TrDosImage\PositionAndLengthPrint($this->_io, $this, $this->_root);
                break;
            default:
                $this->_m_positionAndLength = new \TrDosImage\PositionAndLengthGeneric($this->_io, $this, $this->_root);
                break;
        }
        $this->_m_lengthSectors = $this->_io->readU1();
        $this->_m_startingSector = $this->_io->readU1();
        $this->_m_startingTrack = $this->_io->readU1();
    }
    protected $_m_isDeleted;
    public function isDeleted() {
        if ($this->_m_isDeleted !== null)
            return $this->_m_isDeleted;
        $this->_m_isDeleted = $this->name()->firstByte() == 1;
        return $this->_m_isDeleted;
    }
    protected $_m_isTerminator;
    public function isTerminator() {
        if ($this->_m_isTerminator !== null)
            return $this->_m_isTerminator;
        $this->_m_isTerminator = $this->name()->firstByte() == 0;
        return $this->_m_isTerminator;
    }
    protected $_m_contents;
    public function contents() {
        if ($this->_m_contents !== null)
            return $this->_m_contents;
        $_pos = $this->_io->pos();
        $this->_io->seek(((($this->startingTrack() * 256) * 16) + ($this->startingSector() * 256)));
        $this->_m_contents = $this->_io->readBytes(($this->lengthSectors() * 256));
        $this->_io->seek($_pos);
        return $this->_m_contents;
    }
    protected $_m_name;
    protected $_m_extension;
    protected $_m_positionAndLength;
    protected $_m_lengthSectors;
    protected $_m_startingSector;
    protected $_m_startingTrack;
    protected $_m__raw_name;
    public function name() { return $this->_m_name; }
    public function extension() { return $this->_m_extension; }
    public function positionAndLength() { return $this->_m_positionAndLength; }
    public function lengthSectors() { return $this->_m_lengthSectors; }
    public function startingSector() { return $this->_m_startingSector; }
    public function startingTrack() { return $this->_m_startingTrack; }
    public function _raw_name() { return $this->_m__raw_name; }
}

namespace \TrDosImage;

class DiskType {
    const TYPE_80_TRACKS_DOUBLE_SIDE = 22;
    const TYPE_40_TRACKS_DOUBLE_SIDE = 23;
    const TYPE_80_TRACKS_SINGLE_SIDE = 24;
    const TYPE_40_TRACKS_SINGLE_SIDE = 25;
}
