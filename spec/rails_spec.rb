require 'rubygems'
require 'webmock'
require 'logworm'

require File.dirname(__FILE__) + '/spec_helper'

$: << File.dirname(__FILE__) + '/../lib'

describe Logworm, " init" do
  it "should initialize the logger with a default db" do
    require 'logworm_client/logger.rb'                  # ==> Get Logworm::Logger defined
    Logworm::Logger.should_receive(:use_default_db)

    require 'action_controller'                         # ==> Get ActionController defined 
    load 'logworm_client/rails.rb'                      # ==> does class_eval of ActionController (use load to guarantee require)
  end
end

