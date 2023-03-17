#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * The NeXT/Sun audio file format.
 * 
 * Sample files:
 * 
 * * <https://github.com/python/cpython/tree/b8a7daf077da/Lib/test/sndhdrdata>
 * * <ftp://ftp-ccrma.stanford.edu/pub/Lisp/sf.tar.gz>
 * * <https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/Samples.html>
 * \sa https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/AU.html Source
 * \sa http://soundfile.sapp.org/doc/NextFormat/ Source
 * \sa http://soundfile.sapp.org/doc/NextFormat/soundstruct.h Source
 * \sa https://github.com/andreiw/polaris/blob/deb47cb/usr/src/head/audio/au.h#L87-L112 Source
 * \sa https://github.com/libsndfile/libsndfile/blob/86c9f9eb/src/au.c#L39-L74 Source
 * \sa https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L34-L49 Source
 * \sa https://github.com/mpruett/audiofile/blob/b62c902/libaudiofile/NeXT.cpp#L65-L96 Source
 */

class au_t : public kaitai::kstruct {

public:
    class header_t;

    enum encodings_t {
        ENCODINGS_MULAW_8 = 1,
        ENCODINGS_LINEAR_8 = 2,
        ENCODINGS_LINEAR_16 = 3,
        ENCODINGS_LINEAR_24 = 4,
        ENCODINGS_LINEAR_32 = 5,
        ENCODINGS_FLOAT = 6,
        ENCODINGS_DOUBLE = 7,
        ENCODINGS_FRAGMENTED = 8,
        ENCODINGS_NESTED = 9,
        ENCODINGS_DSP_CORE = 10,
        ENCODINGS_FIXED_POINT_8 = 11,
        ENCODINGS_FIXED_POINT_16 = 12,
        ENCODINGS_FIXED_POINT_24 = 13,
        ENCODINGS_FIXED_POINT_32 = 14,
        ENCODINGS_DISPLAY = 16,
        ENCODINGS_MULAW_SQUELCH = 17,
        ENCODINGS_EMPHASIZED = 18,
        ENCODINGS_COMPRESSED = 19,
        ENCODINGS_COMPRESSED_EMPHASIZED = 20,
        ENCODINGS_DSP_COMMANDS = 21,
        ENCODINGS_DSP_COMMANDS_SAMPLES = 22,
        ENCODINGS_ADPCM_G721 = 23,
        ENCODINGS_ADPCM_G722 = 24,
        ENCODINGS_ADPCM_G723_3 = 25,
        ENCODINGS_ADPCM_G723_5 = 26,
        ENCODINGS_ALAW_8 = 27,
        ENCODINGS_AES = 28,
        ENCODINGS_DELTA_MULAW_8 = 29
    };

    au_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, au_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~au_t();

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, au_t* p__parent = nullptr, au_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

    private:
        uint32_t m_data_size;
        encodings_t m_encoding;
        uint32_t m_sample_rate;
        uint32_t m_num_channels;
        std::string m_comment;
        au_t* m__root;
        au_t* m__parent;

    public:

        /**
         * don't read this field, access `_root.len_data` instead
         * 
         * value `0xffff_ffff` means unspecified size
         */
        uint32_t data_size() const { return m_data_size; }
        encodings_t encoding() const { return m_encoding; }
        uint32_t sample_rate() const { return m_sample_rate; }

        /**
         * number of interleaved channels
         */
        uint32_t num_channels() const { return m_num_channels; }

        /**
         * Most resources claim that this field must be at least 4 bytes long.
         * However, most programs don't enforce it, and [Audacity](
         * https://www.audacityteam.org/) even generates .au files with this field
         * being 0-byte long. According to <https://nixdoc.net/man-pages/IRIX/man4/dmedia/next.4.html>,
         * "NeXT files require that this chunk be at least 4 bytes (chars) long,
         * whereas this chunk may be zerolength in a Sun .au file."
         * 
         * By convention, size should be a multiple of 4 -
         * see <https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L132-L133>.
         * Page <http://soundfile.sapp.org/doc/NextFormat/> also mentions that for some
         * sound playing programs, this field must have an even byte size. So a multiple
         * of 4 is probably best for compatibility.
         * 
         * Must be null-terminated. It is usually an ASCII text string, but this space
         * might be also used to store application-specific binary (i.e. non-ASCII) data.
         */
        std::string comment() const { return m_comment; }
        au_t* _root() const { return m__root; }
        au_t* _parent() const { return m__parent; }
    };

private:
    bool f_len_data;
    int32_t m_len_data;

public:
    int32_t len_data();

private:
    std::string m_magic;
    uint32_t m_ofs_data;
    std::unique_ptr<header_t> m_header;
    au_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_header;
    std::unique_ptr<kaitai::kstream> m__io__raw_header;

public:
    std::string magic() const { return m_magic; }
    uint32_t ofs_data() const { return m_ofs_data; }
    header_t* header() const { return m_header.get(); }
    au_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_header() const { return m__raw_header; }
    kaitai::kstream* _io__raw_header() const { return m__io__raw_header.get(); }
};
