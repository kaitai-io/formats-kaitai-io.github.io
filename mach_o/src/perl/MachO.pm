# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package MachO;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $MAGIC_TYPE_FAT_LE = 3199925962;
our $MAGIC_TYPE_FAT_BE = 3405691582;
our $MAGIC_TYPE_MACHO_LE_X86 = 3472551422;
our $MAGIC_TYPE_MACHO_LE_X64 = 3489328638;
our $MAGIC_TYPE_MACHO_BE_X86 = 4277009102;
our $MAGIC_TYPE_MACHO_BE_X64 = 4277009103;

our $CPU_TYPE_VAX = 1;
our $CPU_TYPE_ROMP = 2;
our $CPU_TYPE_NS32032 = 4;
our $CPU_TYPE_NS32332 = 5;
our $CPU_TYPE_I386 = 7;
our $CPU_TYPE_MIPS = 8;
our $CPU_TYPE_NS32532 = 9;
our $CPU_TYPE_HPPA = 11;
our $CPU_TYPE_ARM = 12;
our $CPU_TYPE_MC88000 = 13;
our $CPU_TYPE_SPARC = 14;
our $CPU_TYPE_I860 = 15;
our $CPU_TYPE_I860_LITTLE = 16;
our $CPU_TYPE_RS6000 = 17;
our $CPU_TYPE_POWERPC = 18;
our $CPU_TYPE_ABI64 = 16777216;
our $CPU_TYPE_X86_64 = 16777223;
our $CPU_TYPE_ARM64 = 16777228;
our $CPU_TYPE_POWERPC64 = 16777234;
our $CPU_TYPE_ANY = 4294967295;

our $FILE_TYPE_OBJECT = 1;
our $FILE_TYPE_EXECUTE = 2;
our $FILE_TYPE_FVMLIB = 3;
our $FILE_TYPE_CORE = 4;
our $FILE_TYPE_PRELOAD = 5;
our $FILE_TYPE_DYLIB = 6;
our $FILE_TYPE_DYLINKER = 7;
our $FILE_TYPE_BUNDLE = 8;
our $FILE_TYPE_DYLIB_STUB = 9;
our $FILE_TYPE_DSYM = 10;
our $FILE_TYPE_KEXT_BUNDLE = 11;

our $LOAD_COMMAND_TYPE_SEGMENT = 1;
our $LOAD_COMMAND_TYPE_SYMTAB = 2;
our $LOAD_COMMAND_TYPE_SYMSEG = 3;
our $LOAD_COMMAND_TYPE_THREAD = 4;
our $LOAD_COMMAND_TYPE_UNIX_THREAD = 5;
our $LOAD_COMMAND_TYPE_LOAD_FVM_LIB = 6;
our $LOAD_COMMAND_TYPE_ID_FVM_LIB = 7;
our $LOAD_COMMAND_TYPE_IDENT = 8;
our $LOAD_COMMAND_TYPE_FVM_FILE = 9;
our $LOAD_COMMAND_TYPE_PREPAGE = 10;
our $LOAD_COMMAND_TYPE_DYSYMTAB = 11;
our $LOAD_COMMAND_TYPE_LOAD_DYLIB = 12;
our $LOAD_COMMAND_TYPE_ID_DYLIB = 13;
our $LOAD_COMMAND_TYPE_LOAD_DYLINKER = 14;
our $LOAD_COMMAND_TYPE_ID_DYLINKER = 15;
our $LOAD_COMMAND_TYPE_PREBOUND_DYLIB = 16;
our $LOAD_COMMAND_TYPE_ROUTINES = 17;
our $LOAD_COMMAND_TYPE_SUB_FRAMEWORK = 18;
our $LOAD_COMMAND_TYPE_SUB_UMBRELLA = 19;
our $LOAD_COMMAND_TYPE_SUB_CLIENT = 20;
our $LOAD_COMMAND_TYPE_SUB_LIBRARY = 21;
our $LOAD_COMMAND_TYPE_TWOLEVEL_HINTS = 22;
our $LOAD_COMMAND_TYPE_PREBIND_CKSUM = 23;
our $LOAD_COMMAND_TYPE_SEGMENT_64 = 25;
our $LOAD_COMMAND_TYPE_ROUTINES_64 = 26;
our $LOAD_COMMAND_TYPE_UUID = 27;
our $LOAD_COMMAND_TYPE_CODE_SIGNATURE = 29;
our $LOAD_COMMAND_TYPE_SEGMENT_SPLIT_INFO = 30;
our $LOAD_COMMAND_TYPE_LAZY_LOAD_DYLIB = 32;
our $LOAD_COMMAND_TYPE_ENCRYPTION_INFO = 33;
our $LOAD_COMMAND_TYPE_DYLD_INFO = 34;
our $LOAD_COMMAND_TYPE_VERSION_MIN_MACOSX = 36;
our $LOAD_COMMAND_TYPE_VERSION_MIN_IPHONEOS = 37;
our $LOAD_COMMAND_TYPE_FUNCTION_STARTS = 38;
our $LOAD_COMMAND_TYPE_DYLD_ENVIRONMENT = 39;
our $LOAD_COMMAND_TYPE_DATA_IN_CODE = 41;
our $LOAD_COMMAND_TYPE_SOURCE_VERSION = 42;
our $LOAD_COMMAND_TYPE_DYLIB_CODE_SIGN_DRS = 43;
our $LOAD_COMMAND_TYPE_ENCRYPTION_INFO_64 = 44;
our $LOAD_COMMAND_TYPE_LINKER_OPTION = 45;
our $LOAD_COMMAND_TYPE_LINKER_OPTIMIZATION_HINT = 46;
our $LOAD_COMMAND_TYPE_VERSION_MIN_TVOS = 47;
our $LOAD_COMMAND_TYPE_VERSION_MIN_WATCHOS = 48;
our $LOAD_COMMAND_TYPE_REQ_DYLD = 2147483648;
our $LOAD_COMMAND_TYPE_LOAD_WEAK_DYLIB = 2147483672;
our $LOAD_COMMAND_TYPE_RPATH = 2147483676;
our $LOAD_COMMAND_TYPE_REEXPORT_DYLIB = 2147483679;
our $LOAD_COMMAND_TYPE_DYLD_INFO_ONLY = 2147483682;
our $LOAD_COMMAND_TYPE_LOAD_UPWARD_DYLIB = 2147483683;
our $LOAD_COMMAND_TYPE_MAIN = 2147483688;

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

    $self->{magic} = $self->{_io}->read_u4be();
    $self->{header} = MachO::MachHeader->new($self->{_io}, $self, $self->{_root});
    $self->{load_commands} = ();
    my $n_load_commands = $self->header()->ncmds();
    for (my $i = 0; $i < $n_load_commands; $i++) {
        $self->{load_commands}[$i] = MachO::LoadCommand->new($self->{_io}, $self, $self->{_root});
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub load_commands {
    my ($self) = @_;
    return $self->{load_commands};
}

########################################################################
package MachO::RpathCommand;

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

    $self->{path_offset} = $self->{_io}->read_u4le();
    $self->{path} = Encode::decode("utf-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub path_offset {
    my ($self) = @_;
    return $self->{path_offset};
}

sub path {
    my ($self) = @_;
    return $self->{path};
}

########################################################################
package MachO::Uleb128;

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
    if (($self->b1() & 128) != 0) {
        $self->{b2} = $self->{_io}->read_u1();
    }
    if (($self->b2() & 128) != 0) {
        $self->{b3} = $self->{_io}->read_u1();
    }
    if (($self->b3() & 128) != 0) {
        $self->{b4} = $self->{_io}->read_u1();
    }
    if (($self->b4() & 128) != 0) {
        $self->{b5} = $self->{_io}->read_u1();
    }
    if (($self->b5() & 128) != 0) {
        $self->{b6} = $self->{_io}->read_u1();
    }
    if (($self->b6() & 128) != 0) {
        $self->{b7} = $self->{_io}->read_u1();
    }
    if (($self->b7() & 128) != 0) {
        $self->{b8} = $self->{_io}->read_u1();
    }
    if (($self->b8() & 128) != 0) {
        $self->{b9} = $self->{_io}->read_u1();
    }
    if (($self->b9() & 128) != 0) {
        $self->{b10} = $self->{_io}->read_u1();
    }
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = ((($self->b1() % 128) << 0) + (($self->b1() & 128) == 0 ? 0 : ((($self->b2() % 128) << 7) + (($self->b2() & 128) == 0 ? 0 : ((($self->b3() % 128) << 14) + (($self->b3() & 128) == 0 ? 0 : ((($self->b4() % 128) << 21) + (($self->b4() & 128) == 0 ? 0 : ((($self->b5() % 128) << 28) + (($self->b5() & 128) == 0 ? 0 : ((($self->b6() % 128) << 35) + (($self->b6() & 128) == 0 ? 0 : ((($self->b7() % 128) << 42) + (($self->b7() & 128) == 0 ? 0 : ((($self->b8() % 128) << 49) + (($self->b8() & 128) == 0 ? 0 : ((($self->b9() % 128) << 56) + (($self->b8() & 128) == 0 ? 0 : (($self->b10() % 128) << 63)))))))))))))))))));
    return $self->{value};
}

