require 'date'

Gem::Specification.new do |s|
  s.name        = 'ruby_sipgate'
  s.version     = '0.2.3'
  s.date        = Date.today.to_s
  s.summary     = "sms via sipgate api"
  s.description = "Sending sms via sipgate api"
  s.authors     = ["Sebastian Neumann"]
  s.email       = 'github@tempo-tm.de'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'https://github.com/tempo/ruby-sipgate'
  s.license     = 'MIT'
end
