set :stage, :production

server 'gigabase.org', user: 'deploy', roles: %w{web app db}
set :deploy_to, '/var/www/mario'
set :branch, "master"