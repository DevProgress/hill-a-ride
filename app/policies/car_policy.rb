class CarPolicy
  attr_reader :user, :car

  def initialize(user, car)
    @user = user
    @car = car
  end

  def edit?
    current_user.id == @car.user_id
  end

  def update?
    current_user.id == @car.user_id
  end

end