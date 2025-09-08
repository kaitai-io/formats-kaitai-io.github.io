# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use BytesWithIo;
use Encode;

########################################################################
package PcfFont;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TYPES_PROPERTIES = 1;
our $TYPES_ACCELERATORS = 2;
our $TYPES_METRICS = 4;
our $TYPES_BITMAPS = 8;
our $TYPES_INK_METRICS = 16;
our $TYPES_BDF_ENCODINGS = 32;
our $TYPES_SWIDTHS = 64;
our $TYPES_GLYPH_NAMES = 128;
our $TYPES_BDF_ACCELERATORS = 256;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{num_tables} = $self->{_io}->read_u4le();
    $self->{tables} = [];
    my $n_tables = $self->num_tables();
    for (my $i = 0; $i < $n_tables; $i++) {
        push @{$self->{tables}}, PcfFont::Table->new($self->{_io}, $self, $self->{_root});
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub num_tables {
    my ($self) = @_;
    return $self->{num_tables};
}

sub tables {
    my ($self) = @_;
    return $self->{tables};
}

########################################################################
package PcfFont::Format;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{padding1} = $self->{_io}->read_bits_int_be(2);
    $self->{scan_unit_mask} = $self->{_io}->read_bits_int_be(2);
    $self->{is_most_significant_bit_first} = $self->{_io}->read_bits_int_be(1);
    $self->{is_big_endian} = $self->{_io}->read_bits_int_be(1);
    $self->{glyph_pad_mask} = $self->{_io}->read_bits_int_be(2);
    $self->{_io}->align_to_byte();
    $self->{format} = $self->{_io}->read_u1();
    $self->{padding} = $self->{_io}->read_u2le();
}

sub padding1 {
    my ($self) = @_;
    return $self->{padding1};
}

sub scan_unit_mask {
    my ($self) = @_;
    return $self->{scan_unit_mask};
}

sub is_most_significant_bit_first {
    my ($self) = @_;
    return $self->{is_most_significant_bit_first};
}

sub is_big_endian {
    my ($self) = @_;
    return $self->{is_big_endian};
}

sub glyph_pad_mask {
    my ($self) = @_;
    return $self->{glyph_pad_mask};
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

########################################################################
package PcfFont::Table;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{type} = $self->{_io}->read_u4le();
    $self->{format} = PcfFont::Format->new($self->{_io}, $self, $self->{_root});
    $self->{len_body} = $self->{_io}->read_u4le();
    $self->{ofs_body} = $self->{_io}->read_u4le();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_body());
    my $_on = $self->type();
    if ($_on == $PcfFont::TYPES_BDF_ENCODINGS) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = PcfFont::Table::BdfEncodings->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $PcfFont::TYPES_BITMAPS) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = PcfFont::Table::Bitmaps->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $PcfFont::TYPES_GLYPH_NAMES) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = PcfFont::Table::GlyphNames->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $PcfFont::TYPES_PROPERTIES) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = PcfFont::Table::Properties->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $PcfFont::TYPES_SWIDTHS) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = PcfFont::Table::Swidths->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->len_body());
    }
    $self->{_io}->seek($_pos);
    return $self->{body};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
}

sub ofs_body {
    my ($self) = @_;
    return $self->{ofs_body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package PcfFont::Table::BdfEncodings;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{format} = PcfFont::Format->new($self->{_io}, $self, $self->{_root});
    $self->{min_char_or_byte2} = $self->{_io}->read_u2le();
    $self->{max_char_or_byte2} = $self->{_io}->read_u2le();
    $self->{min_byte1} = $self->{_io}->read_u2le();
    $self->{max_byte1} = $self->{_io}->read_u2le();
    $self->{default_char} = $self->{_io}->read_u2le();
    $self->{glyph_indexes} = [];
    my $n_glyph_indexes = (($self->max_char_or_byte2() - $self->min_char_or_byte2()) + 1) * (($self->max_byte1() - $self->min_byte1()) + 1);
    for (my $i = 0; $i < $n_glyph_indexes; $i++) {
        push @{$self->{glyph_indexes}}, $self->{_io}->read_u2le();
    }
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub min_char_or_byte2 {
    my ($self) = @_;
    return $self->{min_char_or_byte2};
}

sub max_char_or_byte2 {
    my ($self) = @_;
    return $self->{max_char_or_byte2};
}

sub min_byte1 {
    my ($self) = @_;
    return $self->{min_byte1};
}

sub max_byte1 {
    my ($self) = @_;
    return $self->{max_byte1};
}

sub default_char {
    my ($self) = @_;
    return $self->{default_char};
}

sub glyph_indexes {
    my ($self) = @_;
    return $self->{glyph_indexes};
}

########################################################################
package PcfFont::Table::Bitmaps;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{format} = PcfFont::Format->new($self->{_io}, $self, $self->{_root});
    $self->{num_glyphs} = $self->{_io}->read_u4le();
    $self->{offsets} = [];
    my $n_offsets = $self->num_glyphs();
    for (my $i = 0; $i < $n_offsets; $i++) {
        push @{$self->{offsets}}, $self->{_io}->read_u4le();
    }
    $self->{bitmap_sizes} = [];
    my $n_bitmap_sizes = 4;
    for (my $i = 0; $i < $n_bitmap_sizes; $i++) {
        push @{$self->{bitmap_sizes}}, $self->{_io}->read_u4le();
    }
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub num_glyphs {
    my ($self) = @_;
    return $self->{num_glyphs};
}

sub offsets {
    my ($self) = @_;
    return $self->{offsets};
}

sub bitmap_sizes {
    my ($self) = @_;
    return $self->{bitmap_sizes};
}

########################################################################
package PcfFont::Table::GlyphNames;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{format} = PcfFont::Format->new($self->{_io}, $self, $self->{_root});
    $self->{num_glyphs} = $self->{_io}->read_u4le();
    $self->{names} = [];
    my $n_names = $self->num_glyphs();
    for (my $i = 0; $i < $n_names; $i++) {
        push @{$self->{names}}, PcfFont::Table::GlyphNames::StringRef->new($self->{_io}, $self, $self->{_root});
    }
    $self->{len_strings} = $self->{_io}->read_u4le();
    $self->{_raw_strings} = $self->{_io}->read_bytes($self->len_strings());
    my $io__raw_strings = IO::KaitaiStruct::Stream->new($self->{_raw_strings});
    $self->{strings} = BytesWithIo->new($io__raw_strings);
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub num_glyphs {
    my ($self) = @_;
    return $self->{num_glyphs};
}

sub names {
    my ($self) = @_;
    return $self->{names};
}

sub len_strings {
    my ($self) = @_;
    return $self->{len_strings};
}

sub strings {
    my ($self) = @_;
    return $self->{strings};
}

sub _raw_strings {
    my ($self) = @_;
    return $self->{_raw_strings};
}

########################################################################
package PcfFont::Table::GlyphNames::StringRef;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{ofs_string} = $self->{_io}->read_u4le();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    my $io = $self->_parent()->strings()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_string());
    $self->{value} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
    $io->seek($_pos);
    return $self->{value};
}

