require 'spec_helper'

describe TeamUserMembershipInvitation do
  it :has_valid_factory do
    expect(FactoryGirl.build(:team_user_membership_invitation)).to be_valid
  end

  context :validates do
    describe :presence_of do
      it :team do
        expect(FactoryGirl.build(:team_user_membership_invitation, team: nil)).not_to be_valid
      end

      it :user_email do
        expect(FactoryGirl.build(:team_user_membership_invitation, user_email: nil)).not_to be_valid
      end
    end

    describe :uniqueness_of do
      it :invitation_by_team_by_user do
        t = FactoryGirl.create(:team_user_membership_invitation)
        expect(FactoryGirl.build(:team_user_membership_invitation, user_email: t.user_email, team: t.team)).not_to be_valid
      end
    end
  end

  context :abilities do
    before do
      @user = FactoryGirl.create(:user)
      @ability = Ability.new(@user)
    end

    it :can_manage_invitations_if_owner do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :owner)
      expect(@ability).to be_able_to(:manage, FactoryGirl.build(:team_user_membership_invitation, team: t.team))
    end

    it :can_manage_invitations_if_admin do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :admin)
      expect(@ability).to be_able_to(:manage, FactoryGirl.build(:team_user_membership_invitation, team: t.team))
    end

    it :cant_manage_invitations_if_regular do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :regular)
      expect(@ability).not_to be_able_to(:manage, FactoryGirl.build(:team_user_membership_invitation, team: t.team))
    end

    it :cant_manage_invitations_if_other do
      expect(@ability).not_to be_able_to(:manage, FactoryGirl.build(:team_user_membership_invitation))
    end
  #   it :can_manage_own_regular_team_memberships_if_admin do
  #     t = FactoryGirl.create(:team_user_membership, user: @user, role: :admin)
  #     expect(@ability).to be_able_to(:manage, FactoryGirl.build(:team_user_membership, team: t.team, role: :regular))
  #   end

  #   it :cant_manage_own_admin_team_memberships_if_admin do
  #     t = FactoryGirl.create(:team_user_membership, user: @user, role: :admin)
  #     expect(@ability).not_to be_able_to(:manage, FactoryGirl.build(:team_user_membership, team: t.team, role: :admin))
  #   end

  #   it :cant_manage_own_owner_team_memberships_if_admin do
  #     t = FactoryGirl.create(:team_user_membership, user: @user, role: :admin)
  #     expect(@ability).not_to be_able_to(:manage, FactoryGirl.build(:team_user_membership, team: t.team, role: :owner))
  #   end

  #   it :cant_manage_own_team_memberships_if_admin do
  #     t = FactoryGirl.create(:team_user_membership, user: @user, role: :regular)
  #     expect(@ability).not_to be_able_to(:manage, FactoryGirl.build(:team_user_membership, team: t.team))
  #   end

  #   it :can_read_memberships_if_regular do
  #     t = FactoryGirl.create(:team_user_membership, user: @user, role: :regular)
  #     expect(@ability).not_to be_able_to(:read, FactoryGirl.build(:team_user_membership, team: t.team))
  #   end

  #   it :can_read_memberships_if_not_member do
  #     expect(@ability).not_to be_able_to(:read, FactoryGirl.build(:team_user_membership))
  #   end
  end
end
