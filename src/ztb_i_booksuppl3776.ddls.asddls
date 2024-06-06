@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZTB_I_BOOKSUPPL3776'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZTB_I_BOOKSUPPL3776 as select from ztbbooksuppl3776
association to parent ZTB_I_BOOKING_3776      as _BOOKING         on $projection.travel_id = _BOOKING.travel_id //Compositio usa el padre y association to parent usa el hijo
                                                                        and $projection.booking_id = _BOOKING.booking_id 
association [1..1] to Z_I_TRAVEL_3776        as _Travel          on $projection.travel_id = _Travel.travel_id
   association [1..1] to /DMO/I_Supplement      as _Product         on $projection.supplement_id = _Product.SupplementID
   association [1..*] to /DMO/I_SupplementText  as _SuplementText   on $projection.supplement_id = _SuplementText.SupplementID
{
    key travel_id,
    key booking_id,
    key booking_supplement_id,
    supplement_id,
    @Semantics.amount.currencyCode: 'currency_code'
    price,
    currency_code,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at,
    _BOOKING,
    _Travel,
    _Product,
    _SuplementText
}
