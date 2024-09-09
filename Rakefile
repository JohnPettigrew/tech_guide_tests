require 'rubocop/rake_task'
require 'parallel_tests/tasks'

namespace :test do
  desc 'Runs the rubocop linter'
  RuboCop::RakeTask.new(:rubocop)
end

task default: 'test:rubocop'

# The below implementation demonstrates our desired functionality but needs to be done in a programmatic way to work cross platform

namespace :development do
  desc 'Local Chrome run of the scenarios tagged "working"'
  task :working_on_it do
    ENV['CONFIG_DIR'] = 'ci_config/working'
    system 'CONFIG_DIR=ci_config/working bundle exec cucumber features --tags "(@working)"'
  end

  desc 'Local Chrome run of implemented tests only'
  task :implemented_tests do
    ENV['CONFIG_DIR'] = 'ci_config/default'
    system 'CONFIG_DIR=ci_config/default bundle exec cucumber features --tags "(not @not_implemented)"'
  end

  desc 'Runs all implemented scenarios in Chrome and sends to Halo'
  task 'default_to_Halo' do
    ENV['CONFIG_DIR'] = 'ci_config/default_to_halo'
    system 'CONFIG_DIR=ci_config/default_to_halo bundle exec cucumber features --tags "(not @not_implemented)"'
  end
end

desc 'Run axe accessibility audit and send results to Halo'
task :axe_audit do
  ENV['CONFIG_DIR'] = 'ci_config/axe_audit'
  system 'CONFIG_DIR=ci_config/axe_audit bundle exec cucumber features --tags "(@axe)"'
end
