require "rspec/core"
require "rspec/core/rake_task"

task :default => [:spec]

task :spec 
RSpec::Core::RakeTask.new do | task |
  task.verbose = false
  task.rspec_opts = [ "--options", "spec/spec.opts" ]
  task.pattern = FileList["spec/**/*_spec.rb"]
end
