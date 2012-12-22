module Sinatra
  module JstSupport
    def self.registered(app)
      app.extend ClassMethods
      app.helpers Helpers
    end

    # Returns a hash to determine which engine is mapped onto a given extension.
    def self.mappings
      @mappings ||= Hash.new
    end

    def self.register(ext, engine)
      mappings[ext] = engine
    end

    class Engine
      attr_reader :file
      def initialize(file); @file = file; end
      def contents()        File.read(@file); end

      # The pre-processing that happens before sending it to the compiled
      # JST file. Override me if needed.
      def precompile()      contents.inspect; end

      # The JavaScript function to invoke on the precompile'd object.
      def function()        "_.template"; end
    end

    register 'tpl', Engine

    module Helpers
      # Returns a list of JST files.
      def jst_files
        # Tuples of [ name, Engine instance ]
        tuples = Dir.chdir(Main.views) {
          Dir["**/*.jst.*"].map { |fn|
            fn       =~ %r{^(.*)\.jst\.([^\.]+)$}
            name, ext = $1, $2
            engine    = JstSupport.mappings[ext]

            [ name, engine.new(File.join(Main.views, fn)) ]  if engine
          }.compact
        }

        Hash[*tuples.flatten]
      end
    end

    module ClassMethods
      def serve_jst(path, options={})
        get path do
          content_type :js
          jsts = jst_files.map { |(name, engine)|
            contents = engine.precompile
            fn       = engine.function

            %{
              JST[#{name.inspect}] = function() {
                if (!c[#{name.inspect}]) c[#{name.inspect}] = #{fn}(#{contents});
                return c[#{name.inspect}].apply(this, arguments);
              };
          }.strip.gsub(/^ {12}/, '')
          }

          %{
            (function(){
              var c = {};
              if (!window.JST) window.JST = {};
              #{jsts.join("\n  ")}
            })();
          }.strip.gsub(/^ {12}/, '')
        end
      end
    end
  end
end


# module Sinatra
#   module JstSupport
#     # Requires haml.js.
#     # https://github.com/creationix/haml-js I think.
#     class HamlEngine < Engine
#       def function()  "Haml.compile"; end
#     end

#     # Requires jade.js.
#     # https://github.com/visionmedia/jade
#     class JadeEngine < Engine
#       def function()  "require('jade').compile"; end
#       def precompile; contents.inspect; end
#     end

#     register 'jade', Engines::JadeEngine
#     register 'haml', Engines::HamlEngine
#   end
# end