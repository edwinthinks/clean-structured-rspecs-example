class User

  def initialize(is_frog: )
    @is_frog = is_frog
  end

  def is_frog?
    @is_frog
  end

  def jumps_high?
    is_frog?
  end

  def turn_to_frog
    raise 'user is already a frog' if is_frog?
    @is_frog = true
  end

end
