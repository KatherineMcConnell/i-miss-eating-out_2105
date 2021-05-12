class Restaurant
  attr_reader :opening_time,
              :name,
              :dishes

  def initialize(opening_time, name)
    @opening_time = opening_time
    @name = name
    @dishes = []
  end

  def closing_time(hours_open)
    "#{hours_open + opening_time.to_i}:00"
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
    opening_time.to_i < 12
  end

  def menu_dish_names
    # @dishes.map {|dish| dish.upcase}
    @dishes.map(&:upcase)
  end

  def announce_closing_time(hours_open)
    if closing_time(hours_open).to_i < 12
      "#{@name} will be closing at #{closing_time(hours_open)}AM"
    else
      "#{@name} will be closing at #{closing_time(hours_open).to_i - 12}:00PM"
    end
  end
end
