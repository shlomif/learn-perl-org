use ExtUtils::MakeMaker;

WriteMakefile(
    'ABSTRACT'	=> 'Learn.perl.org and other learning resources',
    'AUTHOR'	=> 'Leo Lapworth',
    'LICENSE'	=> 'perl',
    'NAME'	=> 'Learn',
    'PREREQ_PM'	=> {
		    'Task::Kensho' => '0.23',
		   },
    'VERSION_FROM' => 'lib/Learn.pm',
    'dist'	=> {'COMPRESS' => 'gzip -9f', 'SUFFIX' => 'gz'},
);
