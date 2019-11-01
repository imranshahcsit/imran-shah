require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"

server "172.104.73.142", :web, :app, :db, primary: true

set :user, "imran"
set :application, "userauth20"
set :deploy_to, "/home/#{user}/rails_app/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:imran shah/#{userauth20}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases


namespace :deploy do
	%w[start stop restart].each do |command|
		desc "#{command} unicorn server"
		task command, roles: :app, except: {no_release: true} do
			run "/etc/init.d/unicorn_#{application} #{command}"
		end
	end

























