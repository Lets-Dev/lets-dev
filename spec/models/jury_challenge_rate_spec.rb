require 'spec_helper'

describe JuryChallengeRate do
  it :has_valid_factory do
    expect(FactoryGirl.build(:jury_challenge_rate)).to be_valid
  end
  
  context :abilities do
    before do
      @user = FactoryGirl.create(:user)
      @ability = Ability.new(@user)
    end

    it :can_manage_if_jury do
      m = FactoryGirl.create(:jury_challenge_membership, user: @user, challenge: FactoryGirl.create(:challenge, ends_at: Time.now - 15.days))
      expect(@ability).to be_able_to(:manage, FactoryGirl.build(:jury_challenge_rate, jury_challenge_membership: m))
    end

    it :cant_manage_if_not_jury do
      m = FactoryGirl.create(:jury_challenge_membership, challenge: FactoryGirl.create(:challenge, ends_at: Time.now - 15.days))
      expect(@ability).not_to be_able_to(:manage, FactoryGirl.build(:jury_challenge_rate, jury_challenge_membership: m))
    end
    
    it :cant_manage_if_challenge_not_ended do
      m = FactoryGirl.create(:jury_challenge_membership, user: @user, challenge: FactoryGirl.create(:challenge, ends_at: Time.now + 1.hour))
      expect(@ability).not_to be_able_to(:manage, FactoryGirl.build(:jury_challenge_rate, jury_challenge_membership: m))
    end
        
    it :cant_manage_more_than_a_month_after do
      m = FactoryGirl.create(:jury_challenge_membership, user: @user, challenge: FactoryGirl.create(:challenge, ends_at: Time.now - 1.month - 1.hour))
      expect(@ability).not_to be_able_to(:manage, FactoryGirl.build(:jury_challenge_rate, jury_challenge_membership: m))
    end

    it :can_manage_the_month_after do
      m = FactoryGirl.create(:jury_challenge_membership, user: @user, challenge: FactoryGirl.create(:challenge, ends_at: Time.now - 15.days))
      expect(@ability).to be_able_to(:manage, FactoryGirl.build(:jury_challenge_rate, jury_challenge_membership: m))
    end
  end
end
