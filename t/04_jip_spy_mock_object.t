#!/usr/bin/env perl

use 5.006;
use strict;
use warnings FATAL => 'all';

use Test::More;
use English qw(-no_match_vars);

BEGIN {
    plan tests => 3;

    use_ok 'JIP::Spy::Mock::Object', 'v0.0.1';
}

subtest 'Require some module' => sub {
    plan tests => 1;

    require_ok 'JIP::Spy::Mock::Object';

    diag(
        sprintf(
            'Testing JIP::Spy::Mock::Object %s, Perl %s, %s',
            $JIP::Spy::Mock::Object::VERSION,
            $PERL_VERSION,
            $EXECUTABLE_NAME,
        ),
    );
};

subtest 'new()' => sub {
    plan tests => 7;

    my $o = JIP::Spy::Mock::Object->new;
    ok $o, 'got instance of JIP::Spy::Mock::Object';

    isa_ok $o, 'JIP::Spy::Mock::Object';

    can_ok $o, qw(new);
};
