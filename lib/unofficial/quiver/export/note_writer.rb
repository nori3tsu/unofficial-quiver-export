require 'moneta'

module Unofficial
  module Quiver
    module Export
      class NoteWriter
        def initialize(content_file, options)
          @content_file = File.new(content_file)
          @content = JSON.parse(open(content_file).read)
          @options = options

          @store = Moneta.new(:HashFile, dir: @options[:db])
        end

        def write
          return unless updated?

          open(output_note_file, 'w') do |f|
            Logger.debug(f.path)
            @content['cells'].each do |cell|
              f.puts cell['data']
            end
          end

          save_last_updated_time
        end

        private

        def updated?
          wrote_time = @store[meta['uuid']]
          return true unless wrote_time

          wrote_time < @content_file.mtime
        end

        def save_last_updated_time
          @store[meta['uuid']] = @content_file.mtime
        end

        def meta
          f = File.join(File.dirname(@content_file), 'meta.json')
          @meta = JSON.parse(open(f).read)
        end

        def notebook_meta
          f = File.join(File.dirname(@content_file), '../meta.json')
          @notebook_meta = JSON.parse(open(f).read)
        end

        def output_note_file
          f = File.join(@options[:out], notebook_meta['name'], @content['title'].gsub('/', '') + @options[:ext])
          FileUtils.mkdir_p(File.dirname(f))
          f
        end
      end
    end
  end
end
