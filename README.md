ruby sipgate
=========

Ruby Gem for sending sms via sipgate api


Usage
======

require 'ruby_sipgate'

RubySipgate::Config.set :password, "your_password"

RubySipgate::Config.set :username, "your_username"

RubySipgate::Sms.deliver "015598765432", "Lorem Ipsum"

Config Parameters
==================
* :password = ""
* :username = ""
* :debug = false
* :verbose = false
