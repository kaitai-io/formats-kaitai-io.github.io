<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Parse UEFI variables db and dbx that contain signatures, certificates and
 * hashes. On a Linux system using UEFI, these variables are readable from:
 * 
 * ```
 * /sys/firmware/efi/efivars/db-d719b2cb-3d3a-4596-a3bc-dad00e67656f
 * /sys/firmware/efi/efivars/dbDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c
 * /sys/firmware/efi/efivars/dbx-d719b2cb-3d3a-4596-a3bc-dad00e67656f
 * /sys/firmware/efi/efivars/dbxDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c
 * ```
 * 
 * Note:
 * 
 * * `d719b2cb-3d3a-4596-a3bc-dad00e67656f` is defined as `EFI_IMAGE_SECURITY_DATABASE_GUID`
 * * `8be4df61-93ca-11d2-aa0d-00e098032b8c` is defined as `EFI_GLOBAL_VARIABLE`
 * 
 * Each file contains an EFI attribute (32-bit integer) followed by a list of
 * `EFI_SIGNATURE_LIST` structures.
 */

namespace {
    class EfivarSignatureList extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\EfivarSignatureList $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_varAttributes = new \EfivarSignatureList\EfiVarAttr($this->_io, $this, $this->_root);
            $this->_m_signatures = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_signatures[] = new \EfivarSignatureList\SignatureList($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_varAttributes;
        protected $_m_signatures;

        /**
         * Attributes of the UEFI variable
         */
        public function varAttributes() { return $this->_m_varAttributes; }
        public function signatures() { return $this->_m_signatures; }
    }
}

/**
 * Attributes of a UEFI variable
 */

namespace EfivarSignatureList {
    class EfiVarAttr extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\EfivarSignatureList $_parent = null, ?\EfivarSignatureList $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_enhancedAuthenticatedAccess = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_appendWrite = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_timeBasedAuthenticatedWriteAccess = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_authenticatedWriteAccess = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_hardwareErrorRecord = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_runtimeAccess = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_bootserviceAccess = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_nonVolatile = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_reserved1 = $this->_io->readBitsIntBe(24);
        }
        protected $_m_enhancedAuthenticatedAccess;
        protected $_m_appendWrite;
        protected $_m_timeBasedAuthenticatedWriteAccess;
        protected $_m_authenticatedWriteAccess;
        protected $_m_hardwareErrorRecord;
        protected $_m_runtimeAccess;
        protected $_m_bootserviceAccess;
        protected $_m_nonVolatile;
        protected $_m_reserved1;
        public function enhancedAuthenticatedAccess() { return $this->_m_enhancedAuthenticatedAccess; }
        public function appendWrite() { return $this->_m_appendWrite; }
        public function timeBasedAuthenticatedWriteAccess() { return $this->_m_timeBasedAuthenticatedWriteAccess; }
        public function authenticatedWriteAccess() { return $this->_m_authenticatedWriteAccess; }
        public function hardwareErrorRecord() { return $this->_m_hardwareErrorRecord; }
        public function runtimeAccess() { return $this->_m_runtimeAccess; }
        public function bootserviceAccess() { return $this->_m_bootserviceAccess; }
        public function nonVolatile() { return $this->_m_nonVolatile; }

        /**
         * Reserved (unused) bits
         */
        public function reserved1() { return $this->_m_reserved1; }
    }
}

namespace EfivarSignatureList {
    class SignatureData extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\EfivarSignatureList\SignatureList $_parent = null, ?\EfivarSignatureList $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_owner = $this->_io->readBytes(16);
            $this->_m_data = $this->_io->readBytesFull();
        }
        protected $_m_owner;
        protected $_m_data;

        /**
         * An identifier which identifies the agent which added the signature to the list
         */
        public function owner() { return $this->_m_owner; }

        /**
         * The format of the signature is defined by the SignatureType.
         */
        public function data() { return $this->_m_data; }
    }
}

