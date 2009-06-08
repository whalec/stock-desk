module Portfolio
  module Algorythms
    class SimpleMovingAverage
      def initialize(chart, *args)
        args.first.each do |length|
          simple_moving_average(chart, length)
        end
      end

      private

      def simple_moving_average(chart, length, options = {})
        data = options[:data] || :close
        attribute = "sma_#{length}".to_sym
        start = length - 1
        ending = chart.ticks.length - 1
        chart.ticks[start..ending].each do |tick|
          index = chart.ticks.index(tick)
          ticks = chart.ticks[index - length + 1..index].collect{|d| d.send(data)}
          total = 0
          ticks.each{|d| total += d }
          tick.studies[attribute] = total / length
        end
      end
    end
  end
end