# Frozen-string-literal: true
# Copyright: 2017 Jordon Bedwell - MIT License
# Encoding: utf-8

require "rspec/helper"

describe Jekyll::LogWrapper do
  let :io do
    StringIO.new
  end

  #

  before :each do
    allow(wrapper.logger.writer).to receive(:logdevice).
      and_return(io)
  end

  #

  let :wrapper do
    Jekyll::LogWrapper.new(Jekyll.logger)
  end

  #

  [:error, :warn, :info, :debug].each do |k|
    it { respond_to :"#{k}?" }
    it { respond_to k }

    #

    describe "##{k}" do
      before :each do
        wrapper.info("hello") do
          "world"
        end
      end

      it "should add a : when yielding" do
        expect(io.string.strip).to(eq("hello: world"))
      end
    end
  end
end
