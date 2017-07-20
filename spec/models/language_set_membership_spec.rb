require 'spec_helper'

describe LanguageSetMembership do
  it :has_valid_factory do
    expect(FactoryGirl.build(:language_set_membership)).to be_valid
  end
end
