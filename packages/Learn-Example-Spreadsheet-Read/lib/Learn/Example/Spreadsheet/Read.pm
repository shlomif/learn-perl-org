package Learn::Example::Spreadsheet::Read

use strict;
use warnings;

=head1 NAME

Learn::Example::Spreadsheet::Read

=head1 SYNOPSIS

An example of reading a spreadsheet

=head1 DESCRIPTION

The Spreadsheet::ParseExcel::Simple lets you easily read in Excel spreadsheets.

  my $xls = Spreadsheet::ParseExcel::Simple->read('spreadsheet.xls');
  foreach my $sheet ($xls->sheets) {
     while ($sheet->has_data) {  
         my @data = $sheet->next_row;
     }
  }

=cut

1;
