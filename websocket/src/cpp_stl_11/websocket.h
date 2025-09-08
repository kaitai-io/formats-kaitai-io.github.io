#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class websocket_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * The WebSocket protocol establishes a two-way communication channel via TCP.
 * Messages are made up of one or more dataframes, and are delineated by
 * frames with the `fin` bit set.
 */

class websocket_t : public kaitai::kstruct {

public:
    class dataframe_t;
    class frame_header_t;
    class initial_frame_t;

    enum opcode_t {
        OPCODE_CONTINUATION = 0,
        OPCODE_TEXT = 1,
        OPCODE_BINARY = 2,
        OPCODE_RESERVED_3 = 3,
        OPCODE_RESERVED_4 = 4,
        OPCODE_RESERVED_5 = 5,
        OPCODE_RESERVED_6 = 6,
        OPCODE_RESERVED_7 = 7,
        OPCODE_CLOSE = 8,
        OPCODE_PING = 9,
        OPCODE_PONG = 10,
        OPCODE_RESERVED_CONTROL_B = 11,
        OPCODE_RESERVED_CONTROL_C = 12,
        OPCODE_RESERVED_CONTROL_D = 13,
        OPCODE_RESERVED_CONTROL_E = 14,
        OPCODE_RESERVED_CONTROL_F = 15
    };
    static bool _is_defined_opcode_t(opcode_t v);

private:
    static const std::set<opcode_t> _values_opcode_t;

public:

    websocket_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, websocket_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~websocket_t();

    class dataframe_t : public kaitai::kstruct {

    public:

        dataframe_t(kaitai::kstream* p__io, websocket_t* p__parent = nullptr, websocket_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~dataframe_t();

    private:
        std::unique_ptr<frame_header_t> m_header;
        std::string m_payload_bytes;
        bool n_payload_bytes;

    public:
        bool _is_null_payload_bytes() { payload_bytes(); return n_payload_bytes; };

    private:
        std::string m_payload_text;
        bool n_payload_text;

    public:
        bool _is_null_payload_text() { payload_text(); return n_payload_text; };

    private:
        websocket_t* m__root;
        websocket_t* m__parent;

    public:
        frame_header_t* header() const { return m_header.get(); }
        std::string payload_bytes() const { return m_payload_bytes; }
        std::string payload_text() const { return m_payload_text; }
        websocket_t* _root() const { return m__root; }
        websocket_t* _parent() const { return m__parent; }
    };

    class frame_header_t : public kaitai::kstruct {

    public:

        frame_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, websocket_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~frame_header_t();

    private:
        bool f_len_payload;
        int32_t m_len_payload;

    public:
        int32_t len_payload();

    private:
        bool m_finished;
        uint64_t m_reserved;
        opcode_t m_opcode;
        bool m_is_masked;
        uint64_t m_len_payload_primary;
        uint16_t m_len_payload_extended_1;
        bool n_len_payload_extended_1;

    public:
        bool _is_null_len_payload_extended_1() { len_payload_extended_1(); return n_len_payload_extended_1; };

    private:
        uint32_t m_len_payload_extended_2;
        bool n_len_payload_extended_2;

    public:
        bool _is_null_len_payload_extended_2() { len_payload_extended_2(); return n_len_payload_extended_2; };

    private:
        uint32_t m_mask_key;
        bool n_mask_key;

    public:
        bool _is_null_mask_key() { mask_key(); return n_mask_key; };

    private:
        websocket_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        bool finished() const { return m_finished; }
        uint64_t reserved() const { return m_reserved; }
        opcode_t opcode() const { return m_opcode; }
        bool is_masked() const { return m_is_masked; }
        uint64_t len_payload_primary() const { return m_len_payload_primary; }
        uint16_t len_payload_extended_1() const { return m_len_payload_extended_1; }
        uint32_t len_payload_extended_2() const { return m_len_payload_extended_2; }
        uint32_t mask_key() const { return m_mask_key; }
        websocket_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class initial_frame_t : public kaitai::kstruct {

    public:

        initial_frame_t(kaitai::kstream* p__io, websocket_t* p__parent = nullptr, websocket_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~initial_frame_t();

    private:
        std::unique_ptr<frame_header_t> m_header;
        std::string m_payload_bytes;
        bool n_payload_bytes;

    public:
        bool _is_null_payload_bytes() { payload_bytes(); return n_payload_bytes; };

    private:
        std::string m_payload_text;
        bool n_payload_text;

    public:
        bool _is_null_payload_text() { payload_text(); return n_payload_text; };

    private:
        websocket_t* m__root;
        websocket_t* m__parent;

    public:
        frame_header_t* header() const { return m_header.get(); }
        std::string payload_bytes() const { return m_payload_bytes; }
        std::string payload_text() const { return m_payload_text; }
        websocket_t* _root() const { return m__root; }
        websocket_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<initial_frame_t> m_initial_frame;
    std::unique_ptr<std::vector<std::unique_ptr<dataframe_t>>> m_trailing_frames;
    bool n_trailing_frames;

public:
    bool _is_null_trailing_frames() { trailing_frames(); return n_trailing_frames; };

private:
    websocket_t* m__root;
    kaitai::kstruct* m__parent;

public:
    initial_frame_t* initial_frame() const { return m_initial_frame.get(); }
    std::vector<std::unique_ptr<dataframe_t>>* trailing_frames() const { return m_trailing_frames.get(); }
    websocket_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
