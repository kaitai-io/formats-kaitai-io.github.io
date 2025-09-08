#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class ogg_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * Ogg is a popular media container format, which provides basic
 * streaming / buffering mechanisms and is content-agnostic. Most
 * popular codecs that are used within Ogg streams are Vorbis (thus
 * making Ogg/Vorbis streams) and Theora (Ogg/Theora).
 * 
 * Ogg stream is a sequence Ogg pages. They can be read sequentially,
 * or one can jump into arbitrary stream location and scan for "OggS"
 * sync code to find the beginning of a new Ogg page and continue
 * decoding the stream contents from that one.
 */

class ogg_t : public kaitai::kstruct {

public:
    class page_t;

    ogg_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ogg_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~ogg_t();

    /**
     * Ogg page is a basic unit of data in an Ogg bitstream, usually
     * it's around 4-8 KB, with a maximum size of 65307 bytes.
     */

    class page_t : public kaitai::kstruct {

    public:

        page_t(kaitai::kstream* p__io, ogg_t* p__parent = nullptr, ogg_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~page_t();

    private:
        std::string m_sync_code;
        std::string m_version;
        uint64_t m_reserved1;
        bool m_is_end_of_stream;
        bool m_is_beginning_of_stream;
        bool m_is_continuation;
        uint64_t m_granule_pos;
        uint32_t m_bitstream_serial;
        uint32_t m_page_seq_num;
        uint32_t m_crc32;
        uint8_t m_num_segments;
        std::unique_ptr<std::vector<uint8_t>> m_len_segments;
        std::unique_ptr<std::vector<std::string>> m_segments;
        ogg_t* m__root;
        ogg_t* m__parent;

    public:
        std::string sync_code() const { return m_sync_code; }

        /**
         * Version of the Ogg bitstream format. Currently must be 0.
         */
        std::string version() const { return m_version; }
        uint64_t reserved1() const { return m_reserved1; }

        /**
         * EOS (End Of Stream) mark. This page is the last page in the
         * logical bitstream. The EOS flag must be set on the final page of
         * every logical bitstream, and must not be set on any other page.
         */
        bool is_end_of_stream() const { return m_is_end_of_stream; }

        /**
         * BOS (Beginning Of Stream) mark. This page is the first page in
         * the logical bitstream. The BOS flag must be set on the first
         * page of every logical bitstream, and must not be set on any
         * other page.
         */
        bool is_beginning_of_stream() const { return m_is_beginning_of_stream; }

        /**
         * The first packet on this page is a continuation of the previous
         * packet in the logical bitstream.
         */
        bool is_continuation() const { return m_is_continuation; }

        /**
         * "Granule position" is the time marker in Ogg files. It is an
         * abstract value, whose meaning is determined by the codec. It
         * may, for example, be a count of the number of samples, the
         * number of frames or a more complex scheme.
         */
        uint64_t granule_pos() const { return m_granule_pos; }

        /**
         * Serial number that identifies a page as belonging to a
         * particular logical bitstream. Each logical bitstream in a file
         * has a unique value, and this field allows implementations to
         * deliver the pages to the appropriate decoder. In a typical
         * Vorbis and Theora file, one stream is the audio (Vorbis), and
         * the other is the video (Theora).
         */
        uint32_t bitstream_serial() const { return m_bitstream_serial; }

        /**
         * Sequential number of page, guaranteed to be monotonically
         * increasing for each logical bitstream. The first page is 0, the
         * second 1, etc. This allows implementations to detect when data
         * has been lost.
         */
        uint32_t page_seq_num() const { return m_page_seq_num; }

        /**
         * This field provides a CRC32 checksum of the data in the entire
         * page (including the page header, calculated with the checksum
         * field set to 0). This allows verification that the data has not
         * been corrupted since it was created. Pages that fail the
         * checksum should be discarded. The checksum is generated using a
         * polynomial value of 0x04C11DB7.
         */
        uint32_t crc32() const { return m_crc32; }

        /**
         * The number of segments that exist in this page. There can be a
         * maximum of 255 segments in any one page.
         */
        uint8_t num_segments() const { return m_num_segments; }

        /**
         * Table of lengths of segments.
         */
        std::vector<uint8_t>* len_segments() const { return m_len_segments.get(); }

        /**
         * Segment content bytes make up the rest of the Ogg page.
         */
        std::vector<std::string>* segments() const { return m_segments.get(); }
        ogg_t* _root() const { return m__root; }
        ogg_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<std::vector<std::unique_ptr<page_t>>> m_pages;
    ogg_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<std::unique_ptr<page_t>>* pages() const { return m_pages.get(); }
    ogg_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
