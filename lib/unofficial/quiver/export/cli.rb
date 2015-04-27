require 'thor'
require 'json'

module Unofficial
  module Quiver
    module Export
      class CLI < Thor
        desc "exec", "Exports Quiver notes."
        option :in, required: true, desc: 'Quiver working directory.'
        option :out, required: true, desc: 'Directory to export.'
        option :ext, required: false, default: '.txt', desc: 'Extention to export file.'
        option :db, required: false, type: :boolean, default: File.expand_path("~/.quiver-export"), desc: 'DB file path.'
        option :log, required: false, bunner: '<PATH>', desc: 'Log file path. If it is not specified, the default is stdout.'
        option :clean, required: false, type: :boolean, default: false, desc: 'Removes --out directory before execute.'
        option :debug, required: false, type: :boolean, default: false, desc: 'Prints debug logs.'
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
