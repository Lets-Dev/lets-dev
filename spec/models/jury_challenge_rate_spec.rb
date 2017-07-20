require 'spec_helper'

describe JuryChallengeRate do
  it :has_valid_factory do
    expect(FactoryGirl.build(:jury_challenge_rate)).to be_valid
  end
end
