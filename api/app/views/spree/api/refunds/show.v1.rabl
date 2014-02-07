object @refund
attributes *refund_attributes

child(:items => :items) do
  attributes refund_item_attributes
end