# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;
use List::Util;

########################################################################
package Ttf;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{offset_table} = Ttf::OffsetTable->new($self->{_io}, $self, $self->{_root});
    $self->{directory_table} = ();
    my $n_directory_table = $self->offset_table()->num_tables();
    for (my $i = 0; $i < $n_directory_table; $i++) {
        $self->{directory_table}[$i] = Ttf::DirTableEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub offset_table {
    my ($self) = @_;
    return $self->{offset_table};
}

sub directory_table {
    my ($self) = @_;
    return $self->{directory_table};
}

########################################################################
package Ttf::Post;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{format} = Ttf::Fixed->new($self->{_io}, $self, $self->{_root});
    $self->{italic_angle} = Ttf::Fixed->new($self->{_io}, $self, $self->{_root});
    $self->{underline_position} = $self->{_io}->read_s2be();
    $self->{underline_thichness} = $self->{_io}->read_s2be();
    $self->{is_fixed_pitch} = $self->{_io}->read_u4be();
    $self->{min_mem_type42} = $self->{_io}->read_u4be();
    $self->{max_mem_type42} = $self->{_io}->read_u4be();
    $self->{min_mem_type1} = $self->{_io}->read_u4be();
    $self->{max_mem_type1} = $self->{_io}->read_u4be();
    if ( (($self->format()->major() == 2) && ($self->format()->minor() == 0)) ) {
        $self->{format20} = Ttf::Post::Format20->new($self->{_io}, $self, $self->{_root});
    }
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub italic_angle {
    my ($self) = @_;
    return $self->{italic_angle};
}

sub underline_position {
    my ($self) = @_;
    return $self->{underline_position};
}

sub underline_thichness {
    my ($self) = @_;
    return $self->{underline_thichness};
}

sub is_fixed_pitch {
    my ($self) = @_;
    return $self->{is_fixed_pitch};
}

sub min_mem_type42 {
    my ($self) = @_;
    return $self->{min_mem_type42};
}

sub max_mem_type42 {
    my ($self) = @_;
    return $self->{max_mem_type42};
}

sub min_mem_type1 {
    my ($self) = @_;
    return $self->{min_mem_type1};
}

sub max_mem_type1 {
    my ($self) = @_;
    return $self->{max_mem_type1};
}

sub format20 {
    my ($self) = @_;
    return $self->{format20};
}

########################################################################
package Ttf::Post::Format20;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{number_of_glyphs} = $self->{_io}->read_u2be();
    $self->{glyph_name_index} = ();
    my $n_glyph_name_index = $self->number_of_glyphs();
    for (my $i = 0; $i < $n_glyph_name_index; $i++) {
        $self->{glyph_name_index}[$i] = $self->{_io}->read_u2be();
    }
    $self->{glyph_names} = ();
    do {
        $_ = Ttf::Post::Format20::PascalString->new($self->{_io}, $self, $self->{_root});
        push @{$self->{glyph_names}}, $_;
    } until ( (($_->length() == 0) || ($self->_io()->is_eof())) );
}

sub number_of_glyphs {
    my ($self) = @_;
    return $self->{number_of_glyphs};
}

sub glyph_name_index {
    my ($self) = @_;
    return $self->{glyph_name_index};
}

sub glyph_names {
    my ($self) = @_;
    return $self->{glyph_names};
}

########################################################################
package Ttf::Post::Format20::PascalString;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{length} = $self->{_io}->read_u1();
    if ($self->length() != 0) {
        $self->{value} = Encode::decode("ascii", $self->{_io}->read_bytes($self->length()));
    }
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Ttf::Name;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PLATFORMS_UNICODE = 0;
our $PLATFORMS_MACINTOSH = 1;
our $PLATFORMS_RESERVED_2 = 2;
our $PLATFORMS_MICROSOFT = 3;

our $NAMES_COPYRIGHT = 0;
our $NAMES_FONT_FAMILY = 1;
our $NAMES_FONT_SUBFAMILY = 2;
our $NAMES_UNIQUE_SUBFAMILY_ID = 3;
our $NAMES_FULL_FONT_NAME = 4;
our $NAMES_NAME_TABLE_VERSION = 5;
our $NAMES_POSTSCRIPT_FONT_NAME = 6;
our $NAMES_TRADEMARK = 7;
our $NAMES_MANUFACTURER = 8;
our $NAMES_DESIGNER = 9;
our $NAMES_DESCRIPTION = 10;
our $NAMES_URL_VENDOR = 11;
our $NAMES_URL_DESIGNER = 12;
our $NAMES_LICENSE = 13;
our $NAMES_URL_LICENSE = 14;
our $NAMES_RESERVED_15 = 15;
our $NAMES_PREFERRED_FAMILY = 16;
our $NAMES_PREFERRED_SUBFAMILY = 17;
our $NAMES_COMPATIBLE_FULL_NAME = 18;
our $NAMES_SAMPLE_TEXT = 19;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{format_selector} = $self->{_io}->read_u2be();
    $self->{num_name_records} = $self->{_io}->read_u2be();
    $self->{ofs_strings} = $self->{_io}->read_u2be();
    $self->{name_records} = ();
    my $n_name_records = $self->num_name_records();
    for (my $i = 0; $i < $n_name_records; $i++) {
        $self->{name_records}[$i] = Ttf::Name::NameRecord->new($self->{_io}, $self, $self->{_root});
    }
}

sub format_selector {
    my ($self) = @_;
    return $self->{format_selector};
}

sub num_name_records {
    my ($self) = @_;
    return $self->{num_name_records};
}

sub ofs_strings {
    my ($self) = @_;
    return $self->{ofs_strings};
}

sub name_records {
    my ($self) = @_;
    return $self->{name_records};
}

########################################################################
package Ttf::Name::NameRecord;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{platform_id} = $self->{_io}->read_u2be();
    $self->{encoding_id} = $self->{_io}->read_u2be();
    $self->{language_id} = $self->{_io}->read_u2be();
    $self->{name_id} = $self->{_io}->read_u2be();
    $self->{len_str} = $self->{_io}->read_u2be();
    $self->{ofs_str} = $self->{_io}->read_u2be();
}

sub ascii_value {
    my ($self) = @_;
    return $self->{ascii_value} if ($self->{ascii_value});
    my $io = $self->_parent()->_io();
    my $_pos = $io->pos();
    $io->seek(($self->_parent()->ofs_strings() + $self->ofs_str()));
    $self->{ascii_value} = Encode::decode("ascii", $io->read_bytes($self->len_str()));
    $io->seek($_pos);
    return $self->{ascii_value};
}

sub unicode_value {
    my ($self) = @_;
    return $self->{unicode_value} if ($self->{unicode_value});
    my $io = $self->_parent()->_io();
    my $_pos = $io->pos();
    $io->seek(($self->_parent()->ofs_strings() + $self->ofs_str()));
    $self->{unicode_value} = Encode::decode("utf-16be", $io->read_bytes($self->len_str()));
    $io->seek($_pos);
    return $self->{unicode_value};
}

sub platform_id {
    my ($self) = @_;
    return $self->{platform_id};
}

sub encoding_id {
    my ($self) = @_;
    return $self->{encoding_id};
}

sub language_id {
    my ($self) = @_;
    return $self->{language_id};
}

sub name_id {
    my ($self) = @_;
    return $self->{name_id};
}

sub len_str {
    my ($self) = @_;
    return $self->{len_str};
}

sub ofs_str {
    my ($self) = @_;
    return $self->{ofs_str};
}

########################################################################
package Ttf::Head;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $FLAGS_BASELINE_AT_Y0 = 1;
our $FLAGS_LEFT_SIDEBEARING_AT_X0 = 2;
our $FLAGS_FLAG_DEPEND_ON_POINT_SIZE = 4;
our $FLAGS_FLAG_FORCE_PPEM = 8;
our $FLAGS_FLAG_MAY_ADVANCE_WIDTH = 16;