sub b1 {
    my ($self) = @_;
    return $self->{b1};
}

sub b2 {
    my ($self) = @_;
    return $self->{b2};
}

sub b3 {
    my ($self) = @_;
    return $self->{b3};
}

sub b4 {
    my ($self) = @_;
    return $self->{b4};
}

sub b5 {
    my ($self) = @_;
    return $self->{b5};
}

sub b6 {
    my ($self) = @_;
    return $self->{b6};
}

sub b7 {
    my ($self) = @_;
    return $self->{b7};
}

sub b8 {
    my ($self) = @_;
    return $self->{b8};
}

sub b9 {
    my ($self) = @_;
    return $self->{b9};
}

sub b10 {
    my ($self) = @_;
    return $self->{b10};
}

########################################################################
package MachO::SourceVersionCommand;

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

    $self->{version} = $self->{_io}->read_u8le();
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

########################################################################
package MachO::CsBlob;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CS_MAGIC_BLOB_WRAPPER = 4208855809;
our $CS_MAGIC_REQUIREMENT = 4208856064;
our $CS_MAGIC_REQUIREMENTS = 4208856065;
our $CS_MAGIC_CODE_DIRECTORY = 4208856066;
our $CS_MAGIC_EMBEDDED_SIGNATURE = 4208856256;
our $CS_MAGIC_DETACHED_SIGNATURE = 4208856257;
our $CS_MAGIC_ENTITLEMENT = 4208882033;

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

    $self->{magic} = $self->{_io}->read_u4be();
    $self->{length} = $self->{_io}->read_u4be();
    my $_on = $self->magic();
    if ($_on == $MachO::CsBlob::CS_MAGIC_REQUIREMENT) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->length() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::CsBlob::Requirement->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::CS_MAGIC_CODE_DIRECTORY) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->length() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::CsBlob::CodeDirectory->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::CS_MAGIC_ENTITLEMENT) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->length() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::CsBlob::Entitlement->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::CS_MAGIC_REQUIREMENTS) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->length() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::CsBlob::Requirements->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::CS_MAGIC_BLOB_WRAPPER) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->length() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::CsBlob::BlobWrapper->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::CS_MAGIC_EMBEDDED_SIGNATURE) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->length() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::CsBlob::SuperBlob->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::CS_MAGIC_DETACHED_SIGNATURE) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->length() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::CsBlob::SuperBlob->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes(($self->length() - 8));
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package MachO::CsBlob::Entitlement;

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

    $self->{data} = $self->{_io}->read_bytes_full();
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package MachO::CsBlob::CodeDirectory;

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

    $self->{version} = $self->{_io}->read_u4be();
    $self->{flags} = $self->{_io}->read_u4be();
    $self->{hash_offset} = $self->{_io}->read_u4be();
    $self->{ident_offset} = $self->{_io}->read_u4be();
    $self->{n_special_slots} = $self->{_io}->read_u4be();
    $self->{n_code_slots} = $self->{_io}->read_u4be();
    $self->{code_limit} = $self->{_io}->read_u4be();
    $self->{hash_size} = $self->{_io}->read_u1();
    $self->{hash_type} = $self->{_io}->read_u1();
    $self->{spare1} = $self->{_io}->read_u1();
    $self->{page_size} = $self->{_io}->read_u1();
    $self->{spare2} = $self->{_io}->read_u4be();
    if ($self->version() >= 131328) {
        $self->{scatter_offset} = $self->{_io}->read_u4be();
    }
    if ($self->version() >= 131584) {
        $self->{team_id_offset} = $self->{_io}->read_u4be();
    }
}

sub ident {
    my ($self) = @_;
    return $self->{ident} if ($self->{ident});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->ident_offset() - 8));
    $self->{ident} = Encode::decode("utf-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{_io}->seek($_pos);
    return $self->{ident};
}

sub team_id {
    my ($self) = @_;
    return $self->{team_id} if ($self->{team_id});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->team_id_offset() - 8));
    $self->{team_id} = Encode::decode("utf-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{_io}->seek($_pos);
    return $self->{team_id};
}

sub hashes {
    my ($self) = @_;
    return $self->{hashes} if ($self->{hashes});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek((($self->hash_offset() - 8) - ($self->hash_size() * $self->n_special_slots())));
    $self->{hashes} = ();
    my $n_hashes = ($self->n_special_slots() + $self->n_code_slots());
    for (my $i = 0; $i < $n_hashes; $i++) {
        $self->{hashes}[$i] = $self->{_io}->read_bytes($self->hash_size());
    }
    $self->{_io}->seek($_pos);
    return $self->{hashes};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub hash_offset {
    my ($self) = @_;
    return $self->{hash_offset};
}

sub ident_offset {
    my ($self) = @_;
    return $self->{ident_offset};
}

sub n_special_slots {
    my ($self) = @_;
    return $self->{n_special_slots};
}

sub n_code_slots {
    my ($self) = @_;
    return $self->{n_code_slots};
}

sub code_limit {
    my ($self) = @_;
    return $self->{code_limit};
}

sub hash_size {
    my ($self) = @_;
    return $self->{hash_size};
}

sub hash_type {
    my ($self) = @_;
    return $self->{hash_type};
}

sub spare1 {
    my ($self) = @_;
    return $self->{spare1};
}

sub page_size {
    my ($self) = @_;
    return $self->{page_size};
}

sub spare2 {
    my ($self) = @_;
    return $self->{spare2};
}

sub scatter_offset {
    my ($self) = @_;
    return $self->{scatter_offset};
}

sub team_id_offset {
    my ($self) = @_;
    return $self->{team_id_offset};
}

########################################################################
package MachO::CsBlob::Data;

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

    $self->{length} = $self->{_io}->read_u4be();
    $self->{value} = $self->{_io}->read_bytes($self->length());
    $self->{padding} = $self->{_io}->read_bytes((4 - ($self->length() & 3)));
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

########################################################################
package MachO::CsBlob::SuperBlob;

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

    $self->{count} = $self->{_io}->read_u4be();
    $self->{blobs} = ();
    my $n_blobs = $self->count();
    for (my $i = 0; $i < $n_blobs; $i++) {
        $self->{blobs}[$i] = MachO::CsBlob::BlobIndex->new($self->{_io}, $self, $self->{_root});
    }
}

sub count {
    my ($self) = @_;
    return $self->{count};
}

sub blobs {
    my ($self) = @_;
    return $self->{blobs};
}

########################################################################
package MachO::CsBlob::Expr;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OP_ENUM_FALSE = 0;
our $OP_ENUM_TRUE = 1;
our $OP_ENUM_IDENT = 2;
our $OP_ENUM_APPLE_ANCHOR = 3;
our $OP_ENUM_ANCHOR_HASH = 4;
our $OP_ENUM_INFO_KEY_VALUE = 5;
our $OP_ENUM_AND_OP = 6;
our $OP_ENUM_OR_OP = 7;
our $OP_ENUM_CD_HASH = 8;
our $OP_ENUM_NOT_OP = 9;
our $OP_ENUM_INFO_KEY_FIELD = 10;
our $OP_ENUM_CERT_FIELD = 11;
our $OP_ENUM_TRUSTED_CERT = 12;
our $OP_ENUM_TRUSTED_CERTS = 13;
our $OP_ENUM_CERT_GENERIC = 14;
our $OP_ENUM_APPLE_GENERIC_ANCHOR = 15;
our $OP_ENUM_ENTITLEMENT_FIELD = 16;

