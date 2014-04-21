module Rubysgate
  class Config
    @@params={username:"",password:"",debug:false}

    def self.get *key
      if key.empty?
        return @@params
      elsif key.size == 1
        return @@params[key.first]
      end
      return nil
    end

    def self.set hash
      @@params = hash
    end

    def self.set key,value
      @@params[key]=value
    end
  end
end