our $FONT_DIRECTION_HINT_FULLY_MIXED_DIRECTIONAL_GLYPHS = 0;
our $FONT_DIRECTION_HINT_ONLY_STRONGLY_LEFT_TO_RIGHT = 1;
our $FONT_DIRECTION_HINT_STRONGLY_LEFT_TO_RIGHT_AND_NEUTRALS = 2;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{version} = Ttf::Fixed->new($self->{_io}, $self, $self->{_root});
    $self->{font_revision} = Ttf::Fixed->new($self->{_io}, $self, $self->{_root});
    $self->{checksum_adjustment} = $self->{_io}->read_u4be();
    $self->{magic_number} = $self->{_io}->read_bytes(4);
    $self->{flags} = $self->{_io}->read_u2be();
    $self->{units_per_em} = $self->{_io}->read_u2be();
    $self->{created} = $self->{_io}->read_u8be();
    $self->{modified} = $self->{_io}->read_u8be();
    $self->{x_min} = $self->{_io}->read_s2be();
    $self->{y_min} = $self->{_io}->read_s2be();
    $self->{x_max} = $self->{_io}->read_s2be();
    $self->{y_max} = $self->{_io}->read_s2be();
    $self->{mac_style} = $self->{_io}->read_u2be();
    $self->{lowest_rec_ppem} = $self->{_io}->read_u2be();
    $self->{font_direction_hint} = $self->{_io}->read_s2be();
    $self->{index_to_loc_format} = $self->{_io}->read_s2be();
    $self->{glyph_data_format} = $self->{_io}->read_s2be();
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub font_revision {
    my ($self) = @_;
    return $self->{font_revision};
}

sub checksum_adjustment {
    my ($self) = @_;
    return $self->{checksum_adjustment};
}

sub magic_number {
    my ($self) = @_;
    return $self->{magic_number};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub units_per_em {
    my ($self) = @_;
    return $self->{units_per_em};
}

sub created {
    my ($self) = @_;
    return $self->{created};
}

sub modified {
    my ($self) = @_;
    return $self->{modified};
}

sub x_min {
    my ($self) = @_;
    return $self->{x_min};
}

sub y_min {
    my ($self) = @_;
    return $self->{y_min};
}

sub x_max {
    my ($self) = @_;
    return $self->{x_max};
}

sub y_max {
    my ($self) = @_;
    return $self->{y_max};
}

sub mac_style {
    my ($self) = @_;
    return $self->{mac_style};
}

sub lowest_rec_ppem {
    my ($self) = @_;
    return $self->{lowest_rec_ppem};
}

sub font_direction_hint {
    my ($self) = @_;
    return $self->{font_direction_hint};
}

sub index_to_loc_format {
    my ($self) = @_;
    return $self->{index_to_loc_format};
}

sub glyph_data_format {
    my ($self) = @_;
    return $self->{glyph_data_format};
}

########################################################################
package Ttf::Prep;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{instructions} = $self->{_io}->read_bytes_full();
}

sub instructions {
    my ($self) = @_;
    return $self->{instructions};
}

########################################################################
package Ttf::Hhea;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{version} = Ttf::Fixed->new($self->{_io}, $self, $self->{_root});
    $self->{ascender} = $self->{_io}->read_s2be();
    $self->{descender} = $self->{_io}->read_s2be();
    $self->{line_gap} = $self->{_io}->read_s2be();
    $self->{advance_width_max} = $self->{_io}->read_u2be();
    $self->{min_left_side_bearing} = $self->{_io}->read_s2be();
    $self->{min_right_side_bearing} = $self->{_io}->read_s2be();
    $self->{x_max_extend} = $self->{_io}->read_s2be();
    $self->{caret_slope_rise} = $self->{_io}->read_s2be();
    $self->{caret_slope_run} = $self->{_io}->read_s2be();
    $self->{reserved} = $self->{_io}->read_bytes(10);
    $self->{metric_data_format} = $self->{_io}->read_s2be();
    $self->{number_of_hmetrics} = $self->{_io}->read_u2be();
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub ascender {
    my ($self) = @_;
    return $self->{ascender};
}

sub descender {
    my ($self) = @_;
    return $self->{descender};
}

sub line_gap {
    my ($self) = @_;
    return $self->{line_gap};
}

sub advance_width_max {
    my ($self) = @_;
    return $self->{advance_width_max};
}

sub min_left_side_bearing {
    my ($self) = @_;
    return $self->{min_left_side_bearing};
}

sub min_right_side_bearing {
    my ($self) = @_;
    return $self->{min_right_side_bearing};
}

sub x_max_extend {
    my ($self) = @_;
    return $self->{x_max_extend};
}

sub caret_slope_rise {
    my ($self) = @_;
    return $self->{caret_slope_rise};
}

sub caret_slope_run {
    my ($self) = @_;
    return $self->{caret_slope_run};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub metric_data_format {
    my ($self) = @_;
    return $self->{metric_data_format};
}

sub number_of_hmetrics {
    my ($self) = @_;
    return $self->{number_of_hmetrics};
}

########################################################################
package Ttf::Fpgm;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{instructions} = $self->{_io}->read_bytes_full();
}

sub instructions {
    my ($self) = @_;
    return $self->{instructions};
}

########################################################################
package Ttf::Kern;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{version} = $self->{_io}->read_u2be();
    $self->{subtable_count} = $self->{_io}->read_u2be();
    $self->{subtables} = ();
    my $n_subtables = $self->subtable_count();
    for (my $i = 0; $i < $n_subtables; $i++) {
        $self->{subtables}[$i] = Ttf::Kern::Subtable->new($self->{_io}, $self, $self->{_root});
    }
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub subtable_count {
    my ($self) = @_;
    return $self->{subtable_count};
}

sub subtables {
    my ($self) = @_;
    return $self->{subtables};
}

########################################################################
package Ttf::Kern::Subtable;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{version} = $self->{_io}->read_u2be();
    $self->{length} = $self->{_io}->read_u2be();
    $self->{format} = $self->{_io}->read_u1();
    $self->{reserved} = $self->{_io}->read_bits_int_be(4);
    $self->{is_override} = $self->{_io}->read_bits_int_be(1);
    $self->{is_cross_stream} = $self->{_io}->read_bits_int_be(1);
    $self->{is_minimum} = $self->{_io}->read_bits_int_be(1);
    $self->{is_horizontal} = $self->{_io}->read_bits_int_be(1);
    $self->{_io}->align_to_byte();
    if ($self->format() == 0) {
        $self->{format0} = Ttf::Kern::Subtable::Format0->new($self->{_io}, $self, $self->{_root});
    }
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub is_override {
    my ($self) = @_;
    return $self->{is_override};
}

sub is_cross_stream {
    my ($self) = @_;
    return $self->{is_cross_stream};
}

sub is_minimum {
    my ($self) = @_;
    return $self->{is_minimum};
}

sub is_horizontal {
    my ($self) = @_;
    return $self->{is_horizontal};
}

sub format0 {
    my ($self) = @_;
    return $self->{format0};
}

########################################################################
package Ttf::Kern::Subtable::Format0;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{pair_count} = $self->{_io}->read_u2be();
    $self->{search_range} = $self->{_io}->read_u2be();
    $self->{entry_selector} = $self->{_io}->read_u2be();
    $self->{range_shift} = $self->{_io}->read_u2be();
    $self->{kerning_pairs} = ();
    my $n_kerning_pairs = $self->pair_count();
    for (my $i = 0; $i < $n_kerning_pairs; $i++) {
        $self->{kerning_pairs}[$i] = Ttf::Kern::Subtable::Format0::KerningPair->new($self->{_io}, $self, $self->{_root});
    }
}

sub pair_count {
    my ($self) = @_;
    return $self->{pair_count};
}

sub search_range {
    my ($self) = @_;
    return $self->{search_range};
}

sub entry_selector {
    my ($self) = @_;
    return $self->{entry_selector};
}

sub range_shift {
    my ($self) = @_;
    return $self->{range_shift};
}

sub kerning_pairs {
    my ($self) = @_;
    return $self->{kerning_pairs};
}

########################################################################
package Ttf::Kern::Subtable::Format0::KerningPair;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{left} = $self->{_io}->read_u2be();
    $self->{right} = $self->{_io}->read_u2be();
    $self->{value} = $self->{_io}->read_s2be();
}

sub left {
    my ($self) = @_;
    return $self->{left};
}

sub right {
    my ($self) = @_;
    return $self->{right};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Ttf::DirTableEntry;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{tag} = Encode::decode("ascii", $self->{_io}->read_bytes(4));
    $self->{checksum} = $self->{_io}->read_u4be();
    $self->{offset} = $self->{_io}->read_u4be();
    $self->{length} = $self->{_io}->read_u4be();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->offset());
    my $_on = $self->tag();
    if ($_on eq "head") {
        $self->{_raw_value} = $io->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Head->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on eq "cvt ") {
        $self->{_raw_value} = $io->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Cvt->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on eq "prep") {
        $self->{_raw_value} = $io->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Prep->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on eq "kern") {
        $self->{_raw_value} = $io->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Kern->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on eq "hhea") {
        $self->{_raw_value} = $io->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Hhea->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on eq "post") {
        $self->{_raw_value} = $io->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Post->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on eq "OS/2") {
        $self->{_raw_value} = $io->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Os2->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on eq "name") {
        $self->{_raw_value} = $io->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Name->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on eq "maxp") {
        $self->{_raw_value} = $io->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Maxp->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on eq "glyf") {
        $self->{_raw_value} = $io->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Glyf->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on eq "fpgm") {
        $self->{_raw_value} = $io->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Fpgm->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on eq "cmap") {
        $self->{_raw_value} = $io->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Cmap->new($io__raw_value, $self, $self->{_root});
    }
    else {
        $self->{value} = $io->read_bytes($self->length());
    }
    $io->seek($_pos);
    return $self->{value};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub _raw_value {
    my ($self) = @_;
    return $self->{_raw_value};
}