our $CERT_SLOT_LEFT_CERT = 0;
our $CERT_SLOT_ANCHOR_CERT = 4294967295;

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

    $self->{op} = $self->{_io}->read_u4be();
    my $_on = $self->op();
    if ($_on == $MachO::CsBlob::Expr::OP_ENUM_IDENT) {
        $self->{data} = MachO::CsBlob::Expr::IdentExpr->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::Expr::OP_ENUM_OR_OP) {
        $self->{data} = MachO::CsBlob::Expr::OrExpr->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::Expr::OP_ENUM_INFO_KEY_VALUE) {
        $self->{data} = MachO::CsBlob::Data->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::Expr::OP_ENUM_ANCHOR_HASH) {
        $self->{data} = MachO::CsBlob::Expr::AnchorHashExpr->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::Expr::OP_ENUM_INFO_KEY_FIELD) {
        $self->{data} = MachO::CsBlob::Expr::InfoKeyFieldExpr->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::Expr::OP_ENUM_NOT_OP) {
        $self->{data} = MachO::CsBlob::Expr->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::Expr::OP_ENUM_ENTITLEMENT_FIELD) {
        $self->{data} = MachO::CsBlob::Expr::EntitlementFieldExpr->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::Expr::OP_ENUM_TRUSTED_CERT) {
        $self->{data} = MachO::CsBlob::Expr::CertSlotExpr->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::Expr::OP_ENUM_AND_OP) {
        $self->{data} = MachO::CsBlob::Expr::AndExpr->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::Expr::OP_ENUM_CERT_GENERIC) {
        $self->{data} = MachO::CsBlob::Expr::CertGenericExpr->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::Expr::OP_ENUM_CERT_FIELD) {
        $self->{data} = MachO::CsBlob::Expr::CertFieldExpr->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::Expr::OP_ENUM_CD_HASH) {
        $self->{data} = MachO::CsBlob::Data->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $MachO::CsBlob::Expr::OP_ENUM_APPLE_GENERIC_ANCHOR) {
        $self->{data} = MachO::CsBlob::Expr::AppleGenericAnchorExpr->new($self->{_io}, $self, $self->{_root});
    }
}

sub op {
    my ($self) = @_;
    return $self->{op};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package MachO::CsBlob::Expr::InfoKeyFieldExpr;

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

    $self->{data} = MachO::CsBlob::Data->new($self->{_io}, $self, $self->{_root});
    $self->{match} = MachO::CsBlob::Match->new($self->{_io}, $self, $self->{_root});
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub match {
    my ($self) = @_;
    return $self->{match};
}

########################################################################
package MachO::CsBlob::Expr::CertSlotExpr;

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

    $self->{value} = $self->{_io}->read_u4be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package MachO::CsBlob::Expr::CertGenericExpr;

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

    $self->{cert_slot} = $self->{_io}->read_u4be();
    $self->{data} = MachO::CsBlob::Data->new($self->{_io}, $self, $self->{_root});
    $self->{match} = MachO::CsBlob::Match->new($self->{_io}, $self, $self->{_root});
}

sub cert_slot {
    my ($self) = @_;
    return $self->{cert_slot};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub match {
    my ($self) = @_;
    return $self->{match};
}

########################################################################
package MachO::CsBlob::Expr::IdentExpr;

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

    $self->{identifier} = MachO::CsBlob::Data->new($self->{_io}, $self, $self->{_root});
}

sub identifier {
    my ($self) = @_;
    return $self->{identifier};
}

########################################################################
package MachO::CsBlob::Expr::CertFieldExpr;

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

    $self->{cert_slot} = $self->{_io}->read_u4be();
    $self->{data} = MachO::CsBlob::Data->new($self->{_io}, $self, $self->{_root});
    $self->{match} = MachO::CsBlob::Match->new($self->{_io}, $self, $self->{_root});
}

sub cert_slot {
    my ($self) = @_;
    return $self->{cert_slot};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub match {
    my ($self) = @_;
    return $self->{match};
}

########################################################################
package MachO::CsBlob::Expr::AnchorHashExpr;

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

    $self->{cert_slot} = $self->{_io}->read_u4be();
    $self->{data} = MachO::CsBlob::Data->new($self->{_io}, $self, $self->{_root});
}

sub cert_slot {
    my ($self) = @_;
    return $self->{cert_slot};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package MachO::CsBlob::Expr::AppleGenericAnchorExpr;

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

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = "anchor apple generic";
    return $self->{value};
}

########################################################################
package MachO::CsBlob::Expr::EntitlementFieldExpr;

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

    $self->{data} = MachO::CsBlob::Data->new($self->{_io}, $self, $self->{_root});
    $self->{match} = MachO::CsBlob::Match->new($self->{_io}, $self, $self->{_root});
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub match {
    my ($self) = @_;
    return $self->{match};
}

########################################################################
package MachO::CsBlob::Expr::AndExpr;

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

    $self->{left} = MachO::CsBlob::Expr->new($self->{_io}, $self, $self->{_root});
    $self->{right} = MachO::CsBlob::Expr->new($self->{_io}, $self, $self->{_root});
}

sub left {
    my ($self) = @_;
    return $self->{left};
}

sub right {
    my ($self) = @_;
    return $self->{right};
}

########################################################################
package MachO::CsBlob::Expr::OrExpr;

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

    $self->{left} = MachO::CsBlob::Expr->new($self->{_io}, $self, $self->{_root});
    $self->{right} = MachO::CsBlob::Expr->new($self->{_io}, $self, $self->{_root});
}

sub left {
    my ($self) = @_;
    return $self->{left};
}

sub right {
    my ($self) = @_;
    return $self->{right};
}

########################################################################
package MachO::CsBlob::BlobIndex;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CSSLOT_TYPE_CODE_DIRECTORY = 0;
our $CSSLOT_TYPE_INFO_SLOT = 1;
our $CSSLOT_TYPE_REQUIREMENTS = 2;
our $CSSLOT_TYPE_RESOURCE_DIR = 3;
our $CSSLOT_TYPE_APPLICATION = 4;
our $CSSLOT_TYPE_ENTITLEMENTS = 5;
our $CSSLOT_TYPE_ALTERNATE_CODE_DIRECTORIES = 4096;
our $CSSLOT_TYPE_SIGNATURE_SLOT = 65536;

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

    $self->{type} = $self->{_io}->read_u4be();
    $self->{offset} = $self->{_io}->read_u4be();
}

sub blob {
    my ($self) = @_;
    return $self->{blob} if ($self->{blob});
    my $io = $self->_parent()->_io();
    my $_pos = $io->pos();
    $io->seek(($self->offset() - 8));
    $self->{_raw_blob} = $io->read_bytes_full();
    my $io__raw_blob = IO::KaitaiStruct::Stream->new($self->{_raw_blob});
    $self->{blob} = MachO::CsBlob->new($io__raw_blob, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{blob};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub _raw_blob {
    my ($self) = @_;
    return $self->{_raw_blob};
}

########################################################################
package MachO::CsBlob::Match;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OP_EXISTS = 0;
our $OP_EQUAL = 1;
our $OP_CONTAINS = 2;
our $OP_BEGINS_WITH = 3;
our $OP_ENDS_WITH = 4;
our $OP_LESS_THAN = 5;
our $OP_GREATER_THAN = 6;
our $OP_LESS_EQUAL = 7;
our $OP_GREATER_EQUAL = 8;

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

    $self->{match_op} = $self->{_io}->read_u4be();
    if ($self->match_op() != $MachO::CsBlob::Match::OP_EXISTS) {
        $self->{data} = MachO::CsBlob::Data->new($self->{_io}, $self, $self->{_root});
    }
}

sub match_op {
    my ($self) = @_;
    return $self->{match_op};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package MachO::CsBlob::Requirement;

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

    $self->{kind} = $self->{_io}->read_u4be();
    $self->{expr} = MachO::CsBlob::Expr->new($self->{_io}, $self, $self->{_root});
}

sub kind {
    my ($self) = @_;
    return $self->{kind};
}

sub expr {
    my ($self) = @_;
    return $self->{expr};
}

########################################################################
package MachO::CsBlob::Requirements;

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

    $self->{count} = $self->{_io}->read_u4be();
    $self->{items} = ();
    my $n_items = $self->count();
    for (my $i = 0; $i < $n_items; $i++) {
        $self->{items}[$i] = MachO::CsBlob::RequirementsBlobIndex->new($self->{_io}, $self, $self->{_root});
    }
}

sub count {
    my ($self) = @_;
    return $self->{count};
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package MachO::CsBlob::BlobWrapper;

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

    $self->{data} = $self->{_io}->read_bytes_full();
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package MachO::CsBlob::RequirementsBlobIndex;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $REQUIREMENT_TYPE_HOST = 1;
our $REQUIREMENT_TYPE_GUEST = 2;
our $REQUIREMENT_TYPE_DESIGNATED = 3;
our $REQUIREMENT_TYPE_LIBRARY = 4;

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

    $self->{type} = $self->{_io}->read_u4be();
    $self->{offset} = $self->{_io}->read_u4be();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->offset() - 8));
    $self->{value} = MachO::CsBlob->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{value};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

