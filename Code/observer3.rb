
class Ob_change_winners

  def initialize(obj)
      obj.add_observer(self)
  end

  def update name,card
      puts "#{name} would have won with :#{card} but we moved to the 2nd best card !"
  end
end