########################################################################
package Ttf::Os2;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $WEIGHT_CLASS_THIN = 100;
our $WEIGHT_CLASS_EXTRA_LIGHT = 200;
our $WEIGHT_CLASS_LIGHT = 300;
our $WEIGHT_CLASS_NORMAL = 400;
our $WEIGHT_CLASS_MEDIUM = 500;
our $WEIGHT_CLASS_SEMI_BOLD = 600;
our $WEIGHT_CLASS_BOLD = 700;
our $WEIGHT_CLASS_EXTRA_BOLD = 800;
our $WEIGHT_CLASS_BLACK = 900;

our $WIDTH_CLASS_ULTRA_CONDENSED = 1;
our $WIDTH_CLASS_EXTRA_CONDENSED = 2;
our $WIDTH_CLASS_CONDENSED = 3;
our $WIDTH_CLASS_SEMI_CONDENSED = 4;
our $WIDTH_CLASS_NORMAL = 5;
our $WIDTH_CLASS_SEMI_EXPANDED = 6;
our $WIDTH_CLASS_EXPANDED = 7;
our $WIDTH_CLASS_EXTRA_EXPANDED = 8;
our $WIDTH_CLASS_ULTRA_EXPANDED = 9;

our $FS_TYPE_RESTRICTED_LICENSE_EMBEDDING = 2;
our $FS_TYPE_PREVIEW_AND_PRINT_EMBEDDING = 4;
our $FS_TYPE_EDITABLE_EMBEDDING = 8;

our $FS_SELECTION_ITALIC = 1;
our $FS_SELECTION_UNDERSCORE = 2;
our $FS_SELECTION_NEGATIVE = 4;
our $FS_SELECTION_OUTLINED = 8;
our $FS_SELECTION_STRIKEOUT = 16;
our $FS_SELECTION_BOLD = 32;
our $FS_SELECTION_REGULAR = 64;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{version} = $self->{_io}->read_u2be();
    $self->{x_avg_char_width} = $self->{_io}->read_s2be();
    $self->{weight_class} = $self->{_io}->read_u2be();
    $self->{width_class} = $self->{_io}->read_u2be();
    $self->{fs_type} = $self->{_io}->read_s2be();
    $self->{y_subscript_x_size} = $self->{_io}->read_s2be();
    $self->{y_subscript_y_size} = $self->{_io}->read_s2be();
    $self->{y_subscript_x_offset} = $self->{_io}->read_s2be();
    $self->{y_subscript_y_offset} = $self->{_io}->read_s2be();
    $self->{y_superscript_x_size} = $self->{_io}->read_s2be();
    $self->{y_superscript_y_size} = $self->{_io}->read_s2be();
    $self->{y_superscript_x_offset} = $self->{_io}->read_s2be();
    $self->{y_superscript_y_offset} = $self->{_io}->read_s2be();
    $self->{y_strikeout_size} = $self->{_io}->read_s2be();
    $self->{y_strikeout_position} = $self->{_io}->read_s2be();
    $self->{s_family_class} = $self->{_io}->read_s2be();
    $self->{panose} = Ttf::Os2::Panose->new($self->{_io}, $self, $self->{_root});
    $self->{unicode_range} = Ttf::Os2::UnicodeRange->new($self->{_io}, $self, $self->{_root});
    $self->{ach_vend_id} = Encode::decode("ascii", $self->{_io}->read_bytes(4));
    $self->{selection} = $self->{_io}->read_u2be();
    $self->{first_char_index} = $self->{_io}->read_u2be();
    $self->{last_char_index} = $self->{_io}->read_u2be();
    $self->{typo_ascender} = $self->{_io}->read_s2be();
    $self->{typo_descender} = $self->{_io}->read_s2be();
    $self->{typo_line_gap} = $self->{_io}->read_s2be();
    $self->{win_ascent} = $self->{_io}->read_u2be();
    $self->{win_descent} = $self->{_io}->read_u2be();
    $self->{code_page_range} = Ttf::Os2::CodePageRange->new($self->{_io}, $self, $self->{_root});
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub x_avg_char_width {
    my ($self) = @_;
    return $self->{x_avg_char_width};
}

sub weight_class {
    my ($self) = @_;
    return $self->{weight_class};
}

sub width_class {
    my ($self) = @_;
    return $self->{width_class};
}

sub fs_type {
    my ($self) = @_;
    return $self->{fs_type};
}

sub y_subscript_x_size {
    my ($self) = @_;
    return $self->{y_subscript_x_size};
}

sub y_subscript_y_size {
    my ($self) = @_;
    return $self->{y_subscript_y_size};
}

sub y_subscript_x_offset {
    my ($self) = @_;
    return $self->{y_subscript_x_offset};
}

sub y_subscript_y_offset {
    my ($self) = @_;
    return $self->{y_subscript_y_offset};
}

sub y_superscript_x_size {
    my ($self) = @_;
    return $self->{y_superscript_x_size};
}

sub y_superscript_y_size {
    my ($self) = @_;
    return $self->{y_superscript_y_size};
}

sub y_superscript_x_offset {
    my ($self) = @_;
    return $self->{y_superscript_x_offset};
}

sub y_superscript_y_offset {
    my ($self) = @_;
    return $self->{y_superscript_y_offset};
}

sub y_strikeout_size {
    my ($self) = @_;
    return $self->{y_strikeout_size};
}

sub y_strikeout_position {
    my ($self) = @_;
    return $self->{y_strikeout_position};
}

sub s_family_class {
    my ($self) = @_;
    return $self->{s_family_class};
}

sub panose {
    my ($self) = @_;
    return $self->{panose};
}

sub unicode_range {
    my ($self) = @_;
    return $self->{unicode_range};
}

sub ach_vend_id {
    my ($self) = @_;
    return $self->{ach_vend_id};
}

sub selection {
    my ($self) = @_;
    return $self->{selection};
}

sub first_char_index {
    my ($self) = @_;
    return $self->{first_char_index};
}

sub last_char_index {
    my ($self) = @_;
    return $self->{last_char_index};
}

sub typo_ascender {
    my ($self) = @_;
    return $self->{typo_ascender};
}

sub typo_descender {
    my ($self) = @_;
    return $self->{typo_descender};
}

sub typo_line_gap {
    my ($self) = @_;
    return $self->{typo_line_gap};
}

sub win_ascent {
    my ($self) = @_;
    return $self->{win_ascent};
}

sub win_descent {
    my ($self) = @_;
    return $self->{win_descent};
}

sub code_page_range {
    my ($self) = @_;
    return $self->{code_page_range};
}

########################################################################
package Ttf::Os2::Panose;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $WEIGHT_ANY = 0;
our $WEIGHT_NO_FIT = 1;
our $WEIGHT_VERY_LIGHT = 2;
our $WEIGHT_LIGHT = 3;
our $WEIGHT_THIN = 4;
our $WEIGHT_BOOK = 5;
our $WEIGHT_MEDIUM = 6;
our $WEIGHT_DEMI = 7;
our $WEIGHT_BOLD = 8;
our $WEIGHT_HEAVY = 9;
our $WEIGHT_BLACK = 10;
our $WEIGHT_NORD = 11;

our $PROPORTION_ANY = 0;
our $PROPORTION_NO_FIT = 1;
our $PROPORTION_OLD_STYLE = 2;
our $PROPORTION_MODERN = 3;
our $PROPORTION_EVEN_WIDTH = 4;
our $PROPORTION_EXPANDED = 5;
our $PROPORTION_CONDENSED = 6;
our $PROPORTION_VERY_EXPANDED = 7;
our $PROPORTION_VERY_CONDENSED = 8;
our $PROPORTION_MONOSPACED = 9;

our $FAMILY_KIND_ANY = 0;
our $FAMILY_KIND_NO_FIT = 1;
our $FAMILY_KIND_TEXT_AND_DISPLAY = 2;
our $FAMILY_KIND_SCRIPT = 3;
our $FAMILY_KIND_DECORATIVE = 4;
our $FAMILY_KIND_PICTORIAL = 5;

