module Portfolio
  module Algorythms
    class ExponentialMovingAverage
      def initialize(chart, *args)
        args.each do |length|
          exponential_moving_average(chart, length)
        end
      end

      private

      def exponential_moving_average(chart, length, options = {})
        data = options[:data] || :close
      end
    end
  end
end