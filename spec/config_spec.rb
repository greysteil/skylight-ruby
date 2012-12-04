require 'spec_helper'

module Skylight
  describe Config do

    let :config do
      Config.new
    end

    let :yaml_config do
      Config.load_from_yaml(File.expand_path("../fixtures/sample_config.yml", __FILE__))
    end

    it "has correct defaults" do
      config.authentication_token.should == "8yagFhG61tYeY4j18K8+VpI0CyG4sht5J2Oj7RQL05RhcHBsaWNhdGlvbl9pZHM9Zm9vJnJvbGU9YWdlbnQ="
      config.ssl.should == true
      config.deflate.should == true
      config.host.should == "agent.skylight.io"
      config.port.should == 443
      config.samples_per_interval.should == 100
      config.interval.should == 5
      config.max_pending_traces.should == 1_000
    end

    it "has boolean aliases" do
      config.ssl?.should == true
      config.deflate?.should == true
    end

    it "can be loaded from YAML" do
      yaml_config.authentication_token.should == "abc123"
      yaml_config.ssl.should == false
      yaml_config.deflate.should == false
      yaml_config.host.should == "localhost"
      yaml_config.port.should == 8080
      yaml_config.samples_per_interval.should == 50
      yaml_config.interval.should == 10
      yaml_config.max_pending_traces.should == 500
    end

  end
end
