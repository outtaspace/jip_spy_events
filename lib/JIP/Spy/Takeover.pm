package JIP::Spy::Takeover;

use strict;
use warnings;
use version 0.77;

use English qw(-no_match_vars);

our $VERSION = version->declare('v0.0.1');

sub new {
    my ($self, $target) = @ARG;

    return bless {}, $self;
}

1;
