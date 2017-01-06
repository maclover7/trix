module Trix
  class Engine < ::Rails::Engine
    initializer 'trix.view_helpers' do
      ActiveSupport.on_load(:action_view) do
        require 'trix/form'
      end

      if defined? ::SimpleForm
        require 'trix/simple_form/trix_editor_input'

        ::SimpleForm.setup do |config|
          config.custom_inputs_namespaces << 'Trix::SimpleForm'
        end
      end
    end
  end
end
