INTERFACE zif_00_partner_ex PUBLIC.

  TYPES: BEGIN OF partner_info,
           attribute TYPE string,
           value     TYPE string,
         END OF partner_info.

  TYPES partner_infos TYPE TABLE OF partner_info WITH EMPTY KEY.

  METHODS get_partner_info
    RETURNING VALUE(partner_info) TYPE partner_infos.

ENDINTERFACE.
