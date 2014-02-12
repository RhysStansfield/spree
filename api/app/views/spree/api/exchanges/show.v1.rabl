object @exchange
attributes *exchange_attributes

child(:items => :items) do
  attributes exchange_item_attributes
end