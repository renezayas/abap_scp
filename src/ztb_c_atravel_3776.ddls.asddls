@EndUserText.label: 'ZTB_C_ATRAVEL_3776'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZTB_C_ATRAVEL_3776
  provider contract transactional_query 
       as projection on ZTB_I_TRAVEL_3776
{
    key travel_id,
    @ObjectModel.text.element: [ 'AgencyName' ]
    agency_id,
    _Agency.Name        as AgencyName,
    @ObjectModel.text.element: [ 'CustomerName' ]
    customer_id,
    _Customer.LastName  as CustomerName,
    begin_date,
    end_date,
    @Semantics.amount.currencyCode: 'Currency_Code'
    booking_fee,
    @Semantics.amount.currencyCode: 'Currency_Code'
    total_price,
    @Semantics.currencyCode: true
    currency_code,
    description,
    overall_status,
    created_by,
    created_at,
    last_changed_by,
    last_changed_at,
    /* Associations */
    _Booking : redirected to composition child ZTB_C_ABOOKING_3776,
    _Customer
}
