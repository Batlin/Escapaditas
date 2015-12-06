class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 666
      can :manage, :all
    else
      can :search, :all
      can :like, :all
      can :read, :all
      can :create, Site
      can :update, Site do |site|
 	site.try(:user) == user
      end
      can :destroy, Site do |site|
 	site.try(:user) == user
	end
      can :create, Comment
      can :update, Comment do |comment|
 	comment.try(:user) == user
      end
      can :destroy, Comment do |comment|
 	comment.try(:user) == user
	end
      can :create, Respuestum
      can :update, Respuestum do |respuesta|
 	respuesta.try(:user) == user
      end
      can :destroy, Respuestum do |respuesta|
 	respuesta.try(:user) == user
	end
      end 
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
