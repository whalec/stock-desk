module Portfolio
  class Chart
    attr_reader :symbol
    
    def initialize(symbol, &block)
      raise StandardError, "You must define a symbol" unless symbol
      @symbol = symbol
      
      activate!
      instance_eval(&block) if block_given?
    end

    private
    
    def activate!
      Portfolio.activate(symbol, self)
    end
  end
end