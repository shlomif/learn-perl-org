#!/usr/bin/env perl

# We always want strict and warnings
use strict;
use warnings;

# use the module that's going to do all the hard work for us
use Spreadsheet::ParseExcel::Simple;

# Read in the spreadsheet
my $file = 'wedding_attendees.xls';
my $xls = Spreadsheet::ParseExcel::Simple->read($file);

# Get all the sheets into an array.
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

    # %person is a hash, we want the headings as the keys, and data as the values.
    # This syntax is cleaner than having to loop over both the data and the headings
    my %person{@headings} = @data;
    
    # Add this row hash into our @people, we add the \ in front as we only want a reference
    # instead of a copy of it
    push @people, \%person;
}

# Now we have the data, decide what to do with it

# foreach my $person (@people) {
#     
# }





