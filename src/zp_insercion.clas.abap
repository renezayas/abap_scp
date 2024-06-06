CLASS zp_insercion DEFINITION
    PUBLIC
    FINAL
    CREATE PUBLIC .
    PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
    PROTECTED SECTION.
    PRIVATE SECTION.
ENDCLASS.



CLASS ZP_INSERCION IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
DATA: lt_paises TYPE TABLE OF ZTPAISES,
lt_ztpersonas TYPE TABLE OF ZTPERSONAS.
** BRANDS **
lt_paises = VALUE #(
( id_pais = 'PY' pais = 'Paraguay' )
( id_pais = 'AR' pais = 'Argentina' )
( id_pais = 'BR' pais = 'Brasil' )
( id_pais = 'MX' pais = 'MExico' )
)
.
DELETE FROM ZTPAISES.
INSERT ZTPAISES FROM TABLE @lt_paises.
SELECT * FROM ZTPAISES INTO TABLE @lt_paises.
out->write( sy-dbcnt ).
out->write( 'ZTPAISES data inserted successfully!').
** CARS**
lt_ztpersonas = VALUE #(
( id = '001' nombre = 'Luis Chilavert' fecha_nac = '19841119' id_pais = 'PY'
foto = 'https://www.buscabiografias.com/img/people/Jose_Luis_Chilavert.jpg')
( id = '002' nombre = 'Maria de los Angeles' fecha_nac = '19801211' id_pais = 'MX'
foto = 'https://elsudamericano.wordpress.com/wp-content/uploads/2014/01/clotilde.jpg?w=321&h=277' )
( id = '003' nombre = 'Ramon Valdez' fecha_nac = '19811211' id_pais = 'AR'
foto = 'https://images.mubicdn.net/images/cast_member/256943/cache-273168-1509311189/image-w856.jpg?size=160x')
).
DELETE FROM ZTPERSONAS.
INSERT ZTPERSONAS FROM TABLE @lt_ztpersonas.
SELECT * FROM ZTPERSONAS INTO TABLE @lt_ztpersonas.
out->write( sy-dbcnt ).
out->write( 'ZTPERSONAS data inserted successfully!').

ENDMETHOD.
ENDCLASS.
