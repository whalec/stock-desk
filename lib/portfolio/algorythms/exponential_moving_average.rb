module Portfolio
  module Algorythms
    class ExponentialMovingAverage
      def initialize(chart, args)
        args.each do |length|
          exponential_moving_average(chart, length)
        end
      end

      private

      # Algorythm from Think or Swim
      # ExpAverage[1] + 2/(length+1)*(price - ExpAverage[1])
      def exponential_moving_average(chart, length, options = {})
        data = options[:data] || :close
        Portfolio::Algorythms::SimpleMovingAverage.new(chart, [length]) 
        attribute = "ema_#{length}".to_sym
        start = length
        ending = chart.ticks.length - 1
        chart.ticks[length-1].studies[attribute] = chart.ticks[length-1].send("sma_#{length}".to_sym)
        chart.ticks[start..ending].each do |tick|
          price = tick.send(data)
          prev_ema = chart.ticks[chart.ticks.index(tick) - 1].send(attribute)
          tick.studies[attribute] = prev_ema + 2.0 / (length + 1.0) * (price - prev_ema)
        end
      end
    end
  end
end