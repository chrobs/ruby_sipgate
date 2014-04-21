module Rubysgate
  class Sms
    def self.hi
      puts "Hi #{Rubysgate::Config.get :username}, your pass is '#{Rubysgate::Config.get :password}'!"
    end

    def self.deliver(phonenumber, text)
      user = Rubysgate::Config.get :username
      url = "https://#{user}:#{Rubysgate::Config.get :password}@samurai.sipgate.net/RPC2"
      client = XMLRPC::Client.new2(url)
      client.call('samurai.ClientIdentify', {'ClientName' => 'Ruby-Client'} )
      number = strip_phonenumber(phonenumber)
      args = {
        'RemoteUri' => "sip:#{number}@sipgate.net",
        'TOS' => 'text',
        'Content' => text[0,159]
      }
      if Rubysgate::Config.get :debug
        puts "*** I would have sent the following to #{phonenumber}:"
        puts args.inspect
      else
        if r = client.call('samurai.SessionInitiate', args)
          puts "*** SMS sent to #{number} (#{r.inspect})"
          puts "*** SMS text: #{text}" if Rubysgate::Config.get :debug
        else
          raise "sms send failed: #{r.inspect}"
        end
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
