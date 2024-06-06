@EndUserText.label: 'ZTB_C_BOOKING_3776'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZTB_C_BOOKING_3776 
    as projection on ZTB_I_BOOKING_3776
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
    /* Associations */
    _BOOKINGSUPPLEMENT,
    _Carrier,
    _Connection,
    _Customer,
    _TRAVEL
}
