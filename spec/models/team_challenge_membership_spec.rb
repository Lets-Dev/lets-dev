require 'spec_helper'

describe TeamChallengeMembership do
  before do
    @t = FactoryGirl.create(:team_user_membership)
    FactoryGirl.create(:team_user_membership, team: @t.team)
  end

  it :has_valid_factory do
    expect(FactoryGirl.build(:team_challenge_membership, team: @t.team)).to be_valid
  end

  context :validates do
    describe :presence_of do
      it :team do
        expect(FactoryGirl.build(:team_challenge_membership, team: nil)).not_to be_valid
      end

      it :challenge do
        expect(FactoryGirl.build(:team_challenge_membership, challenge: nil)).not_to be_valid
      end

      it :github_repository do
        expect(FactoryGirl.build(:team_challenge_membership, github_repository: nil)).not_to be_valid
      end
    end

    describe :uniqueness_of do
      it :membership_per_challenge_per_team do
        m = FactoryGirl.create(:team_challenge_membership, team: @t.team)
        expect(FactoryGirl.build(:team_challenge_membership, team: m.team, challenge: m.challenge)).not_to be_valid
      end
    end
  end

  context :modifiers do
    it :formats_github_repository do
      github_links = %w(
        lets-dev/lets-dev
        https://github.com/lets-dev/lets-dev
        https://github.com/lets-dev/lets-dev.git
        git@github.com:lets-dev/lets-dev.git
      )

      github_links.each do |link|
        tcm = FactoryGirl.build(:team_challenge_membership, github_repository: link)
        tcm.send(:format_github_repo)
        expect(tcm.github_repository).to eq('lets-dev/lets-dev')
      end
    end
  end

  context :abilities do
    before do
      @user = FactoryGirl.create(:user)
      @ability = Ability.new(@user)
    end

    it :can_manage_challenge_memberships_if_owner do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :owner)
      expect(@ability).to be_able_to(:manage, FactoryGirl.build(:team_challenge_membership, team: t.team))
    end

    it :can_manage_challenge_memberships_if_admin do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :admin)
      expect(@ability).to be_able_to(:manage, FactoryGirl.build(:team_challenge_membership, team: t.team))
    end

    it :cant_manage_challenge_memberships_if_regular do
      t = FactoryGirl.create(:team_user_membership, user: @user, role: :regular)
      expect(@ability).not_to be_able_to(:manage, FactoryGirl.build(:team_challenge_membership, team: t.team))
    end
  end
end
