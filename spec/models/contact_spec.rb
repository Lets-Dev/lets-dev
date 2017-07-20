require 'spec_helper'

describe Contact do
  it :has_valid_factory do
    expect(FactoryGirl.build(:contact)).to be_valid
  end

  describe :validates do
    describe :presence_of do
      it :name do
        expect(FactoryGirl.build(:contact, name: nil)).not_to be_valid
      end
    end
  end
end
