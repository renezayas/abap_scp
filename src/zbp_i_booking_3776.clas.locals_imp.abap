CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Booking RESULT result.

    METHODS calculateTotalFlightPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Booking~calculateTotalFlightPrice.

    METHODS ValidateStatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR Booking~ValidateStatus.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD get_instance_features.
    READ ENTITIES OF z_i_travel_3776 IN LOCAL MODE
    ENTITY Booking
    FIELDS ( booking_id  booking_date customer_id booking_status )
    WITH VALUE #( FOR key_row IN keys ( %key = key_row-%key ) )
    RESULT DATA(lt_booking_result).

    result = VALUE #( FOR ls_booking IN lt_booking_result

                      ( %key                      = ls_booking-%key
                        %assoc-_BookingSupplement = if_abap_behv=>fc-o-enabled
                         ) ).

  ENDMETHOD.

  METHOD calculateTotalFlightPrice.
    IF NOT keys IS INITIAL.

      zcl_aux_travel_det_3776=>calculate_price( it_travel_id =
                                                VALUE #( FOR GROUPS <booking>  OF booking_key  IN keys
                                                GROUP BY booking_key-travel_id WITHOUT MEMBERS ( <booking> ) ) ).

    ENDIF.
  ENDMETHOD.

   METHOD ValidateStatus.

    READ ENTITY IN LOCAL MODE z_i_travel_3776\\Booking
     FIELDS ( booking_status )
     WITH VALUE #( FOR <key_row> IN keys ( %key = <key_row>-%key ) )
     RESULT DATA(lt_booking_result).

    LOOP AT lt_booking_result INTO DATA(ls_booking_result).

      CASE ls_booking_result-booking_status.
        WHEN 'N'. "Open
        WHEN 'X'. "Cancelled
        WHEN 'B'. "Accepted
        WHEN OTHERS.
          APPEND VALUE #( %key                  = ls_booking_result-%key ) TO failed-booking.

          APPEND VALUE #( %key                  = ls_booking_result-%key
                          %msg                  = new_message(
                                                    id       = 'Z_MC_TRAVEL_3776'
                                                    number   = '008'
                                                    severity = if_abap_behv_message=>severity-error
                                                    v1       = ls_booking_result-booking_id )
                          %element-booking_status  = if_abap_behv=>mk-on ) TO reported-booking.
      ENDCASE.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
