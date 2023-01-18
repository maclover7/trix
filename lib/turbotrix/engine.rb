module Turbotrix
  class Engine < ::Rails::Engine
    initializer 'turbotrix.view_helpers' do
      ActiveSupport.on_load(:action_view) do
        require 'turbotrix/form'
      end

      if defined? ::SimpleForm
        require 'turbotrix/simple_form/turbotrix_editor_input'

        ::SimpleForm.setup do |config|
          config.custom_inputs_namespaces << 'Turbotrix::SimpleForm'
        end
      end
    end
  end
end
