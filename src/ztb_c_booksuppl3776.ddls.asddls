@EndUserText.label: 'ZTB_C_BOOKSUPPL3776'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZTB_C_BOOKSUPPL3776 as projection on ZTB_I_BOOKSUPPL3776
{
    key travel_id,
    key booking_id,
    key booking_supplement_id,
    supplement_id,
    price,
    currency_code,
    last_changed_at,
    /* Associations */
    _BOOKING,
    _Product,
    _SuplementText,
    _Travel
}
