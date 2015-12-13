ENV['RACK_ENV'] = 'test'

require_relative '../pradlibs.rb'
require 'rack/test'

describe 'Pull Request Annoying Data Libraries' do
  include Rack::Test::Methods

  def app
    PradLibs
  end

  describe "#post" do
    it "can recieve a POST request" do
      post '/'
      expect(last_response).to be_ok
    end

    context "bad args" do
      it "tell the user they're doin' it wrong" do
        post '/'
        expect(last_response.body).to include 'usage'
      end
    end
  end
end