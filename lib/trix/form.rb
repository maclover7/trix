require 'action_view'
require 'active_support/core_ext'

module TurbotrixEditorHelper
  mattr_accessor(:id, instance_accessor: false)
  class_variable_set('@@id', 0)

  def turbotrix_editor_tag(name, value = nil, options = {})
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
    include TurbotrixEditorHelper

    module Tags
      class TurbotrixEditor < Base
        include TurbotrixEditorHelper
        delegate :dom_id, to: :'@template_object'

        def render
          options = @options.stringify_keys
          add_default_name_and_id(options)
          options['input'] ||= dom_id(object, [options['id'], :trix_input].compact.join('_'))
          trix_editor_tag(options.delete('name'), value_before_type_cast(object), options)
        end
      end
    end

    module FormHelper
      def turbotrix_editor(object_name, method, options = {})
        Tags::TurbotrixEditor.new(object_name, method, self, options).render
      end
    end

    class FormBuilder
      def turbotrix_editor(method, options = {})
        @template.turbotrix_editor(@object_name, method, objectify_options(options))
      end
    end
  end
end
