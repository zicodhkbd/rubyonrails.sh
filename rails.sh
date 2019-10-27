
##Installing Ruby

sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

##Installing with rbenv

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.6.5
rbenv global 2.6.5
ruby -v

gem install bundler


##Configuring Git

git config --global color.ui true
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR@EMAIL.com"
ssh-keygen -t rsa -b 4096 -C "YOUR@EMAIL.com"

cat ~/.ssh/id_rsa.pub

ssh -T git@github.com


#Installing Rails

gem install rails -v 6.0.0

rbenv rehash

rails -v


##Setting Up PostgreSQL

sudo apt install postgresql postgresql-contrib libpq-dev

systemctl start postgresql
systemctl enable postgresql


#Login to the 'postgres' user and run the Postgres shell.
sudo su - postgres
psql

# If you would like to Change the Postgres password using the query below.

postgres=# \password postgres

#create a new role for our rails installation. We will create a new role named 'rails_dev' with the privilege of creating the database and with the password 'abcd1234'.

postgres=# create role rails_dev with createdb login password 'aqwe123';

#Now check all available roles on the system.
postgres=#\du


###Final Steps

##Create Your First App with Rails and PostgreSQL
rails new myapp -d postgresql

# Move into the application directory
cd myapp

# config/database.yml file to contain the username/password that you specified 
sudo nano config/database.yml

#There are different configuration sections for each setup - Development, Testing, and Production.
In the development section, uncomment those line and change the value as below.

	 development:
	25   <<: *default
	26   database: testapp_development
	27
	28   # The specified database role being used to connect to postgres.
	29   # To create additional roles in postgres see `$ createuser --help`.
	30   # When left blank, postgres will use the default role. This is
	31   # the same name as the operating system user that initialized the database.
	32   username: rails_dev
	33
	34   # The password associated with the postgres role (username).
	35   password: abcd1234
	36
	37   # Connect on a TCP socket. Omitted by default since the client uses a
	38   # domain socket that doesn't need configuration. Windows does not have
	39   # domain sockets, so uncomment these lines.
	40   host: localhost
	41
	42   # The TCP port the server listens on. Defaults to 5432.
	43   # If your server runs on a different port number, change accordingly.
	44   port: 5432
	45

#For the testing section, paste those configurations under the testing section.

	55 # Warning: The database defined as "test" will be erased and
	56 # re-generated from your development database when you run "rake".
	57 # Do not set this db to the same as development or production.
	58 test:
	59   <<: *default
	60   database: testapp_test
	61   host: localhost
	62   port: 5432
	63   username: rails_dev
	64   password: abcd1234

##Create the database
rails db:setup
rails db:migrate

## start the default development mode rails web server
rails server

##visit 

http://localhost:3000 

https://www.youtube.com/watch?v=ABmt13zS7uM


