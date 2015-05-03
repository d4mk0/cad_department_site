lock '3.2.1'

set :application, 'cad_department_site'
set :repo_url, 'git@github.com:d4mk0/cad_department_site.git'

set :shared_path, "#{deploy_to}/shared"
set :unicorn_pid, "#{shared_path}/pids/unicorn.pid"
set :rails_env, "production"

set :linked_files, %w{ config/database.yml config/secrets.yml config/unicorn.rb }
set :linked_dirs, %w{ log tmp/pids tmp/cache tmp/sockets vendor/bundle public/versions}

namespace :deploy do
  after :publishing, :restart
  before :restart, :stop

  desc 'Start application'
  task :start do
    on roles(:app) do
      execute "cd #{current_path} && MAGICK_THREAD_LIMIT=1 RAILS_ENV=production ~/.rvm/bin/rvm default do bundle exec unicorn -Dc #{shared_path}/config/unicorn.rb -E production"
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app) do
      execute "[ -f #{current_path}/tmp/pids/unicorn.pid ] && kill -QUIT `cat #{current_path}/tmp/pids/unicorn.pid`"
    end
  end

  desc 'Restart Application'
  task :restart do
    on roles(:app) do
    end
  end

  after :restart, :start
end