require 'rubygems'
require 'webmock'
require 'logworm'

require File.dirname(__FILE__) + '/spec_helper'

$: << File.dirname(__FILE__) + '/../lib'
require 'logworm_client/logger.rb'

describe Logworm::Logger, " flushing" do
  before do
    Logworm::Logger.use_db Logworm::DB.new("logworm://a:b@localhost/c/d/")
  end
  
  it "should only record if it's been initialized" do
    Logworm::Logger.use_db nil
    Logworm::Logger.log(:tbl1, :a => 1)
    Logworm::Logger.flush.should == [0,0]
  end

  it "should only record if there are entries" do
    Logworm::Logger.flush.should == [0,0]
  end
  
  it "should try to record it it's initialized and has entries, and then reset" do
    stub_request(:post, "localhost/log").to_return(:body => {:count => 10, :inserted_at => Time.now}.to_json)
    Logworm::Logger.log(:tbl1, :a => 1)
    Logworm::Logger.flush[0].should == 1
    Logworm::Logger.flush.should == [0,0]
  end
  
end

