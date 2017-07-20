class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else

      can :manage, Team do |team|
        user.is_owner_of?(team)
      end

      can :update, Team do |team|
        user.is_admin_of?(team)
      end

      can :manage, TeamChallengeMembership do |tcm|
        user.is_admin_of?(tcm.team)
      end

      can :manage, TeamUserMembership do |tum|
        user.is_owner_of?(tum.team) || (tum.regular? && user.is_admin_of?(tum.team))
      end

      can :manage, TeamUserMembershipInvitation do |tum|
        user.is_admin_of?(tum.team)
      end
    end
  end
end
