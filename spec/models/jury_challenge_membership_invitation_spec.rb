require 'spec_helper'

describe JuryChallengeMembershipInvitation do
  it :has_valid_factory do
    expect(FactoryGirl.build(:jury_challenge_membership_invitation)).to be_valid
  end
end
