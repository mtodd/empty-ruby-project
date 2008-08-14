module Project
  
  VERSION = [0, 0, 0]
  
  class << self
    
    def version
      VERSION.join('.')
    end
    
  end
  
end
