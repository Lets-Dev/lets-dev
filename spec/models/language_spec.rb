require 'spec_helper'

describe Language do
  it :has_valid_factory do
    expect(FactoryGirl.build(:language)).to be_valid
  end
end
