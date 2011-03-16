module Dribbble
  class Base
    include HTTParty
    extend HTTParty
    
    base_uri 'api.dribbble.com'
    
    def initialize(attributes = {})
      attributes ||= {}
      attributes.each do |key, value|
        setter = "#{key}="
        self.send setter, value if self.respond_to?(setter)
      end
      
      after_initialize(attributes)
    end
    
    def self.paginated_list(result, list_key='shots')
      result[llist_key].map do |attributes|
        new(attributes)
      end
    end
  end
end