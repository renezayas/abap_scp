@EndUserText.label: 'Z_C_ABOOKING_3776'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity Z_C_ABOOKING_3776 
  as projection on Z_I_BOOKING_3776
{
  key travel_id         as TravelID,
  key booking_id        as BookingID,       
  booking_date          as BookingDate,
  customer_id           as CustomerID,
  @ObjectModel.text.element: [ 'CarrierName' ]  
  carrier_id            as CarrierID,
  _Carrier.Name         as CarrierName,
  connection_id         as ConnectionID,
  flight_date           as FlightDate,
  @Semantics.amount.currencyCode : 'CurrencyCode'
  flight_price          as FlightPrice,
  @Semantics.currencyCode: true
  currency_code         as CurrencyCode,
  booking_status        as BookingStatus,
  last_changed_at       as LastChangeAt,
  /* Associations */
  _TRAVEL               :   redirected to parent Z_C_ATRAVEL_3776, 
  _Customer,
  _Carrier
}
