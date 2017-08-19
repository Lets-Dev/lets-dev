require 'spec_helper'

describe TeamUserMembershipRequest do
  it :has_valid_factory do
    expect(FactoryGirl.build(:team_user_membership_request)).to be_valid
  end
end
