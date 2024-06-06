@EndUserText.label: 'ZTB_C_TRAVEL_3776'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZTB_C_TRAVEL_3776 
    as projection on ZTB_I_TRAVEL_3776
{
    key travel_id,
    agency_id,
    customer_id,
    begin_date,
    end_date,
    booking_fee,
    total_price,
    currency_code,
    description,
    overall_status,
    created_by,
    created_at,
    last_changed_by,
    last_changed_at,
    /* Associations */
    _Booking,
    _Customer
}
