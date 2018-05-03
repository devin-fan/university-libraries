class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
        can :manage, :all
    elsif user.role? :student
        can :manage, User do |_user|
            _user.id == user.id
        end
        can :create, Film
	can :read, Film do |film|
            film.is_base? or film.permission==1 or film.permission==0
	end
        can :manage, Film do |film|
            user.films.all.map(&:id).include? film.id
        end
        can :create, Tag
    else
        can :read, Tag
        can :read, Film do |film|
	    film.is_base? or film.permission==0
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
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
