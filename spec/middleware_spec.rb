ENV['RACK_ENV'] ||= 'test'

Bundler.require

require 'minitest/autorun'
require 'rack'
require 'rack/client'

describe Ping::Middleware do
  before do
    app = Rack::Builder.new do
      use Ping::Middleware
      run lambda {|e| [200, {'Content-Type' => 'text/plain'}, ['app']]}
    end

    @client = Rack::Client.new do
      run app
    end
  end

  it "responds to a ping" do
    response = @client.get('http://example.com/__ping__')
    response.status.must_equal 200
    response.body.must_equal 'Pong'
  end

  it "runs the rest of the app just fine" do
    urls = [
      'http://example.com/__ping_',
      'http://example.com/_ping__',
      'http://example.com/ping',
      'http://example.com/real_url',
      'http://example.com/'
    ]

    urls.each do |url|
      response = @client.get(url)
      response.status.must_equal 200
      response.body.must_equal 'app'
    end
  end
end
