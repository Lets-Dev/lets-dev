require 'spec_helper'

describe Team do
  it :has_valid_factory do
    expect(FactoryGirl.build(:team)).to be_valid
  end

  context :validates do
    describe :presence_of do
      it :name do
        expect(FactoryGirl.build(:team, name: nil)).not_to be_valid
      end
    end

    describe :uniqueness_of do
      it :name do
        t = FactoryGirl.create(:team)
        expect(FactoryGirl.build(:team, name: t.name)).not_to be_valid
      end
    end
  end

  context :abilities do
    before do
      @user = FactoryGirl.create(:user)
      @ability = Ability.new(@user)
    end

    it :can_manage_if_owner do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :owner)
      expect(@ability).to be_able_to(:manage, t.team)
    end

    it :cant_manage_if_admin do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :admin)
      expect(@ability).not_to be_able_to(:manage, t.team)
    end

    it :cant_manage_if_regular do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :regular)
      expect(@ability).not_to be_able_to(:manage, t.team)
    end

    it :can_update_if_admin do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :admin)
      expect(@ability).to be_able_to(:update, t.team)
    end
  end
end
