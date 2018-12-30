set :stage, :production
set :rails_env, 'production'
set :branch, "master"
set :puma_state, "#{shared_path}/tmp/puma/state"
set :puma_pid, "#{shared_path}/tmp/puma/pid"

server 'tv.luckyruby.com', roles: %w{web app db}, user: 'klin'

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

end
