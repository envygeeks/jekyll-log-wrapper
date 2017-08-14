# Frozen-String-Literal: true
# Copyright 2017 Jordon Bedwell - MIT License
# Encoding: UTF-8

require "forwardable/extended"
require "logger"

module Jekyll
  class LogWrapper
    extend Forwardable::Extended
    rb_delegate :level , :to => :"@logger.writer"
    attr_reader :logger

    # --
    # @return [Jekyll::LogWrapper]
    # @param logger [Jekyll::Logger] the logger
    # Initialize a new instance.
    # --
    def initialize(obj)
      @logger = obj
    end

    # --
    # @return [Symbol] because that's what Jekyll does.
    # Wraps around Jekyll's handling of log levels to translate
    #   numbers into what they expect (:symbols) so that your
    #   logger behaves as expected.
    # --
    def level=(val)
      if val.is_a?(Integer)
        val = Logger::SEV_LABEL.fetch(val).
          downcase.to_sym
      end

      @logger.writer.level = val
    end

    [:error, :warn, :info, :debug].each do |k|
      rb_delegate "#{k}?", to: :"@logger.writer"

      # --
      # @return [true,false] if it logged.
      # Wraps around the original method so that we can
      #   accept, a block (which is what most loggers allow)
      #   for you to do anyways.
      # --
      define_method k do |*msgs, &block|
        if block
          msgs << msgs.pop+":"
          msgs << block.call
        end

        @logger.send(k, *msgs)
      end
    end
  end
end
