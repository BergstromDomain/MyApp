# How I developed this Ruby on Rails application #


## Get started ##


### Set up environment ###
> I have had several failed attempts developing on Windows, using *VirtualBox*, using the *Windows Subsystem for Linux* as well as using dual boot and developing in *Ubuntu*. I've ended up spending more time getting the environments ready than working on my actual app. When I took a Ruby on Rails course from Udemy, I was introduced to *AWS Cloud9* which is what I have decided to use going forward.


#### Created a Cloud9 environment in AWS ####
The first thing I did was to create a Cloud9 environment in AWS. 

1. Log in to AWS as an __IAM__ user
  - __URL__: https://aws.amazon.com/console/
  - __IAM user name__: *Developer*
  - __Password__: *****
  - Click on __Sign in__
  - From __AWS Management Console__ select __Cloud9__
2. Create a new environment
  - Click on __Create environment__
  - Enter the __Name__: *Ruby on Rails 6 - MyApp*
  - Click on __Next step__
3. Configure settings
  - Select __Environment type__: *Create a new EC2 instance for environment (direct access)*
  - Select __Instance type__: *t3.small (2 GiB RAM + 2 vCPU)*
  - Select __Platform__: *Ubuntu Server 18.04 LTS*
  - Select __Cost-saving setting__: *After 30 minutes (default)*
  - Click on __Next step__
5. Review
  - Click on __Create environment__


#### Set up the Cloud9 environment for Ruby on Rails development  ####
1. In Cloud9 open up a new terminal and install core packages for
  ```bash
  pwd
  /home/ubuntu/environmentsudo apt install curl
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update
  sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
  ```
2. Install Ruby using Rbenv
  ```bash
  rvm -v
  rvm 1.29.12 (latest) by Michal Papis, Piotr Kuczynski, Wayne E. Seguin [https://rvm.io]

  rvm install 3.0.0
  rvm use 3.0.0

  ruby -v
  ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]

  which ruby
  /home/ubuntu/.rvm/rubies/ruby-3.0.0/bin/ruby
  ```
3. Install Bundler
  ```bash
  gem install bundler
  ```
4. Configure Git
  ```bash
  git config --global color.ui true
  git config --global user.name "Niklas Bergstrom"
  git config --global user.email "me.niklas@gmail.com"
  ```
5. Generate SSH keys
- Check to see if you have any SSH keys
  ```bash
  ls -l ~/.ssh/id_*.pub
  ls: cannot access '/home/ubuntu/.ssh/id_*.pub': No such file or directory
  ```
- Generate SSH keys
  ```bash
  ssh-keygen -t rsa -b 4096 -C me.niklas@gmail.com
  Generating public/private rsa key pair.
  Enter file in which to save the key (/home/ubuntu/.ssh/id_rsa):
  Enter passphrase (empty for no passphrase):
  Enter same passphrase again:
  Your identification has been saved in /home/ubuntu/.ssh/id_rsa.
  Your public key has been saved in /home/ubuntu/.ssh/id_rsa.pub.
  The key fingerprint is:
  SHA256:Qar5BNloxGYaOdJRvlb36VfHD43+JDxzJNUuqKPI5ag me.niklas@gmail.com
  The key's randomart image is:
  +---[RSA 4096]----+
  | ..=o   .        |
  |. =o++ o        .|
  | . ** + o       o|
  |  .. * . o . . * |
  |    = . S o . * *|
  |   . o   . . + *.|
  |      . . + . * +|
  |     . = . o   B |
  |    E.+ o       .|
  +----[SHA256]-----+
  ```
- Show the keys and copy them to the clipboard
  ```bash
  less ~/.ssh/id_*.pub
  ```


#### Set up GitHub as the source repository ####
1. Log in to GitHub
  - __URL__: https://github.com/
  - __User name__: *me.niklas@gmail.com*
  - __Password__: *****
2. Create a new repository
  - Click on __New__
  - Enter __Repository name__: *MyApp*
  - Select *Public*
  - Click on __Create repository__
3. Add public key from __Cloud9__
  - Copy keys from __Cloud9__
    ```bash
    less ~/.ssh/id_*.pub
    ```
4. Open the new repository and select __Settings >> Deploy keys__
  - Click on __Add deploy key__
  - Enter __Title__: *Cloud9 IDE*
  - Copy the key into the __Key__ field
  - Check the __Allow write access__ checkbox
  - Click on __Add key__
5. Test the connection
  - In __Cloud9__ type the command
    ```bash
    ssh -T git@github.com
    The authenticity of host 'github.com (140.82.113.3)' can't be established.
    RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added 'github.com,140.82.113.3' (RSA) to the list of known hosts.
    Hi BergstromDomain/MyApp! You've successfully authenticated, but GitHub does not provide shell access.
    ```

#### Installed and configure Ruby on Rails ####
1. Install Rails
  ```bash
  gem install rails -v 6.1.1
  rails -v
  Rails 6.1.1
  ```
2. Setting up PostgreSQL
  ```bash
  sudo apt install postgresql libpq-dev
  sudo su postgres
  postgres@ip-172-31-6-168:/home/ubuntu/environment$ createuser --interactive
  Enter name of role to add: ubuntu
  Shall the new role be a superuser? (y/n) y
  postgres@ip-172-31-6-168:/home/ubuntu/environment$ exit
  exit
  ```


----------
[<< Previous chapter](./1_0_get_started_toc.md) | [Table of contents](../how_i_developed_this_rails_application.md) | [Next chapter >>](./1_2_created_a_new_rails_application.md)
