module Portfolio
  class Day
    attr_accessor :date, :open, :high, :low, :close, :volume, :adj_close, :studies

    def initialize(args = [])
      @date = Date.parse(args[0])
      @open = Float(args[1])
      @high = Float(args[2])
      @low  = Float(args[3])
      @close = Float(args[4])
      @volume = Integer(args[5])
      @adj_close = Float(args[6])
      @studies = {} # For Rails style attributes such as sma_20 sma_15 ema_20 ema_15 etc
    end

    # Returns from the attributes hash with dot syntax
    def method_missing(*args)
      if attributes.has_key? args.first
        attributes[args.first]
      else
        p self.attributes
        super
      end
    end
  end
end