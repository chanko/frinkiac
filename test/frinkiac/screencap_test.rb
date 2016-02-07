require './test/test_helper'

class FrinkiacScreencapTest < Minitest::Test
  def test_exists
    assert Frinkiac::Screencap
  end

  def test_it_gives_back_empty_array
    VCR.use_cassette('empty') do
      results = Frinkiac::Screencap.search('asdf')

      assert_equal(0, results.size)

      assert(results.kind_of?(Array))
    end
  end

  def test_it_gives_back_multiple_screencaps
    VCR.use_cassette('search') do
      results = Frinkiac::Screencap.search('lazy saturday')

      assert_equal(48, results.size)

      assert(results.kind_of?(Array))
      assert(results.first.kind_of?(Frinkiac::Screencap))

      screencap = results.first

      assert_equal(1201207, screencap.id)
      assert_equal('S09E09', screencap.episode)
      assert_equal(40022, screencap.timestamp)
    end
  end

  def test_it_gives_back_correct_image_url
    VCR.use_cassette('search') do
      screencap = Frinkiac::Screencap.search('lazy saturday').first

      assert_equal('https://frinkiac.com/img/S09E09/40022.jpg', screencap.image_url)
    end
  end

  def test_it_gives_back_a_random_screencap
    VCR.use_cassette('search') do
      screencap = Frinkiac::Screencap.random('lazy saturday')

      assert(screencap.kind_of?(Frinkiac::Screencap))
    end
  end

  def test_it_gives_back_nil_when_random_returns_nothing
    VCR.use_cassette('empty') do
      screencap = Frinkiac::Screencap.random('asdf')

      assert(screencap.nil?)
    end
  end
end
