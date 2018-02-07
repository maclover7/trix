require 'test_helper'

class TrixTest < Minitest::Test
  def test_trix_version_not_nil
    refute_nil Trix::VERSION
  end
end