########################################################################
package MachO::RoutinesCommand;

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

    $self->{init_address} = $self->{_io}->read_u4le();
    $self->{init_module} = $self->{_io}->read_u4le();
    $self->{reserved} = $self->{_io}->read_bytes(24);
}

sub init_address {
    my ($self) = @_;
    return $self->{init_address};
}

sub init_module {
    my ($self) = @_;
    return $self->{init_module};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package MachO::MachoFlags;

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

sub subsections_via_symbols {
    my ($self) = @_;
    return $self->{subsections_via_symbols} if ($self->{subsections_via_symbols});
    $self->{subsections_via_symbols} = ($self->value() & 8192) != 0;
    return $self->{subsections_via_symbols};
}

sub dead_strippable_dylib {
    my ($self) = @_;
    return $self->{dead_strippable_dylib} if ($self->{dead_strippable_dylib});
    $self->{dead_strippable_dylib} = ($self->value() & 4194304) != 0;
    return $self->{dead_strippable_dylib};
}

sub weak_defines {
    my ($self) = @_;
    return $self->{weak_defines} if ($self->{weak_defines});
    $self->{weak_defines} = ($self->value() & 32768) != 0;
    return $self->{weak_defines};
}

sub prebound {
    my ($self) = @_;
    return $self->{prebound} if ($self->{prebound});
    $self->{prebound} = ($self->value() & 16) != 0;
    return $self->{prebound};
}

sub all_mods_bound {
    my ($self) = @_;
    return $self->{all_mods_bound} if ($self->{all_mods_bound});
    $self->{all_mods_bound} = ($self->value() & 4096) != 0;
    return $self->{all_mods_bound};
}

sub has_tlv_descriptors {
    my ($self) = @_;
    return $self->{has_tlv_descriptors} if ($self->{has_tlv_descriptors});
    $self->{has_tlv_descriptors} = ($self->value() & 8388608) != 0;
    return $self->{has_tlv_descriptors};
}

sub force_flat {
    my ($self) = @_;
    return $self->{force_flat} if ($self->{force_flat});
    $self->{force_flat} = ($self->value() & 256) != 0;
    return $self->{force_flat};
}

sub root_safe {
    my ($self) = @_;
    return $self->{root_safe} if ($self->{root_safe});
    $self->{root_safe} = ($self->value() & 262144) != 0;
    return $self->{root_safe};
}

sub no_undefs {
    my ($self) = @_;
    return $self->{no_undefs} if ($self->{no_undefs});
    $self->{no_undefs} = ($self->value() & 1) != 0;
    return $self->{no_undefs};
}

sub setuid_safe {
    my ($self) = @_;
    return $self->{setuid_safe} if ($self->{setuid_safe});
    $self->{setuid_safe} = ($self->value() & 524288) != 0;
    return $self->{setuid_safe};
}

sub no_heap_execution {
    my ($self) = @_;
    return $self->{no_heap_execution} if ($self->{no_heap_execution});
    $self->{no_heap_execution} = ($self->value() & 16777216) != 0;
    return $self->{no_heap_execution};
}

sub no_reexported_dylibs {
    my ($self) = @_;
    return $self->{no_reexported_dylibs} if ($self->{no_reexported_dylibs});
    $self->{no_reexported_dylibs} = ($self->value() & 1048576) != 0;
    return $self->{no_reexported_dylibs};
}

sub no_multi_defs {
    my ($self) = @_;
    return $self->{no_multi_defs} if ($self->{no_multi_defs});
    $self->{no_multi_defs} = ($self->value() & 512) != 0;
    return $self->{no_multi_defs};
}

sub app_extension_safe {
    my ($self) = @_;
    return $self->{app_extension_safe} if ($self->{app_extension_safe});
    $self->{app_extension_safe} = ($self->value() & 33554432) != 0;
    return $self->{app_extension_safe};
}

sub prebindable {
    my ($self) = @_;
    return $self->{prebindable} if ($self->{prebindable});
    $self->{prebindable} = ($self->value() & 2048) != 0;
    return $self->{prebindable};
}

sub incr_link {
    my ($self) = @_;
    return $self->{incr_link} if ($self->{incr_link});
    $self->{incr_link} = ($self->value() & 2) != 0;
    return $self->{incr_link};
}

sub bind_at_load {
    my ($self) = @_;
    return $self->{bind_at_load} if ($self->{bind_at_load});
    $self->{bind_at_load} = ($self->value() & 8) != 0;
    return $self->{bind_at_load};
}

sub canonical {
    my ($self) = @_;
    return $self->{canonical} if ($self->{canonical});
    $self->{canonical} = ($self->value() & 16384) != 0;
    return $self->{canonical};
}

sub two_level {
    my ($self) = @_;
    return $self->{two_level} if ($self->{two_level});
    $self->{two_level} = ($self->value() & 128) != 0;
    return $self->{two_level};
}

sub split_segs {
    my ($self) = @_;
    return $self->{split_segs} if ($self->{split_segs});
    $self->{split_segs} = ($self->value() & 32) != 0;
    return $self->{split_segs};
}

sub lazy_init {
    my ($self) = @_;
    return $self->{lazy_init} if ($self->{lazy_init});
    $self->{lazy_init} = ($self->value() & 64) != 0;
    return $self->{lazy_init};
}

sub allow_stack_execution {
    my ($self) = @_;
    return $self->{allow_stack_execution} if ($self->{allow_stack_execution});
    $self->{allow_stack_execution} = ($self->value() & 131072) != 0;
    return $self->{allow_stack_execution};
}

sub binds_to_weak {
    my ($self) = @_;
    return $self->{binds_to_weak} if ($self->{binds_to_weak});
    $self->{binds_to_weak} = ($self->value() & 65536) != 0;
    return $self->{binds_to_weak};
}

sub no_fix_prebinding {
    my ($self) = @_;
    return $self->{no_fix_prebinding} if ($self->{no_fix_prebinding});
    $self->{no_fix_prebinding} = ($self->value() & 1024) != 0;
    return $self->{no_fix_prebinding};
}

sub dyld_link {
    my ($self) = @_;
    return $self->{dyld_link} if ($self->{dyld_link});
    $self->{dyld_link} = ($self->value() & 4) != 0;
    return $self->{dyld_link};
}

sub pie {
    my ($self) = @_;
    return $self->{pie} if ($self->{pie});
    $self->{pie} = ($self->value() & 2097152) != 0;
    return $self->{pie};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package MachO::RoutinesCommand64;

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

    $self->{init_address} = $self->{_io}->read_u8le();
    $self->{init_module} = $self->{_io}->read_u8le();
    $self->{reserved} = $self->{_io}->read_bytes(48);
}

sub init_address {
    my ($self) = @_;
    return $self->{init_address};
}

sub init_module {
    my ($self) = @_;
    return $self->{init_module};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package MachO::LinkerOptionCommand;

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

    $self->{num_strings} = $self->{_io}->read_u4le();
    $self->{strings} = ();
    my $n_strings = $self->num_strings();
    for (my $i = 0; $i < $n_strings; $i++) {
        $self->{strings}[$i] = Encode::decode("utf-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub num_strings {
    my ($self) = @_;
    return $self->{num_strings};
}

sub strings {
    my ($self) = @_;
    return $self->{strings};
}

########################################################################
package MachO::SegmentCommand64;

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

    $self->{segname} = Encode::decode("ascii", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(16), 0));
    $self->{vmaddr} = $self->{_io}->read_u8le();
    $self->{vmsize} = $self->{_io}->read_u8le();
    $self->{fileoff} = $self->{_io}->read_u8le();
    $self->{filesize} = $self->{_io}->read_u8le();
    $self->{maxprot} = MachO::VmProt->new($self->{_io}, $self, $self->{_root});
    $self->{initprot} = MachO::VmProt->new($self->{_io}, $self, $self->{_root});
    $self->{nsects} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u4le();
    $self->{sections} = ();
    my $n_sections = $self->nsects();
    for (my $i = 0; $i < $n_sections; $i++) {
        $self->{sections}[$i] = MachO::SegmentCommand64::Section64->new($self->{_io}, $self, $self->{_root});
    }
}

sub segname {
    my ($self) = @_;
    return $self->{segname};
}

sub vmaddr {
    my ($self) = @_;
    return $self->{vmaddr};
}

sub vmsize {
    my ($self) = @_;
    return $self->{vmsize};
}

sub fileoff {
    my ($self) = @_;
    return $self->{fileoff};
}

sub filesize {
    my ($self) = @_;
    return $self->{filesize};
}

sub maxprot {
    my ($self) = @_;
    return $self->{maxprot};
}

sub initprot {
    my ($self) = @_;
    return $self->{initprot};
}

sub nsects {
    my ($self) = @_;
    return $self->{nsects};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub sections {
    my ($self) = @_;
    return $self->{sections};
}

########################################################################
package MachO::SegmentCommand64::Section64;

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

    $self->{sect_name} = Encode::decode("ascii", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(16), 0));
    $self->{seg_name} = Encode::decode("ascii", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(16), 0));
    $self->{addr} = $self->{_io}->read_u8le();
    $self->{size} = $self->{_io}->read_u8le();
    $self->{offset} = $self->{_io}->read_u4le();
    $self->{align} = $self->{_io}->read_u4le();
    $self->{reloff} = $self->{_io}->read_u4le();
    $self->{nreloc} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u4le();
    $self->{reserved1} = $self->{_io}->read_u4le();
    $self->{reserved2} = $self->{_io}->read_u4le();
    $self->{reserved3} = $self->{_io}->read_u4le();
}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->offset());
    my $_on = $self->sect_name();
    if ($_on eq "__objc_nlclslist") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::PointerList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__objc_methname") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::StringList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__nl_symbol_ptr") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::PointerList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__la_symbol_ptr") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::PointerList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__objc_selrefs") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::PointerList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__cstring") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::StringList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__objc_classlist") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::PointerList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__objc_protolist") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::PointerList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__objc_imageinfo") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::PointerList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__objc_methtype") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::StringList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__cfstring") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::CfStringList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__objc_classrefs") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::PointerList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__objc_protorefs") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::PointerList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__objc_classname") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::StringList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__got") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::PointerList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__eh_frame") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::EhFrame->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "__objc_superrefs") {
        $self->{_raw_data} = $io->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = MachO::SegmentCommand64::Section64::PointerList->new($io__raw_data, $self, $self->{_root});
    }
    else {
        $self->{data} = $io->read_bytes($self->size());
    }
    $io->seek($_pos);
    return $self->{data};
}

