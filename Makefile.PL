use inc::Module::Install;
name 'Template-Plugin-Filter-Pipe';
all_from 'lib/Template/Plugin/Filter/Pipe.pm';
perl_version '5.006';

requires 'Template';
requires 'Text::Pipe';

build_requires 'Test::Differences';
build_requires 'Test::More' => '0.70';

process_templates(
    first_year => 2007,
    rest_from  => "$ENV{HOME}/.mitlib/standard_pod",
    start_tag  => '{%',
    end_tag    => '%}',
);

use_standard_tests(without => 'pod_coverage');
auto_include;
WriteAll;
