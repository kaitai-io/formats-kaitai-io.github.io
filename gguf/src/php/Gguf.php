<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * GGUF is the file format of the [ggml](https://github.com/ggml-org/ggml)
 * tensor library for storing machine learning models, used for example by
 * [llama.cpp](https://github.com/ggml-org/llama.cpp) for inference. It
 * replaced the older GGML, GGMF and GGJT formats.
 * 
 * A GGUF file consists of a header with metadata as key-value pairs (model
 * architecture, hyperparameters, tokenizer, etc.), a description of each
 * tensor (name, dimensions, type and offset), and finally the tensor data.
 */

namespace {
    class Gguf extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Gguf $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x47\x47\x55\x46")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x47\x47\x55\x46", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_body = new \Gguf\GgufBody($this->_io, $this, $this->_root);
        }
        protected $_m_isBigEndian;
        public function isBigEndian() {
            if ($this->_m_isBigEndian !== null)
                return $this->_m_isBigEndian;
            $this->_m_isBigEndian = ($this->versionLe() & 65535) == 0;
            return $this->_m_isBigEndian;
        }
        protected $_m_lenFile;

        /**
         * Length of the file (computed from the header), including the padding after
         * the last tensor's data.
         * 
         * This Kaitai Struct implementation stops parsing where the tensor data
         * starts (which is read lazily, i.e. only on demand). Without reading the
         * tensor data, you can use this expected file size to check whether the file
         * has been truncated, to carve the file out of a larger one, etc.
         */
        public function lenFile() {
            if ($this->_m_lenFile !== null)
                return $this->_m_lenFile;
            $this->_m_lenFile = ($this->body()->ofsTensorData() + ($this->body()->numTensorInfos() != 0 ? $this->body()->tensorInfos()[count($this->body()->tensorInfos()) - 1]->expectedNextOffset() : 0));
            return $this->_m_lenFile;
        }
        protected $_m_versionLe;
        public function versionLe() {
            if ($this->_m_versionLe !== null)
                return $this->_m_versionLe;
            $_pos = $this->_io->pos();
            $this->_io->seek(4);
            $this->_m_versionLe = $this->_io->readU4le();
            $this->_io->seek($_pos);
            return $this->_m_versionLe;
        }
        protected $_m_magic;
        protected $_m_body;

        /**
         * GGUF file magic
         */
        public function magic() { return $this->_m_magic; }
        public function body() { return $this->_m_body; }
    }
}

