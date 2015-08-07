# Ensure that bundle is used for rake tasks
SSHKit.config.command_map[:rake] = "bundle exec rake"
lock '3.4.0'

set :application, 'mario'
set :repo_url, 'git@github.com:giga-opensource/mario-api.git'

set :scm, :git
set :user, :deploy
set :use_sudo, false
set :git_enable_submodules, true

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :ssh_options, {
  forward_agent: true,
  port: 22,
  keys: [File.join(ENV["HOME"], ".ssh", "id_rsa")]
}

set :keep_releases, 5
