require 'spec_helper'

describe JuryChallengeMembership do
  it :has_valid_factory do
    expect(FactoryGirl.build(:jury_challenge_membership)).to be_valid
  end
end