namespace Gguf {
    class GgufBody extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gguf $_parent = null, ?\Gguf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            switch ($this->_root()->isBigEndian()) {
                case true:
                    $this->_m__is_le = false;
                    break;
                case false:
                    $this->_m__is_le = true;
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
            $this->_m_version = $this->_io->readU4le();
            if (!($this->_m_version >= 2)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(2, $this->_m_version, $this->_io, "/types/gguf_body/seq/0");
            }
            if (!($this->_m_version <= 3)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(3, $this->_m_version, $this->_io, "/types/gguf_body/seq/0");
            }
            $this->_m_numTensorInfos = $this->_io->readU8le();
            $this->_m_numKvPairs = $this->_io->readU8le();
            $this->_m_kvPairs = [];
            $n = $this->numKvPairs();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_kvPairs[] = new \Gguf\GgufBody\GgufKv(($i != 0 ? $this->kvPairs()[$i - 1]->alignment() : 32), $this->_io, $this, $this->_root, $this->_m__is_le);
            }
            $this->_m_tensorInfos = [];
            $n = $this->numTensorInfos();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_tensorInfos[] = new \Gguf\GgufBody\GgufTensorInfo(($i != 0 ? $this->tensorInfos()[$i - 1]->expectedNextOffset() : 0), $this->_io, $this, $this->_root, $this->_m__is_le);
            }
            if ($this->numTensorInfos() != 0) {
                $this->_m_padding = $this->_io->readBytes(\Kaitai\Struct\Stream::mod($this->alignment() - \Kaitai\Struct\Stream::mod($this->_io()->pos(), $this->alignment()), $this->alignment()));
            }
            if ($this->ofsTensorData() < 0) {
                $this->_m__unnamed6 = $this->_io->readBytes(0);
            }
        }

        private function _readBE() {
            $this->_m_version = $this->_io->readU4be();
            if (!($this->_m_version >= 2)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(2, $this->_m_version, $this->_io, "/types/gguf_body/seq/0");
            }
            if (!($this->_m_version <= 3)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(3, $this->_m_version, $this->_io, "/types/gguf_body/seq/0");
            }
            $this->_m_numTensorInfos = $this->_io->readU8be();
            $this->_m_numKvPairs = $this->_io->readU8be();
            $this->_m_kvPairs = [];
            $n = $this->numKvPairs();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_kvPairs[] = new \Gguf\GgufBody\GgufKv(($i != 0 ? $this->kvPairs()[$i - 1]->alignment() : 32), $this->_io, $this, $this->_root, $this->_m__is_le);
            }
            $this->_m_tensorInfos = [];
            $n = $this->numTensorInfos();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_tensorInfos[] = new \Gguf\GgufBody\GgufTensorInfo(($i != 0 ? $this->tensorInfos()[$i - 1]->expectedNextOffset() : 0), $this->_io, $this, $this->_root, $this->_m__is_le);
            }
            if ($this->numTensorInfos() != 0) {
                $this->_m_padding = $this->_io->readBytes(\Kaitai\Struct\Stream::mod($this->alignment() - \Kaitai\Struct\Stream::mod($this->_io()->pos(), $this->alignment()), $this->alignment()));
            }
            if ($this->ofsTensorData() < 0) {
                $this->_m__unnamed6 = $this->_io->readBytes(0);
            }
        }
        protected $_m_alignment;

        /**
         * Global alignment - from the `general.alignment` key, or 32 if there's no
         * such key.
         */
        public function alignment() {
            if ($this->_m_alignment !== null)
                return $this->_m_alignment;
            $this->_m_alignment = (count($this->kvPairs()) != 0 ? $this->kvPairs()[count($this->kvPairs()) - 1]->alignment() : 32);
            return $this->_m_alignment;
        }
        protected $_m_ofsTensorData;

        /**
         * Offset of the tensor data. Each tensor's `offset` is relative to this
         * position.
         */
        public function ofsTensorData() {
            if ($this->_m_ofsTensorData !== null)
                return $this->_m_ofsTensorData;
            $this->_m_ofsTensorData = $this->_io()->pos();
            return $this->_m_ofsTensorData;
        }
        protected $_m_version;
        protected $_m_numTensorInfos;
        protected $_m_numKvPairs;
        protected $_m_kvPairs;
        protected $_m_tensorInfos;
        protected $_m_padding;
        protected $_m__unnamed6;

        /**
         * File format version. Version 1 used 32-bit counts and lengths, which
         * this Kaitai Struct implementation doesn't support, and neither does
         * ggml.
         */
        public function version() { return $this->_m_version; }

        /**
         * The number of tensors in the file
         */
        public function numTensorInfos() { return $this->_m_numTensorInfos; }

        /**
         * The number of key-value pairs in the file header
         */
        public function numKvPairs() { return $this->_m_numKvPairs; }

        /**
         * Key-value pairs. ggml (v0.27.0)
         * [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L575-L578)
         * duplicate keys, but this Kaitai Struct implementation can't detect
         * them. If there are multiple `general.alignment` keys, the last one is
         * used for the `alignment` value instance.
         */
        public function kvPairs() { return $this->_m_kvPairs; }

        /**
         * Tensor metadata. ggml (v0.27.0)
         * [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L664-L669)
         * duplicate tensor names, but this Kaitai Struct implementation can't
         * detect them.
         */
        public function tensorInfos() { return $this->_m_tensorInfos; }
        public function padding() { return $this->_m_padding; }
        public function _unnamed6() { return $this->_m__unnamed6; }
    }
}

/**
 * Nested arrays are supported. Although ggml (v0.27.0) doesn't support them,
 * they are explicitly allowed by `gguf.md` - see
 * <https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L221>.
 */

