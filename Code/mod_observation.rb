module ModObservation

      # Our own observer module with code blocks!

      def initialize
        @observers=[]
      end

      def add_observer(&mycodeblock)
          @observers << mycodeblock
      end

      def delete_observer(&mycodeblock)
        @observers.delete(mycodeblock)
      end

      def notify_observers
        @observers.each do |observer|
          observer.call(self)
        end
      end

    def notify_observers_fraud card
        raise "!!!!!!!!! This #{card} has appeared incorrectly - SHUT DOWN THE GAME !!!!!!!!!!"
    end

end