<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * RTCP is the Real-Time Control Protocol
 */

namespace {
    class RtcpPayload extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_rtcpPackets = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_rtcpPackets[] = new \RtcpPayload\RtcpPacket($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_rtcpPackets;
        public function rtcpPackets() { return $this->_m_rtcpPackets; }
    }
}

namespace RtcpPayload {
    class PsfbAfbRembPacket extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \RtcpPayload\PsfbAfbPacket $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numSsrc = $this->_io->readU1();
            $this->_m_brExp = $this->_io->readBitsIntBe(6);
            $this->_m_brMantissa = $this->_io->readBitsIntBe(18);
            $this->_io->alignToByte();
            $this->_m_ssrcList = [];
            $n = $this->numSsrc();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_ssrcList[] = $this->_io->readU4be();
            }
        }
        protected $_m_maxTotalBitrate;
        public function maxTotalBitrate() {
            if ($this->_m_maxTotalBitrate !== null)
                return $this->_m_maxTotalBitrate;
            $this->_m_maxTotalBitrate = ($this->brMantissa() * (1 << $this->brExp()));
            return $this->_m_maxTotalBitrate;
        }
        protected $_m_numSsrc;
        protected $_m_brExp;
        protected $_m_brMantissa;
        protected $_m_ssrcList;
        public function numSsrc() { return $this->_m_numSsrc; }
        public function brExp() { return $this->_m_brExp; }
        public function brMantissa() { return $this->_m_brMantissa; }
        public function ssrcList() { return $this->_m_ssrcList; }
    }
}

namespace RtcpPayload {
    class SrPacket extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \RtcpPayload\RtcpPacket $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ssrc = $this->_io->readU4be();
            $this->_m_ntpMsw = $this->_io->readU4be();
            $this->_m_ntpLsw = $this->_io->readU4be();
            $this->_m_rtpTimestamp = $this->_io->readU4be();
            $this->_m_senderPacketCount = $this->_io->readU4be();
            $this->_m_senderOctetCount = $this->_io->readU4be();
            $this->_m_reportBlock = [];
            $n = $this->_parent()->subtype();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_reportBlock[] = new \RtcpPayload\ReportBlock($this->_io, $this, $this->_root);
            }
        }
        protected $_m_ntp;
        public function ntp() {
            if ($this->_m_ntp !== null)
                return $this->_m_ntp;
            $this->_m_ntp = (($this->ntpMsw() << 32) & $this->ntpLsw());
            return $this->_m_ntp;
        }
        protected $_m_ssrc;
        protected $_m_ntpMsw;
        protected $_m_ntpLsw;
        protected $_m_rtpTimestamp;
        protected $_m_senderPacketCount;
        protected $_m_senderOctetCount;
        protected $_m_reportBlock;
        public function ssrc() { return $this->_m_ssrc; }
        public function ntpMsw() { return $this->_m_ntpMsw; }
        public function ntpLsw() { return $this->_m_ntpLsw; }
        public function rtpTimestamp() { return $this->_m_rtpTimestamp; }
        public function senderPacketCount() { return $this->_m_senderPacketCount; }
        public function senderOctetCount() { return $this->_m_senderOctetCount; }
        public function reportBlock() { return $this->_m_reportBlock; }
    }
}

namespace RtcpPayload {
    class RrPacket extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \RtcpPayload\RtcpPacket $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ssrc = $this->_io->readU4be();
            $this->_m_reportBlock = [];
            $n = $this->_parent()->subtype();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_reportBlock[] = new \RtcpPayload\ReportBlock($this->_io, $this, $this->_root);
            }
        }
        protected $_m_ssrc;
        protected $_m_reportBlock;
        public function ssrc() { return $this->_m_ssrc; }
        public function reportBlock() { return $this->_m_reportBlock; }
    }
}

