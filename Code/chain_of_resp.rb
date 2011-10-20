module Chain_of_resp

  def next_chain(link)
    @next = link
  end

  def method_missing(method, *args, &block)
    if @next == nil
      puts "Admission request cannot be handled!"
      return
    end
    @next.__send__(method, *args, &block)
  end
end