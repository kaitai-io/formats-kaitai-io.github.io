# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package Id3v11;

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

}

sub id3v1_tag {
    my ($self) = @_;
    return $self->{id3v1_tag} if ($self->{id3v1_tag});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->_io()->size() - 128));
    $self->{id3v1_tag} = Id3v11::Id3V11Tag->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{id3v1_tag};
}

########################################################################
package Id3v11::Id3V11Tag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $GENRE_ENUM_BLUES = 0;
our $GENRE_ENUM_CLASSIC_ROCK = 1;
our $GENRE_ENUM_COUNTRY = 2;
our $GENRE_ENUM_DANCE = 3;
our $GENRE_ENUM_DISCO = 4;
our $GENRE_ENUM_FUNK = 5;
our $GENRE_ENUM_GRUNGE = 6;
our $GENRE_ENUM_HIP_HOP = 7;
our $GENRE_ENUM_JAZZ = 8;
our $GENRE_ENUM_METAL = 9;
our $GENRE_ENUM_NEW_AGE = 10;
our $GENRE_ENUM_OLDIES = 11;
our $GENRE_ENUM_OTHER = 12;
our $GENRE_ENUM_POP = 13;
our $GENRE_ENUM_RNB = 14;
our $GENRE_ENUM_RAP = 15;
our $GENRE_ENUM_REGGAE = 16;
our $GENRE_ENUM_ROCK = 17;
our $GENRE_ENUM_TECHNO = 18;
our $GENRE_ENUM_INDUSTRIAL = 19;
our $GENRE_ENUM_ALTERNATIVE = 20;
our $GENRE_ENUM_SKA = 21;
our $GENRE_ENUM_DEATH_METAL = 22;
our $GENRE_ENUM_PRANKS = 23;
our $GENRE_ENUM_SOUNDTRACK = 24;
our $GENRE_ENUM_EURO_TECHNO = 25;
our $GENRE_ENUM_AMBIENT = 26;
our $GENRE_ENUM_TRIP_HOP = 27;
our $GENRE_ENUM_VOCAL = 28;
our $GENRE_ENUM_JAZZ_FUNK = 29;
our $GENRE_ENUM_FUSION = 30;
our $GENRE_ENUM_TRANCE = 31;
our $GENRE_ENUM_CLASSICAL = 32;
our $GENRE_ENUM_INSTRUMENTAL = 33;
our $GENRE_ENUM_ACID = 34;
our $GENRE_ENUM_HOUSE = 35;
our $GENRE_ENUM_GAME = 36;
our $GENRE_ENUM_SOUND_CLIP = 37;
our $GENRE_ENUM_GOSPEL = 38;
our $GENRE_ENUM_NOISE = 39;
our $GENRE_ENUM_ALTERNROCK = 40;
our $GENRE_ENUM_BASS = 41;
our $GENRE_ENUM_SOUL = 42;
our $GENRE_ENUM_PUNK = 43;
our $GENRE_ENUM_SPACE = 44;
our $GENRE_ENUM_MEDITATIVE = 45;
our $GENRE_ENUM_INSTRUMENTAL_POP = 46;
our $GENRE_ENUM_INSTRUMENTAL_ROCK = 47;
our $GENRE_ENUM_ETHNIC = 48;
our $GENRE_ENUM_GOTHIC = 49;
our $GENRE_ENUM_DARKWAVE = 50;
our $GENRE_ENUM_TECHNO_INDUSTRIAL = 51;
our $GENRE_ENUM_ELECTRONIC = 52;
our $GENRE_ENUM_POP_FOLK = 53;
our $GENRE_ENUM_EURODANCE = 54;
our $GENRE_ENUM_DREAM = 55;
our $GENRE_ENUM_SOUTHERN_ROCK = 56;
our $GENRE_ENUM_COMEDY = 57;
our $GENRE_ENUM_CULT = 58;
our $GENRE_ENUM_GANGSTA = 59;
our $GENRE_ENUM_TOP_40 = 60;
our $GENRE_ENUM_CHRISTIAN_RAP = 61;
our $GENRE_ENUM_POP_FUNK = 62;
our $GENRE_ENUM_JUNGLE = 63;
our $GENRE_ENUM_NATIVE_AMERICAN = 64;
our $GENRE_ENUM_CABARET = 65;
our $GENRE_ENUM_NEW_WAVE = 66;
our $GENRE_ENUM_PSYCHADELIC = 67;
our $GENRE_ENUM_RAVE = 68;
our $GENRE_ENUM_SHOWTUNES = 69;
our $GENRE_ENUM_TRAILER = 70;
our $GENRE_ENUM_LO_FI = 71;
our $GENRE_ENUM_TRIBAL = 72;
our $GENRE_ENUM_ACID_PUNK = 73;
our $GENRE_ENUM_ACID_JAZZ = 74;
our $GENRE_ENUM_POLKA = 75;
our $GENRE_ENUM_RETRO = 76;
our $GENRE_ENUM_MUSICAL = 77;
our $GENRE_ENUM_ROCK_N_ROLL = 78;
our $GENRE_ENUM_HARD_ROCK = 79;
our $GENRE_ENUM_FOLK = 80;
our $GENRE_ENUM_FOLK_ROCK = 81;
our $GENRE_ENUM_NATIONAL_FOLK = 82;
our $GENRE_ENUM_SWING = 83;
our $GENRE_ENUM_FAST_FUSION = 84;
our $GENRE_ENUM_BEBOB = 85;
our $GENRE_ENUM_LATIN = 86;
our $GENRE_ENUM_REVIVAL = 87;
our $GENRE_ENUM_CELTIC = 88;
our $GENRE_ENUM_BLUEGRASS = 89;
our $GENRE_ENUM_AVANTGARDE = 90;
our $GENRE_ENUM_GOTHIC_ROCK = 91;
our $GENRE_ENUM_PROGRESSIVE_ROCK = 92;
our $GENRE_ENUM_PSYCHEDELIC_ROCK = 93;
our $GENRE_ENUM_SYMPHONIC_ROCK = 94;
our $GENRE_ENUM_SLOW_ROCK = 95;
our $GENRE_ENUM_BIG_BAND = 96;
our $GENRE_ENUM_CHORUS = 97;
our $GENRE_ENUM_EASY_LISTENING = 98;
our $GENRE_ENUM_ACOUSTIC = 99;
our $GENRE_ENUM_HUMOUR = 100;
our $GENRE_ENUM_SPEECH = 101;
our $GENRE_ENUM_CHANSON = 102;
our $GENRE_ENUM_OPERA = 103;
our $GENRE_ENUM_CHAMBER_MUSIC = 104;
our $GENRE_ENUM_SONATA = 105;
our $GENRE_ENUM_SYMPHONY = 106;
our $GENRE_ENUM_BOOTY_BASS = 107;
our $GENRE_ENUM_PRIMUS = 108;
our $GENRE_ENUM_PORN_GROOVE = 109;
our $GENRE_ENUM_SATIRE = 110;
our $GENRE_ENUM_SLOW_JAM = 111;
our $GENRE_ENUM_CLUB = 112;
our $GENRE_ENUM_TANGO = 113;
our $GENRE_ENUM_SAMBA = 114;
our $GENRE_ENUM_FOLKLORE = 115;
our $GENRE_ENUM_BALLAD = 116;
our $GENRE_ENUM_POWER_BALLAD = 117;
our $GENRE_ENUM_RHYTHMIC_SOUL = 118;
our $GENRE_ENUM_FREESTYLE = 119;
our $GENRE_ENUM_DUET = 120;
our $GENRE_ENUM_PUNK_ROCK = 121;
our $GENRE_ENUM_DRUM_SOLO = 122;
our $GENRE_ENUM_A_CAPELLA = 123;
our $GENRE_ENUM_EURO_HOUSE = 124;
our $GENRE_ENUM_DANCE_HALL = 125;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (84, 65, 71)));
    $self->{title} = $self->{_io}->read_bytes(30);
    $self->{artist} = $self->{_io}->read_bytes(30);
    $self->{album} = $self->{_io}->read_bytes(30);
    $self->{year} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{comment} = $self->{_io}->read_bytes(30);
    $self->{genre} = $self->{_io}->read_u1();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub title {
    my ($self) = @_;
    return $self->{title};
}

sub artist {
    my ($self) = @_;
    return $self->{artist};
}

sub album {
    my ($self) = @_;
    return $self->{album};
}

sub year {
    my ($self) = @_;
    return $self->{year};
}

sub comment {
    my ($self) = @_;
    return $self->{comment};
}

sub genre {
    my ($self) = @_;
    return $self->{genre};
}

1;
