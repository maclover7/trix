class TrixEditorInput < Formtastic::Inputs::StringInput
  def to_html
    input_wrapping do
      editor_tag_params = {
        input: input_html_options[:id]
      }
      editor_tag = template.content_tag('trix-editor', '', editor_tag_params)
      hidden_field = builder.hidden_field(method, input_html_options)

      editor = template.content_tag('div', editor_tag + hidden_field, class: 'trix-editor-wrapper')

      label_html + editor
    end
  end
end
