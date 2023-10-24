#!/usr/bin/perl

use strict;
use warnings;
use LWP::UserAgent;
use JSON qw(encode_json);
use Ham::APRS::FAP qw(parseaprs);

my $ua = LWP::UserAgent->new;
$ua->env_proxy;

my $json = encode_json({
    sender           => 'K3MAQ',
    recipient        => 'K3MAQ',
    message_contents => 'Your shoelace is untied',
    position => {
        latitude  => '40.438440',
        longitude => '-79.998430',
        altitude  => 1223,
        speed     => 80,
    },
});

my $req = HTTP::Request->new(POST => "http://localhost:3000/api/submit_message");
$req->content_type('application/json');
$req->content($json);

my $r = $ua->request($req);

if ($r->is_success)
{

}
else
{
    die $r->status_line;
}

