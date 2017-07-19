require 'spec_helper'

describe TeamUserMembership do
  it :has_valid_factory do
    expect(FactoryGirl.build(:team_user_membership)).to be_valid
  end

  context :validates do
    describe :presence_of do
      it :team do
        expect(FactoryGirl.build(:team_user_membership, team: nil)).not_to be_valid
      end

      it :user do
        expect(FactoryGirl.build(:team_user_membership, user: nil)).not_to be_valid
      end
    end

    describe :uniqueness_of do
      it :active_membership_by_user do
        t = FactoryGirl.create(:team_user_membership)
        expect(FactoryGirl.build(:team_user_membership, user: t.user)).not_to be_valid
        t.update(ended_at: Time.now - 1.day)
        expect(FactoryGirl.build(:team_user_membership, user: t.user)).to be_valid
      end

      it :owner_membership_by_team do
        t = FactoryGirl.create(:team_user_membership, role: :owner)
        expect(FactoryGirl.build(:team_user_membership, team: t.team, role: :owner)).not_to be_valid
        t.update(role: :regular)
        expect(FactoryGirl.build(:team_user_membership, team: t.team, role: :owner)).to be_valid
      end
    end
  end

  context :abilities do
    before do
      @user = FactoryGirl.create(:user)
      @ability = Ability.new(@user)
    end

    it :can_manage_own_team_memberships_if_owner do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :owner)
      expect(@ability).to be_able_to(:manage, FactoryGirl.build(:team_user_membership, team: t.team))
    end

    it :can_manage_own_regular_team_memberships_if_admin do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :admin)
      expect(@ability).to be_able_to(:manage, FactoryGirl.build(:team_user_membership, team: t.team, role: :regular))
    end

    it :cant_manage_own_admin_team_memberships_if_admin do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :admin)
      expect(@ability).not_to be_able_to(:manage, FactoryGirl.build(:team_user_membership, team: t.team, role: :admin))
    end

    it :cant_manage_own_owner_team_memberships_if_admin do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :admin)
      expect(@ability).not_to be_able_to(:manage, FactoryGirl.build(:team_user_membership, team: t.team, role: :owner))
    end

    it :cant_manage_own_team_memberships_if_admin do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :regular)
      expect(@ability).not_to be_able_to(:manage, FactoryGirl.build(:team_user_membership, team: t.team))
    end

    it :can_read_memberships_if_regular do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :regular)
      expect(@ability).not_to be_able_to(:read, FactoryGirl.build(:team_user_membership, team: t.team))
    end

    it :can_read_memberships_if_not_member do
      expect(@ability).not_to be_able_to(:read, FactoryGirl.build(:team_user_membership))
    end
  end
end
