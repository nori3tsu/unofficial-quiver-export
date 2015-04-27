require 'thor'
require 'json'

module Unofficial
  module Quiver
    module Export
      class CLI < Thor

        desc "exec", "export Quiver notes to .md files."
        option :in, required: true
        option :out, required: true
        option :ext, required: false, default: '.txt'
        option :db, required: false, default: File.expand_path("~/.quiver-export")
        option :log, required: false, default: STDOUT
        option :clean, required: false, default: false
        option :debug, required: false, default: false
        default_task :exec

        def exec
          init

          Logger.debug("options: #{options}")

          scan_content do |content_file|
            writer = NoteWriter.new(content_file, options)
            writer.write
          end

          Logger.info('Export complete!!')
        end

        private

        def init
          Logger.configure(options[:log], debug: options[:debug])
          clean if options[:clean]
        end

        def clean
          Logger.info('Clean --out and --db option directories.')
          FileUtils.rm_r(options[:out]) if File.exists?(options[:out])
          FileUtils.rm_r(options[:db]) if File.exists?(options[:db])
        end

        def scan_content
          Dir.glob(File.join(options[:in], '**/*.qvnote/content.json')).each do |content_file|
            yield(content_file)
          end
        end
      end
    end
  end
end