our $LETTER_FORM_ANY = 0;
our $LETTER_FORM_NO_FIT = 1;
our $LETTER_FORM_NORMAL_CONTACT = 2;
our $LETTER_FORM_NORMAL_WEIGHTED = 3;
our $LETTER_FORM_NORMAL_BOXED = 4;
our $LETTER_FORM_NORMAL_FLATTENED = 5;
our $LETTER_FORM_NORMAL_ROUNDED = 6;
our $LETTER_FORM_NORMAL_OFF_CENTER = 7;
our $LETTER_FORM_NORMAL_SQUARE = 8;
our $LETTER_FORM_OBLIQUE_CONTACT = 9;
our $LETTER_FORM_OBLIQUE_WEIGHTED = 10;
our $LETTER_FORM_OBLIQUE_BOXED = 11;
our $LETTER_FORM_OBLIQUE_FLATTENED = 12;
our $LETTER_FORM_OBLIQUE_ROUNDED = 13;
our $LETTER_FORM_OBLIQUE_OFF_CENTER = 14;
our $LETTER_FORM_OBLIQUE_SQUARE = 15;

our $SERIF_STYLE_ANY = 0;
our $SERIF_STYLE_NO_FIT = 1;
our $SERIF_STYLE_COVE = 2;
our $SERIF_STYLE_OBTUSE_COVE = 3;
our $SERIF_STYLE_SQUARE_COVE = 4;
our $SERIF_STYLE_OBTUSE_SQUARE_COVE = 5;
our $SERIF_STYLE_SQUARE = 6;
our $SERIF_STYLE_THIN = 7;
our $SERIF_STYLE_BONE = 8;
our $SERIF_STYLE_EXAGGERATED = 9;
our $SERIF_STYLE_TRIANGLE = 10;
our $SERIF_STYLE_NORMAL_SANS = 11;
our $SERIF_STYLE_OBTUSE_SANS = 12;
our $SERIF_STYLE_PERP_SANS = 13;
our $SERIF_STYLE_FLARED = 14;
our $SERIF_STYLE_ROUNDED = 15;

our $X_HEIGHT_ANY = 0;
our $X_HEIGHT_NO_FIT = 1;
our $X_HEIGHT_CONSTANT_SMALL = 2;
our $X_HEIGHT_CONSTANT_STANDARD = 3;
our $X_HEIGHT_CONSTANT_LARGE = 4;
our $X_HEIGHT_DUCKING_SMALL = 5;
our $X_HEIGHT_DUCKING_STANDARD = 6;
our $X_HEIGHT_DUCKING_LARGE = 7;

our $ARM_STYLE_ANY = 0;
our $ARM_STYLE_NO_FIT = 1;
our $ARM_STYLE_STRAIGHT_ARMS_HORIZONTAL = 2;
our $ARM_STYLE_STRAIGHT_ARMS_WEDGE = 3;
our $ARM_STYLE_STRAIGHT_ARMS_VERTICAL = 4;
our $ARM_STYLE_STRAIGHT_ARMS_SINGLE_SERIF = 5;
our $ARM_STYLE_STRAIGHT_ARMS_DOUBLE_SERIF = 6;
our $ARM_STYLE_NON_STRAIGHT_ARMS_HORIZONTAL = 7;
our $ARM_STYLE_NON_STRAIGHT_ARMS_WEDGE = 8;
our $ARM_STYLE_NON_STRAIGHT_ARMS_VERTICAL = 9;
our $ARM_STYLE_NON_STRAIGHT_ARMS_SINGLE_SERIF = 10;
our $ARM_STYLE_NON_STRAIGHT_ARMS_DOUBLE_SERIF = 11;

our $STROKE_VARIATION_ANY = 0;
our $STROKE_VARIATION_NO_FIT = 1;
our $STROKE_VARIATION_GRADUAL_DIAGONAL = 2;
our $STROKE_VARIATION_GRADUAL_TRANSITIONAL = 3;
our $STROKE_VARIATION_GRADUAL_VERTICAL = 4;
our $STROKE_VARIATION_GRADUAL_HORIZONTAL = 5;
our $STROKE_VARIATION_RAPID_VERTICAL = 6;
our $STROKE_VARIATION_RAPID_HORIZONTAL = 7;
our $STROKE_VARIATION_INSTANT_VERTICAL = 8;

our $CONTRAST_ANY = 0;
our $CONTRAST_NO_FIT = 1;
our $CONTRAST_NONE = 2;
our $CONTRAST_VERY_LOW = 3;
our $CONTRAST_LOW = 4;
our $CONTRAST_MEDIUM_LOW = 5;
our $CONTRAST_MEDIUM = 6;
our $CONTRAST_MEDIUM_HIGH = 7;
our $CONTRAST_HIGH = 8;
our $CONTRAST_VERY_HIGH = 9;

our $MIDLINE_ANY = 0;
our $MIDLINE_NO_FIT = 1;
our $MIDLINE_STANDARD_TRIMMED = 2;
our $MIDLINE_STANDARD_POINTED = 3;
our $MIDLINE_STANDARD_SERIFED = 4;
our $MIDLINE_HIGH_TRIMMED = 5;
our $MIDLINE_HIGH_POINTED = 6;
our $MIDLINE_HIGH_SERIFED = 7;
our $MIDLINE_CONSTANT_TRIMMED = 8;
our $MIDLINE_CONSTANT_POINTED = 9;
our $MIDLINE_CONSTANT_SERIFED = 10;
our $MIDLINE_LOW_TRIMMED = 11;
our $MIDLINE_LOW_POINTED = 12;
our $MIDLINE_LOW_SERIFED = 13;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{family_type} = $self->{_io}->read_u1();
    $self->{serif_style} = $self->{_io}->read_u1();
    $self->{weight} = $self->{_io}->read_u1();
    $self->{proportion} = $self->{_io}->read_u1();
    $self->{contrast} = $self->{_io}->read_u1();
    $self->{stroke_variation} = $self->{_io}->read_u1();
    $self->{arm_style} = $self->{_io}->read_u1();
    $self->{letter_form} = $self->{_io}->read_u1();
    $self->{midline} = $self->{_io}->read_u1();
    $self->{x_height} = $self->{_io}->read_u1();
}

sub family_type {
    my ($self) = @_;
    return $self->{family_type};
}

sub serif_style {
    my ($self) = @_;
    return $self->{serif_style};
}

sub weight {
    my ($self) = @_;
    return $self->{weight};
}

sub proportion {
    my ($self) = @_;
    return $self->{proportion};
}

sub contrast {
    my ($self) = @_;
    return $self->{contrast};
}

sub stroke_variation {
    my ($self) = @_;
    return $self->{stroke_variation};
}

sub arm_style {
    my ($self) = @_;
    return $self->{arm_style};
}

sub letter_form {
    my ($self) = @_;
    return $self->{letter_form};
}

sub midline {
    my ($self) = @_;
    return $self->{midline};
}

sub x_height {
    my ($self) = @_;
    return $self->{x_height};
}

