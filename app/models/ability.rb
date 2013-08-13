class Ability
  include CanCan::Ability

  def initialize(administrator = nil)

    if administrator
      can :manage, Post
    else
      can :read, :all
    end
  end
end
