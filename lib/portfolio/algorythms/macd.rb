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
        data = options[:data] || :close
        chart.ticks[options[:slow_length] - 1..chart.ticks.length - 1].each do |tick|
          slow_length = tick.send("ema_#{options[:slow_length]}")
          fast_length = tick.send("ema_#{options[:fast_length]}")
          tick.studies[:macd_value] = fast_length - slow_length
        end
        
        ema_chart = chart.ticks[options[:slow_length]..chart.ticks.length - 1]
        data = :macd_value
        attribute = :macd_average
        chart.ticks[options[:slow_length] - 1].studies[attribute] = chart.ticks[options[:slow_length] - 1].send(data)
        chart.ticks[options[:slow_length]..chart.ticks.length - 1].each do |tick|
          price = tick.send(data)
          prev_ema = chart.ticks[chart.ticks.index(tick) - 1].send(attribute)
          tick.studies[attribute] = (prev_ema + 2.0 / (options[:macd_length] + 1.0) * (price - prev_ema))
        end
        
        
      end
    end
  end
end