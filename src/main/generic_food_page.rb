require 'food_page'

module FoodParser

  class GenericFoodPage < FoodPage
    include Comparable

    def initialize(title, menu)
      @title = title
      @menu = menu
      @prio = ["husman", "chili", "com.inn"]
    end

    def get_name()
      @title
    end

    def get_array_for(day)
      @menu.split("\n")
    end

    def <=>(other)
      name = get_name.downcase
      other_name = other.get_name.downcase
      comparison = get_prio(name) <=> get_prio(other_name)
      if comparison == 0
        name <=> other_name
      else
        comparison
      end
    end

    private

    def get_prio(name)
      prio = 100
      @prio.each_index do |i|
        if name.include? @prio[i]
          prio = i
          break
        end
      end
      prio
    end

  end

end
