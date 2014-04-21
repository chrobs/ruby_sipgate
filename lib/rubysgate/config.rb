module Rubysgate
  class Config
    @@username = ""
    @@password = ""

    def self.username
      @@username
    end
    def self.username= name
      @@username = name
    end
    def self.password
      @@password
    end
    def self.password= pass
      @@password = pass
    end
  end
end
