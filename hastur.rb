while true
    Node.all.each do |x|
      puts "kick"
      x.work()
    end
end
