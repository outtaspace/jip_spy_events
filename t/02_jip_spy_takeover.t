#!/usr/bin/env perl

use 5.006;
use strict;
use warnings FATAL => 'all';

use Test::More;
use English qw(-no_match_vars);

BEGIN {
    plan tests => 3;

    use_ok 'JIP::Spy::Takeover', 'v0.0.1';
}

subtest 'Require some module' => sub {
    plan tests => 1;

    require_ok 'JIP::Spy::Takeover';

    diag(
        sprintf(
            'Testing JIP::Spy::Takeover %s, Perl %s, %s',
            $JIP::Spy::Takeover::VERSION,
            $PERL_VERSION,
            $EXECUTABLE_NAME,
        ),
    );
};

subtest 'new()' => sub {
    plan tests => 3;

    my $o = JIP::Spy::Takeover->new;
    ok $o, 'got instance of JIP::Spy::Takeover';

    isa_ok $o, 'JIP::Spy::Takeover';

    can_ok $o, qw(new);
};
