Rubysgate
=========

Ruby Gem for sending sms via sipgate api


Usage
======

require 'rubysgate'
Rubysgate::Config.set :password, "your_password"
Rubysgate::Config.set :username, "your_username"
Rubysgate::Sms.deliver "015598765432", "Lorem Ipsum"

Config Parameters
==================
* :password = ""
* :username = ""
* :debug = false
