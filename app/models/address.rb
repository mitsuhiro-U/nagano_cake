class Address < ApplicationRecord
    belongs_to :customer
    
    def full_address
        # selfはこのメソッドをよびだしたモノ
        # self.postal_code + self.address + self.name
        "#{postal_code} #{address} #{name}"
    end
end
