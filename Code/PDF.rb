require_relative 'SuperReport'

class PDF_report < SuperReport

       def output_start
       end

       def output_head
       end

      def output_body_start
      end

       def output_head
          puts '   THIS IS PDF'
         puts "#{@title}"
      end

      def output_line line
          puts "#{line}"
      end

      def output_body_end
          puts 'END OF PDF'
      end

      def output_end
      end

end