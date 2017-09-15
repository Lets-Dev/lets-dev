require 'spec_helper'

describe FinancialMovement do
  it :has_valid_factory do
    expect(FactoryGirl.build(:financial_movement)).to be_valid
  end
end
