# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'spelling'
set :repo_url, "ssh://git@github.com/luckyruby/spelling.git"
set :deploy_to, "/var/www/spelling"
set :scm, :git
set :linked_files, %w{config/database.yml config/secrets.yml config/config.yml}
set :linked_dirs, %w{log tmp}

namespace :deploy do

  desc 'Seed database'
  task :seed do
    on roles(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:seed'
        end
      end
    end
  end  

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
