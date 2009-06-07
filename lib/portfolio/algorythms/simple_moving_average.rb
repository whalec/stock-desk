module Portfolio
  module Algorythms
    class SimpleMovingAverage
      def initialize(chart, *args)
        args.each do |length|
          simple_moving_average(chart, length)
        end
      end

      private

      def simple_moving_average(chart, length, options = {})
        data = options[:data] || :close
      end
    end
  end
end