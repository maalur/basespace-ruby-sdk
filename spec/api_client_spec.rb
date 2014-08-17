require 'rubygems'
require 'rspec'

require 'bio-basespace-sdk'

describe Bio::BaseSpace::APIClient do
  describe "initialization" do
    it "omitting access token" do
      expect { Bio::BaseSpace::APIClient.new }.to raise_error(Bio::BaseSpace::UndefinedParameterError)
    end
  end
end