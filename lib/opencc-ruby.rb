require 'opencc-ruby/opencc'

module Opencc
  class Convert
    def initialize(config=nil) 
      @od = Opencc.open config
    end  
    def convert(str) 
      return Opencc.convert @od, str
    end
    def destroy 
      Opencc.close $od
    end
  end
end
