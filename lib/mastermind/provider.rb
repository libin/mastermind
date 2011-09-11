module Mastermind
  class Provider
    include Mixin::Attributes
    include Mixin::Providers

    attr_accessor :new_resource
    
    provider_name :default
    actions :nothing
    
    attribute :name, String
    
    def initialize(new_resource)
      @new_resource = new_resource
    end
    
    def self.find_by_name(name)
      Mastermind::Registry.providers[name]
    end
    
    def execute
      self.send(self.action)
    end
    
    def to_s
      "provider[#{provider_name}]"
    end
    
    def to_json(*a)
      result = {
        "name" => name,
        "attributes" => options
      }
      result.to_json(*a)
    end
  end
end
