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
        default_task :exec

        def exec
          puts "options: in = #{options[:in]}, out = #{options[:out]}"

          clean
          scan_content do |content_file|
            writer = NoteWriter.new(content_file, options)
            writer.write
          end

          puts 'Export complete!!'
        end

        private

        def clean
          puts 'Clean the --out option directory.'
          d = options[:out]
          FileUtils.rm_r(d) if File.exists?(d)
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
