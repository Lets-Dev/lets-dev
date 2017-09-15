require 'spec_helper'

describe JuryChallengeMembershipRequest do
  it :has_valid_factory do
    expect(FactoryGirl.build(:jury_challenge_membership_request)).to be_valid
  end
end
