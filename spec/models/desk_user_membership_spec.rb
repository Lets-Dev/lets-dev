require 'spec_helper'

describe DeskUserMembership do
  it :has_valid_factory do
    expect(FactoryGirl.build(:desk_user_membership)).to be_valid
  end
end