########################################################################
package Ttf::Os2::UnicodeRange;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{basic_latin} = $self->{_io}->read_bits_int_be(1);
    $self->{latin_1_supplement} = $self->{_io}->read_bits_int_be(1);
    $self->{latin_extended_a} = $self->{_io}->read_bits_int_be(1);
    $self->{latin_extended_b} = $self->{_io}->read_bits_int_be(1);
    $self->{ipa_extensions} = $self->{_io}->read_bits_int_be(1);
    $self->{spacing_modifier_letters} = $self->{_io}->read_bits_int_be(1);
    $self->{combining_diacritical_marks} = $self->{_io}->read_bits_int_be(1);
    $self->{basic_greek} = $self->{_io}->read_bits_int_be(1);
    $self->{greek_symbols_and_coptic} = $self->{_io}->read_bits_int_be(1);
    $self->{cyrillic} = $self->{_io}->read_bits_int_be(1);
    $self->{armenian} = $self->{_io}->read_bits_int_be(1);
    $self->{basic_hebrew} = $self->{_io}->read_bits_int_be(1);
    $self->{hebrew_extended} = $self->{_io}->read_bits_int_be(1);
    $self->{basic_arabic} = $self->{_io}->read_bits_int_be(1);
    $self->{arabic_extended} = $self->{_io}->read_bits_int_be(1);
    $self->{devanagari} = $self->{_io}->read_bits_int_be(1);
    $self->{bengali} = $self->{_io}->read_bits_int_be(1);
    $self->{gurmukhi} = $self->{_io}->read_bits_int_be(1);
    $self->{gujarati} = $self->{_io}->read_bits_int_be(1);
    $self->{oriya} = $self->{_io}->read_bits_int_be(1);
    $self->{tamil} = $self->{_io}->read_bits_int_be(1);
    $self->{telugu} = $self->{_io}->read_bits_int_be(1);
    $self->{kannada} = $self->{_io}->read_bits_int_be(1);
    $self->{malayalam} = $self->{_io}->read_bits_int_be(1);
    $self->{thai} = $self->{_io}->read_bits_int_be(1);
    $self->{lao} = $self->{_io}->read_bits_int_be(1);
    $self->{basic_georgian} = $self->{_io}->read_bits_int_be(1);
    $self->{georgian_extended} = $self->{_io}->read_bits_int_be(1);
    $self->{hangul_jamo} = $self->{_io}->read_bits_int_be(1);
    $self->{latin_extended_additional} = $self->{_io}->read_bits_int_be(1);
    $self->{greek_extended} = $self->{_io}->read_bits_int_be(1);
    $self->{general_punctuation} = $self->{_io}->read_bits_int_be(1);
    $self->{superscripts_and_subscripts} = $self->{_io}->read_bits_int_be(1);
    $self->{currency_symbols} = $self->{_io}->read_bits_int_be(1);
    $self->{combining_diacritical_marks_for_symbols} = $self->{_io}->read_bits_int_be(1);
    $self->{letterlike_symbols} = $self->{_io}->read_bits_int_be(1);
    $self->{number_forms} = $self->{_io}->read_bits_int_be(1);
    $self->{arrows} = $self->{_io}->read_bits_int_be(1);
    $self->{mathematical_operators} = $self->{_io}->read_bits_int_be(1);
    $self->{miscellaneous_technical} = $self->{_io}->read_bits_int_be(1);
    $self->{control_pictures} = $self->{_io}->read_bits_int_be(1);
    $self->{optical_character_recognition} = $self->{_io}->read_bits_int_be(1);
    $self->{enclosed_alphanumerics} = $self->{_io}->read_bits_int_be(1);
    $self->{box_drawing} = $self->{_io}->read_bits_int_be(1);
    $self->{block_elements} = $self->{_io}->read_bits_int_be(1);
    $self->{geometric_shapes} = $self->{_io}->read_bits_int_be(1);
    $self->{miscellaneous_symbols} = $self->{_io}->read_bits_int_be(1);
    $self->{dingbats} = $self->{_io}->read_bits_int_be(1);
    $self->{cjk_symbols_and_punctuation} = $self->{_io}->read_bits_int_be(1);
    $self->{hiragana} = $self->{_io}->read_bits_int_be(1);
    $self->{katakana} = $self->{_io}->read_bits_int_be(1);
    $self->{bopomofo} = $self->{_io}->read_bits_int_be(1);
    $self->{hangul_compatibility_jamo} = $self->{_io}->read_bits_int_be(1);
    $self->{cjk_miscellaneous} = $self->{_io}->read_bits_int_be(1);
    $self->{enclosed_cjk_letters_and_months} = $self->{_io}->read_bits_int_be(1);
    $self->{cjk_compatibility} = $self->{_io}->read_bits_int_be(1);
    $self->{hangul} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved_for_unicode_subranges1} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved_for_unicode_subranges2} = $self->{_io}->read_bits_int_be(1);
    $self->{cjk_unified_ideographs} = $self->{_io}->read_bits_int_be(1);
    $self->{private_use_area} = $self->{_io}->read_bits_int_be(1);
    $self->{cjk_compatibility_ideographs} = $self->{_io}->read_bits_int_be(1);
    $self->{alphabetic_presentation_forms} = $self->{_io}->read_bits_int_be(1);
    $self->{arabic_presentation_forms_a} = $self->{_io}->read_bits_int_be(1);
    $self->{combining_half_marks} = $self->{_io}->read_bits_int_be(1);
    $self->{cjk_compatibility_forms} = $self->{_io}->read_bits_int_be(1);
    $self->{small_form_variants} = $self->{_io}->read_bits_int_be(1);
    $self->{arabic_presentation_forms_b} = $self->{_io}->read_bits_int_be(1);
    $self->{halfwidth_and_fullwidth_forms} = $self->{_io}->read_bits_int_be(1);
    $self->{specials} = $self->{_io}->read_bits_int_be(1);
    $self->{_io}->align_to_byte();
    $self->{reserved} = $self->{_io}->read_bytes(7);
}

sub basic_latin {
    my ($self) = @_;
    return $self->{basic_latin};
}

sub latin_1_supplement {
    my ($self) = @_;
    return $self->{latin_1_supplement};
}

sub latin_extended_a {
    my ($self) = @_;
    return $self->{latin_extended_a};
}

sub latin_extended_b {
    my ($self) = @_;
    return $self->{latin_extended_b};
}

sub ipa_extensions {
    my ($self) = @_;
    return $self->{ipa_extensions};
}

sub spacing_modifier_letters {
    my ($self) = @_;
    return $self->{spacing_modifier_letters};
}

sub combining_diacritical_marks {
    my ($self) = @_;
    return $self->{combining_diacritical_marks};
}

sub basic_greek {
    my ($self) = @_;
    return $self->{basic_greek};
}

sub greek_symbols_and_coptic {
    my ($self) = @_;
    return $self->{greek_symbols_and_coptic};
}

sub cyrillic {
    my ($self) = @_;
    return $self->{cyrillic};
}

sub armenian {
    my ($self) = @_;
    return $self->{armenian};
}

sub basic_hebrew {
    my ($self) = @_;
    return $self->{basic_hebrew};
}

sub hebrew_extended {
    my ($self) = @_;
    return $self->{hebrew_extended};
}

sub basic_arabic {
    my ($self) = @_;
    return $self->{basic_arabic};
}

sub arabic_extended {
    my ($self) = @_;
    return $self->{arabic_extended};
}

sub devanagari {
    my ($self) = @_;
    return $self->{devanagari};
}

sub bengali {
    my ($self) = @_;
    return $self->{bengali};
}

sub gurmukhi {
    my ($self) = @_;
    return $self->{gurmukhi};
}

sub gujarati {
    my ($self) = @_;
    return $self->{gujarati};
}

sub oriya {
    my ($self) = @_;
    return $self->{oriya};
}

sub tamil {
    my ($self) = @_;
    return $self->{tamil};
}

sub telugu {
    my ($self) = @_;
    return $self->{telugu};
}

sub kannada {
    my ($self) = @_;
    return $self->{kannada};
}

sub malayalam {
    my ($self) = @_;
    return $self->{malayalam};
}

sub thai {
    my ($self) = @_;
    return $self->{thai};
}

sub lao {
    my ($self) = @_;
    return $self->{lao};
}

sub basic_georgian {
    my ($self) = @_;
    return $self->{basic_georgian};
}

sub georgian_extended {
    my ($self) = @_;
    return $self->{georgian_extended};
}

sub hangul_jamo {
    my ($self) = @_;
    return $self->{hangul_jamo};
}

sub latin_extended_additional {
    my ($self) = @_;
    return $self->{latin_extended_additional};
}

sub greek_extended {
    my ($self) = @_;
    return $self->{greek_extended};
}

sub general_punctuation {
    my ($self) = @_;
    return $self->{general_punctuation};
}

sub superscripts_and_subscripts {
    my ($self) = @_;
    return $self->{superscripts_and_subscripts};
}

sub currency_symbols {
    my ($self) = @_;
    return $self->{currency_symbols};
}

sub combining_diacritical_marks_for_symbols {
    my ($self) = @_;
    return $self->{combining_diacritical_marks_for_symbols};
}

sub letterlike_symbols {
    my ($self) = @_;
    return $self->{letterlike_symbols};
}

sub number_forms {
    my ($self) = @_;
    return $self->{number_forms};
}

sub arrows {
    my ($self) = @_;
    return $self->{arrows};
}

sub mathematical_operators {
    my ($self) = @_;
    return $self->{mathematical_operators};
}

sub miscellaneous_technical {
    my ($self) = @_;
    return $self->{miscellaneous_technical};
}

sub control_pictures {
    my ($self) = @_;
    return $self->{control_pictures};
}

sub optical_character_recognition {
    my ($self) = @_;
    return $self->{optical_character_recognition};
}

sub enclosed_alphanumerics {
    my ($self) = @_;
    return $self->{enclosed_alphanumerics};
}

sub box_drawing {
    my ($self) = @_;
    return $self->{box_drawing};
}

