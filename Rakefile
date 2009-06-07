require 'rubygems'
require 'rake'
require 'spec'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "portfolio"
    gem.summary = %Q{Portfolio is a DSL for the creation and management of stock charts}
    gem.email = "cameron@snepo.com"
    gem.homepage = "http://blog.snepo.com"
    gem.authors = ["Cameron Barrie"]
    gem.add_dependency("fastercsv", "= 1.4")
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:test) do |t|
  t.spec_opts = ['--options', "spec/spec.opts"]
  t.spec_files = FileList['spec/**/*_spec.rb']
end

task :default => :test
