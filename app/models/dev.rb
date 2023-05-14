class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(match_name)
        names = []
        self.freebies.each do |freebie|
            names << freebie.item_name
        end
        names.include?(match_name)
    end

    def give_away(dev, freebie)
        if self.freebies.include?(freebie)
            freebie.dev_id = dev.id
            freebie.save
        end
    end

end
