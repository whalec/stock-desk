require 'rubygems'
gem 'rspec'
require 'spec'

$:<< File.join(File.dirname(__FILE__), '..', 'lib')


SPEC_DIR = File.dirname(__FILE__) unless defined? SPEC_DIR
$:<< SPEC_DIR

require 'portfolio'

# require 'supports/mayo.rb'
# require 'supports/test_source.rb'