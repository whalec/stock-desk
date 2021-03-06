require File.join(File.dirname(__FILE__), "spec_helper.rb")

describe "GLD Symbol" do

  before :all do
    Portfolio.chart :gld do
      study :simple_moving_average, 15, 28
      study :exponential_moving_average, 12, 26
      study :macd
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
    @day.ema_12.to_s.should eql("88.0208550175818")
  end
  
  it "should have an Exponential Moving Average of 26 on the date of the 29/04/2009" do
    @day.ema_26.to_s.should eql("88.4452510181791")
  end
  
  it "should have a MACD based of the EMA 12 & 26" do
    @day.macd_value.should_not be_nil
    @day.macd_average.should_not be_nil
  end
  
  # NOTE: You need to use the abs(absolute value) of the macd_value && macd_average
  it "should have a MACD Value on the date of the 29/04/2009" do
    @day.macd_value.abs.to_s.should eql("0.424396000597284")
  end
  
  it "should have a MACD Average on the date of the 29/04/2009" do
    @day.macd_average.abs.to_s.should eql("0.731052236194398")
  end
end


describe "AAPL Symbol heckled" do
  
  before :all do
    # We're just mocking the warnings, I want to know they happen, I just 
    # don't want to see them all the time. 
    logger = mock(Logger)
    Portfolio.should_receive(:log).and_return(logger)
    logger.should_receive(:warn)
    
    @un_heckled_chart = Portfolio.chart(:aapl).ticks
    Portfolio.chart :aapl do
      heckle
    end
  end
  
  it "should heckle the chart" do
    Portfolio[:aapl].ticks.should_not eql(@un_heckled_chart)
  end
end