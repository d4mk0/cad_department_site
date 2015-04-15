set :stage, :staging
set :branch, 'master'
set :deploy_to, '/work/www/cad.d4mk0.me'

server "46.36.218.178", roles: [:web, :app, :db], user: 'd4mk0', primary: true