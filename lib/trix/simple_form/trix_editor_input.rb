module Turbotrix
  module SimpleForm
    class TurbotrixEditorInput < ::SimpleForm::Inputs::Base
      def input(_wrapper_options)
        editor_tag = template.content_tag('trix-editor', '', input: input_class, class: 'trix-content')
        hidden_field = @builder.hidden_field(attribute_name, input_html_options)

        template.content_tag('div', editor_tag + hidden_field, class: 'trix-editor-wrapper')
      end
    end
  end
end
