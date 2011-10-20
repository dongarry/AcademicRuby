require_relative 'chain_of_resp'

class WebManager
  include Chain_of_resp

  def initialize(link = nil)
    next_chain(link)
  end

  def entry_check
        age_limit
        previous_convictions
        suitably_dressed
        sufficent_cash
        puts "Entry check approved"
        puts
  end
end

class Front_door_bouncer
  include Chain_of_resp

   def initialize(link = nil)
    next_chain(link)
   end

  def age_limit
    puts "#{self.class.to_s} has confirmed player is over 18 "
  end

end

class Legal_secretary
  include Chain_of_resp

   def initialize(link = nil)
    next_chain(link)
   end

  def previous_convictions
    puts "#{self.class.to_s} has confirmed player has no previous convictions "
  end

end

class Casino_door_man
  include Chain_of_resp

   def initialize(link = nil)
    next_chain(link)
   end

  def suitably_dressed
    puts "#{self.class.to_s} has confirmed player is dressed suitable "
  end

end

class Casino_cashier
  include Chain_of_resp

   def initialize(link = nil)
    next_chain(link)
   end

  def sufficent_cash
    puts "#{self.class.to_s} has confirmed player has sufficient money "
  end

end
