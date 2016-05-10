class LineItem < ActiveRecord::Base
    belongs_to :product
    belongs_to :cart
    def update_product(item)
        current_item = LineItem.find_by_id(item.id)
        if current_item
            current_item.quantity = quantity
        end
        current_item
end

end
