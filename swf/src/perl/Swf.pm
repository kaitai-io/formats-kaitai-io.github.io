# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Compress::Zlib;
use Encode;

########################################################################
package Swf;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COMPRESSIONS_ZLIB = 67;
our $COMPRESSIONS_NONE = 70;
our $COMPRESSIONS_LZMA = 90;

our $TAG_TYPE_END_OF_FILE = 0;
our $TAG_TYPE_PLACE_OBJECT = 4;
our $TAG_TYPE_REMOVE_OBJECT = 5;
our $TAG_TYPE_SET_BACKGROUND_COLOR = 9;
our $TAG_TYPE_DEFINE_SOUND = 14;
our $TAG_TYPE_PLACE_OBJECT2 = 26;
our $TAG_TYPE_REMOVE_OBJECT2 = 28;
our $TAG_TYPE_FRAME_LABEL = 43;
our $TAG_TYPE_EXPORT_ASSETS = 56;
our $TAG_TYPE_SCRIPT_LIMITS = 65;
our $TAG_TYPE_FILE_ATTRIBUTES = 69;
our $TAG_TYPE_PLACE_OBJECT3 = 70;
our $TAG_TYPE_SYMBOL_CLASS = 76;
our $TAG_TYPE_METADATA = 77;
our $TAG_TYPE_DEFINE_SCALING_GRID = 78;
our $TAG_TYPE_DO_ABC = 82;
our $TAG_TYPE_DEFINE_SCENE_AND_FRAME_LABEL_DATA = 86;

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

    $self->{compression} = $self->{_io}->read_u1();
    $self->{signature} = $self->{_io}->ensure_fixed_contents(pack('C*', (87, 83)));
    $self->{version} = $self->{_io}->read_u1();
    $self->{len_file} = $self->{_io}->read_u4le();
    if ($self->compression() == $Swf::COMPRESSIONS_NONE) {
        $self->{_raw_plain_body} = $self->{_io}->read_bytes_full();
        my $io__raw_plain_body = IO::KaitaiStruct::Stream->new($self->{_raw_plain_body});
        $self->{plain_body} = Swf::SwfBody->new($io__raw_plain_body, $self, $self->{_root});
    }
    if ($self->compression() == $Swf::COMPRESSIONS_ZLIB) {
        $self->{_raw__raw_zlib_body} = $self->{_io}->read_bytes_full();
        $self->{_raw_zlib_body} = Compress::Zlib::uncompress($self->{_raw__raw_zlib_body});
        my $io__raw_zlib_body = IO::KaitaiStruct::Stream->new($self->{_raw_zlib_body});
        $self->{zlib_body} = Swf::SwfBody->new($io__raw_zlib_body, $self, $self->{_root});
    }
}

sub compression {
    my ($self) = @_;
    return $self->{compression};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub len_file {
    my ($self) = @_;
    return $self->{len_file};
}

sub plain_body {
    my ($self) = @_;
    return $self->{plain_body};
}

sub zlib_body {
    my ($self) = @_;
    return $self->{zlib_body};
}

sub _raw_plain_body {
    my ($self) = @_;
    return $self->{_raw_plain_body};
}

sub _raw_zlib_body {
    my ($self) = @_;
    return $self->{_raw_zlib_body};
}

sub _raw__raw_zlib_body {
    my ($self) = @_;
    return $self->{_raw__raw_zlib_body};
}

########################################################################
package Swf::Rgb;

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

    $self->{r} = $self->{_io}->read_u1();
    $self->{g} = $self->{_io}->read_u1();
    $self->{b} = $self->{_io}->read_u1();
}

sub r {
    my ($self) = @_;
    return $self->{r};
}

sub g {
    my ($self) = @_;
    return $self->{g};
}

sub b {
    my ($self) = @_;
    return $self->{b};
}

########################################################################
package Swf::DoAbcBody;

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

    $self->{flags} = $self->{_io}->read_u4le();
    $self->{name} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{abcdata} = $self->{_io}->read_bytes_full();
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub abcdata {
    my ($self) = @_;
    return $self->{abcdata};
}

