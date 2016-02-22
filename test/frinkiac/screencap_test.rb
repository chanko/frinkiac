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

  def test_it_gives_back_the_correct_caption
    VCR.use_cassette('caption') do
      screencap = Frinkiac::Screencap.search('strap in and feel the g\'s').first

      assert_equal("NOBODY SNUGGLES WITH MAX\nPOWER. YOU STRAP\nYOURSELF IN AND FEEL THE\nGs!", screencap.caption)
    end
  end

  def test_it_gives_back_the_correct_meme_url
    VCR.use_cassette('meme') do
      screencap = Frinkiac::Screencap.search('strap in and feel the g\'s').first

      assert_equal(screencap.meme_url, 'https://frinkiac.com/meme/S10E13/774439.jpg?lines=NOBODY%20SNUGGLES%20WITH%20MAX%0APOWER.%20YOU%20STRAP%0AYOURSELF%20IN%20AND%20FEEL%20THE%0AGs!')
    end
  end

  def test_it_allows_a_custom_caption_for_a_meme
    VCR.use_cassette('meme') do
      screencap = Frinkiac::Screencap.search('strap in and feel the g\'s').first

      assert_equal(screencap.meme_url("NOBODY SNUGGLES WITH MAX POWER.\nYOU STRAP YOURSELF IN AND FEEL THE Gs!"), 'https://frinkiac.com/meme/S10E13/774439.jpg?lines=NOBODY%20SNUGGLES%20WITH%20MAX%20POWER.%0AYOU%20STRAP%20YOURSELF%20IN%20AND%20FEEL%20THE%20Gs!')
    end
  end

  def test_it_allows_captions_as_arrays
    VCR.use_cassette('meme') do
      screencap = Frinkiac::Screencap.search('strap in and feel the g\'s').first

      assert_equal(screencap.meme_url(["NOBODY SNUGGLES WITH MAX POWER.","YOU STRAP YOURSELF IN AND FEEL THE Gs!"]), 'https://frinkiac.com/meme/S10E13/774439.jpg?lines=NOBODY%20SNUGGLES%20WITH%20MAX%20POWER.%0AYOU%20STRAP%20YOURSELF%20IN%20AND%20FEEL%20THE%20Gs!')
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
