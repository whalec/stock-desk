require File.join(File.dirname(__FILE__), "spec_helper.rb")

describe Portfolio do

  before :all do
    Portfolio.chart :gld do
      study :simple_moving_average, 15, 28
    end
  end

  it "should create a new chart with the gld symbol" do
    Portfolio[:gld].should_not be_nil
  end
  
  it "should have a Simple Moving Average of 15 on the date of 29/04/2009" do
    date = Date.parse("2009-04-29")
    
    day = Portfolio[:gld].ticks.select{|day| day.date == date}.first
    
    day.close.should equal(88.33)
    day.sma_15.should equal(87.3293333333333)
  end
end