sub sect_name {
    my ($self) = @_;
    return $self->{sect_name};
}

sub seg_name {
    my ($self) = @_;
    return $self->{seg_name};
}

sub addr {
    my ($self) = @_;
    return $self->{addr};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub align {
    my ($self) = @_;
    return $self->{align};
}

sub reloff {
    my ($self) = @_;
    return $self->{reloff};
}

sub nreloc {
    my ($self) = @_;
    return $self->{nreloc};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub reserved3 {
    my ($self) = @_;
    return $self->{reserved3};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

########################################################################
package MachO::SegmentCommand64::Section64::CfStringList;

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

    $self->{items} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{items}}, MachO::SegmentCommand64::Section64::CfString->new($self->{_io}, $self, $self->{_root});
    }
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package MachO::SegmentCommand64::Section64::CfString;

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

    $self->{isa} = $self->{_io}->read_u8le();
    $self->{info} = $self->{_io}->read_u8le();
    $self->{data} = $self->{_io}->read_u8le();
    $self->{length} = $self->{_io}->read_u8le();
}

sub isa {
    my ($self) = @_;
    return $self->{isa};
}

sub info {
    my ($self) = @_;
    return $self->{info};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

########################################################################
package MachO::SegmentCommand64::Section64::EhFrameItem;

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

    $self->{length} = $self->{_io}->read_u4le();
    if ($self->length() == 4294967295) {
        $self->{length64} = $self->{_io}->read_u8le();
    }
    $self->{id} = $self->{_io}->read_u4le();
    if ($self->length() > 0) {
        my $_on = $self->id();
        if ($_on == 0) {
            $self->{_raw_body} = $self->{_io}->read_bytes(($self->length() - 4));
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = MachO::SegmentCommand64::Section64::EhFrameItem::Cie->new($io__raw_body, $self, $self->{_root});
        }
        else {
            $self->{body} = $self->{_io}->read_bytes(($self->length() - 4));
        }
    }
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub length64 {
    my ($self) = @_;
    return $self->{length64};
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package MachO::SegmentCommand64::Section64::EhFrameItem::CharChain;

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

    $self->{chr} = $self->{_io}->read_u1();
    if ($self->chr() != 0) {
        $self->{next} = MachO::SegmentCommand64::Section64::EhFrameItem::CharChain->new($self->{_io}, $self, $self->{_root});
    }
}

sub chr {
    my ($self) = @_;
    return $self->{chr};
}

sub next {
    my ($self) = @_;
    return $self->{next};
}

########################################################################
package MachO::SegmentCommand64::Section64::EhFrameItem::Cie;

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

    $self->{version} = $self->{_io}->read_u1();
    $self->{aug_str} = MachO::SegmentCommand64::Section64::EhFrameItem::CharChain->new($self->{_io}, $self, $self->{_root});
    $self->{code_alignment_factor} = MachO::Uleb128->new($self->{_io}, $self, $self->{_root});
    $self->{data_alignment_factor} = MachO::Uleb128->new($self->{_io}, $self, $self->{_root});
    $self->{return_address_register} = $self->{_io}->read_u1();
    if ($self->aug_str()->chr() == 122) {
        $self->{augmentation} = MachO::SegmentCommand64::Section64::EhFrameItem::AugmentationEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub aug_str {
    my ($self) = @_;
    return $self->{aug_str};
}

sub code_alignment_factor {
    my ($self) = @_;
    return $self->{code_alignment_factor};
}

sub data_alignment_factor {
    my ($self) = @_;
    return $self->{data_alignment_factor};
}

sub return_address_register {
    my ($self) = @_;
    return $self->{return_address_register};
}

sub augmentation {
    my ($self) = @_;
    return $self->{augmentation};
}

########################################################################
package MachO::SegmentCommand64::Section64::EhFrameItem::AugmentationEntry;

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

    $self->{length} = MachO::Uleb128->new($self->{_io}, $self, $self->{_root});
    if ($self->_parent()->aug_str()->next()->chr() == 82) {
        $self->{fde_pointer_encoding} = $self->{_io}->read_u1();
    }
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub fde_pointer_encoding {
    my ($self) = @_;
    return $self->{fde_pointer_encoding};
}

########################################################################
package MachO::SegmentCommand64::Section64::EhFrame;

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

    $self->{items} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{items}}, MachO::SegmentCommand64::Section64::EhFrameItem->new($self->{_io}, $self, $self->{_root});
    }
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package MachO::SegmentCommand64::Section64::PointerList;

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

    $self->{items} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{items}}, $self->{_io}->read_u8le();
    }
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package MachO::SegmentCommand64::Section64::StringList;

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

    $self->{strings} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{strings}}, Encode::decode("ascii", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub strings {
    my ($self) = @_;
    return $self->{strings};
}

########################################################################
package MachO::VmProt;

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

    $self->{strip_read} = $self->{_io}->read_bits_int(1);
    $self->{is_mask} = $self->{_io}->read_bits_int(1);
    $self->{reserved0} = $self->{_io}->read_bits_int(1);
    $self->{copy} = $self->{_io}->read_bits_int(1);
    $self->{no_change} = $self->{_io}->read_bits_int(1);
    $self->{execute} = $self->{_io}->read_bits_int(1);
    $self->{write} = $self->{_io}->read_bits_int(1);
    $self->{read} = $self->{_io}->read_bits_int(1);
    $self->{reserved1} = $self->{_io}->read_bits_int(24);
}

sub strip_read {
    my ($self) = @_;
    return $self->{strip_read};
}

sub is_mask {
    my ($self) = @_;
    return $self->{is_mask};
}

sub reserved0 {
    my ($self) = @_;
    return $self->{reserved0};
}

sub copy {
    my ($self) = @_;
    return $self->{copy};
}

sub no_change {
    my ($self) = @_;
    return $self->{no_change};
}

sub execute {
    my ($self) = @_;
    return $self->{execute};
}

sub write {
    my ($self) = @_;
    return $self->{write};
}

sub read {
    my ($self) = @_;
    return $self->{read};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

########################################################################
package MachO::DysymtabCommand;

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

    $self->{i_local_sym} = $self->{_io}->read_u4le();
    $self->{n_local_sym} = $self->{_io}->read_u4le();
    $self->{i_ext_def_sym} = $self->{_io}->read_u4le();
    $self->{n_ext_def_sym} = $self->{_io}->read_u4le();
    $self->{i_undef_sym} = $self->{_io}->read_u4le();
    $self->{n_undef_sym} = $self->{_io}->read_u4le();
    $self->{toc_off} = $self->{_io}->read_u4le();
    $self->{n_toc} = $self->{_io}->read_u4le();
    $self->{mod_tab_off} = $self->{_io}->read_u4le();
    $self->{n_mod_tab} = $self->{_io}->read_u4le();
    $self->{ext_ref_sym_off} = $self->{_io}->read_u4le();
    $self->{n_ext_ref_syms} = $self->{_io}->read_u4le();
    $self->{indirect_sym_off} = $self->{_io}->read_u4le();
    $self->{n_indirect_syms} = $self->{_io}->read_u4le();
    $self->{ext_rel_off} = $self->{_io}->read_u4le();
    $self->{n_ext_rel} = $self->{_io}->read_u4le();
    $self->{loc_rel_off} = $self->{_io}->read_u4le();
    $self->{n_loc_rel} = $self->{_io}->read_u4le();
}

