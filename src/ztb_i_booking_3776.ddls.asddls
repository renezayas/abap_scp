@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZTB_I_BOOKING_3776'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
    define view entity ZTB_I_BOOKING_3776 
        as select from ztb_booking_3776
    composition [0..*] of ZTB_I_BOOKSUPPL3776 as _BOOKINGSUPPLEMENT //Compositio usa el padre y association to parent usa el hijo
    association to parent ZTB_I_TRAVEL_3776 as _TRAVEL on $projection.travel_id = _TRAVEL.travel_id 
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
    @Semantics.amount.currencyCode: 'currency_code'
    flight_price,
    currency_code,
    booking_status,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at,
    _TRAVEL,
    _BOOKINGSUPPLEMENT,
    _Customer,
    _Carrier,
    _Connection
}
