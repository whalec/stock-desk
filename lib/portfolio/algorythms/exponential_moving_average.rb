module Portfolio
  module Algorythms
    class ExponentialMovingAverage
      def initialize(chart, *args)
        args.each do |length|
          exponential_moving_average(chart, length)
        end
      end

      private

      # Take the SMA of the length from LENGTH unit back in the array
      # Use that SMA as a base to 
      def exponential_moving_average(chart, length, options = {})
        data = options[:data] || :close
        
      end
    end
  end
end

# # Algorythm from Think or Swim
# # ExpAverage[1] + 2/(length+1)*(price - ExpAverage[1])
# def exponential_moving_average(options = {})
#   # Start with the oldest SMA as a base
#   sma = simple_moving_average(:length => options[:length], :index => options[:length], :data => options[:data])
#   starting_point, ending_point = options[:range] || [(options[:length] + 1), @days.length - 1]
#   days = @days[starting_point..ending_point]
#   data = options[:data] || :close
#   previous = sma
#   attribute = options[:attribute] || "ema_#{options[:length]}".to_sym
#   days.each do |day|
#     if day.respond_to?(data)
#       previous = previous + 2.0 / (options[:length] + 1) * (day.send(data) - previous)
#       day.attributes[attribute] = previous
#     end
#   end
# end