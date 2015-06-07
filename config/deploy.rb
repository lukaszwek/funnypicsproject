# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'funnypics'
set :repo_url, 'git@github.com:CucumisSativus/funnypics.git'
set :rvm_type, :user
set :rvm_ruby_version, '2.2.1@funnypics'
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', '.env')

# Default value for linked_dirs is []
set :bundle_binstubs, nil
set :linked_dirs, ['log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system']
set :normalize_asset_timestamps, %{public/images public/javascripts public/stylesheets public/assets}
set :assets_roles, [:web, :app]

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  after :published, :symlink_to_public_ruby do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute "rm #{fetch(:deploy_to)}/public_ruby"
      execute "ln -s #{fetch(:release_path)} #{fetch(:deploy_to)}/public_ruby"
    end
  end
end


