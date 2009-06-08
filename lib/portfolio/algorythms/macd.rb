module Portfolio
  module Algorythms
    class Macd
      def initialize(chart, options = {})
        options = options.first || {}
        fast_length = options[:fast_length] || 12
        slow_length = options[:slow_length] || 26
        macd_length = options[:macd_length] || 9
        macd(chart, {:fast_length => fast_length,
                     :slow_length => slow_length,
                     :macd_length => macd_length,
                     :data => options[:data]})
      end
      
      private
      
      def macd(chart, options = {})
        puts "MACD"
        data = options[:data] || :close
        
      end
    end
  end
end