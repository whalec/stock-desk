require 'rubygems'
require 'fastercsv'
require 'open-uri'
require 'logger'
$:<< File.join(File.dirname(__FILE__))
Dir["#{File.dirname(__FILE__)}/portfolio/*.rb"].each &method(:require)
Dir["#{File.dirname(__FILE__)}/portfolio/**/*.rb"].each &method(:require)
module Portfolio
  class << self
    @@active_charts = {}
    attr_reader :active_charts
    
    # Access registered smoke source instances
    #
    # Usage:
    #
    #     Portfolio.chart :spx do ....
    #
    #     Portfolio[:spx]
    #     => #<Portfolio::Chart::0x18428d4...
    def [](symbol)
      active_charts[symbol]
    end
    
    # Activates new instances of sources
    # Source instances are stored within the 
    # @@active_sources class variable for later use
    def activate(symbol, chart)
      if active_charts.has_key?(symbol)
        Portfolio.log.warn "Portfolio chart activation: Chart with idential symbol already initialized" 
      end
      active_charts.update({ symbol => chart })
    end
    
    # Returns all activated smoke sources
    def active_charts
      @@active_charts
    end
    
    # Log for info, debug, error and warn with:
    # 
    #   Portfolio.log.info "message"
    #   Portfolio.log.debug "message"
    #   Portfolio.log.error "message"
    #   Portfolio.log.warn "message"
    def log
      @@log ||= Logger.new($stdout)
    end
    
    def chart(symbol, &block); Portfolio::Chart.new(symbol, &block); end
  end
end