sub ofs_string {
    my ($self) = @_;
    return $self->{ofs_string};
}

########################################################################
package PcfFont::Table::Properties;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{format} = PcfFont::Format->new($self->{_io}, $self, $self->{_root});
    $self->{num_props} = $self->{_io}->read_u4le();
    $self->{props} = [];
    my $n_props = $self->num_props();
    for (my $i = 0; $i < $n_props; $i++) {
        push @{$self->{props}}, PcfFont::Table::Properties::Prop->new($self->{_io}, $self, $self->{_root});
    }
    $self->{padding} = $self->{_io}->read_bytes((($self->num_props() & 3) == 0 ? 0 : 4 - ($self->num_props() & 3)));
    $self->{len_strings} = $self->{_io}->read_u4le();
    $self->{_raw_strings} = $self->{_io}->read_bytes($self->len_strings());
    my $io__raw_strings = IO::KaitaiStruct::Stream->new($self->{_raw_strings});
    $self->{strings} = BytesWithIo->new($io__raw_strings);
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub num_props {
    my ($self) = @_;
    return $self->{num_props};
}

sub props {
    my ($self) = @_;
    return $self->{props};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub len_strings {
    my ($self) = @_;
    return $self->{len_strings};
}

sub strings {
    my ($self) = @_;
    return $self->{strings};
}

sub _raw_strings {
    my ($self) = @_;
    return $self->{_raw_strings};
}

########################################################################
package PcfFont::Table::Properties::Prop;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{ofs_name} = $self->{_io}->read_u4le();
    $self->{is_string} = $self->{_io}->read_u1();
    $self->{value_or_ofs_value} = $self->{_io}->read_u4le();
}

sub int_value {
    my ($self) = @_;
    return $self->{int_value} if ($self->{int_value});
    if ($self->is_string() == 0) {
        $self->{int_value} = $self->value_or_ofs_value();
    }
    return $self->{int_value};
}

sub name {
    my ($self) = @_;
    return $self->{name} if ($self->{name});
    my $io = $self->_parent()->strings()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_name());
    $self->{name} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
    $io->seek($_pos);
    return $self->{name};
}

sub str_value {
    my ($self) = @_;
    return $self->{str_value} if ($self->{str_value});
    if ($self->is_string() != 0) {
        my $io = $self->_parent()->strings()->_io();
        my $_pos = $io->pos();
        $io->seek($self->value_or_ofs_value());
        $self->{str_value} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
        $io->seek($_pos);
    }
    return $self->{str_value};
}

sub ofs_name {
    my ($self) = @_;
    return $self->{ofs_name};
}

sub is_string {
    my ($self) = @_;
    return $self->{is_string};
}

sub value_or_ofs_value {
    my ($self) = @_;
    return $self->{value_or_ofs_value};
}

########################################################################
package PcfFont::Table::Swidths;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{format} = PcfFont::Format->new($self->{_io}, $self, $self->{_root});
    $self->{num_glyphs} = $self->{_io}->read_u4le();
    $self->{swidths} = [];
    my $n_swidths = $self->num_glyphs();
    for (my $i = 0; $i < $n_swidths; $i++) {
        push @{$self->{swidths}}, $self->{_io}->read_u4le();
    }
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub num_glyphs {
    my ($self) = @_;
    return $self->{num_glyphs};
}

sub swidths {
    my ($self) = @_;
    return $self->{swidths};
}

1;
