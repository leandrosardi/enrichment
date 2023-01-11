# default screen
get "/enrichment", :agent => /(.*)/ do
    redirect2 "/enrichment/orders", params
end
get "/enrichment/", :agent => /(.*)/ do
    redirect2 "/enrichment/orders", params
end

# internal app screens
get "/enrichment/offer", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/enrichment/views/offer", :layout => :"/views/layouts/core"
end

get "/enrichment/plans", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/enrichment/views/plans", :layout => :"/views/layouts/core"
end

get "/enrichment/orders", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/enrichment/views/orders", :layout => :"/views/layouts/core"
end

get "/enrichment/orders/new", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/enrichment/views/new_order", :layout => :"/views/layouts/core"
end

get "/enrichment/orders/:oid/edit", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/enrichment/views/edit_order", :layout => :"/views/layouts/core"
end

# filters
post "/enrichment/filter_new_order", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/enrichment/views/filter_new_order"
end

post "/enrichment/filter_edit_order", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/enrichment/views/filter_new_order"
end

post "/enrichment/filter_delete_order", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/enrichment/views/filter_new_order"
end
