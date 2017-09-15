require 'spec_helper'

describe User do
  it :has_valid_factory do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  describe :validates do
    describe :presence_of do
      it :username do
        expect(FactoryGirl.build(:user, username: nil)).not_to be_valid
      end

      it :email do
        expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
      end
    end

    describe :uniqueness_of do
      it :username do
        u = FactoryGirl.create(:user)
        expect(FactoryGirl.build(:user, username: u.username)).not_to be_valid
      end

      it :email do
        u = FactoryGirl.create(:user)
        expect(FactoryGirl.build(:user, email: u.email)).not_to be_valid
      end
    end
  end
end
