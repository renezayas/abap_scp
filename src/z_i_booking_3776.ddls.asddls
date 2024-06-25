@AbapCatalog.sqlViewName: 'ZVBOOK_3776'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Z_I_BOOKING_3776'
define view z_i_booking_3776 
    as select from zbooking_3776
    composition [0..*] of z_i_booksuppl_3776 as _BookingSupplement //Compositio usa el padre y association to parent usa el hijo
    association to parent z_i_travel_3776 as _Travel on $projection.travel_id = _Travel.travel_id 
    association [1..1] to /DMO/I_Customer as _Customer on $projection.customer_id = _Customer.CustomerID
    association [1..1] to /DMO/I_Carrier as _Carrier on $projection.carrier_id = _Carrier.AirlineID
    association [1..*] to /DMO/I_Connection as _Connection on $projection.connection_id = _Connection.ConnectionID
                                                   
{
    key travel_id,
    key booking_id,
    booking_date,
    customer_id,
    carrier_id,
    connection_id,
    flight_date,
    flight_price,
    currency_code,
    booking_status,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at,
    _Travel,
    _BookingSupplement,
    _Customer,
    _Carrier,
    _Connection
}
