#!/usr/bin/env perl

# We always want strict and warnings
use strict;
use warnings;

# use the module that's going to do all the hard work for us
use Spreadsheet::ParseExcel::Simple;

# Read in the spreadsheet
my $file = 'wedding_attendees.xls';
my $xls = Spreadsheet::ParseExcel::Simple->read($file);

# Get all the sheets into an array (list).
my @spreadsheets = $xls->sheets;

# We only have one sheet, so get that from the array
my $sheet = $spreadsheets[0];

# We know there is a header row, lets get the heading names
my @headings = $sheet->next_row();

# Create somewhere to store the data from the spreadsheet
my @people;

# Read in the data
while ($sheet->has_data) {  
    
    # Get a new row of data as an array
    my @data = $sheet->next_row;
    
    # If the first column is empty then skip to the next record
    next unless $data[0];

    # %person is a hash, we want the headings as the keys, and data as the values.
    my %person;
    # This syntax (called a 'hash slice') is shorter than having to loop over 
    # both the data and the headings
    @person{@headings} = @data;
    
    # Add this person hash into our @people, we add the \ in front as we only 
    # want a reference instead of a copy of it which generally good practice
    push @people, \%person;
}

# Now we have the data, decide what to do with it

# Lets count how many people are attending...

# Store our counts here
my %counters;

foreach my $person (@people) {
    # Find out what the persons status is, if we do not have one default to 'unknown'
    my $status = $person->{'Attending'} || 'unknown';

    # Increment the counter for this status
    $counters{$status}++;
}

# Lets print this to screen
my $top_label = 'Numbers attending...';
print "$top_label\n";
print "-" x length($top_label) . "\n";
foreach my $status (keys %counters) {
    print "$status\t- " . $counters{$status} . "\n";
}





