class CarPolicy
  attr_reader :user, :car

  def initialize(user, car)
    @user = user
    @car = car
  end

  def edit?
    user.id == @car.user_id
  end

  def update?
    edit?
  end

  def accept?
    edit?
  end

end