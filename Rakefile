require 'rubocop/rake_task'
require 'parallel_tests/tasks'
require 'dotenv/load'

namespace :test do
  desc 'Runs the rubocop linter'
  RuboCop::RakeTask.new(:rubocop)
end

task default: 'test:rubocop'

# The below implementation demonstrates our desired functionality but needs to be done in a programmatic way to work cross platform

namespace :dev do
  desc 'Run tests tagged "@working" and report locally'
  task :working_on_it do
    ENV['CONFIG_DIR'] = 'ci_config/default'
    system 'CONFIG_DIR=ci_config/default bundle exec cucumber features --tags "@working"'
  end

  desc 'Run all functional tests and report locally'
  task :functional_tests do
    ENV['CONFIG_DIR'] = 'ci_config/default'
    system 'CONFIG_DIR=ci_config/default bundle exec cucumber features --tags "(not @axe)"'
  end
end

namespace :qa do
  desc 'Run all functional tests and report locally'
  task :functional_tests do
    ENV['CONFIG_DIR'] = 'ci_config/qa'
    system 'CONFIG_DIR=ci_config/qa bundle exec cucumber features --tags "(not @axe)"'
  end
end

namespace :accessibility do
  desc 'Run axe accessibility tests and report via Halo'
  task :axe_audit do
    ENV['CONFIG_DIR'] = 'ci_config/axe_audit'
    system 'CONFIG_DIR=ci_config/axe_audit bundle exec cucumber features --tags "@axe"'
  end
end

namespace :production do
  desc 'Run all functional tests and report via Halo'
  task :functional_tests do
    ENV['CONFIG_DIR'] = 'ci_config/production'
    system 'CONFIG_DIR=ci_config/production bundle exec cucumber features --tags "(not @axe)"'
  end
end
