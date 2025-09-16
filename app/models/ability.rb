class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
      if user.email=="admin@gmail.com"         
        can :manage, :all
     else
        cannot :read, Category
     end
  end
end