sub block_elements {
    my ($self) = @_;
    return $self->{block_elements};
}

sub geometric_shapes {
    my ($self) = @_;
    return $self->{geometric_shapes};
}

sub miscellaneous_symbols {
    my ($self) = @_;
    return $self->{miscellaneous_symbols};
}

sub dingbats {
    my ($self) = @_;
    return $self->{dingbats};
}

sub cjk_symbols_and_punctuation {
    my ($self) = @_;
    return $self->{cjk_symbols_and_punctuation};
}

sub hiragana {
    my ($self) = @_;
    return $self->{hiragana};
}

sub katakana {
    my ($self) = @_;
    return $self->{katakana};
}

sub bopomofo {
    my ($self) = @_;
    return $self->{bopomofo};
}

sub hangul_compatibility_jamo {
    my ($self) = @_;
    return $self->{hangul_compatibility_jamo};
}

sub cjk_miscellaneous {
    my ($self) = @_;
    return $self->{cjk_miscellaneous};
}

sub enclosed_cjk_letters_and_months {
    my ($self) = @_;
    return $self->{enclosed_cjk_letters_and_months};
}

sub cjk_compatibility {
    my ($self) = @_;
    return $self->{cjk_compatibility};
}

sub hangul {
    my ($self) = @_;
    return $self->{hangul};
}

sub reserved_for_unicode_subranges1 {
    my ($self) = @_;
    return $self->{reserved_for_unicode_subranges1};
}

sub reserved_for_unicode_subranges2 {
    my ($self) = @_;
    return $self->{reserved_for_unicode_subranges2};
}

sub cjk_unified_ideographs {
    my ($self) = @_;
    return $self->{cjk_unified_ideographs};
}

sub private_use_area {
    my ($self) = @_;
    return $self->{private_use_area};
}

sub cjk_compatibility_ideographs {
    my ($self) = @_;
    return $self->{cjk_compatibility_ideographs};
}

sub alphabetic_presentation_forms {
    my ($self) = @_;
    return $self->{alphabetic_presentation_forms};
}

sub arabic_presentation_forms_a {
    my ($self) = @_;
    return $self->{arabic_presentation_forms_a};
}

sub combining_half_marks {
    my ($self) = @_;
    return $self->{combining_half_marks};
}

sub cjk_compatibility_forms {
    my ($self) = @_;
    return $self->{cjk_compatibility_forms};
}

sub small_form_variants {
    my ($self) = @_;
    return $self->{small_form_variants};
}

sub arabic_presentation_forms_b {
    my ($self) = @_;
    return $self->{arabic_presentation_forms_b};
}

sub halfwidth_and_fullwidth_forms {
    my ($self) = @_;
    return $self->{halfwidth_and_fullwidth_forms};
}

sub specials {
    my ($self) = @_;
    return $self->{specials};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package Ttf::Os2::CodePageRange;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{symbol_character_set} = $self->{_io}->read_bits_int_be(1);
    $self->{oem_character_set} = $self->{_io}->read_bits_int_be(1);
    $self->{macintosh_character_set} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved_for_alternate_ansi_oem} = $self->{_io}->read_bits_int_be(7);
    $self->{cp1361_korean_johab} = $self->{_io}->read_bits_int_be(1);
    $self->{cp950_chinese_traditional_chars_taiwan_and_hong_kong} = $self->{_io}->read_bits_int_be(1);
    $self->{cp949_korean_wansung} = $self->{_io}->read_bits_int_be(1);
    $self->{cp936_chinese_simplified_chars_prc_and_singapore} = $self->{_io}->read_bits_int_be(1);
    $self->{cp932_jis_japan} = $self->{_io}->read_bits_int_be(1);
    $self->{cp874_thai} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved_for_alternate_ansi} = $self->{_io}->read_bits_int_be(8);
    $self->{cp1257_windows_baltic} = $self->{_io}->read_bits_int_be(1);
    $self->{cp1256_arabic} = $self->{_io}->read_bits_int_be(1);
    $self->{cp1255_hebrew} = $self->{_io}->read_bits_int_be(1);
    $self->{cp1254_turkish} = $self->{_io}->read_bits_int_be(1);
    $self->{cp1253_greek} = $self->{_io}->read_bits_int_be(1);
    $self->{cp1251_cyrillic} = $self->{_io}->read_bits_int_be(1);
    $self->{cp1250_latin_2_eastern_europe} = $self->{_io}->read_bits_int_be(1);
    $self->{cp1252_latin_1} = $self->{_io}->read_bits_int_be(1);
    $self->{cp437_us} = $self->{_io}->read_bits_int_be(1);
    $self->{cp850_we_latin_1} = $self->{_io}->read_bits_int_be(1);
    $self->{cp708_arabic_asmo_708} = $self->{_io}->read_bits_int_be(1);
    $self->{cp737_greek_former_437_g} = $self->{_io}->read_bits_int_be(1);
    $self->{cp775_ms_dos_baltic} = $self->{_io}->read_bits_int_be(1);
    $self->{cp852_latin_2} = $self->{_io}->read_bits_int_be(1);
    $self->{cp855_ibm_cyrillic_primarily_russian} = $self->{_io}->read_bits_int_be(1);
    $self->{cp857_ibm_turkish} = $self->{_io}->read_bits_int_be(1);
    $self->{cp860_ms_dos_portuguese} = $self->{_io}->read_bits_int_be(1);
    $self->{cp861_ms_dos_icelandic} = $self->{_io}->read_bits_int_be(1);
    $self->{cp862_hebrew} = $self->{_io}->read_bits_int_be(1);
    $self->{cp863_ms_dos_canadian_french} = $self->{_io}->read_bits_int_be(1);
    $self->{cp864_arabic} = $self->{_io}->read_bits_int_be(1);
    $self->{cp865_ms_dos_nordic} = $self->{_io}->read_bits_int_be(1);
    $self->{cp866_ms_dos_russian} = $self->{_io}->read_bits_int_be(1);
    $self->{cp869_ibm_greek} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved_for_oem} = $self->{_io}->read_bits_int_be(16);
}

sub symbol_character_set {
    my ($self) = @_;
    return $self->{symbol_character_set};
}

sub oem_character_set {
    my ($self) = @_;
    return $self->{oem_character_set};
}

sub macintosh_character_set {
    my ($self) = @_;
    return $self->{macintosh_character_set};
}

sub reserved_for_alternate_ansi_oem {
    my ($self) = @_;
    return $self->{reserved_for_alternate_ansi_oem};
}

sub cp1361_korean_johab {
    my ($self) = @_;
    return $self->{cp1361_korean_johab};
}

sub cp950_chinese_traditional_chars_taiwan_and_hong_kong {
    my ($self) = @_;
    return $self->{cp950_chinese_traditional_chars_taiwan_and_hong_kong};
}

sub cp949_korean_wansung {
    my ($self) = @_;
    return $self->{cp949_korean_wansung};
}

sub cp936_chinese_simplified_chars_prc_and_singapore {
    my ($self) = @_;
    return $self->{cp936_chinese_simplified_chars_prc_and_singapore};
}

sub cp932_jis_japan {
    my ($self) = @_;
    return $self->{cp932_jis_japan};
}

sub cp874_thai {
    my ($self) = @_;
    return $self->{cp874_thai};
}

sub reserved_for_alternate_ansi {
    my ($self) = @_;
    return $self->{reserved_for_alternate_ansi};
}

sub cp1257_windows_baltic {
    my ($self) = @_;
    return $self->{cp1257_windows_baltic};
}

sub cp1256_arabic {
    my ($self) = @_;
    return $self->{cp1256_arabic};
}

sub cp1255_hebrew {
    my ($self) = @_;
    return $self->{cp1255_hebrew};
}

sub cp1254_turkish {
    my ($self) = @_;
    return $self->{cp1254_turkish};
}

sub cp1253_greek {
    my ($self) = @_;
    return $self->{cp1253_greek};
}

sub cp1251_cyrillic {
    my ($self) = @_;
    return $self->{cp1251_cyrillic};
}

sub cp1250_latin_2_eastern_europe {
    my ($self) = @_;
    return $self->{cp1250_latin_2_eastern_europe};
}

sub cp1252_latin_1 {
    my ($self) = @_;
    return $self->{cp1252_latin_1};
}

sub cp437_us {
    my ($self) = @_;
    return $self->{cp437_us};
}

sub cp850_we_latin_1 {
    my ($self) = @_;
    return $self->{cp850_we_latin_1};
}

sub cp708_arabic_asmo_708 {
    my ($self) = @_;
    return $self->{cp708_arabic_asmo_708};
}

