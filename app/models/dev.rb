class Dev < ActiveRecord::Base
has_many :freebies
has_many :companies, through: :freebies

def received_one?(item_name)
   self.freebies.map do |item|
    item.item_name
   end.include?(item_name) 
end

def give_away(dev,freebie)
    if(self.received_one?(freebie.item_name))
        freebie.dev_id=dev.id
    end
end

end
