
class Ob_one

  def initialize(obj)
      obj.add_observer(self)
  end

  def update card
      puts "This card has won #{card} !"
  end

end