########################################################################
package Swf::SwfBody;

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

    $self->{rect} = Swf::Rect->new($self->{_io}, $self, $self->{_root});
    $self->{frame_rate} = $self->{_io}->read_u2le();
    $self->{frame_count} = $self->{_io}->read_u2le();
    if ($self->_root()->version() >= 8) {
        $self->{file_attributes_tag} = Swf::Tag->new($self->{_io}, $self, $self->{_root});
    }
    $self->{tags} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{tags}}, Swf::Tag->new($self->{_io}, $self, $self->{_root});
    }
}

sub rect {
    my ($self) = @_;
    return $self->{rect};
}

sub frame_rate {
    my ($self) = @_;
    return $self->{frame_rate};
}

sub frame_count {
    my ($self) = @_;
    return $self->{frame_count};
}

sub file_attributes_tag {
    my ($self) = @_;
    return $self->{file_attributes_tag};
}

sub tags {
    my ($self) = @_;
    return $self->{tags};
}

########################################################################
package Swf::Rect;

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

    $self->{b1} = $self->{_io}->read_u1();
    $self->{skip} = $self->{_io}->read_bytes($self->num_bytes());
}

sub num_bits {
    my ($self) = @_;
    return $self->{num_bits} if ($self->{num_bits});
    $self->{num_bits} = ($self->b1() >> 3);
    return $self->{num_bits};
}

sub num_bytes {
    my ($self) = @_;
    return $self->{num_bytes} if ($self->{num_bytes});
    $self->{num_bytes} = int(((($self->num_bits() * 4) - 3) + 7) / 8);
    return $self->{num_bytes};
}

sub b1 {
    my ($self) = @_;
    return $self->{b1};
}

sub skip {
    my ($self) = @_;
    return $self->{skip};
}

########################################################################
package Swf::Tag;

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

    $self->{record_header} = Swf::RecordHeader->new($self->{_io}, $self, $self->{_root});
    my $_on = $self->record_header()->tag_type();
    if ($_on == $Swf::TAG_TYPE_DEFINE_SOUND) {
        $self->{_raw_tag_body} = $self->{_io}->read_bytes($self->record_header()->len());
        my $io__raw_tag_body = IO::KaitaiStruct::Stream->new($self->{_raw_tag_body});
        $self->{tag_body} = Swf::DefineSoundBody->new($io__raw_tag_body, $self, $self->{_root});
    }
    elsif ($_on == $Swf::TAG_TYPE_SET_BACKGROUND_COLOR) {
        $self->{_raw_tag_body} = $self->{_io}->read_bytes($self->record_header()->len());
        my $io__raw_tag_body = IO::KaitaiStruct::Stream->new($self->{_raw_tag_body});
        $self->{tag_body} = Swf::Rgb->new($io__raw_tag_body, $self, $self->{_root});
    }
    elsif ($_on == $Swf::TAG_TYPE_SCRIPT_LIMITS) {
        $self->{_raw_tag_body} = $self->{_io}->read_bytes($self->record_header()->len());
        my $io__raw_tag_body = IO::KaitaiStruct::Stream->new($self->{_raw_tag_body});
        $self->{tag_body} = Swf::ScriptLimitsBody->new($io__raw_tag_body, $self, $self->{_root});
    }
    elsif ($_on == $Swf::TAG_TYPE_DO_ABC) {
        $self->{_raw_tag_body} = $self->{_io}->read_bytes($self->record_header()->len());
        my $io__raw_tag_body = IO::KaitaiStruct::Stream->new($self->{_raw_tag_body});
        $self->{tag_body} = Swf::DoAbcBody->new($io__raw_tag_body, $self, $self->{_root});
    }
    elsif ($_on == $Swf::TAG_TYPE_EXPORT_ASSETS) {
        $self->{_raw_tag_body} = $self->{_io}->read_bytes($self->record_header()->len());
        my $io__raw_tag_body = IO::KaitaiStruct::Stream->new($self->{_raw_tag_body});
        $self->{tag_body} = Swf::SymbolClassBody->new($io__raw_tag_body, $self, $self->{_root});
    }
    elsif ($_on == $Swf::TAG_TYPE_SYMBOL_CLASS) {
        $self->{_raw_tag_body} = $self->{_io}->read_bytes($self->record_header()->len());
        my $io__raw_tag_body = IO::KaitaiStruct::Stream->new($self->{_raw_tag_body});
        $self->{tag_body} = Swf::SymbolClassBody->new($io__raw_tag_body, $self, $self->{_root});
    }
    else {
        $self->{tag_body} = $self->{_io}->read_bytes($self->record_header()->len());
    }
}

