package JIP::Spy;

use strict;
use warnings;
use version 0.77;

use Exporter qw(import);
use Scalar::Util qw(blessed);
use English qw(-no_match_vars);

use JIP::Spy::Events;
use JIP::Spy::Takeover;

our $VERSION = version->declare('v0.0.1');

our @EXPORT_OK = qw(spy mock takeover);

sub spy {
    return JIP::Spy::Events->new(@ARG);
}

sub takeover {
    return JIP::Spy::Takeover->new(@ARG);
}

sub mock {
    my ($target, $method) = @ARG;

    my $mock
        = blessed($target)
        ? 'JIP::Spy::Mock::Object'
        : 'JIP::Spy::Mock::Class';

    return $mock->new($target, $method);
}

1;
