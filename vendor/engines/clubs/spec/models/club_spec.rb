require 'spec_helper'

describe Club do

  def reset_club(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @club.destroy! if @club
    @club = Club.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_club
  end

  context "validations" do
    
    it "rejects empty name" do
      Club.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_club
      Club.new(@valid_attributes).should_not be_valid
    end
    
  end

end