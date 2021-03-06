class Ability
  include CanCan::Ability



  def initialize(user)
       
    #user ||= User.new # Guest user

    if user.admin?
      can :manage, :all
    #else
      #can :read, :home

     # can :manage, User do |service|
     #   service.try(:id) == user.id
     # end

      #can [:update, :edit], User, :id => user.id

      #can [:update, :edit], Registration, :id => user.id

    else
        #can :manage, User
        can [:update, :edit, :destroy], User do |u|
          u.id == user.id
        end


     
    end

  end


 # def initialize(user)
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
  #end
end
