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
end