#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class vp8_duck_ivf_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * Duck IVF is a simple container format for raw VP8 data, which is an open and
 * royalty-free video compression format, currently developed by Google.
 * 
 * Test .ivf files are available at
 * <https://chromium.googlesource.com/webm/vp8-test-vectors>
 * \sa https://wiki.multimedia.cx/index.php/Duck_IVF Source
 */

class vp8_duck_ivf_t : public kaitai::kstruct {

public:
    class block_t;
    class blocks_t;

    vp8_duck_ivf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, vp8_duck_ivf_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~vp8_duck_ivf_t();

    class block_t : public kaitai::kstruct {

    public:

        block_t(kaitai::kstream* p__io, vp8_duck_ivf_t::blocks_t* p__parent = nullptr, vp8_duck_ivf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_t();

    private:
        uint32_t m_len_frame;
        uint64_t m_timestamp;
        std::string m_framedata;
        vp8_duck_ivf_t* m__root;
        vp8_duck_ivf_t::blocks_t* m__parent;

    public:

        /**
         * size of the frame data
         */
        uint32_t len_frame() const { return m_len_frame; }
        uint64_t timestamp() const { return m_timestamp; }
        std::string framedata() const { return m_framedata; }
        vp8_duck_ivf_t* _root() const { return m__root; }
        vp8_duck_ivf_t::blocks_t* _parent() const { return m__parent; }
    };

    class blocks_t : public kaitai::kstruct {

    public:

        blocks_t(kaitai::kstream* p__io, vp8_duck_ivf_t* p__parent = nullptr, vp8_duck_ivf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~blocks_t();

    private:
        std::unique_ptr<block_t> m_entries;
        vp8_duck_ivf_t* m__root;
        vp8_duck_ivf_t* m__parent;

    public:
        block_t* entries() const { return m_entries.get(); }
        vp8_duck_ivf_t* _root() const { return m__root; }
        vp8_duck_ivf_t* _parent() const { return m__parent; }
    };

private:
    std::string m_magic1;
    uint16_t m_version;
    uint16_t m_len_header;
    std::string m_codec;
    uint16_t m_width;
    uint16_t m_height;
    uint32_t m_framerate;
    uint32_t m_timescale;
    uint32_t m_num_frames;
    uint32_t m_unused;
    std::unique_ptr<std::vector<std::unique_ptr<blocks_t>>> m_image_data;
    vp8_duck_ivf_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Magic Number of IVF Files
     */
    std::string magic1() const { return m_magic1; }

    /**
     * This should be 0
     */
    uint16_t version() const { return m_version; }

    /**
     * Normally the header length is 32 byte
     */
    uint16_t len_header() const { return m_len_header; }

    /**
     * Name of the codec e.g. 'VP80' for VP8
     */
    std::string codec() const { return m_codec; }

    /**
     * The (initial) width of the video, every keyframe may change the resolution
     */
    uint16_t width() const { return m_width; }

    /**
     * The (initial) height of the video, every keyframe may change the resolution
     */
    uint16_t height() const { return m_height; }

    /**
     * the (framerate * timescale) e.g. for 30 fps -> 30000
     */
    uint32_t framerate() const { return m_framerate; }

    /**
     * the timescale is a divider of the seconds (VPX is integer math only) mostly 1000
     */
    uint32_t timescale() const { return m_timescale; }

    /**
     * the number of frames (if not a camera stream)
     */
    uint32_t num_frames() const { return m_num_frames; }
    uint32_t unused() const { return m_unused; }
    std::vector<std::unique_ptr<blocks_t>>* image_data() const { return m_image_data.get(); }
    vp8_duck_ivf_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