namespace RtcpPayload {
    class RtcpPacket extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \RtcpPayload $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_version = $this->_io->readBitsIntBe(2);
            $this->_m_padding = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_subtype = $this->_io->readBitsIntBe(5);
            $this->_io->alignToByte();
            $this->_m_payloadType = $this->_io->readU1();
            $this->_m_length = $this->_io->readU2be();
            switch ($this->payloadType()) {
                case \RtcpPayload\PayloadType::SR:
                    $this->_m__raw_body = $this->_io->readBytes((4 * $this->length()));
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \RtcpPayload\SrPacket($_io__raw_body, $this, $this->_root);
                    break;
                case \RtcpPayload\PayloadType::PSFB:
                    $this->_m__raw_body = $this->_io->readBytes((4 * $this->length()));
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \RtcpPayload\PsfbPacket($_io__raw_body, $this, $this->_root);
                    break;
                case \RtcpPayload\PayloadType::RR:
                    $this->_m__raw_body = $this->_io->readBytes((4 * $this->length()));
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \RtcpPayload\RrPacket($_io__raw_body, $this, $this->_root);
                    break;
                case \RtcpPayload\PayloadType::RTPFB:
                    $this->_m__raw_body = $this->_io->readBytes((4 * $this->length()));
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \RtcpPayload\RtpfbPacket($_io__raw_body, $this, $this->_root);
                    break;
                case \RtcpPayload\PayloadType::SDES:
                    $this->_m__raw_body = $this->_io->readBytes((4 * $this->length()));
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \RtcpPayload\SdesPacket($_io__raw_body, $this, $this->_root);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes((4 * $this->length()));
                    break;
            }
        }
        protected $_m_version;
        protected $_m_padding;
        protected $_m_subtype;
        protected $_m_payloadType;
        protected $_m_length;
        protected $_m_body;
        protected $_m__raw_body;
        public function version() { return $this->_m_version; }
        public function padding() { return $this->_m_padding; }
        public function subtype() { return $this->_m_subtype; }
        public function payloadType() { return $this->_m_payloadType; }
        public function length() { return $this->_m_length; }
        public function body() { return $this->_m_body; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace RtcpPayload {
    class SdesTlv extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \RtcpPayload\SourceChunk $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_type = $this->_io->readU1();
            if ($this->type() != \RtcpPayload\SdesSubtype::PAD) {
                $this->_m_length = $this->_io->readU1();
            }
            if ($this->type() != \RtcpPayload\SdesSubtype::PAD) {
                $this->_m_value = $this->_io->readBytes($this->length());
            }
        }
        protected $_m_type;
        protected $_m_length;
        protected $_m_value;
        public function type() { return $this->_m_type; }
        public function length() { return $this->_m_length; }
        public function value() { return $this->_m_value; }
    }
}

namespace RtcpPayload {
    class ReportBlock extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ssrcSource = $this->_io->readU4be();
            $this->_m_lostVal = $this->_io->readU1();
            $this->_m_highestSeqNumReceived = $this->_io->readU4be();
            $this->_m_interarrivalJitter = $this->_io->readU4be();
            $this->_m_lsr = $this->_io->readU4be();
            $this->_m_dlsr = $this->_io->readU4be();
        }
        protected $_m_fractionLost;
        public function fractionLost() {
            if ($this->_m_fractionLost !== null)
                return $this->_m_fractionLost;
            $this->_m_fractionLost = ($this->lostVal() >> 24);
            return $this->_m_fractionLost;
        }
        protected $_m_cumulativePacketsLost;
        public function cumulativePacketsLost() {
            if ($this->_m_cumulativePacketsLost !== null)
                return $this->_m_cumulativePacketsLost;
            $this->_m_cumulativePacketsLost = ($this->lostVal() & 16777215);
            return $this->_m_cumulativePacketsLost;
        }
        protected $_m_ssrcSource;
        protected $_m_lostVal;
        protected $_m_highestSeqNumReceived;
        protected $_m_interarrivalJitter;
        protected $_m_lsr;
        protected $_m_dlsr;
        public function ssrcSource() { return $this->_m_ssrcSource; }
        public function lostVal() { return $this->_m_lostVal; }
        public function highestSeqNumReceived() { return $this->_m_highestSeqNumReceived; }
        public function interarrivalJitter() { return $this->_m_interarrivalJitter; }
        public function lsr() { return $this->_m_lsr; }
        public function dlsr() { return $this->_m_dlsr; }
    }
}

