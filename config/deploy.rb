# Bundler bootstrap
require 'bundler/capistrano'

# main details
set :application, 'clientapp.isotope11.com'
role :web, 'clientapp.isotope11.com'
role :app, 'clientapp.isotope11.com'
role :db, 'clientapp.isotope11.com', :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, '/home/deployer/client_app'
set :user, 'deployer'
set :use_sudo, false

# repo details
set :scm, :git
set :repository, 'git@github.com:isotope11/client_app.git'
set :branch, 'master'
set :git_enable_submodules, 1

# runtime dependencies
depend :remote, :gem, "bundler", "1.0.21"

# tasks
namespace :deploy do
  before 'deploy:setup', :db

  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc 'Restart Application'
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc 'Symlink shared resources on each release'
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{current_path}/config/database.yml"
  end
end

before 'deploy:assets:precompile', 'deploy:symlink_shared'
