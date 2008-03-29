
require 'mongrel_cluster/recipes'

set :application, "enroll"

default_run_options[:pty] = true
set :repository,  "git://github.com/drudru/enroll.git"
set :scm, "git"
set :user, "dru"
set :branch, "origin/master"


set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"
# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/dru/www/#{application}"
set :deploy_via, :remote_cache

ssh_options[:port] = 73


role :app, ENV['DEPLOY_TO']
role :web, ENV['DEPLOY_TO']
role :db,  ENV['DEPLOY_TO'], :primary => true
