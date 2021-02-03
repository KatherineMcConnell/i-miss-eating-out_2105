class Restaurant
  attr_reader :opening_time,
              :name
  def initialize(opening_time, name)
    @opening_time = opening_time
    @name = name
    @dishes = []
    @closing_time = ()

  end

  def dishes
    @dishes
  end

  def add_dish(dish)
    dishes.push(dish)
  end

  def closing_time(hours)
    converted_value = @opening_time.slice(0..1).to_i + hours
    @closing_time = "#{converted_value}:00"
  end

  def open_for_lunch?
    if @opening_time.slice(0..1).to_i < 12
      true
    else
      false
    end
  end

  def menu_dish_names
    upcase_dishes = []
    @dishes.each do |dish|
    upcase_dishes << dish.upcase
    end
    p upcase_dishes
  end
end
