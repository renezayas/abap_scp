@AbapCatalog.sqlViewName: 'ZV_BOOK_3776'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Z_I_BOOKSUPPL_3776'
define view z_i_booksuppl_3776 
    as select from zbooksuppl_3776 as BookingSupplement
    association to parent z_i_booking_3776      as _Booking         on $projection.TravelId = _Booking.travel_id //Compositio usa el padre y association to parent usa el hijo
                                                                        and $projection.BookingId = _Booking.booking_id 
   association [1..1] to z_i_travel_3776        as _Travel          on $projection.TravelId = _Travel.travel_id
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
    
    
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at,
    
    _Booking,
    _Travel,
    _Product,
    _SuplementText
}
