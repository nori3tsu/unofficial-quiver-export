require 'logger'

module Unofficial
  module Quiver
    module Export
      class Logger
        def self.configure(out, debug: false)
          init_instance(out)

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

        private

        def self.init_instance(out)
          if out.nil?
            @logger = ::Logger.new(STDOUT)
          else
            @logger = ::Logger.new(out)
          end
        end
      end
    end
  end
end