namespace RtcpPayload {
    class RtpfbTransportFeedbackPacket extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \RtcpPayload\RtpfbPacket $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_baseSequenceNumber = $this->_io->readU2be();
            $this->_m_packetStatusCount = $this->_io->readU2be();
            $this->_m_b4 = $this->_io->readU4be();
            $this->_m_remaining = $this->_io->readBytesFull();
        }
        protected $_m_referenceTime;
        public function referenceTime() {
            if ($this->_m_referenceTime !== null)
                return $this->_m_referenceTime;
            $this->_m_referenceTime = ($this->b4() >> 8);
            return $this->_m_referenceTime;
        }
        protected $_m_fbPktCount;
        public function fbPktCount() {
            if ($this->_m_fbPktCount !== null)
                return $this->_m_fbPktCount;
            $this->_m_fbPktCount = ($this->b4() & 255);
            return $this->_m_fbPktCount;
        }
        protected $_m_packetStatus;
        public function packetStatus() {
            if ($this->_m_packetStatus !== null)
                return $this->_m_packetStatus;
            $this->_m_packetStatus = $this->_io->readBytes(0);
            return $this->_m_packetStatus;
        }
        protected $_m_recvDelta;
        public function recvDelta() {
            if ($this->_m_recvDelta !== null)
                return $this->_m_recvDelta;
            $this->_m_recvDelta = $this->_io->readBytes(0);
            return $this->_m_recvDelta;
        }
        protected $_m_baseSequenceNumber;
        protected $_m_packetStatusCount;
        protected $_m_b4;
        protected $_m_remaining;
        public function baseSequenceNumber() { return $this->_m_baseSequenceNumber; }
        public function packetStatusCount() { return $this->_m_packetStatusCount; }
        public function b4() { return $this->_m_b4; }
        public function remaining() { return $this->_m_remaining; }
    }
}

namespace RtcpPayload {
    class PsfbPacket extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \RtcpPayload\RtcpPacket $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ssrc = $this->_io->readU4be();
            $this->_m_ssrcMediaSource = $this->_io->readU4be();
            switch ($this->fmt()) {
                case \RtcpPayload\PsfbSubtype::AFB:
                    $this->_m__raw_fciBlock = $this->_io->readBytesFull();
                    $_io__raw_fciBlock = new \Kaitai\Struct\Stream($this->_m__raw_fciBlock);
                    $this->_m_fciBlock = new \RtcpPayload\PsfbAfbPacket($_io__raw_fciBlock, $this, $this->_root);
                    break;
                default:
                    $this->_m_fciBlock = $this->_io->readBytesFull();
                    break;
            }
        }
        protected $_m_fmt;
        public function fmt() {
            if ($this->_m_fmt !== null)
                return $this->_m_fmt;
            $this->_m_fmt = $this->_parent()->subtype();
            return $this->_m_fmt;
        }
        protected $_m_ssrc;
        protected $_m_ssrcMediaSource;
        protected $_m_fciBlock;
        protected $_m__raw_fciBlock;
        public function ssrc() { return $this->_m_ssrc; }
        public function ssrcMediaSource() { return $this->_m_ssrcMediaSource; }
        public function fciBlock() { return $this->_m_fciBlock; }
        public function _raw_fciBlock() { return $this->_m__raw_fciBlock; }
    }
}

namespace RtcpPayload {
    class SourceChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \RtcpPayload\SdesPacket $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ssrc = $this->_io->readU4be();
            $this->_m_sdesTlv = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_sdesTlv[] = new \RtcpPayload\SdesTlv($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_ssrc;
        protected $_m_sdesTlv;
        public function ssrc() { return $this->_m_ssrc; }
        public function sdesTlv() { return $this->_m_sdesTlv; }
    }
}

namespace RtcpPayload {
    class SdesPacket extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \RtcpPayload\RtcpPacket $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_sourceChunk = [];
            $n = $this->sourceCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_sourceChunk[] = new \RtcpPayload\SourceChunk($this->_io, $this, $this->_root);
            }
        }
        protected $_m_sourceCount;
        public function sourceCount() {
            if ($this->_m_sourceCount !== null)
                return $this->_m_sourceCount;
            $this->_m_sourceCount = $this->_parent()->subtype();
            return $this->_m_sourceCount;
        }
        protected $_m_sourceChunk;
        public function sourceChunk() { return $this->_m_sourceChunk; }
    }
}

