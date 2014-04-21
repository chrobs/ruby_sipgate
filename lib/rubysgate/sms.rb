module Rubysgate
  class Sms
    def self.hi
      puts "Hi #{Rubysgate::Config.username}, your pass is '#{Rubysgate::Config.password}'!"
    end

    def self.deliver(phonenumber, text)
      user = Rubysgate::Config.username
      url = "https://#{user}:#{Rubysgate::Config.password}@samurai.sipgate.net/RPC2"
      client = XMLRPC::Client.new2(url)
      client.call('samurai.ClientIdentify', {'ClientName' => 'Ruby-Client'} )
      number = strip_phonenumber(phonenumber)
      args = {
        'RemoteUri' => "sip:#{number}@sipgate.net",
        'TOS' => 'text',
        'Content' => text[0,159]
      }
      if r = client.call('samurai.SessionInitiate', args)
        puts "*** SMS sent to #{number} (#{r.inspect})"
        puts "*** SMS text: #{text}" #if Rails.env.development?
      else
        raise "sms send failed: #{r.inspect}"
      end
    end

    private
     def self.strip_phonenumber(number)
     number.gsub!(/\D/, '')
     number.gsub!(/^01/, '491')
     number.gsub!(/^00491/, '491')
     number
     end
  end
end
