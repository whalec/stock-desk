require File.join(File.dirname(__FILE__), "spec_helper.rb")

describe "GLD Symbol" do

  before :all do
    Portfolio.chart :gld do
      study :simple_moving_average, 15, 28
    end
    @date = Date.parse("2009-04-29")
    @day = Portfolio[:gld].ticks.select{|day| day.date == @date}.first
  end

  it "should create a new chart" do
    Portfolio[:gld].should_not be_nil
  end
  
  it "should have a close price on the date of the 29/04/2009" do
    @day.close.should eql(88.33)
  end
  
  it "should have a Simple Moving Average of 15 on the date of 29/04/2009" do
    @day.sma_15.to_s.should eql("87.4353333333333") # Had to to_s this to get it to match...
  end
  
  it "should have a Simple Moving Average of 28 on the date of the 29/04/2009" do
    @day.sma_28.to_s.should eql("88.66") # Had to to_s this to get it to match...
  end
end