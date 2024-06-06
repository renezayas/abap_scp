@AbapCatalog.sqlViewName: 'ZV_TRAV_3776'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Z_I_TRAVEL_3776'
define root view Z_I_TRAVEL_3776 
    as select from ztravel_3776 as TRAVEL
    composition [0..*] of Z_I_BOOKING_3776 as _Booking //Composition usa el padre y association to parent usa el hijo
    association [0..1] to /DMO/I_Agency as _Agency on $projection.agency_id = _Agency.AgencyID
    association [0..1] to /DMO/I_Customer as _Customer on $projection.customer_id = _Customer.CustomerID
    association [0..1] to I_Currency as _Currency on $projection.currency_code = _Currency.Currency
{
    key travel_id,
    agency_id,
    customer_id,
    begin_date,
    end_date,
    @Semantics.amount.currencyCode: 'currency_code'
    booking_fee,
    @Semantics.amount.currencyCode:'currency_code'
    total_price,
    @Semantics.currencyCode: true
    currency_code,
    description,
    overall_status,
    @Semantics.user.createdBy: true
    created_by,
    @Semantics.systemDateTime.createdAt: true
    created_at,
    @Semantics.user.lastChangedBy: true
    last_changed_by,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at,
    _Booking,
    _Agency,
    _Customer,
    _Currency
}
