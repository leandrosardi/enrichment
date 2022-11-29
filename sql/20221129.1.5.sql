-- enrichment orer is about a list of records in the fl_lead, all belonging an export list (fl_export), to append information.
-- user can request re-processing of a list by just creating a new order.
create table if not exists erc_order (
    id uuid not null primary key,
    create_time timestamp not null,
    id_user uuid not null references "user"(id),
    id_export uuid not null references fl_export(id),
    stat_total_leads bigint null,
    stat_enriched_leads bigint null
);

-- pampa fields for verification
alter table fl_lead add column if not exists enrich_reservation_id varchar(500) null;
alter table fl_lead add column if not exists enrich_reservation_time timestamp null;
alter table fl_lead add column if not exists enrich_reservation_times int null;
alter table fl_lead add column if not exists enrich_start_time timestamp null;
alter table fl_lead add column if not exists enrich_end_time timestamp null;
alter table fl_lead add column if not exists enrich_success boolean null;
alter table fl_lead add column if not exists enrich_error_description text null;
