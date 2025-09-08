#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class vlq_base128_le_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * A variable-length unsigned/signed integer using base128 encoding. 1-byte groups
 * consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
 * "least significant group first", i.e. in "little-endian" manner.
 * 
 * This particular encoding is specified and used in:
 * 
 * * DWARF debug file format, where it's dubbed "unsigned LEB128" or "ULEB128".
 *   <https://dwarfstd.org/doc/dwarf-2.0.0.pdf> - page 139
 * * Google Protocol Buffers, where it's called "Base 128 Varints".
 *   <https://protobuf.dev/programming-guides/encoding/#varints>
 * * Apache Lucene, where it's called "VInt"
 *   <https://lucene.apache.org/core/3_5_0/fileformats.html#VInt>
 * * Apache Avro uses this as a basis for integer encoding, adding ZigZag on
 *   top of it for signed ints
 *   <https://avro.apache.org/docs/1.12.0/specification/#primitive-types-1>
 * 
 * More information on this encoding is available at <https://en.wikipedia.org/wiki/LEB128>
 * 
 * This particular implementation supports integer values up to 64 bits (i.e. the
 * maximum unsigned value supported is `2**64 - 1`), which implies that serialized
 * values can be up to 10 bytes in length.
 * 
 * If the most significant 10th byte (`groups[9]`) is present, its `has_next`
 * must be `false` (otherwise we would have 11 or more bytes, which is not
 * supported) and its `value` can be only `0` or `1` (because a 9-byte VLQ can
 * represent `9 * 7 = 63` bits already, so the 10th byte can only add 1 bit,
 * since only integers up to 64 bits are supported). These restrictions are
 * enforced by this implementation. They were inspired by the Protoscope tool,
 * see <https://github.com/protocolbuffers/protoscope/blob/8e7a6aafa2c9958527b1e0747e66e1bfff045819/writer.go#L644-L648>.
 */

class vlq_base128_le_t : public kaitai::kstruct {

public:
    class group_t;

    vlq_base128_le_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, vlq_base128_le_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~vlq_base128_le_t();

    /**
     * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
     */

    class group_t : public kaitai::kstruct {

    public:

        group_t(int32_t p_idx, uint64_t p_prev_interm_value, uint64_t p_multiplier, kaitai::kstream* p__io, vlq_base128_le_t* p__parent = nullptr, vlq_base128_le_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~group_t();

    private:
        bool f_interm_value;
        uint64_t m_interm_value;

    public:
        uint64_t interm_value();

    private:
        bool m_has_next;
        uint64_t m_value;
        int32_t m_idx;
        uint64_t m_prev_interm_value;
        uint64_t m_multiplier;
        vlq_base128_le_t* m__root;
        vlq_base128_le_t* m__parent;

    public:

        /**
         * If `true`, then we have more bytes to read.
         * 
         * Since this implementation only supports serialized values up to 10
         * bytes, this must be `false` in the 10th group (`groups[9]`).
         */
        bool has_next() const { return m_has_next; }

        /**
         * The 7-bit (base128) numeric value chunk of this group
         * 
         * Since this implementation only supports integer values up to 64 bits,
         * the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
         * (otherwise the width of the represented value would be 65 bits or
         * more, which is not supported).
         */
        uint64_t value() const { return m_value; }
        int32_t idx() const { return m_idx; }
        uint64_t prev_interm_value() const { return m_prev_interm_value; }
        uint64_t multiplier() const { return m_multiplier; }
        vlq_base128_le_t* _root() const { return m__root; }
        vlq_base128_le_t* _parent() const { return m__parent; }
    };

private:
    bool f_len;
    int32_t m_len;

public:
    int32_t len();

private:
    bool f_sign_bit;
    uint64_t m_sign_bit;

public:
    uint64_t sign_bit();

private:
    bool f_value;
    uint64_t m_value;

public:

    /**
     * Resulting unsigned value as normal integer
     */
    uint64_t value();

private:
    bool f_value_signed;
    int64_t m_value_signed;

public:
    int64_t value_signed();

private:
    std::unique_ptr<std::vector<std::unique_ptr<group_t>>> m_groups;
    vlq_base128_le_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<std::unique_ptr<group_t>>* groups() const { return m_groups.get(); }
    vlq_base128_le_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