namespace EfivarSignatureList {
    class SignatureList extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\EfivarSignatureList $_parent = null, ?\EfivarSignatureList $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_signatureType = $this->_io->readBytes(16);
            $this->_m_lenSignatureList = $this->_io->readU4le();
            $this->_m_lenSignatureHeader = $this->_io->readU4le();
            $this->_m_lenSignature = $this->_io->readU4le();
            $this->_m_header = $this->_io->readBytes($this->lenSignatureHeader());
            if ($this->lenSignature() > 0) {
                $this->_m__raw_signatures = [];
                $this->_m_signatures = [];
                $n = intval((($this->lenSignatureList() - $this->lenSignatureHeader()) - 28) / $this->lenSignature());
                for ($i = 0; $i < $n; $i++) {
                    $this->_m__raw_signatures[] = $this->_io->readBytes($this->lenSignature());
                    $_io__raw_signatures = new \Kaitai\Struct\Stream(end($this->_m__raw_signatures));
                    $this->_m_signatures[] = new \EfivarSignatureList\SignatureData($_io__raw_signatures, $this, $this->_root);
                }
            }
        }
        protected $_m_isCertDerPkcs7;

        /**
         * DER-encoded PKCS #7 version 1.5 [RFC2315]
         */
        public function isCertDerPkcs7() {
            if ($this->_m_isCertDerPkcs7 !== null)
                return $this->_m_isCertDerPkcs7;
            $this->_m_isCertDerPkcs7 = $this->signatureType() == "\x9D\xD2\xAF\x4A\xDF\x68\xEE\x49\x8A\xA9\x34\x7D\x37\x56\x65\xA7";
            return $this->_m_isCertDerPkcs7;
        }
        protected $_m_isCertRsa2048Key;

        /**
         * RSA-2048 key (only the modulus since the public key exponent is known to be 0x10001)
         */
        public function isCertRsa2048Key() {
            if ($this->_m_isCertRsa2048Key !== null)
                return $this->_m_isCertRsa2048Key;
            $this->_m_isCertRsa2048Key = $this->signatureType() == "\xE8\x66\x57\x3C\x9C\x26\x34\x4E\xAA\x14\xED\x77\x6E\x85\xB3\xB6";
            return $this->_m_isCertRsa2048Key;
        }
        protected $_m_isCertRsa2048Sha1;

        /**
         * RSA-2048 signature of a SHA-1 hash
         */
        public function isCertRsa2048Sha1() {
            if ($this->_m_isCertRsa2048Sha1 !== null)
                return $this->_m_isCertRsa2048Sha1;
            $this->_m_isCertRsa2048Sha1 = $this->signatureType() == "\x4F\x44\xF8\x67\x43\x87\xF1\x48\xA3\x28\x1E\xAA\xB8\x73\x60\x80";
            return $this->_m_isCertRsa2048Sha1;
        }
        protected $_m_isCertRsa2048Sha256;

        /**
         * RSA-2048 signature of a SHA-256 hash
         */
        public function isCertRsa2048Sha256() {
            if ($this->_m_isCertRsa2048Sha256 !== null)
                return $this->_m_isCertRsa2048Sha256;
            $this->_m_isCertRsa2048Sha256 = $this->signatureType() == "\x90\x61\xB3\xE2\x9B\x87\x3D\x4A\xAD\x8D\xF2\xE7\xBB\xA3\x27\x84";
            return $this->_m_isCertRsa2048Sha256;
        }
        protected $_m_isCertSha1;

        /**
         * SHA-1 hash
         */
        public function isCertSha1() {
            if ($this->_m_isCertSha1 !== null)
                return $this->_m_isCertSha1;
            $this->_m_isCertSha1 = $this->signatureType() == "\x12\xA5\x6C\x82\x10\xCF\xC9\x4A\xB1\x87\xBE\x01\x49\x66\x31\xBD";
            return $this->_m_isCertSha1;
        }
        protected $_m_isCertSha224;

        /**
         * SHA-224 hash
         */
        public function isCertSha224() {
            if ($this->_m_isCertSha224 !== null)
                return $this->_m_isCertSha224;
            $this->_m_isCertSha224 = $this->signatureType() == "\x33\x52\x6E\x0B\x5C\xA6\xC9\x44\x94\x07\xD9\xAB\x83\xBF\xC8\xBD";
            return $this->_m_isCertSha224;
        }
        protected $_m_isCertSha256;

        /**
         * SHA-256 hash
         */
        public function isCertSha256() {
            if ($this->_m_isCertSha256 !== null)
                return $this->_m_isCertSha256;
            $this->_m_isCertSha256 = $this->signatureType() == "\x26\x16\xC4\xC1\x4C\x50\x92\x40\xAC\xA9\x41\xF9\x36\x93\x43\x28";
            return $this->_m_isCertSha256;
        }
        protected $_m_isCertSha256X509;

        /**
         * SHA256 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
         */
        public function isCertSha256X509() {
            if ($this->_m_isCertSha256X509 !== null)
                return $this->_m_isCertSha256X509;
            $this->_m_isCertSha256X509 = $this->signatureType() == "\x92\xA4\xD2\x3B\xC0\x96\x79\x40\xB4\x20\xFC\xF9\x8E\xF1\x03\xED";
            return $this->_m_isCertSha256X509;
        }
        protected $_m_isCertSha384;

        /**
         * SHA-384 hash
         */
        public function isCertSha384() {
            if ($this->_m_isCertSha384 !== null)
                return $this->_m_isCertSha384;
            $this->_m_isCertSha384 = $this->signatureType() == "\x07\x53\x3E\xFF\xD0\x9F\xC9\x48\x85\xF1\x8A\xD5\x6C\x70\x1E\x01";
            return $this->_m_isCertSha384;
        }
        protected $_m_isCertSha384X509;

        /**
         * SHA384 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
         */
        public function isCertSha384X509() {
            if ($this->_m_isCertSha384X509 !== null)
                return $this->_m_isCertSha384X509;
            $this->_m_isCertSha384X509 = $this->signatureType() == "\x6E\x87\x76\x70\xC2\x80\xE6\x4E\xAA\xD2\x28\xB3\x49\xA6\x86\x5B";
            return $this->_m_isCertSha384X509;
        }
        protected $_m_isCertSha512;

        /**
         * SHA-512 hash
         */
        public function isCertSha512() {
            if ($this->_m_isCertSha512 !== null)
                return $this->_m_isCertSha512;
            $this->_m_isCertSha512 = $this->signatureType() == "\xAE\x0F\x3E\x09\xC4\xA6\x50\x4F\x9F\x1B\xD4\x1E\x2B\x89\xC1\x9A";
            return $this->_m_isCertSha512;
        }
        protected $_m_isCertSha512X509;

        /**
         * SHA512 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
         */
        public function isCertSha512X509() {
            if ($this->_m_isCertSha512X509 !== null)
                return $this->_m_isCertSha512X509;
            $this->_m_isCertSha512X509 = $this->signatureType() == "\x63\xBF\x6D\x44\x02\x25\xDA\x4C\xBC\xFA\x24\x65\xD2\xB0\xFE\x9D";
            return $this->_m_isCertSha512X509;
        }
        protected $_m_isCertX509;

        /**
         * X.509 certificate
         */
        public function isCertX509() {
            if ($this->_m_isCertX509 !== null)
                return $this->_m_isCertX509;
            $this->_m_isCertX509 = $this->signatureType() == "\xA1\x59\xC0\xA5\xE4\x94\xA7\x4A\x87\xB5\xAB\x15\x5C\x2B\xF0\x72";
            return $this->_m_isCertX509;
        }
        protected $_m_signatureType;
        protected $_m_lenSignatureList;
        protected $_m_lenSignatureHeader;
        protected $_m_lenSignature;
        protected $_m_header;
        protected $_m_signatures;
        protected $_m__raw_signatures;

        /**
         * Type of the signature as a GUID
         */
        public function signatureType() { return $this->_m_signatureType; }

        /**
         * Total size of the signature list, including this header
         */
        public function lenSignatureList() { return $this->_m_lenSignatureList; }

        /**
         * Size of the signature header which precedes the array of signatures
         */
        public function lenSignatureHeader() { return $this->_m_lenSignatureHeader; }

        /**
         * Size of each signature
         */
        public function lenSignature() { return $this->_m_lenSignature; }

        /**
         * Header before the array of signatures
         */
        public function header() { return $this->_m_header; }

        /**
         * An array of signatures
         */
        public function signatures() { return $this->_m_signatures; }
        public function _raw_signatures() { return $this->_m__raw_signatures; }
    }
}
