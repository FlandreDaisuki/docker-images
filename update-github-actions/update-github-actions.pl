#!/usr/bin/env perl

use strict;
use warnings;

sub usage {
  die "Usage:\n"
    . "  update-github-actions.pl actions WORKFLOW_YAML\n"
    . "  update-github-actions.pl rewrite UPDATE_MAP WORKFLOW_YAML OUTPUT\n";
}

sub list_actions {
  my ($workflow_path) = @_;

  open my $workflow_file, '<', $workflow_path
    or die "Cannot read $workflow_path: $!\n";

  my %actions;
  while (my $line = <$workflow_file>) {
    if (
      $line =~
        /^\s*(?:-\s+)?uses:\s*["']?([^@"']+)@[^\s"']+["']?\s*(?:#.*)?$/
    ) {
      my $action = $1;
      $actions{$action} = 1
        if $action !~ m{^(?:\./|docker://)}
          && $action =~ m{^[^/]+/[^/]+(?:/.*)?$};
    }
  }

  close $workflow_file;
  print "$_\n" for sort keys %actions;
}

sub read_updates {
  my ($map_path) = @_;

  open my $map_file, '<', $map_path
    or die "Cannot read $map_path: $!\n";

  my %updates;
  while (my $line = <$map_file>) {
    chomp $line;
    my ($action, $sha, $version) = split /\t/, $line, 3;
    $updates{$action} = {
      sha => $sha,
      version => $version,
    };
  }

  close $map_file;
  return %updates;
}

sub rewrite_workflow {
  my ($map_path, $input_path, $output_path) = @_;
  my %updates = read_updates($map_path);

  open my $input_file, '<', $input_path
    or die "Cannot read $input_path: $!\n";
  my @lines = <$input_file>;
  close $input_file;

  open my $output_file, '>', $output_path
    or die "Cannot write $output_path: $!\n";

  for (my $index = 0; $index < @lines; $index++) {
    my $line = $lines[$index];

    if (
      $line =~
        /^(\s*)(-\s+)?uses:\s*["']?([^@"']+)@[^\s"']+["']?(\s*(?:#.*)?)\r?\n$/
      && exists $updates{$3}
    ) {
      my ($indent, $list_prefix, $action, $trailing_comment) =
        ($1, $2 // '', $3, $4);
      my $alias_indent = $indent . (' ' x length $list_prefix);
      my $sha = $updates{$action}->{sha};
      my $version = $updates{$action}->{version};

      print {$output_file}
        "${indent}${list_prefix}uses: ${action}\@${sha}${trailing_comment}\n";
      print {$output_file}
        "${alias_indent}# aka ${action}\@${version}\n";

      if ($index + 1 < @lines) {
        my $next_line = $lines[$index + 1];
        if (
          $next_line =~
            /^\Q$alias_indent\E#\s*(?:aka|a\.k\.a\.?)\s+\S+\@\S+\s*\r?\n$/
        ) {
          $index++;
        }
      }

      next;
    }

    print {$output_file} $line;
  }

  close $output_file;
}

my $command = shift @ARGV // usage();

if ($command eq 'actions') {
  @ARGV == 1 or usage();
  list_actions(@ARGV);
}
elsif ($command eq 'rewrite') {
  @ARGV == 3 or usage();
  rewrite_workflow(@ARGV);
}
else {
  usage();
}
