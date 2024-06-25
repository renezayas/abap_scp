@EndUserText.label: 'ZTB_C_ABOOKING_3776'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZTB_C_ABOOKING_3776 
   as projection on ZTB_I_BOOKING_3776
{
    key travel_id,
    key booking_id,
    booking_date,
    customer_id,
    @ObjectModel.text.element: [ 'CarrierName' ]  
    carrier_id,
    _Carrier.Name         as CarrierName,
    connection_id,
    flight_date,
    @Semantics.amount.currencyCode : 'Currency_Code'
    flight_price,
    @Semantics.currencyCode: true
    currency_code,
    booking_status,
    last_changed_at,
    /* Associations */
    _BOOKINGSUPPLEMENT,
    _Carrier,
    _Connection,
    _Customer,
    _TRAVEL :   redirected to parent ZTB_C_ATRAVEL_3776
}
