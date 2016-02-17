# credits for base construct to Thomas Witt
# https://gist.github.com/thomaswitt/4006850

module RubySipgate
  class Sms
    def self.hi
      puts "Hi #{RubySipgate::Config.get :username}, your pass is '#{RubySipgate::Config.get :password}'!"
    end

    def self.deliver(phonenumber, text)
      user = RubySipgate::Config.get :username
      url = "https://#{user}:#{RubySipgate::Config.get :password}@samurai.sipgate.net/RPC2"
      client = XMLRPC::Client.new2(url)
      client.call('samurai.ClientIdentify', {'ClientName' => 'Ruby-Client'} )
      number = strip_phonenumber(phonenumber)
      args = {
        'RemoteUri' => "sip:#{number}@sipgate.net",
        'TOS' => 'text',
        'Content' => text[0,159]
      }
      if sourcenumber = RubySipgate::Config.get(:source)
        strippedsource = strip_phonenumber(sourcenumber)
        args['LocalUri'] = "sip:#{strippedsource}@sipgate.net"
      end
      if RubySipgate::Config.get :debug
        puts "*** I would have sent the following to #{phonenumber}:"
        puts args.inspect
      else
        if r = client.call('samurai.SessionInitiate', args)
          if RubySipgate::Config.get :verbose
            puts "*** SMS sent to #{number} (#{r.inspect})"
            puts "*** SMS text: #{text}"
          end
          return r
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
