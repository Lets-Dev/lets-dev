require 'spec_helper'

describe Desk do
  it :has_valid_factory do
    expect(FactoryGirl.build(:desk)).to be_valid
  end

  describe :validates do
    describe :presence_of do
      it :started_at do
        expect(FactoryGirl.build(:desk, started_at: nil)).not_to be_valid
      end

      it :ended_at do
        expect(FactoryGirl.build(:desk, ended_at: nil)).not_to be_valid
      end
    end
  end
end
