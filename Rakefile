require 'rubocop/rake_task'
require 'parallel_tests/tasks'

namespace :test do
  desc 'Runs the rubocop linter'
  RuboCop::RakeTask.new(:rubocop)
end

task default: 'test:rubocop'

# The below implementation demonstrates our desired functionality but needs to be done in a programmatic way to work cross platform
namespace :ci do
  desc 'Run tests using specific configs'
  task :demo_chrome do
    ENV['CONFIG_DIR'] = 'ci_config/chrome'
    system 'parallel_cucumber features'
  rescue StandardError => e
    puts "At least one test failed, please check your reports. #{e}"
  end

  task :lighthouse do
    system 'parallel_cucumber -n 3 features -o "-t @lighthouse"'
  rescue StandardError => e
    puts "At least one test failed, please check your reports. #{e}"
  end

  task :demo_firefox do
    ENV['CONFIG_DIR'] = 'ci_config/firefox'
    system 'parallel_cucumber features'
  rescue StandardError => e
    puts "At least one test failed, please check your reports. #{e}"
  end
end

desc 'Local Chrome run of implemented tests only'
task :Default do
  ENV['CONFIG_DIR'] = 'ci_config/default'
  system 'CONFIG_DIR=ci_config/default bundle exec cucumber features --tags "(not @not_implemented)"'
end

desc 'Just the scenarios tagged "working"'
task :Working do
  ENV['CONFIG_DIR'] = 'ci_config/working'
  system 'CONFIG_DIR=ci_config/working bundle exec cucumber features --tags "(@working)"'
end
