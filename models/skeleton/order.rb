module BlackStack
    module Enrichment
        class Order < Sequel::Model(:vrf_order)
            many_to_one :user, :class=>:'BlackStack::MySaaS::User', :key=>:id_user
            many_to_one :export, :class=>:'BlackStack::Leads::Export', :key=>:id_export
        end # class Order
    end # Enrichment
end # BlackStack