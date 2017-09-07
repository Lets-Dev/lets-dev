require 'spec_helper'

describe Challenge do
  it :has_valid_factory do
    expect(FactoryGirl.build(:challenge)).to be_valid
  end

  describe :validates do
    describe :presence_of do
      it :language_set do
        expect(FactoryGirl.build(:challenge, language_set: nil)).not_to be_valid
      end

      it :title do
        expect(FactoryGirl.build(:challenge, title: nil)).not_to be_valid
      end

      it :subject do
        expect(FactoryGirl.build(:challenge, subject: nil)).not_to be_valid
      end

      it :starts_at do
        expect(FactoryGirl.build(:challenge, starts_at: nil)).not_to be_valid
      end

      it :ends_at do
        expect(FactoryGirl.build(:challenge, ends_at: nil)).not_to be_valid
      end
    end
  end
end