namespace Gguf\GgufBody {
    class GgufArray extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody\GgufValue $_parent = null, ?\Gguf $_root = null, $is_le = null) {
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
            $this->_m_type = $this->_io->readU4le();
            if (!\Gguf\GgufType::isDefined($this->_m_type)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_type, $this->_io, "/types/gguf_body/types/gguf_array/seq/0");
            }
            $this->_m_numElems = $this->_io->readU8le();
            $this->_m_elems = [];
            $n = $this->numElems();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_elems[] = new \Gguf\GgufBody\GgufValue($this->type(), $this->_io, $this, $this->_root, $this->_m__is_le);
            }
        }

        private function _readBE() {
            $this->_m_type = $this->_io->readU4be();
            if (!\Gguf\GgufType::isDefined($this->_m_type)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_type, $this->_io, "/types/gguf_body/types/gguf_array/seq/0");
            }
            $this->_m_numElems = $this->_io->readU8be();
            $this->_m_elems = [];
            $n = $this->numElems();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_elems[] = new \Gguf\GgufBody\GgufValue($this->type(), $this->_io, $this, $this->_root, $this->_m__is_le);
            }
        }
        protected $_m_type;
        protected $_m_numElems;
        protected $_m_elems;
        public function type() { return $this->_m_type; }
        public function numElems() { return $this->_m_numElems; }
        public function elems() { return $this->_m_elems; }
    }
}

namespace Gguf\GgufBody {
    class GgufBool extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody\GgufValue $_parent = null, ?\Gguf $_root = null, $is_le = null) {
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
            $this->_m_valueRaw = $this->_io->readU1();
            if (!($this->_m_valueRaw <= 1)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(1, $this->_m_valueRaw, $this->_io, "/types/gguf_body/types/gguf_bool/seq/0");
            }
        }

        private function _readBE() {
            $this->_m_valueRaw = $this->_io->readU1();
            if (!($this->_m_valueRaw <= 1)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(1, $this->_m_valueRaw, $this->_io, "/types/gguf_body/types/gguf_bool/seq/0");
            }
        }
        protected $_m_value;
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = $this->valueRaw() != 0;
            return $this->_m_value;
        }
        protected $_m_valueRaw;
        public function valueRaw() { return $this->_m_valueRaw; }
    }
}

