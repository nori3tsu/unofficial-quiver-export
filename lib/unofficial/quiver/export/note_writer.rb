module Unofficial
  module Quiver
    module Export
      class NoteWriter
        def initialize(content_file, options)
          @content_file = content_file
          @content = JSON.parse(open(content_file).read)
          @options = options
        end

        def write
          open(output_note_file, 'w') do |f|
            Logger.debug(f.path)
            @content['cells'].each do |cell|
              f.puts cell['data']
            end
          end
        end

        private

        def meta_file
          @meta_file ||= File.join(File.dirname(@content_file), '../meta.json')
        end

        def nootbook
          nootbook_meta = JSON.parse(open(meta_file).read)
          nootbook_meta['name']
        end

        def output_note_file
          f = File.join(@options[:out], nootbook, @content['title'].gsub('/', '') + @options[:ext])
          FileUtils.mkdir_p(File.dirname(f))
          f
        end
      end
    end
  end
end
