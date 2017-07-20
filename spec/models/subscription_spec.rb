require 'spec_helper'

describe Subscription do
  it :has_valid_factory do
    expect(FactoryGirl.build(:subscription)).to be_valid
  end
end
