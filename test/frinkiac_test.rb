require './test/test_helper'

class FrinkiacTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Frinkiac::VERSION
  end
end