namespace Gguf\GgufBody {
    class GgufFloat32 extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody\GgufValue $_parent = null, ?\Gguf $_root = null, $is_le = null) {
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
            $this->_m_value = $this->_io->readF4le();
        }

        private function _readBE() {
            $this->_m_value = $this->_io->readF4be();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Gguf\GgufBody {
    class GgufFloat64 extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody\GgufValue $_parent = null, ?\Gguf $_root = null, $is_le = null) {
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
            $this->_m_value = $this->_io->readF8le();
        }

        private function _readBE() {
            $this->_m_value = $this->_io->readF8be();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Gguf\GgufBody {
    class GgufInt16 extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody\GgufValue $_parent = null, ?\Gguf $_root = null, $is_le = null) {
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
            $this->_m_value = $this->_io->readS2le();
        }

        private function _readBE() {
            $this->_m_value = $this->_io->readS2be();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Gguf\GgufBody {
    class GgufInt32 extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody\GgufValue $_parent = null, ?\Gguf $_root = null, $is_le = null) {
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
            $this->_m_value = $this->_io->readS4le();
        }

        private function _readBE() {
            $this->_m_value = $this->_io->readS4be();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Gguf\GgufBody {
    class GgufInt64 extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody\GgufValue $_parent = null, ?\Gguf $_root = null, $is_le = null) {
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
            $this->_m_value = $this->_io->readS8le();
        }

        private function _readBE() {
            $this->_m_value = $this->_io->readS8be();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Gguf\GgufBody {
    class GgufInt8 extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody\GgufValue $_parent = null, ?\Gguf $_root = null, $is_le = null) {
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
            $this->_m_value = $this->_io->readS1();
        }

        private function _readBE() {
            $this->_m_value = $this->_io->readS1();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Gguf\GgufBody {
    class GgufKv extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(int $prevAlignment, \Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody $_parent = null, ?\Gguf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_m_prevAlignment = $prevAlignment;
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
            $this->_m_key = new \Gguf\GgufBody\GgufStr($this->_io, $this, $this->_root, $this->_m__is_le);
            $_ = $this->_m_key;
            if (!($_->lenValue() != 0)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_key, $this->_io, "/types/gguf_body/types/gguf_kv/seq/0");
            }
            $this->_m_type = $this->_io->readU4le();
            if (!\Gguf\GgufType::isDefined($this->_m_type)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_type, $this->_io, "/types/gguf_body/types/gguf_kv/seq/1");
            }
            $this->_m_value = new \Gguf\GgufBody\GgufValue($this->type(), $this->_io, $this, $this->_root, $this->_m__is_le);
            $_ = $this->_m_value;
            if (!(($this->key()->value() == "general.alignment" ?  (($this->type() == \Gguf\GgufType::UINT32) && ($_->value()->value() != 0) && (($_->value()->value() & $_->value()->value() - 1) == 0))  : true))) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_value, $this->_io, "/types/gguf_body/types/gguf_kv/seq/2");
            }
        }

        private function _readBE() {
            $this->_m_key = new \Gguf\GgufBody\GgufStr($this->_io, $this, $this->_root, $this->_m__is_le);
            $_ = $this->_m_key;
            if (!($_->lenValue() != 0)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_key, $this->_io, "/types/gguf_body/types/gguf_kv/seq/0");
            }
            $this->_m_type = $this->_io->readU4be();
            if (!\Gguf\GgufType::isDefined($this->_m_type)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_type, $this->_io, "/types/gguf_body/types/gguf_kv/seq/1");
            }
            $this->_m_value = new \Gguf\GgufBody\GgufValue($this->type(), $this->_io, $this, $this->_root, $this->_m__is_le);
            $_ = $this->_m_value;
            if (!(($this->key()->value() == "general.alignment" ?  (($this->type() == \Gguf\GgufType::UINT32) && ($_->value()->value() != 0) && (($_->value()->value() & $_->value()->value() - 1) == 0))  : true))) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_value, $this->_io, "/types/gguf_body/types/gguf_kv/seq/2");
            }
        }
        protected $_m_alignment;
        public function alignment() {
            if ($this->_m_alignment !== null)
                return $this->_m_alignment;
            $this->_m_alignment = ($this->key()->value() == "general.alignment" ? $this->value()->value()->value() : $this->prevAlignment());
            return $this->_m_alignment;
        }
        protected $_m_key;
        protected $_m_type;
        protected $_m_value;
        protected $_m_prevAlignment;
        public function key() { return $this->_m_key; }
        public function type() { return $this->_m_type; }
        public function value() { return $this->_m_value; }
        public function prevAlignment() { return $this->_m_prevAlignment; }
    }
}

namespace Gguf\GgufBody {
    class GgufStr extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Gguf $_root = null, $is_le = null) {
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
            $this->_m_lenValue = $this->_io->readU8le();
            $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenValue()), "UTF-8");
        }

        private function _readBE() {
            $this->_m_lenValue = $this->_io->readU8be();
            $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenValue()), "UTF-8");
        }
        protected $_m_lenValue;
        protected $_m_value;
        public function lenValue() { return $this->_m_lenValue; }
        public function value() { return $this->_m_value; }
    }
}

