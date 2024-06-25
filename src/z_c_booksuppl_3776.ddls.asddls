@EndUserText.label: 'Z_C_BOOKSUPPL_3776'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity  z_c_booksuppl_3776 
    as projection on z_i_booksuppl_3776
{
    key TravelId                as TravelID,
    key BookingId               as BookingID,
    key BookingSupplementId     as BookingSupplementID,
    SupplementId                as SupplementID,
    _SuplementText.Description  as SupplementDescription : localized,
    @Semantics.amount.currencyCode : 'CurrencyCode'
    Price as Price,
    @Semantics.currencyCode: true
    Currency as CurrencyCode,
    /* Associations */
    _Travel     :   redirected to   z_c_travel_3776,
    _Booking    :   redirected to parent   z_c_booking_3776,
    _Product,
    _SuplementText
    
}