namespace RtcpPayload {
    class RtpfbPacket extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \RtcpPayload\RtcpPacket $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ssrc = $this->_io->readU4be();
            $this->_m_ssrcMediaSource = $this->_io->readU4be();
            switch ($this->fmt()) {
                case \RtcpPayload\RtpfbSubtype::TRANSPORT_FEEDBACK:
                    $this->_m__raw_fciBlock = $this->_io->readBytesFull();
                    $_io__raw_fciBlock = new \Kaitai\Struct\Stream($this->_m__raw_fciBlock);
                    $this->_m_fciBlock = new \RtcpPayload\RtpfbTransportFeedbackPacket($_io__raw_fciBlock, $this, $this->_root);
                    break;
                default:
                    $this->_m_fciBlock = $this->_io->readBytesFull();
                    break;
            }
        }
        protected $_m_fmt;
        public function fmt() {
            if ($this->_m_fmt !== null)
                return $this->_m_fmt;
            $this->_m_fmt = $this->_parent()->subtype();
            return $this->_m_fmt;
        }
        protected $_m_ssrc;
        protected $_m_ssrcMediaSource;
        protected $_m_fciBlock;
        protected $_m__raw_fciBlock;
        public function ssrc() { return $this->_m_ssrc; }
        public function ssrcMediaSource() { return $this->_m_ssrcMediaSource; }
        public function fciBlock() { return $this->_m_fciBlock; }
        public function _raw_fciBlock() { return $this->_m__raw_fciBlock; }
    }
}

namespace RtcpPayload {
    class PacketStatusChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_t = $this->_io->readBitsIntBe(1) != 0;
            if (intval($this->t()) == 0) {
                $this->_m_s2 = $this->_io->readBitsIntBe(2);
            }
            if (intval($this->t()) == 1) {
                $this->_m_s1 = $this->_io->readBitsIntBe(1) != 0;
            }
            if (intval($this->t()) == 0) {
                $this->_m_rle = $this->_io->readBitsIntBe(13);
            }
            if (intval($this->t()) == 1) {
                $this->_m_symbolList = $this->_io->readBitsIntBe(14);
            }
        }
        protected $_m_s;
        public function s() {
            if ($this->_m_s !== null)
                return $this->_m_s;
            $this->_m_s = (intval($this->t()) == 0 ? $this->s2() : (intval($this->s1()) == 0 ? 1 : 0));
            return $this->_m_s;
        }
        protected $_m_t;
        protected $_m_s2;
        protected $_m_s1;
        protected $_m_rle;
        protected $_m_symbolList;
        public function t() { return $this->_m_t; }
        public function s2() { return $this->_m_s2; }
        public function s1() { return $this->_m_s1; }
        public function rle() { return $this->_m_rle; }
        public function symbolList() { return $this->_m_symbolList; }
    }
}

namespace RtcpPayload {
    class PsfbAfbPacket extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \RtcpPayload\PsfbPacket $_parent = null, \RtcpPayload $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_uid = $this->_io->readU4be();
            switch ($this->uid()) {
                case 1380273474:
                    $this->_m__raw_contents = $this->_io->readBytesFull();
                    $_io__raw_contents = new \Kaitai\Struct\Stream($this->_m__raw_contents);
                    $this->_m_contents = new \RtcpPayload\PsfbAfbRembPacket($_io__raw_contents, $this, $this->_root);
                    break;
                default:
                    $this->_m_contents = $this->_io->readBytesFull();
                    break;
            }
        }
        protected $_m_uid;
        protected $_m_contents;
        protected $_m__raw_contents;
        public function uid() { return $this->_m_uid; }
        public function contents() { return $this->_m_contents; }
        public function _raw_contents() { return $this->_m__raw_contents; }
    }
}

namespace RtcpPayload {
    class PayloadType {
        const FIR = 192;
        const NACK = 193;
        const IJ = 195;
        const SR = 200;
        const RR = 201;
        const SDES = 202;
        const BYE = 203;
        const APP = 204;
        const RTPFB = 205;
        const PSFB = 206;
        const XR = 207;
        const AVB = 208;
        const RSI = 209;
    }
}

namespace RtcpPayload {
    class SdesSubtype {
        const PAD = 0;
        const CNAME = 1;
        const NAME = 2;
        const EMAIL = 3;
        const PHONE = 4;
        const LOC = 5;
        const TOOL = 6;
        const NOTE = 7;
        const PRIV = 8;
    }
}

namespace RtcpPayload {
    class PsfbSubtype {
        const PLI = 1;
        const SLI = 2;
        const RPSI = 3;
        const FIR = 4;
        const TSTR = 5;
        const TSTN = 6;
        const VBCM = 7;
        const AFB = 15;
    }
}

namespace RtcpPayload {
    class RtpfbSubtype {
        const NACK = 1;
        const TMMBR = 3;
        const TMMBN = 4;
        const RRR = 5;
        const TRANSPORT_FEEDBACK = 15;
    }
}
