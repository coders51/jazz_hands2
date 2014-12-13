require 'pry'
require 'pry-rails'
require 'pry-doc'
require 'pry-git'
require 'pry-remote'
require 'pry-stack_explorer'
require 'jazz_hands2/hirb_ext'
require 'pry-byebug'

module JazzHands2
  class Railtie < Rails::Railtie
    initializer 'jazz_hands2.initialize' do |app|
      silence_warnings do
        Pry.config.should_load_plugins = false

        # Hirb in pry
        Pry.config.print = -> (output, value, _pry_ = Pry) do
          if JazzHands2._hirb_output
            return if Hirb::View.view_or_page_output(value)
          end
          if defined?(AwesomePrint)
            pretty = value.ai(indent: 2)
            output.puts "=> #{pretty}"
          else
            output.puts value
          end
        end
        Hirb.enable

        color = -> { Pry.color && JazzHands2.colored_prompt }
        red  = ->(text) { color[] ? "\001\e[0;31m\002#{text}\001\e[0m\002" : text.to_s }
        blue = ->(text) { color[] ? "\001\e[0;34m\002#{text}\001\e[0m\002" : text.to_s }
        bold = ->(text) { color[] ? "\001\e[1m\002#{text}\001\e[0m\002"    : text.to_s }

        separator = -> { red.(JazzHands2.prompt_separator) }
        name = app.class.parent_name.underscore
        colored_name = -> { blue.(name) }

        line = ->(pry) { "[#{bold.(pry.input_array.size)}] " }
        target_string = ->(object, level) do
          level = 0 if level < 0
          unless (string = Pry.view_clip(object)) == 'main'
            "(#{'../' * level}#{string})"
          else
            ''
          end
        end

        Pry.config.prompt = [
          ->(object, level, pry) do      # Main prompt
            "#{line.(pry)}#{colored_name.()}#{target_string.(object, level)} #{separator.()}  "
          end,
          ->(object, level, pry) do      # Wait prompt in multiline input
            spaces = ' ' * (
              "[#{pry.input_array.size}] ".size +  # Uncolored `line.(pry)`
              name.size +
                target_string.(object, level).size
            )
            "#{spaces} #{separator.()}  "
          end
        ]
      end
    end
  end
end
