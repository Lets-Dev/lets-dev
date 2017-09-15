require 'spec_helper'

describe LanguageSet do
  it :has_valid_factory do
    expect(FactoryGirl.build(:language_set)).to be_valid
  end
end
