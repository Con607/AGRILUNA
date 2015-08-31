set :application, 'agriluna'
set :repo_url, 'git@github.com:Confiuzer/AGRILUNA.git'
set :user, 'confiuzer'
#set :puma_threads, [4, 16]
#set :puma_workers,  0

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/home/confiuzer/#{fetch(:application)}"
set :rvm_type, :user
set :rvm_ruby_version, '2.2.2'
set :rvm_ruby_version, '2.2.2@agriluna'

#set :puma_bind,  "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
#set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
#set :puma_access_log, "#{release_path}/log/puma.error.log"
#set :puma_error_log,  "#{release_path}/log/puma.access.log"
#set :puma_preload_app, true
#set :puma_worker_timeout, nil
#set :puma_init_active_record, true  # Change to true if using ActiveRecord


set :scm, :git
set :format, :pretty
set :log_level, :debug
set :keep_releases, 5

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
 #set :keep_releases, 5

#namespace :puma do
#  desc 'Create Directories for Puma Pids and Socket'
#  task :make_dirs do
#    on roles(:app) do
#      execute "mkdir #{shared_path}/tmp/sockets -p"
#      execute "mkdir #{shared_path}/tmp/pids -p"
#    end
#  end
#
#  before :start, :make_dirs
#end

#namespace :deploy do
#
#  desc "Make sure local git is in sync with remote."
#  task :check_revision do
#    on roles(:app) do
#      unless `git rev-parse HEAD` == `git rev-parse origin/master`
#        puts "WARNING: HEAD is not the same as origin/master"
#        puts "Run `git push` to sync changes."
#        exit
#      end
#    end
#  end
#
#  desc 'Initial Deploy'
#  task :initial do
#    on roles(:app) do
#      before 'deploy:restart', 'puma:start'
#      invoke 'deploy'
#    end
#  end
#
#  desc 'Restart application'
#  task :restart do
#    on roles(:app), in: :sequence, wait: 5 do
#      invoke 'puma:restart'
#    end
#  end
#
#  after :restart, :clear_cache do
#    on roles(:web), in: :groups, limit: 3, wait: 10 do
#      # Here we can do anything such as:
#      # within release_path do
#      #   execute :rake, 'cache:clear'
#      # end
#    end
#  end
#
#  before :starting,     :check_revision
#  after  :finishing,    'deploy:compile_assets'
#  after :finishing, 'deploy:cleanup'
#  after  :finishing,    'puma:restart'
#
#end

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do 
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
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

  after :finishing, 'deploy:cleanup'

end



# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma