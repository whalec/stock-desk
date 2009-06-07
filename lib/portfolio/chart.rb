module Portfolio
  require 'net/http'
  class Chart
    attr_reader :symbol, :ticks
    
    def initialize(symbol, &block)
      raise StandardError, "You must define a symbol" unless symbol
      @symbol = symbol
      @ticks  = get_ticks
      
      activate!
      instance_eval(&block) if block_given?
    end
    
    def study(study_name, *args)
      study = "Portfolio::Algorythms::#{study_name.to_s.split("_").map{|x| x.capitalize}.join}"
      klass = instance_eval(study)
      klass.send(:new, self, args)
    end

    private
    
    def activate!
      Portfolio.activate(symbol, self)
    end
    
    def get_ticks
      uri = URI.parse("http://ichart.finance.yahoo.com")
      res = Net::HTTP.start(uri.host, uri.port) do |http|
        http.get("/table.csv?s=#{symbol.to_s.upcase}")
      end
      csv = FasterCSV.parse(res.body)
      csv[1..csv.length-1].map{|day| Day.new(day)}.reverse # Need the oldest day first
    end
  end
end