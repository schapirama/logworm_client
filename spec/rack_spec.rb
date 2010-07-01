require 'rubygems'
require 'webmock'
require 'logworm'

require File.dirname(__FILE__) + '/spec_helper'

$: << File.dirname(__FILE__) + '/../lib'
require 'logworm_client.rb'

describe Logworm::Rack, " init" do
  it "should initialize the logger with a default db" do
    Logworm::Logger.should_receive(:use_default_db)
    Logworm::Rack.new("xx")
  end
end

