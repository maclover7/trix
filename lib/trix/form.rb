require 'action_view'
require 'active_support/core_ext'

module TrixEditorHelper
  mattr_accessor(:id, instance_accessor: false)
  class_variable_set('@@id', 0)

  def trix_editor_tag(name, value = nil, options = {})
    options.symbolize_keys!

    css_class = Array.wrap(options[:class]).join(' ')
    attributes = { class: "formatted_content trix-content #{css_class}".squish }
    attributes[:autofocus] = true if options[:autofocus]
    attributes[:input] = options[:input] || "trix_input_#{TrixEditorHelper.id += 1}"

    valid_html_options = [:placeholder, :spellcheck, :toolbar, :tabindex]
    attributes.merge!(options.slice(*valid_html_options))

    editor_tag = content_tag('trix-editor', '', attributes)
    input_tag = hidden_field_tag(name, value, id: attributes[:input])

    input_tag + editor_tag
  end
end

module ActionView
  module Helpers
    include TrixEditorHelper

    module Tags
      class TrixEditor < Base
        include TrixEditorHelper
        delegate :dom_id, to: :'@template_object'

        def render
          options = @options.stringify_keys
          add_default_name_and_id(options)
          options['input'] ||= dom_id(object, [options['id'], :trix_input].compact.join('_'))
          if Rails.version >= '5.2.0'
            value = options.delete('value') { value_before_type_cast }
          else
            value = value_before_type_cast(object)
          end
          trix_editor_tag(options.delete('name'), value, options)
        end
      end
    end

    module FormHelper
      def trix_editor(object_name, method, options = {})
        Tags::TrixEditor.new(object_name, method, self, options).render
      end
    end

    class FormBuilder
      def trix_editor(method, options = {})
        @template.trix_editor(@object_name, method, objectify_options(options))
      end
    end
  end
end
