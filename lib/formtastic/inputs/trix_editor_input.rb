class TrixEditorInput < Formtastic::Inputs::StringInput
  def to_html
    input_wrapping do
      construct_editor_tag_params

      editor_tag = template.content_tag('trix-editor', '', @editor_tag_params)
      hidden_field = builder.hidden_field(method, input_html_options)

      editor = template.content_tag('div', editor_tag + hidden_field, class: 'trix-editor-wrapper')

      label_html + editor
    end
  end

  # In Formtastic::Inputs::Base::Html#input_html_options is always generated so we cannot .delete on it
  #
  # This implementation calls the original only once
  def input_html_options
    @input_html_options ||= super
  end

  # Returns params specifically for the trix-editor-tag and moves options autofocus and placeholder
  # from the input_html_options to here
  def construct_editor_tag_params
    @editor_tag_params ||= {
      input: input_html_options[:id],
      class: 'trix-content',
      autofocus: input_html_options.delete(:autofocus),
      placeholder: input_html_options.delete(:placeholder)
    }
  end
end