sub cp737_greek_former_437_g {
    my ($self) = @_;
    return $self->{cp737_greek_former_437_g};
}

sub cp775_ms_dos_baltic {
    my ($self) = @_;
    return $self->{cp775_ms_dos_baltic};
}

sub cp852_latin_2 {
    my ($self) = @_;
    return $self->{cp852_latin_2};
}

sub cp855_ibm_cyrillic_primarily_russian {
    my ($self) = @_;
    return $self->{cp855_ibm_cyrillic_primarily_russian};
}

sub cp857_ibm_turkish {
    my ($self) = @_;
    return $self->{cp857_ibm_turkish};
}

sub cp860_ms_dos_portuguese {
    my ($self) = @_;
    return $self->{cp860_ms_dos_portuguese};
}

sub cp861_ms_dos_icelandic {
    my ($self) = @_;
    return $self->{cp861_ms_dos_icelandic};
}

sub cp862_hebrew {
    my ($self) = @_;
    return $self->{cp862_hebrew};
}

sub cp863_ms_dos_canadian_french {
    my ($self) = @_;
    return $self->{cp863_ms_dos_canadian_french};
}

sub cp864_arabic {
    my ($self) = @_;
    return $self->{cp864_arabic};
}

sub cp865_ms_dos_nordic {
    my ($self) = @_;
    return $self->{cp865_ms_dos_nordic};
}

sub cp866_ms_dos_russian {
    my ($self) = @_;
    return $self->{cp866_ms_dos_russian};
}

sub cp869_ibm_greek {
    my ($self) = @_;
    return $self->{cp869_ibm_greek};
}

sub reserved_for_oem {
    my ($self) = @_;
    return $self->{reserved_for_oem};
}

########################################################################
package Ttf::Fixed;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{major} = $self->{_io}->read_u2be();
    $self->{minor} = $self->{_io}->read_u2be();
}

sub major {
    my ($self) = @_;
    return $self->{major};
}

sub minor {
    my ($self) = @_;
    return $self->{minor};
}

########################################################################
package Ttf::Glyf;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{number_of_contours} = $self->{_io}->read_s2be();
    $self->{x_min} = $self->{_io}->read_s2be();
    $self->{y_min} = $self->{_io}->read_s2be();
    $self->{x_max} = $self->{_io}->read_s2be();
    $self->{y_max} = $self->{_io}->read_s2be();
    if ($self->number_of_contours() > 0) {
        $self->{value} = Ttf::Glyf::SimpleGlyph->new($self->{_io}, $self, $self->{_root});
    }
}

sub number_of_contours {
    my ($self) = @_;
    return $self->{number_of_contours};
}

sub x_min {
    my ($self) = @_;
    return $self->{x_min};
}

sub y_min {
    my ($self) = @_;
    return $self->{y_min};
}

sub x_max {
    my ($self) = @_;
    return $self->{x_max};
}

sub y_max {
    my ($self) = @_;
    return $self->{y_max};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Ttf::Glyf::SimpleGlyph;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{end_pts_of_contours} = ();
    my $n_end_pts_of_contours = $self->_parent()->number_of_contours();
    for (my $i = 0; $i < $n_end_pts_of_contours; $i++) {
        $self->{end_pts_of_contours}[$i] = $self->{_io}->read_u2be();
    }
    $self->{instruction_length} = $self->{_io}->read_u2be();
    $self->{instructions} = $self->{_io}->read_bytes($self->instruction_length());
    $self->{flags} = ();
    my $n_flags = $self->point_count();
    for (my $i = 0; $i < $n_flags; $i++) {
        $self->{flags}[$i] = Ttf::Glyf::SimpleGlyph::Flag->new($self->{_io}, $self, $self->{_root});
    }
}

sub point_count {
    my ($self) = @_;
    return $self->{point_count} if ($self->{point_count});
    $self->{point_count} = (List::Util::max(@{$self->end_pts_of_contours()}) + 1);
    return $self->{point_count};
}

sub end_pts_of_contours {
    my ($self) = @_;
    return $self->{end_pts_of_contours};
}

sub instruction_length {
    my ($self) = @_;
    return $self->{instruction_length};
}

sub instructions {
    my ($self) = @_;
    return $self->{instructions};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

########################################################################
package Ttf::Glyf::SimpleGlyph::Flag;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{reserved} = $self->{_io}->read_bits_int_be(2);
    $self->{y_is_same} = $self->{_io}->read_bits_int_be(1);
    $self->{x_is_same} = $self->{_io}->read_bits_int_be(1);
    $self->{repeat} = $self->{_io}->read_bits_int_be(1);
    $self->{y_short_vector} = $self->{_io}->read_bits_int_be(1);
    $self->{x_short_vector} = $self->{_io}->read_bits_int_be(1);
    $self->{on_curve} = $self->{_io}->read_bits_int_be(1);
    $self->{_io}->align_to_byte();
    if ($self->repeat()) {
        $self->{repeat_value} = $self->{_io}->read_u1();
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub y_is_same {
    my ($self) = @_;
    return $self->{y_is_same};
}

sub x_is_same {
    my ($self) = @_;
    return $self->{x_is_same};
}

sub repeat {
    my ($self) = @_;
    return $self->{repeat};
}

sub y_short_vector {
    my ($self) = @_;
    return $self->{y_short_vector};
}

sub x_short_vector {
    my ($self) = @_;
    return $self->{x_short_vector};
}

sub on_curve {
    my ($self) = @_;
    return $self->{on_curve};
}

sub repeat_value {
    my ($self) = @_;
    return $self->{repeat_value};
}

########################################################################
package Ttf::Cvt;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{fwords} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{fwords}}, $self->{_io}->read_s2be();
    }
}

sub fwords {
    my ($self) = @_;
    return $self->{fwords};
}

########################################################################
package Ttf::Maxp;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{table_version_number} = Ttf::Fixed->new($self->{_io}, $self, $self->{_root});
    $self->{num_glyphs} = $self->{_io}->read_u2be();
    if ($self->is_version10()) {
        $self->{version10_body} = Ttf::MaxpVersion10Body->new($self->{_io}, $self, $self->{_root});
    }
}

sub is_version10 {
    my ($self) = @_;
    return $self->{is_version10} if ($self->{is_version10});
    $self->{is_version10} =  (($self->table_version_number()->major() == 1) && ($self->table_version_number()->minor() == 0)) ;
    return $self->{is_version10};
}

sub table_version_number {
    my ($self) = @_;
    return $self->{table_version_number};
}

sub num_glyphs {
    my ($self) = @_;
    return $self->{num_glyphs};
}

sub version10_body {
    my ($self) = @_;
    return $self->{version10_body};
}

########################################################################
package Ttf::MaxpVersion10Body;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{max_points} = $self->{_io}->read_u2be();
    $self->{max_contours} = $self->{_io}->read_u2be();
    $self->{max_composite_points} = $self->{_io}->read_u2be();
    $self->{max_composite_contours} = $self->{_io}->read_u2be();
    $self->{max_zones} = $self->{_io}->read_u2be();
    $self->{max_twilight_points} = $self->{_io}->read_u2be();
    $self->{max_storage} = $self->{_io}->read_u2be();
    $self->{max_function_defs} = $self->{_io}->read_u2be();
    $self->{max_instruction_defs} = $self->{_io}->read_u2be();
    $self->{max_stack_elements} = $self->{_io}->read_u2be();
    $self->{max_size_of_instructions} = $self->{_io}->read_u2be();
    $self->{max_component_elements} = $self->{_io}->read_u2be();
    $self->{max_component_depth} = $self->{_io}->read_u2be();
}

sub max_points {
    my ($self) = @_;
    return $self->{max_points};
}

sub max_contours {
    my ($self) = @_;
    return $self->{max_contours};
}

sub max_composite_points {
    my ($self) = @_;
    return $self->{max_composite_points};
}

sub max_composite_contours {
    my ($self) = @_;
    return $self->{max_composite_contours};
}

sub max_zones {
    my ($self) = @_;
    return $self->{max_zones};
}

sub max_twilight_points {
    my ($self) = @_;
    return $self->{max_twilight_points};
}

sub max_storage {
    my ($self) = @_;
    return $self->{max_storage};
}

sub max_function_defs {
    my ($self) = @_;
    return $self->{max_function_defs};
}

sub max_instruction_defs {
    my ($self) = @_;
    return $self->{max_instruction_defs};
}

sub max_stack_elements {
    my ($self) = @_;
    return $self->{max_stack_elements};
}

