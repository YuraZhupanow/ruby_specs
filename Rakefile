require 'rspec/core/rake_task'
require 'ci/reporter/rake/rspec'
  
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--format xml', '--out reports/results.xml']
 # t.pattern = 'spec/heartbeat/heartbeat_spec.rb'
end

task :clean do
  rm_rf 'spec/reports'
  rm_rf 'failure_screenshots'
end

task :default => :spec
task :spec => [:clean, 'ci:setup:rspec']