sub indirect_symbols {
    my ($self) = @_;
    return $self->{indirect_symbols} if ($self->{indirect_symbols});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->indirect_sym_off());
    $self->{indirect_symbols} = ();
    my $n_indirect_symbols = $self->n_indirect_syms();
    for (my $i = 0; $i < $n_indirect_symbols; $i++) {
        $self->{indirect_symbols}[$i] = $io->read_u4le();
    }
    $io->seek($_pos);
    return $self->{indirect_symbols};
}

sub i_local_sym {
    my ($self) = @_;
    return $self->{i_local_sym};
}

sub n_local_sym {
    my ($self) = @_;
    return $self->{n_local_sym};
}

sub i_ext_def_sym {
    my ($self) = @_;
    return $self->{i_ext_def_sym};
}

sub n_ext_def_sym {
    my ($self) = @_;
    return $self->{n_ext_def_sym};
}

sub i_undef_sym {
    my ($self) = @_;
    return $self->{i_undef_sym};
}

sub n_undef_sym {
    my ($self) = @_;
    return $self->{n_undef_sym};
}

sub toc_off {
    my ($self) = @_;
    return $self->{toc_off};
}

sub n_toc {
    my ($self) = @_;
    return $self->{n_toc};
}

sub mod_tab_off {
    my ($self) = @_;
    return $self->{mod_tab_off};
}

sub n_mod_tab {
    my ($self) = @_;
    return $self->{n_mod_tab};
}

sub ext_ref_sym_off {
    my ($self) = @_;
    return $self->{ext_ref_sym_off};
}

sub n_ext_ref_syms {
    my ($self) = @_;
    return $self->{n_ext_ref_syms};
}

sub indirect_sym_off {
    my ($self) = @_;
    return $self->{indirect_sym_off};
}

sub n_indirect_syms {
    my ($self) = @_;
    return $self->{n_indirect_syms};
}

sub ext_rel_off {
    my ($self) = @_;
    return $self->{ext_rel_off};
}

sub n_ext_rel {
    my ($self) = @_;
    return $self->{n_ext_rel};
}

sub loc_rel_off {
    my ($self) = @_;
    return $self->{loc_rel_off};
}

sub n_loc_rel {
    my ($self) = @_;
    return $self->{n_loc_rel};
}

########################################################################
package MachO::MachHeader;

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

    $self->{cputype} = $self->{_io}->read_u4le();
    $self->{cpusubtype} = $self->{_io}->read_u4le();
    $self->{filetype} = $self->{_io}->read_u4le();
    $self->{ncmds} = $self->{_io}->read_u4le();
    $self->{sizeofcmds} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u4le();
    if ( (($self->_root()->magic() == $MachO::MAGIC_TYPE_MACHO_BE_X64) || ($self->_root()->magic() == $MachO::MAGIC_TYPE_MACHO_LE_X64)) ) {
        $self->{reserved} = $self->{_io}->read_u4le();
    }
}

sub flags_obj {
    my ($self) = @_;
    return $self->{flags_obj} if ($self->{flags_obj});
    $self->{flags_obj} = MachO::MachoFlags->new($self->{_io}, $self, $self->{_root});
    return $self->{flags_obj};
}

sub cputype {
    my ($self) = @_;
    return $self->{cputype};
}

sub cpusubtype {
    my ($self) = @_;
    return $self->{cpusubtype};
}

sub filetype {
    my ($self) = @_;
    return $self->{filetype};
}

sub ncmds {
    my ($self) = @_;
    return $self->{ncmds};
}

sub sizeofcmds {
    my ($self) = @_;
    return $self->{sizeofcmds};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package MachO::LinkeditDataCommand;

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

    $self->{data_off} = $self->{_io}->read_u4le();
    $self->{data_size} = $self->{_io}->read_u4le();
}

sub data_off {
    my ($self) = @_;
    return $self->{data_off};
}

sub data_size {
    my ($self) = @_;
    return $self->{data_size};
}

########################################################################
package MachO::SubCommand;

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

    $self->{name} = MachO::LcStr->new($self->{_io}, $self, $self->{_root});
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

########################################################################
package MachO::TwolevelHintsCommand;

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

    $self->{offset} = $self->{_io}->read_u4le();
    $self->{num_hints} = $self->{_io}->read_u4le();
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub num_hints {
    my ($self) = @_;
    return $self->{num_hints};
}

########################################################################
package MachO::Version;

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

    $self->{p1} = $self->{_io}->read_u1();
    $self->{minor} = $self->{_io}->read_u1();
    $self->{major} = $self->{_io}->read_u1();
    $self->{release} = $self->{_io}->read_u1();
}

sub p1 {
    my ($self) = @_;
    return $self->{p1};
}

sub minor {
    my ($self) = @_;
    return $self->{minor};
}

sub major {
    my ($self) = @_;
    return $self->{major};
}

sub release {
    my ($self) = @_;
    return $self->{release};
}

########################################################################
package MachO::EncryptionInfoCommand;

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

    $self->{cryptoff} = $self->{_io}->read_u4le();
    $self->{cryptsize} = $self->{_io}->read_u4le();
    $self->{cryptid} = $self->{_io}->read_u4le();
    if ( (($self->_root()->magic() == $MachO::MAGIC_TYPE_MACHO_BE_X64) || ($self->_root()->magic() == $MachO::MAGIC_TYPE_MACHO_LE_X64)) ) {
        $self->{pad} = $self->{_io}->read_u4le();
    }
}

sub cryptoff {
    my ($self) = @_;
    return $self->{cryptoff};
}

sub cryptsize {
    my ($self) = @_;
    return $self->{cryptsize};
}

sub cryptid {
    my ($self) = @_;
    return $self->{cryptid};
}

sub pad {
    my ($self) = @_;
    return $self->{pad};
}

########################################################################
package MachO::CodeSignatureCommand;

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

    $self->{data_off} = $self->{_io}->read_u4le();
    $self->{data_size} = $self->{_io}->read_u4le();
}

sub code_signature {
    my ($self) = @_;
    return $self->{code_signature} if ($self->{code_signature});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->data_off());
    $self->{_raw_code_signature} = $io->read_bytes($self->data_size());
    my $io__raw_code_signature = IO::KaitaiStruct::Stream->new($self->{_raw_code_signature});
    $self->{code_signature} = MachO::CsBlob->new($io__raw_code_signature, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{code_signature};
}

sub data_off {
    my ($self) = @_;
    return $self->{data_off};
}

sub data_size {
    my ($self) = @_;
    return $self->{data_size};
}

sub _raw_code_signature {
    my ($self) = @_;
    return $self->{_raw_code_signature};
}

########################################################################
package MachO::DyldInfoCommand;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $BIND_OPCODE_DONE = 0;
our $BIND_OPCODE_SET_DYLIB_ORDINAL_IMMEDIATE = 16;
our $BIND_OPCODE_SET_DYLIB_ORDINAL_ULEB = 32;
our $BIND_OPCODE_SET_DYLIB_SPECIAL_IMMEDIATE = 48;
our $BIND_OPCODE_SET_SYMBOL_TRAILING_FLAGS_IMMEDIATE = 64;
our $BIND_OPCODE_SET_TYPE_IMMEDIATE = 80;
our $BIND_OPCODE_SET_APPEND_SLEB = 96;
our $BIND_OPCODE_SET_SEGMENT_AND_OFFSET_ULEB = 112;
our $BIND_OPCODE_ADD_ADDRESS_ULEB = 128;
our $BIND_OPCODE_DO_BIND = 144;
our $BIND_OPCODE_DO_BIND_ADD_ADDRESS_ULEB = 160;
our $BIND_OPCODE_DO_BIND_ADD_ADDRESS_IMMEDIATE_SCALED = 176;
our $BIND_OPCODE_DO_BIND_ULEB_TIMES_SKIPPING_ULEB = 192;

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

    $self->{rebase_off} = $self->{_io}->read_u4le();
    $self->{rebase_size} = $self->{_io}->read_u4le();
    $self->{bind_off} = $self->{_io}->read_u4le();
    $self->{bind_size} = $self->{_io}->read_u4le();
    $self->{weak_bind_off} = $self->{_io}->read_u4le();
    $self->{weak_bind_size} = $self->{_io}->read_u4le();
    $self->{lazy_bind_off} = $self->{_io}->read_u4le();
    $self->{lazy_bind_size} = $self->{_io}->read_u4le();
    $self->{export_off} = $self->{_io}->read_u4le();
    $self->{export_size} = $self->{_io}->read_u4le();
}

