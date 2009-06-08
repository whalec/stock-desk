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
    @day.sma_28.to_s.should eql("88.6585714285714") # Had to to_s this to get it to match...
  end
  
  it "should have an Exponential Moving Average of 12 on the date of the 29/04/2009" do
    @day.ema_12.to_s.should eql("88.02")
  end
  
  it "should have an Exponential Moving Average of 26 on the date of the 29/04/2009" do
    @day.ema_26.to_s.should eql("91.42")
  end
  
  it "should have a MACD based of the EMA 12 & 26" do
    @day.macd[:value].should_not be_nil
    @day.macd[:average].should_not be_nil
  end
end