@EndUserText.label: 'Z_C_BOOKSUPPL_3776'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity  Z_C_BOOKSUPPL_3776 
    as projection on Z_I_BOOKSUPPL_3776
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
    _Travel     :   redirected to   Z_C_TRAVEL_3776,
    _BOOKING    :   redirected to parent   Z_C_BOOKING_3776,
    _Product,
    _SuplementText
    
}
