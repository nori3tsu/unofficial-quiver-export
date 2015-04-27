require 'logger'

module Unofficial
  module Quiver
    module Export
      class Logger
        def self.configure(out, debug: false)
          @logger = ::Logger.new(out)
          @logger.level = ::Logger::INFO unless debug
        end

        def self.debug(msg)
          @logger.debug(msg)
        end

        def self.info(msg)
          @logger.info(msg)
        end

        def self.warn(msg)
          @logger.warn(msg)
        end

        def self.error(msg)
          @logger.error(msg)
        end
      end
    end
  end
end