sub rebase {
    my ($self) = @_;
    return $self->{rebase} if ($self->{rebase});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->rebase_off());
    $self->{_raw_rebase} = $io->read_bytes($self->rebase_size());
    my $io__raw_rebase = IO::KaitaiStruct::Stream->new($self->{_raw_rebase});
    $self->{rebase} = MachO::DyldInfoCommand::RebaseData->new($io__raw_rebase, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{rebase};
}

sub bind {
    my ($self) = @_;
    return $self->{bind} if ($self->{bind});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->bind_off());
    $self->{_raw_bind} = $io->read_bytes($self->bind_size());
    my $io__raw_bind = IO::KaitaiStruct::Stream->new($self->{_raw_bind});
    $self->{bind} = MachO::DyldInfoCommand::BindData->new($io__raw_bind, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{bind};
}

sub lazy_bind {
    my ($self) = @_;
    return $self->{lazy_bind} if ($self->{lazy_bind});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->lazy_bind_off());
    $self->{_raw_lazy_bind} = $io->read_bytes($self->lazy_bind_size());
    my $io__raw_lazy_bind = IO::KaitaiStruct::Stream->new($self->{_raw_lazy_bind});
    $self->{lazy_bind} = MachO::DyldInfoCommand::LazyBindData->new($io__raw_lazy_bind, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{lazy_bind};
}

sub exports {
    my ($self) = @_;
    return $self->{exports} if ($self->{exports});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->export_off());
    $self->{_raw_exports} = $io->read_bytes($self->export_size());
    my $io__raw_exports = IO::KaitaiStruct::Stream->new($self->{_raw_exports});
    $self->{exports} = MachO::DyldInfoCommand::ExportNode->new($io__raw_exports, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{exports};
}

sub rebase_off {
    my ($self) = @_;
    return $self->{rebase_off};
}

sub rebase_size {
    my ($self) = @_;
    return $self->{rebase_size};
}

sub bind_off {
    my ($self) = @_;
    return $self->{bind_off};
}

sub bind_size {
    my ($self) = @_;
    return $self->{bind_size};
}

sub weak_bind_off {
    my ($self) = @_;
    return $self->{weak_bind_off};
}

sub weak_bind_size {
    my ($self) = @_;
    return $self->{weak_bind_size};
}

sub lazy_bind_off {
    my ($self) = @_;
    return $self->{lazy_bind_off};
}

sub lazy_bind_size {
    my ($self) = @_;
    return $self->{lazy_bind_size};
}

sub export_off {
    my ($self) = @_;
    return $self->{export_off};
}

sub export_size {
    my ($self) = @_;
    return $self->{export_size};
}

sub _raw_rebase {
    my ($self) = @_;
    return $self->{_raw_rebase};
}

sub _raw_bind {
    my ($self) = @_;
    return $self->{_raw_bind};
}

sub _raw_lazy_bind {
    my ($self) = @_;
    return $self->{_raw_lazy_bind};
}

sub _raw_exports {
    my ($self) = @_;
    return $self->{_raw_exports};
}

########################################################################
package MachO::DyldInfoCommand::BindItem;

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

    $self->{opcode_and_immediate} = $self->{_io}->read_u1();
    if ( (($self->opcode() == $MachO::DyldInfoCommand::BIND_OPCODE_SET_DYLIB_ORDINAL_ULEB) || ($self->opcode() == $MachO::DyldInfoCommand::BIND_OPCODE_SET_APPEND_SLEB) || ($self->opcode() == $MachO::DyldInfoCommand::BIND_OPCODE_SET_SEGMENT_AND_OFFSET_ULEB) || ($self->opcode() == $MachO::DyldInfoCommand::BIND_OPCODE_ADD_ADDRESS_ULEB) || ($self->opcode() == $MachO::DyldInfoCommand::BIND_OPCODE_DO_BIND_ADD_ADDRESS_ULEB) || ($self->opcode() == $MachO::DyldInfoCommand::BIND_OPCODE_DO_BIND_ULEB_TIMES_SKIPPING_ULEB)) ) {
        $self->{uleb} = MachO::Uleb128->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->opcode() == $MachO::DyldInfoCommand::BIND_OPCODE_DO_BIND_ULEB_TIMES_SKIPPING_ULEB) {
        $self->{skip} = MachO::Uleb128->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->opcode() == $MachO::DyldInfoCommand::BIND_OPCODE_SET_SYMBOL_TRAILING_FLAGS_IMMEDIATE) {
        $self->{symbol} = Encode::decode("ascii", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub opcode {
    my ($self) = @_;
    return $self->{opcode} if ($self->{opcode});
    $self->{opcode} = ($self->opcode_and_immediate() & 240);
    return $self->{opcode};
}

sub immediate {
    my ($self) = @_;
    return $self->{immediate} if ($self->{immediate});
    $self->{immediate} = ($self->opcode_and_immediate() & 15);
    return $self->{immediate};
}

sub opcode_and_immediate {
    my ($self) = @_;
    return $self->{opcode_and_immediate};
}

sub uleb {
    my ($self) = @_;
    return $self->{uleb};
}

sub skip {
    my ($self) = @_;
    return $self->{skip};
}

sub symbol {
    my ($self) = @_;
    return $self->{symbol};
}

########################################################################
package MachO::DyldInfoCommand::RebaseData;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OPCODE_DONE = 0;
our $OPCODE_SET_TYPE_IMMEDIATE = 16;
our $OPCODE_SET_SEGMENT_AND_OFFSET_ULEB = 32;
our $OPCODE_ADD_ADDRESS_ULEB = 48;
our $OPCODE_ADD_ADDRESS_IMMEDIATE_SCALED = 64;
our $OPCODE_DO_REBASE_IMMEDIATE_TIMES = 80;
our $OPCODE_DO_REBASE_ULEB_TIMES = 96;
our $OPCODE_DO_REBASE_ADD_ADDRESS_ULEB = 112;
our $OPCODE_DO_REBASE_ULEB_TIMES_SKIPPING_ULEB = 128;

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

    $self->{items} = ();
    do {
        $_ = MachO::DyldInfoCommand::RebaseData::RebaseItem->new($self->{_io}, $self, $self->{_root});
        push @{$self->{items}}, $_;
    } until ($_->opcode() == $MachO::DyldInfoCommand::RebaseData::OPCODE_DONE);
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package MachO::DyldInfoCommand::RebaseData::RebaseItem;

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

    $self->{opcode_and_immediate} = $self->{_io}->read_u1();
    if ( (($self->opcode() == $MachO::DyldInfoCommand::RebaseData::OPCODE_SET_SEGMENT_AND_OFFSET_ULEB) || ($self->opcode() == $MachO::DyldInfoCommand::RebaseData::OPCODE_ADD_ADDRESS_ULEB) || ($self->opcode() == $MachO::DyldInfoCommand::RebaseData::OPCODE_DO_REBASE_ULEB_TIMES) || ($self->opcode() == $MachO::DyldInfoCommand::RebaseData::OPCODE_DO_REBASE_ADD_ADDRESS_ULEB) || ($self->opcode() == $MachO::DyldInfoCommand::RebaseData::OPCODE_DO_REBASE_ULEB_TIMES_SKIPPING_ULEB)) ) {
        $self->{uleb} = MachO::Uleb128->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->opcode() == $MachO::DyldInfoCommand::RebaseData::OPCODE_DO_REBASE_ULEB_TIMES_SKIPPING_ULEB) {
        $self->{skip} = MachO::Uleb128->new($self->{_io}, $self, $self->{_root});
    }
}

sub opcode {
    my ($self) = @_;
    return $self->{opcode} if ($self->{opcode});
    $self->{opcode} = ($self->opcode_and_immediate() & 240);
    return $self->{opcode};
}

sub immediate {
    my ($self) = @_;
    return $self->{immediate} if ($self->{immediate});
    $self->{immediate} = ($self->opcode_and_immediate() & 15);
    return $self->{immediate};
}

sub opcode_and_immediate {
    my ($self) = @_;
    return $self->{opcode_and_immediate};
}

sub uleb {
    my ($self) = @_;
    return $self->{uleb};
}

sub skip {
    my ($self) = @_;
    return $self->{skip};
}

########################################################################
package MachO::DyldInfoCommand::ExportNode;

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

    $self->{terminal_size} = MachO::Uleb128->new($self->{_io}, $self, $self->{_root});
    $self->{children_count} = $self->{_io}->read_u1();
    $self->{children} = ();
    my $n_children = $self->children_count();
    for (my $i = 0; $i < $n_children; $i++) {
        $self->{children}[$i] = MachO::DyldInfoCommand::ExportNode::Child->new($self->{_io}, $self, $self->{_root});
    }
    $self->{terminal} = $self->{_io}->read_bytes($self->terminal_size()->value());
}

