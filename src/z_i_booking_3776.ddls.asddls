@AbapCatalog.sqlViewName: 'ZVBOOK_3776'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Z_I_BOOKING_3776'
define view Z_I_BOOKING_3776 
    as select from zbooking_3776
    composition [0..*] of Z_I_BOOKSUPPL_3776 as _BOOKINGSUPPLEMENT //Compositio usa el padre y association to parent usa el hijo
    association to parent Z_I_TRAVEL_3776 as _TRAVEL on $projection.travel_id = _TRAVEL.travel_id 
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
    last_changed_at,
    _TRAVEL,
    _BOOKINGSUPPLEMENT,
    _Customer,
    _Carrier,
    _Connection
}
