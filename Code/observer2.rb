
class Ob_low_winners

  def initialize(obj)
      obj.add_observer(self)
  end

  def update name,card
      puts "#{name} won with A low card :#{card} !"
  end
end