sub terminal_size {
    my ($self) = @_;
    return $self->{terminal_size};
}

sub children_count {
    my ($self) = @_;
    return $self->{children_count};
}

sub children {
    my ($self) = @_;
    return $self->{children};
}

sub terminal {
    my ($self) = @_;
    return $self->{terminal};
}

########################################################################
package MachO::DyldInfoCommand::ExportNode::Child;

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

    $self->{name} = Encode::decode("ascii", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{node_offset} = MachO::Uleb128->new($self->{_io}, $self, $self->{_root});
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->node_offset()->value());
    $self->{value} = MachO::DyldInfoCommand::ExportNode->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{value};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub node_offset {
    my ($self) = @_;
    return $self->{node_offset};
}

########################################################################
package MachO::DyldInfoCommand::BindData;

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

    $self->{items} = ();
    do {
        $_ = MachO::DyldInfoCommand::BindItem->new($self->{_io}, $self, $self->{_root});
        push @{$self->{items}}, $_;
    } until ($_->opcode() == $MachO::DyldInfoCommand::BIND_OPCODE_DONE);
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package MachO::DyldInfoCommand::LazyBindData;

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

    $self->{items} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{items}}, MachO::DyldInfoCommand::BindItem->new($self->{_io}, $self, $self->{_root});
    }
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package MachO::DylinkerCommand;

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

    $self->{name} = MachO::LcStr->new($self->{_io}, $self, $self->{_root});
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

########################################################################
package MachO::DylibCommand;

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

    $self->{name_offset} = $self->{_io}->read_u4le();
    $self->{timestamp} = $self->{_io}->read_u4le();
    $self->{current_version} = $self->{_io}->read_u4le();
    $self->{compatibility_version} = $self->{_io}->read_u4le();
    $self->{name} = Encode::decode("utf-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub name_offset {
    my ($self) = @_;
    return $self->{name_offset};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub current_version {
    my ($self) = @_;
    return $self->{current_version};
}

sub compatibility_version {
    my ($self) = @_;
    return $self->{compatibility_version};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

########################################################################
package MachO::LcStr;

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

    $self->{length} = $self->{_io}->read_u4le();
    $self->{value} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
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
package MachO::LoadCommand;

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

    $self->{type} = $self->{_io}->read_u4le();
    $self->{size} = $self->{_io}->read_u4le();
    my $_on = $self->type();
    if ($_on == $MachO::LOAD_COMMAND_TYPE_ID_DYLINKER) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::DylinkerCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_REEXPORT_DYLIB) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::DylibCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_SOURCE_VERSION) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::SourceVersionCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_FUNCTION_STARTS) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::LinkeditDataCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_RPATH) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::RpathCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_SUB_FRAMEWORK) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::SubCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_ROUTINES) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::RoutinesCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_SUB_LIBRARY) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::SubCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_DYLD_INFO_ONLY) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::DyldInfoCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_DYLD_ENVIRONMENT) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::DylinkerCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_LOAD_DYLINKER) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::DylinkerCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_SEGMENT_SPLIT_INFO) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::LinkeditDataCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_MAIN) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::EntryPointCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_LOAD_DYLIB) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::DylibCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_ENCRYPTION_INFO) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::EncryptionInfoCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_DYSYMTAB) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::DysymtabCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_TWOLEVEL_HINTS) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::TwolevelHintsCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_ENCRYPTION_INFO_64) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::EncryptionInfoCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_LINKER_OPTION) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::LinkerOptionCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_DYLD_INFO) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::DyldInfoCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_VERSION_MIN_TVOS) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::VersionMinCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_LOAD_UPWARD_DYLIB) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::DylibCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_SEGMENT_64) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::SegmentCommand64->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_SUB_UMBRELLA) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::SubCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_VERSION_MIN_WATCHOS) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::VersionMinCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_ROUTINES_64) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::RoutinesCommand64->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_ID_DYLIB) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::DylibCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_SUB_CLIENT) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::SubCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_DYLIB_CODE_SIGN_DRS) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::LinkeditDataCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_SYMTAB) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::SymtabCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_LINKER_OPTIMIZATION_HINT) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::LinkeditDataCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_DATA_IN_CODE) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::LinkeditDataCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_CODE_SIGNATURE) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::CodeSignatureCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_VERSION_MIN_IPHONEOS) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::VersionMinCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_LOAD_WEAK_DYLIB) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::DylibCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_LAZY_LOAD_DYLIB) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::DylibCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_UUID) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::UuidCommand->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $MachO::LOAD_COMMAND_TYPE_VERSION_MIN_MACOSX) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->size() - 8));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = MachO::VersionMinCommand->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes(($self->size() - 8));
    }
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package MachO::UuidCommand;

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

    $self->{uuid} = $self->{_io}->read_bytes(16);
}

sub uuid {
    my ($self) = @_;
    return $self->{uuid};
}

########################################################################
package MachO::SymtabCommand;

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

    $self->{sym_off} = $self->{_io}->read_u4le();
    $self->{n_syms} = $self->{_io}->read_u4le();
    $self->{str_off} = $self->{_io}->read_u4le();
    $self->{str_size} = $self->{_io}->read_u4le();
}

sub symbols {
    my ($self) = @_;
    return $self->{symbols} if ($self->{symbols});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->sym_off());
    $self->{symbols} = ();
    my $n_symbols = $self->n_syms();
    for (my $i = 0; $i < $n_symbols; $i++) {
        $self->{symbols}[$i] = MachO::SymtabCommand::Nlist64->new($io, $self, $self->{_root});
    }
    $io->seek($_pos);
    return $self->{symbols};
}

sub strs {
    my ($self) = @_;
    return $self->{strs} if ($self->{strs});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->str_off());
    $self->{_raw_strs} = $io->read_bytes($self->str_size());
    my $io__raw_strs = IO::KaitaiStruct::Stream->new($self->{_raw_strs});
    $self->{strs} = MachO::SymtabCommand::StrTable->new($io__raw_strs, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{strs};
}

sub sym_off {
    my ($self) = @_;
    return $self->{sym_off};
}

sub n_syms {
    my ($self) = @_;
    return $self->{n_syms};
}

sub str_off {
    my ($self) = @_;
    return $self->{str_off};
}

sub str_size {
    my ($self) = @_;
    return $self->{str_size};
}

sub _raw_strs {
    my ($self) = @_;
    return $self->{_raw_strs};
}

########################################################################
package MachO::SymtabCommand::StrTable;

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

    $self->{unknown} = $self->{_io}->read_u4le();
    $self->{items} = ();
    do {
        $_ = Encode::decode("ascii", $self->{_io}->read_bytes_term(0, 0, 1, 1));
        push @{$self->{items}}, $_;
    } until ($_ eq "");
}

sub unknown {
    my ($self) = @_;
    return $self->{unknown};
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package MachO::SymtabCommand::Nlist64;

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

    $self->{un} = $self->{_io}->read_u4le();
    $self->{type} = $self->{_io}->read_u1();
    $self->{sect} = $self->{_io}->read_u1();
    $self->{desc} = $self->{_io}->read_u2le();
    $self->{value} = $self->{_io}->read_u8le();
}

sub un {
    my ($self) = @_;
    return $self->{un};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub sect {
    my ($self) = @_;
    return $self->{sect};
}

sub desc {
    my ($self) = @_;
    return $self->{desc};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package MachO::VersionMinCommand;

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

    $self->{version} = MachO::Version->new($self->{_io}, $self, $self->{_root});
    $self->{sdk} = MachO::Version->new($self->{_io}, $self, $self->{_root});
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub sdk {
    my ($self) = @_;
    return $self->{sdk};
}

########################################################################
package MachO::EntryPointCommand;

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

    $self->{entry_off} = $self->{_io}->read_u8le();
    $self->{stack_size} = $self->{_io}->read_u8le();
}

sub entry_off {
    my ($self) = @_;
    return $self->{entry_off};
}

sub stack_size {
    my ($self) = @_;
    return $self->{stack_size};
}

1;