sub max_size_of_instructions {
    my ($self) = @_;
    return $self->{max_size_of_instructions};
}

sub max_component_elements {
    my ($self) = @_;
    return $self->{max_component_elements};
}

sub max_component_depth {
    my ($self) = @_;
    return $self->{max_component_depth};
}

########################################################################
package Ttf::OffsetTable;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{sfnt_version} = Ttf::Fixed->new($self->{_io}, $self, $self->{_root});
    $self->{num_tables} = $self->{_io}->read_u2be();
    $self->{search_range} = $self->{_io}->read_u2be();
    $self->{entry_selector} = $self->{_io}->read_u2be();
    $self->{range_shift} = $self->{_io}->read_u2be();
}

sub sfnt_version {
    my ($self) = @_;
    return $self->{sfnt_version};
}

sub num_tables {
    my ($self) = @_;
    return $self->{num_tables};
}

sub search_range {
    my ($self) = @_;
    return $self->{search_range};
}

sub entry_selector {
    my ($self) = @_;
    return $self->{entry_selector};
}

sub range_shift {
    my ($self) = @_;
    return $self->{range_shift};
}

########################################################################
package Ttf::Cmap;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{version_number} = $self->{_io}->read_u2be();
    $self->{number_of_encoding_tables} = $self->{_io}->read_u2be();
    $self->{tables} = ();
    my $n_tables = $self->number_of_encoding_tables();
    for (my $i = 0; $i < $n_tables; $i++) {
        $self->{tables}[$i] = Ttf::Cmap::SubtableHeader->new($self->{_io}, $self, $self->{_root});
    }
}

sub version_number {
    my ($self) = @_;
    return $self->{version_number};
}

sub number_of_encoding_tables {
    my ($self) = @_;
    return $self->{number_of_encoding_tables};
}

sub tables {
    my ($self) = @_;
    return $self->{tables};
}

########################################################################
package Ttf::Cmap::SubtableHeader;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{platform_id} = $self->{_io}->read_u2be();
    $self->{encoding_id} = $self->{_io}->read_u2be();
    $self->{subtable_offset} = $self->{_io}->read_u4be();
}

sub table {
    my ($self) = @_;
    return $self->{table} if ($self->{table});
    my $io = $self->_parent()->_io();
    my $_pos = $io->pos();
    $io->seek($self->subtable_offset());
    $self->{table} = Ttf::Cmap::Subtable->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{table};
}

sub platform_id {
    my ($self) = @_;
    return $self->{platform_id};
}

sub encoding_id {
    my ($self) = @_;
    return $self->{encoding_id};
}

sub subtable_offset {
    my ($self) = @_;
    return $self->{subtable_offset};
}

########################################################################
package Ttf::Cmap::Subtable;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $SUBTABLE_FORMAT_BYTE_ENCODING_TABLE = 0;
our $SUBTABLE_FORMAT_HIGH_BYTE_MAPPING_THROUGH_TABLE = 2;
our $SUBTABLE_FORMAT_SEGMENT_MAPPING_TO_DELTA_VALUES = 4;
our $SUBTABLE_FORMAT_TRIMMED_TABLE_MAPPING = 6;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{format} = $self->{_io}->read_u2be();
    $self->{length} = $self->{_io}->read_u2be();
    $self->{version} = $self->{_io}->read_u2be();
    my $_on = $self->format();
    if ($_on == $Ttf::Cmap::Subtable::SUBTABLE_FORMAT_BYTE_ENCODING_TABLE) {
        $self->{_raw_value} = $self->{_io}->read_bytes(($self->length() - 6));
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Cmap::Subtable::ByteEncodingTable->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $Ttf::Cmap::Subtable::SUBTABLE_FORMAT_SEGMENT_MAPPING_TO_DELTA_VALUES) {
        $self->{_raw_value} = $self->{_io}->read_bytes(($self->length() - 6));
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Cmap::Subtable::SegmentMappingToDeltaValues->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $Ttf::Cmap::Subtable::SUBTABLE_FORMAT_HIGH_BYTE_MAPPING_THROUGH_TABLE) {
        $self->{_raw_value} = $self->{_io}->read_bytes(($self->length() - 6));
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Cmap::Subtable::HighByteMappingThroughTable->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $Ttf::Cmap::Subtable::SUBTABLE_FORMAT_TRIMMED_TABLE_MAPPING) {
        $self->{_raw_value} = $self->{_io}->read_bytes(($self->length() - 6));
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = Ttf::Cmap::Subtable::TrimmedTableMapping->new($io__raw_value, $self, $self->{_root});
    }
    else {
        $self->{value} = $self->{_io}->read_bytes(($self->length() - 6));
    }
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub _raw_value {
    my ($self) = @_;
    return $self->{_raw_value};
}

########################################################################
package Ttf::Cmap::Subtable::ByteEncodingTable;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{glyph_id_array} = $self->{_io}->read_bytes(256);
}

sub glyph_id_array {
    my ($self) = @_;
    return $self->{glyph_id_array};
}

########################################################################
package Ttf::Cmap::Subtable::HighByteMappingThroughTable;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{sub_header_keys} = ();
    my $n_sub_header_keys = 256;
    for (my $i = 0; $i < $n_sub_header_keys; $i++) {
        $self->{sub_header_keys}[$i] = $self->{_io}->read_u2be();
    }
}

sub sub_header_keys {
    my ($self) = @_;
    return $self->{sub_header_keys};
}

########################################################################
package Ttf::Cmap::Subtable::SegmentMappingToDeltaValues;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{seg_count_x2} = $self->{_io}->read_u2be();
    $self->{search_range} = $self->{_io}->read_u2be();
    $self->{entry_selector} = $self->{_io}->read_u2be();
    $self->{range_shift} = $self->{_io}->read_u2be();
    $self->{end_count} = ();
    my $n_end_count = $self->seg_count();
    for (my $i = 0; $i < $n_end_count; $i++) {
        $self->{end_count}[$i] = $self->{_io}->read_u2be();
    }
    $self->{reserved_pad} = $self->{_io}->read_u2be();
    $self->{start_count} = ();
    my $n_start_count = $self->seg_count();
    for (my $i = 0; $i < $n_start_count; $i++) {
        $self->{start_count}[$i] = $self->{_io}->read_u2be();
    }
    $self->{id_delta} = ();
    my $n_id_delta = $self->seg_count();
    for (my $i = 0; $i < $n_id_delta; $i++) {
        $self->{id_delta}[$i] = $self->{_io}->read_u2be();
    }
    $self->{id_range_offset} = ();
    my $n_id_range_offset = $self->seg_count();
    for (my $i = 0; $i < $n_id_range_offset; $i++) {
        $self->{id_range_offset}[$i] = $self->{_io}->read_u2be();
    }
    $self->{glyph_id_array} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{glyph_id_array}}, $self->{_io}->read_u2be();
    }
}

sub seg_count {
    my ($self) = @_;
    return $self->{seg_count} if ($self->{seg_count});
    $self->{seg_count} = int($self->seg_count_x2() / 2);
    return $self->{seg_count};
}

sub seg_count_x2 {
    my ($self) = @_;
    return $self->{seg_count_x2};
}

sub search_range {
    my ($self) = @_;
    return $self->{search_range};
}

sub entry_selector {
    my ($self) = @_;
    return $self->{entry_selector};
}

sub range_shift {
    my ($self) = @_;
    return $self->{range_shift};
}

sub end_count {
    my ($self) = @_;
    return $self->{end_count};
}

sub reserved_pad {
    my ($self) = @_;
    return $self->{reserved_pad};
}

sub start_count {
    my ($self) = @_;
    return $self->{start_count};
}

sub id_delta {
    my ($self) = @_;
    return $self->{id_delta};
}

sub id_range_offset {
    my ($self) = @_;
    return $self->{id_range_offset};
}

sub glyph_id_array {
    my ($self) = @_;
    return $self->{glyph_id_array};
}

########################################################################
package Ttf::Cmap::Subtable::TrimmedTableMapping;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{first_code} = $self->{_io}->read_u2be();
    $self->{entry_count} = $self->{_io}->read_u2be();
    $self->{glyph_id_array} = ();
    my $n_glyph_id_array = $self->entry_count();
    for (my $i = 0; $i < $n_glyph_id_array; $i++) {
        $self->{glyph_id_array}[$i] = $self->{_io}->read_u2be();
    }
}

sub first_code {
    my ($self) = @_;
    return $self->{first_code};
}

sub entry_count {
    my ($self) = @_;
    return $self->{entry_count};
}

sub glyph_id_array {
    my ($self) = @_;
    return $self->{glyph_id_array};
}

1;
