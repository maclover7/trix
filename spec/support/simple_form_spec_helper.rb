require 'simple_form'

::SimpleForm.setup do |config|
  config.custom_inputs_namespaces << 'Trix::SimpleForm'
end

module SimpleFormSpecHelper
  include ::SimpleForm::ActionViewExtensions::FormHelper
end
