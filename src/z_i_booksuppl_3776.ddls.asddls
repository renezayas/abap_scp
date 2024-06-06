@AbapCatalog.sqlViewName: 'ZV_BOOK_3776'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Z_I_BOOKSUPPL_3776'
define view Z_I_BOOKSUPPL_3776 
    as select from zbooksuppl_3776 as BookingSupplement
    association to parent Z_I_BOOKING_3776      as _BOOKING         on $projection.TravelId = _BOOKING.travel_id //Compositio usa el padre y association to parent usa el hijo
                                                                        and $projection.BookingId = _BOOKING.booking_id 
   association [1..1] to Z_I_TRAVEL_3776        as _Travel          on $projection.TravelId = _Travel.travel_id
   association [1..1] to /DMO/I_Supplement      as _Product         on $projection.SupplementId = _Product.SupplementID
   association [1..*] to /DMO/I_SupplementText  as _SuplementText   on $projection.SupplementId = _SuplementText.SupplementID
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    key booking_supplement_id as BookingSupplementId,
    supplement_id as SupplementId,
     @Semantics.amount.currencyCode : 'currency'
    price as Price,
    @Semantics.currencyCode: true
    currency as Currency,
    _BOOKING,
    _Travel,
    _Product,
    _SuplementText
}
