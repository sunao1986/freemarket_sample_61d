server '18.176.106.68', user: 'ec2-user', roles: %w{app db web}

set :rails_env, "production"
set :unicorn_rack_env, "production"
# set :ssh_options, {
#   port: 3000,
#   keys: [File.expand_path('~/.ssh/freemarket61d.pem')], #'~/.ssh/id_rsa'部分をローカル環境の鍵のパスに
#   forward_agent: true,
#   auth_methods: %w(publickey)
# }