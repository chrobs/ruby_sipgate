ruby sipgate
=========

Ruby Gem for sending SMS via sipgate RPC-API


Usage
======

require 'ruby_sipgate'

RubySipgate::Config.set :username, "your_username_or_email"
RubySipgate::Config.set :password, "your_password"

# setting the source number is optional, by default the sender is "sipgate"
RubySipgate::Config.set :source, "015598765432"

RubySipgate::Sms.deliver "015598765432", "Lorem Ipsum"

Config Parameters
==================
* :password = ""
* :username = ""
* :source = nil
* :debug = false
* :verbose = false
