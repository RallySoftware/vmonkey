require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

ENV['VMONKEY_YML'] ||= File.expand_path(File.join(File.dirname(__FILE__), 'spec', '.vmonkey'))
RSpec::Core::RakeTask.new(:spec)

desc "run only virtual machine specs"
RSpec::Core::RakeTask.new('run_vm_specs') do |t|
  tests = ['spec/virtualmachine_spec*']
  t.pattern = tests
end

desc "run only virtual machine helper specs"
RSpec::Core::RakeTask.new('run_vm_helper_specs') do |t|
  tests = ['spec/vm_helper_spec*']
  t.pattern = tests
end