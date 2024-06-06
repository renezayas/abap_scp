CLASS ztb_inserccion DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZTB_INSERCCION IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
        DATA: lt_travel   TYPE TABLE OF zTB_travel_3776,
          lt_booking  TYPE TABLE OF zTB_booking_3776,
          lt_book_sup TYPE TABLE OF zTBbooksuppl3776.

    DELETE FROM zTB_travel_3776.
    DELETE FROM zTB_booking_3776.
    DELETE FROM zTBbooksuppl3776.


    SELECT travel_id,
    agency_id,
    customer_id,
    begin_date,
    end_date,
    booking_fee,
    total_price,
    currency_code,
    description,
    status AS overall_status,
    createdby AS created_by,
    createdat AS created_at,
    lastchangedby AS last_changed_by,
    lastchangedat AS last_changed_at
    FROM /dmo/travel INTO CORRESPONDING FIELDS OF
   TABLE @lt_travel
    UP TO 50 ROWS.
    SELECT * FROM /dmo/booking
    FOR ALL ENTRIES IN @lt_travel
    WHERE travel_id EQ @lt_travel-travel_id
    INTO CORRESPONDING FIELDS OF TABLE
   @lt_booking.
    SELECT * FROM /dmo/book_suppl
    FOR ALL ENTRIES IN @lt_booking
    WHERE travel_id EQ @lt_booking-travel_id
    AND booking_id EQ @lt_booking-booking_id
    INTO CORRESPONDING FIELDS OF TABLE
   @lt_book_sup.

    INSERT: zTB_travel_3776 FROM TABLE @lt_travel,
    zTB_booking_3776 FROM TABLE @lt_booking,
    zTBbooksuppl3776 FROM TABLE @lt_book_sup.
    out->write( 'DONE!' ).
ENDMETHOD.
ENDCLASS.