namespace Gguf\GgufBody {
    class GgufTensorInfo extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(int $expectedOffset, \Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody $_parent = null, ?\Gguf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_m_expectedOffset = $expectedOffset;
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
            $this->_m_name = new \Gguf\GgufBody\GgufStr($this->_io, $this, $this->_root, $this->_m__is_le);
            $_ = $this->_m_name;
            if (!($_->lenValue() < 64)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_name, $this->_io, "/types/gguf_body/types/gguf_tensor_info/seq/0");
            }
            $this->_m_numDims = $this->_io->readU4le();
            if (!($this->_m_numDims <= 4)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(4, $this->_m_numDims, $this->_io, "/types/gguf_body/types/gguf_tensor_info/seq/1");
            }
            $this->_m_dims = [];
            $n = $this->numDims();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_dims[] = $this->_io->readS8le();
                if (!($this->_m_dims[$i] >= 0)) {
                    throw new \Kaitai\Struct\Error\ValidationLessThanError(0, $this->_m_dims[$i], $this->_io, "/types/gguf_body/types/gguf_tensor_info/seq/2");
                }
            }
            $this->_m_type = $this->_io->readU4le();
            $_ = $this->_m_type;
            if (!( (($_ < 43) && ($this->numElementsPerBlock() != 0) && (\Kaitai\Struct\Stream::mod(($this->numDims() > 0 ? $this->dims()[0] : 1), $this->numElementsPerBlock()) == 0)) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_type, $this->_io, "/types/gguf_body/types/gguf_tensor_info/seq/3");
            }
            $this->_m_offset = $this->_io->readU8le();
            if (!($this->_m_offset == $this->expectedOffset())) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError($this->expectedOffset(), $this->_m_offset, $this->_io, "/types/gguf_body/types/gguf_tensor_info/seq/4");
            }
        }

        private function _readBE() {
            $this->_m_name = new \Gguf\GgufBody\GgufStr($this->_io, $this, $this->_root, $this->_m__is_le);
            $_ = $this->_m_name;
            if (!($_->lenValue() < 64)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_name, $this->_io, "/types/gguf_body/types/gguf_tensor_info/seq/0");
            }
            $this->_m_numDims = $this->_io->readU4be();
            if (!($this->_m_numDims <= 4)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(4, $this->_m_numDims, $this->_io, "/types/gguf_body/types/gguf_tensor_info/seq/1");
            }
            $this->_m_dims = [];
            $n = $this->numDims();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_dims[] = $this->_io->readS8be();
                if (!($this->_m_dims[$i] >= 0)) {
                    throw new \Kaitai\Struct\Error\ValidationLessThanError(0, $this->_m_dims[$i], $this->_io, "/types/gguf_body/types/gguf_tensor_info/seq/2");
                }
            }
            $this->_m_type = $this->_io->readU4be();
            $_ = $this->_m_type;
            if (!( (($_ < 43) && ($this->numElementsPerBlock() != 0) && (\Kaitai\Struct\Stream::mod(($this->numDims() > 0 ? $this->dims()[0] : 1), $this->numElementsPerBlock()) == 0)) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_type, $this->_io, "/types/gguf_body/types/gguf_tensor_info/seq/3");
            }
            $this->_m_offset = $this->_io->readU8be();
            if (!($this->_m_offset == $this->expectedOffset())) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError($this->expectedOffset(), $this->_m_offset, $this->_io, "/types/gguf_body/types/gguf_tensor_info/seq/4");
            }
        }
        protected $_m_data;
        public function data() {
            if ($this->_m_data !== null)
                return $this->_m_data;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->_parent()->ofsTensorData() + $this->offset());
            if ($this->_m__is_le) {
                $this->_m_data = $this->_io->readBytes($this->lenData());
            } else {
                $this->_m_data = $this->_io->readBytes($this->lenData());
            }
            $this->_io->seek($_pos);
            return $this->_m_data;
        }
        protected $_m_dumpDims;

        /**
         * `dims` joined with the string `" x "`. This is necessary for
         * `-webide-representation`, which cannot format `dims` directly -
         * see <https://github.com/kaitai-io/kaitai_struct_webide/issues/160>.
         */
        public function dumpDims() {
            if ($this->_m_dumpDims !== null)
                return $this->_m_dumpDims;
            $this->_m_dumpDims = ((($this->numDims() > 0 ? strval($this->dims()[0]) : "") . ($this->numDims() > 1 ? " x " . strval($this->dims()[1]) : "")) . ($this->numDims() > 2 ? " x " . strval($this->dims()[2]) : "")) . ($this->numDims() > 3 ? " x " . strval($this->dims()[3]) : "");
            return $this->_m_dumpDims;
        }
        protected $_m_expectedNextOffset;

        /**
         * `offset` that the next tensor must have
         */
        public function expectedNextOffset() {
            if ($this->_m_expectedNextOffset !== null)
                return $this->_m_expectedNextOffset;
            $this->_m_expectedNextOffset = (($this->offset() + $this->lenData()) + $this->lenPadding());
            return $this->_m_expectedNextOffset;
        }
        protected $_m_lenBlock;

        /**
         * Size of a block in bytes
         */
        public function lenBlock() {
            if ($this->_m_lenBlock !== null)
                return $this->_m_lenBlock;
            $this->_m_lenBlock = [4, 2, 18, 20, 0, 0, 22, 24, 34, 36, 84, 110, 144, 176, 210, 292, 66, 74, 98, 50, 18, 110, 82, 136, 1, 2, 4, 8, 8, 56, 2, 0, 0, 0, 54, 66, 0, 0, 0, 17, 36, 18, 18][$this->type()];
            return $this->_m_lenBlock;
        }
        protected $_m_lenData;
        public function lenData() {
            if ($this->_m_lenData !== null)
                return $this->_m_lenData;
            $this->_m_lenData = ($this->lenBlock() * $this->numBlocks());
            return $this->_m_lenData;
        }
        protected $_m_lenPadding;

        /**
         * Number of padding bytes after the data
         */
        public function lenPadding() {
            if ($this->_m_lenPadding !== null)
                return $this->_m_lenPadding;
            $this->_m_lenPadding = \Kaitai\Struct\Stream::mod($this->_parent()->alignment() - \Kaitai\Struct\Stream::mod($this->lenData(), $this->_parent()->alignment()), $this->_parent()->alignment());
            return $this->_m_lenPadding;
        }
        protected $_m_numBlocks;
        public function numBlocks() {
            if ($this->_m_numBlocks !== null)
                return $this->_m_numBlocks;
            $this->_m_numBlocks = intval($this->numElements() / $this->numElementsPerBlock());
            return $this->_m_numBlocks;
        }
        protected $_m_numElements;
        public function numElements() {
            if ($this->_m_numElements !== null)
                return $this->_m_numElements;
            $this->_m_numElements = (((($this->numDims() > 0 ? $this->dims()[0] : 1) * ($this->numDims() > 1 ? $this->dims()[1] : 1)) * ($this->numDims() > 2 ? $this->dims()[2] : 1)) * ($this->numDims() > 3 ? $this->dims()[3] : 1));
            return $this->_m_numElements;
        }
        protected $_m_numElementsPerBlock;

        /**
         * Number of elements in a block
         */
        public function numElementsPerBlock() {
            if ($this->_m_numElementsPerBlock !== null)
                return $this->_m_numElementsPerBlock;
            $this->_m_numElementsPerBlock = [1, 1, 32, 32, 0, 0, 32, 32, 32, 32, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 32, 256, 256, 256, 1, 1, 1, 1, 1, 256, 1, 0, 0, 0, 256, 256, 0, 0, 0, 32, 64, 128, 64][$this->type()];
            return $this->_m_numElementsPerBlock;
        }
        protected $_m_padding;

        /**
         * Padding after the data. ggml requires it even after the last tensor
         * when reading the tensor data.
         */
        public function padding() {
            if ($this->_m_padding !== null)
                return $this->_m_padding;
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->_parent()->ofsTensorData() + $this->offset()) + $this->lenData());
            if ($this->_m__is_le) {
                $this->_m_padding = $this->_io->readBytes($this->lenPadding());
            } else {
                $this->_m_padding = $this->_io->readBytes($this->lenPadding());
            }
            $this->_io->seek($_pos);
            return $this->_m_padding;
        }
        protected $_m_name;
        protected $_m_numDims;
        protected $_m_dims;
        protected $_m_type;
        protected $_m_offset;
        protected $_m_expectedOffset;
        public function name() { return $this->_m_name; }
        public function numDims() { return $this->_m_numDims; }
        public function dims() { return $this->_m_dims; }
        public function type() { return $this->_m_type; }

        /**
         * Offset of the tensor's data, relative to `_parent.ofs_tensor_data`
         */
        public function offset() { return $this->_m_offset; }
        public function expectedOffset() { return $this->_m_expectedOffset; }
    }
}

