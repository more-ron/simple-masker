# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "simple-masker"
  gem.homepage = "http://github.com/more-ron/simple-masker"
  gem.license = "MIT"
  gem.summary = %Q{A simple implementation of a presenter pattern}
  gem.description = %Q{Acts like a SimpleDelegator implementing a decorator pattern except that it hides the object's methods instead of delegating them by default. Useful for hiding the ugly beast behind the mask.}
  gem.email = "more.ron.too@gmail.com"
  gem.authors = ["MoreRon"]
  gem.files = "lib/*"
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "simple-masker #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
