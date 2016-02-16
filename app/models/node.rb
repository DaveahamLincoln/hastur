=begin
#t.integer :l_channel              #local channel (relationships, family, etc)
#t.integer :g_channel              #global channel (laws, traditions, local news)
#t.integer :e_channel             #ego channel (stores all broadcasts from a given node)?  i.e. personal truths
=                                 #universal channel ("universal truths," like math and the like, all nodes are subscribed)
t.integer :l_weight               #width of the pipe through which the local channel is piped
t.integer :g_weight               #" global channel
t.integer :u_weight               #" universal channel
#t.integer :g_efficiency           #number of ticks required to generate a share for global
#t.integer :l_efficiency           #number of ticks required to generate a share for local
#t.integer :u_efficiency           #number of ticks required to generate a share for universe
t.string :queue                    #stores the last response generated for broadcast
=end

require "moby"

class Node < ActiveRecord::Base

#============================================================================#

  def work()
    @state = rand(3)  #0 = off/sleeping
                      #1 = receiving
                      #2 = broadcasting

    puts @state
    
    @broadcast_channel = rand(3) #0 = local
                                 #1 = global
                                 #2 = universe

    case @state
    
    when 0
      return 0
   
    when 1
      @i_packet = ""                                                       #received packets
      @l_packet = LocalChannel.limit(self.l_weight).order("Random()")      #TODO turn this into a class method like .generate_packet
      @g_packet = GlobalChannel.limit(self.g_weight).order("Random()")     #"
      @u_packet = UniversalChannel.limit(self.u_weight).order("Random()")  #"

      @l_packet.each do |p|
        @i_packet = @i_packet + " " + p.message
      end
      
      @g_packet.each do |p|
        @i_packet = @i_packet + " " + p.message
      end

      @u_packet.each do |p|
        @i_packet = @i_packet + " " + p.message
      end

      self.koanize(@i_packet)
      
    when 2
      self.broadcast()
      
    else
      return 0
      
    end
    
  end

#============================================================================#  

  def koanize(str)
    tokens = str.split(" ")
    response = []

    tokens.each do |w| 
      c = $thesaurus.synonyms(w).sample()

      if c.nil?
        response << w
      else
        response << c
      end
    end

    response.shuffle!
    self.queue = (response.join(" "))
    self.save!

  end

#============================================================================#

  def broadcast()
    if self.queue?
      case @broadcast_channel
      when 0
        puts "Local: " + self.queue
        x = LocalChannel.new(:message => self.queue)
        x.save!
        
      when 1
        puts "Global: " + self.queue
        x = GlobalChannel.new(:message => self.queue)
        x.save!
        
      when 2
        puts "Universal: " + self.queue
        x = UniversalChannel.new(:message => self.queue)
        x.save!
      else
        return 0
        
      end

    else
      return 0
      
    end
  end

end