namespace Gguf\GgufBody {
    class GgufUint16 extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody\GgufValue $_parent = null, ?\Gguf $_root = null, $is_le = null) {
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
            $this->_m_value = $this->_io->readU2le();
        }

        private function _readBE() {
            $this->_m_value = $this->_io->readU2be();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Gguf\GgufBody {
    class GgufUint32 extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody\GgufValue $_parent = null, ?\Gguf $_root = null, $is_le = null) {
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
            $this->_m_value = $this->_io->readU4le();
        }

        private function _readBE() {
            $this->_m_value = $this->_io->readU4be();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Gguf\GgufBody {
    class GgufUint64 extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody\GgufValue $_parent = null, ?\Gguf $_root = null, $is_le = null) {
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
            $this->_m_value = $this->_io->readU8le();
        }

        private function _readBE() {
            $this->_m_value = $this->_io->readU8be();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Gguf\GgufBody {
    class GgufUint8 extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gguf\GgufBody\GgufValue $_parent = null, ?\Gguf $_root = null, $is_le = null) {
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
            $this->_m_value = $this->_io->readU1();
        }

        private function _readBE() {
            $this->_m_value = $this->_io->readU1();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Gguf\GgufBody {
    class GgufValue extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(int $type, \Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Gguf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_m_type = $type;
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
            switch ($this->type()) {
                case \Gguf\GgufType::ARRAY:
                    $this->_m_value = new \Gguf\GgufBody\GgufArray($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::BOOL:
                    $this->_m_value = new \Gguf\GgufBody\GgufBool($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::FLOAT32:
                    $this->_m_value = new \Gguf\GgufBody\GgufFloat32($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::FLOAT64:
                    $this->_m_value = new \Gguf\GgufBody\GgufFloat64($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::INT16:
                    $this->_m_value = new \Gguf\GgufBody\GgufInt16($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::INT32:
                    $this->_m_value = new \Gguf\GgufBody\GgufInt32($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::INT64:
                    $this->_m_value = new \Gguf\GgufBody\GgufInt64($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::INT8:
                    $this->_m_value = new \Gguf\GgufBody\GgufInt8($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::STRING:
                    $this->_m_value = new \Gguf\GgufBody\GgufStr($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::UINT16:
                    $this->_m_value = new \Gguf\GgufBody\GgufUint16($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::UINT32:
                    $this->_m_value = new \Gguf\GgufBody\GgufUint32($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::UINT64:
                    $this->_m_value = new \Gguf\GgufBody\GgufUint64($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::UINT8:
                    $this->_m_value = new \Gguf\GgufBody\GgufUint8($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
            }
        }

        private function _readBE() {
            switch ($this->type()) {
                case \Gguf\GgufType::ARRAY:
                    $this->_m_value = new \Gguf\GgufBody\GgufArray($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::BOOL:
                    $this->_m_value = new \Gguf\GgufBody\GgufBool($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::FLOAT32:
                    $this->_m_value = new \Gguf\GgufBody\GgufFloat32($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::FLOAT64:
                    $this->_m_value = new \Gguf\GgufBody\GgufFloat64($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::INT16:
                    $this->_m_value = new \Gguf\GgufBody\GgufInt16($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::INT32:
                    $this->_m_value = new \Gguf\GgufBody\GgufInt32($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::INT64:
                    $this->_m_value = new \Gguf\GgufBody\GgufInt64($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::INT8:
                    $this->_m_value = new \Gguf\GgufBody\GgufInt8($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::STRING:
                    $this->_m_value = new \Gguf\GgufBody\GgufStr($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::UINT16:
                    $this->_m_value = new \Gguf\GgufBody\GgufUint16($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::UINT32:
                    $this->_m_value = new \Gguf\GgufBody\GgufUint32($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::UINT64:
                    $this->_m_value = new \Gguf\GgufBody\GgufUint64($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
                case \Gguf\GgufType::UINT8:
                    $this->_m_value = new \Gguf\GgufBody\GgufUint8($this->_io, $this, $this->_root, $this->_m__is_le);
                    break;
            }
        }
        protected $_m_value;
        protected $_m_type;
        public function value() { return $this->_m_value; }
        public function type() { return $this->_m_type; }
    }
}

namespace Gguf {
    class GgmlType {
        const F32 = 0;
        const F16 = 1;
        const Q4_0 = 2;
        const Q4_1 = 3;

        /**
         * Removed from ggml in May 2023, before GGUF was introduced. ggml
         * rejects it.
         */
        const Q4_2 = 4;

        /**
         * Removed from ggml in April 2023, before GGUF was introduced. ggml
         * rejects it.
         */
        const Q4_3 = 5;
        const Q5_0 = 6;
        const Q5_1 = 7;
        const Q8_0 = 8;
        const Q8_1 = 9;
        const Q2_K = 10;
        const Q3_K = 11;
        const Q4_K = 12;
        const Q5_K = 13;
        const Q6_K = 14;
        const Q8_K = 15;
        const IQ2_XXS = 16;
        const IQ2_XS = 17;
        const IQ3_XXS = 18;
        const IQ1_S = 19;
        const IQ4_NL = 20;
        const IQ3_S = 21;
        const IQ2_S = 22;
        const IQ4_XS = 23;
        const I8 = 24;
        const I16 = 25;
        const I32 = 26;
        const I64 = 27;
        const F64 = 28;
        const IQ1_M = 29;
        const BF16 = 30;

        /**
         * Removed from ggml in December 2024 in favor of repacking
         * `ggml_type::q4_0` at load time. ggml rejects it, although files with it
         * exist, e.g.
         * [`Qwen2.5-0.5B-Instruct-Q4_0_4_4.gguf`](https://huggingface.co/bartowski/Qwen2.5-0.5B-Instruct-GGUF/blob/41ba88dbac95fed2528c92514c131d73eb5a174b/Qwen2.5-0.5B-Instruct-Q4_0_4_4.gguf).
         */
        const Q4_0_4_4 = 31;

        /**
         * Removed from ggml in December 2024 in favor of repacking
         * `ggml_type::q4_0` at load time. ggml rejects it, although files with it
         * exist, e.g.
         * [`Qwen2.5-0.5B-Instruct-Q4_0_4_8.gguf`](https://huggingface.co/bartowski/Qwen2.5-0.5B-Instruct-GGUF/blob/41ba88dbac95fed2528c92514c131d73eb5a174b/Qwen2.5-0.5B-Instruct-Q4_0_4_8.gguf).
         */
        const Q4_0_4_8 = 32;

        /**
         * Removed from ggml in December 2024 in favor of repacking
         * `ggml_type::q4_0` at load time. ggml rejects it, although files with it
         * exist, e.g.
         * [`Qwen2.5-0.5B-Instruct-Q4_0_8_8.gguf`](https://huggingface.co/bartowski/Qwen2.5-0.5B-Instruct-GGUF/blob/41ba88dbac95fed2528c92514c131d73eb5a174b/Qwen2.5-0.5B-Instruct-Q4_0_8_8.gguf).
         */
        const Q4_0_8_8 = 33;
        const TQ1_0 = 34;
        const TQ2_0 = 35;

        /**
         * Supported by ggml only from November to December 2024, and only for
         * repacking tensors in memory - it was never written to files. ggml
         * rejects it.
         */
        const IQ4_NL_4_4 = 36;

        /**
         * Reserved by ggml, but never supported. ggml rejects it.
         */
        const IQ4_NL_4_8 = 37;

        /**
         * Reserved by ggml, but never supported. ggml rejects it.
         */
        const IQ4_NL_8_8 = 38;
        const MXFP4 = 39;
        const NVFP4 = 40;
        const Q1_0 = 41;
        const Q2_0 = 42;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 17 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true, 23 => true, 24 => true, 25 => true, 26 => true, 27 => true, 28 => true, 29 => true, 30 => true, 31 => true, 32 => true, 33 => true, 34 => true, 35 => true, 36 => true, 37 => true, 38 => true, 39 => true, 40 => true, 41 => true, 42 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Gguf {
    class GgufType {
        const UINT8 = 0;
        const INT8 = 1;
        const UINT16 = 2;
        const INT16 = 3;
        const UINT32 = 4;
        const INT32 = 5;
        const FLOAT32 = 6;
        const BOOL = 7;
        const STRING = 8;
        const ARRAY = 9;
        const UINT64 = 10;
        const INT64 = 11;
        const FLOAT64 = 12;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