sub record_header {
    my ($self) = @_;
    return $self->{record_header};
}

sub tag_body {
    my ($self) = @_;
    return $self->{tag_body};
}

sub _raw_tag_body {
    my ($self) = @_;
    return $self->{_raw_tag_body};
}

########################################################################
package Swf::SymbolClassBody;

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

    $self->{num_symbols} = $self->{_io}->read_u2le();
    $self->{symbols} = ();
    my $n_symbols = $self->num_symbols();
    for (my $i = 0; $i < $n_symbols; $i++) {
        $self->{symbols}[$i] = Swf::SymbolClassBody::Symbol->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_symbols {
    my ($self) = @_;
    return $self->{num_symbols};
}

sub symbols {
    my ($self) = @_;
    return $self->{symbols};
}

########################################################################
package Swf::SymbolClassBody::Symbol;

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

    $self->{tag} = $self->{_io}->read_u2le();
    $self->{name} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

########################################################################
package Swf::DefineSoundBody;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $SAMPLING_RATES_RATE_5_5_KHZ = 0;
our $SAMPLING_RATES_RATE_11_KHZ = 1;
our $SAMPLING_RATES_RATE_22_KHZ = 2;
our $SAMPLING_RATES_RATE_44_KHZ = 3;

our $BPS_SOUND_8_BIT = 0;
our $BPS_SOUND_16_BIT = 1;

our $CHANNELS_MONO = 0;
our $CHANNELS_STEREO = 1;

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

    $self->{id} = $self->{_io}->read_u2le();
    $self->{format} = $self->{_io}->read_bits_int(4);
    $self->{sampling_rate} = $self->{_io}->read_bits_int(2);
    $self->{bits_per_sample} = $self->{_io}->read_bits_int(1);
    $self->{num_channels} = $self->{_io}->read_bits_int(1);
    $self->{_io}->align_to_byte();
    $self->{num_samples} = $self->{_io}->read_u4le();
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub sampling_rate {
    my ($self) = @_;
    return $self->{sampling_rate};
}

sub bits_per_sample {
    my ($self) = @_;
    return $self->{bits_per_sample};
}

sub num_channels {
    my ($self) = @_;
    return $self->{num_channels};
}

sub num_samples {
    my ($self) = @_;
    return $self->{num_samples};
}

########################################################################
package Swf::RecordHeader;

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

    $self->{tag_code_and_length} = $self->{_io}->read_u2le();
    if ($self->small_len() == 63) {
        $self->{big_len} = $self->{_io}->read_s4le();
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type} if ($self->{tag_type});
    $self->{tag_type} = ($self->tag_code_and_length() >> 6);
    return $self->{tag_type};
}

sub small_len {
    my ($self) = @_;
    return $self->{small_len} if ($self->{small_len});
    $self->{small_len} = ($self->tag_code_and_length() & 63);
    return $self->{small_len};
}

sub len {
    my ($self) = @_;
    return $self->{len} if ($self->{len});
    $self->{len} = ($self->small_len() == 63 ? $self->big_len() : $self->small_len());
    return $self->{len};
}

sub tag_code_and_length {
    my ($self) = @_;
    return $self->{tag_code_and_length};
}

sub big_len {
    my ($self) = @_;
    return $self->{big_len};
}

########################################################################
package Swf::ScriptLimitsBody;

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

    $self->{max_recursion_depth} = $self->{_io}->read_u2le();
    $self->{script_timeout_seconds} = $self->{_io}->read_u2le();
}

sub max_recursion_depth {
    my ($self) = @_;
    return $self->{max_recursion_depth};
}

sub script_timeout_seconds {
    my ($self) = @_;
    return $self->{script_timeout_seconds};
}

1;
