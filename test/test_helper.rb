$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'frinkiac'

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures'
  c.hook_into :webmock
  c.default_cassette_options = {
    match_requests_on: [:method, :host, :path]
  }
end