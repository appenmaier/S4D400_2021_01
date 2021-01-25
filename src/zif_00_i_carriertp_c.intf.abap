interface ZIF_00_I_CARRIERTP_C
  public .


  interfaces /BOBF/IF_LIB_CONSTANTS .

  constants:
    BEGIN OF SC_ACTION,
      BEGIN OF Z00_I_CARRIERTP,
 CREATE_Z00_I_CARRIERTP         TYPE /BOBF/ACT_KEY VALUE '005056044E851EEB97DB9E2D0EEF53B0',
 DELETE_Z00_I_CARRIERTP         TYPE /BOBF/ACT_KEY VALUE '005056044E851EEB97DB9E2D0EEFD3B0',
 LOCK_Z00_I_CARRIERTP           TYPE /BOBF/ACT_KEY VALUE '005056044E851EEB97DB9E2D0EEE93B0',
 SAVE_Z00_I_CARRIERTP           TYPE /BOBF/ACT_KEY VALUE '005056044E851EEB97DB9E2D0EF053B0',
 UNLOCK_Z00_I_CARRIERTP         TYPE /BOBF/ACT_KEY VALUE '005056044E851EEB97DB9E2D0EEED3B0',
 UPDATE_Z00_I_CARRIERTP         TYPE /BOBF/ACT_KEY VALUE '005056044E851EEB97DB9E2D0EEF93B0',
 VALIDATE_Z00_I_CARRIERTP       TYPE /BOBF/ACT_KEY VALUE '005056044E851EEB97DB9E2D0EF013B0',
      END OF Z00_I_CARRIERTP,
      BEGIN OF Z00_I_CONNECTIONTP,
 CREATE_Z00_I_CONNECTIONTP      TYPE /BOBF/ACT_KEY VALUE '005056044E851EEB97DB9E677EED13CA',
 DELETE_Z00_I_CONNECTIONTP      TYPE /BOBF/ACT_KEY VALUE '005056044E851EEB97DB9E677EED93CA',
 SAVE_Z00_I_CONNECTIONTP        TYPE /BOBF/ACT_KEY VALUE '005056044E851EEB97DB9E677EEE13CA',
 UPDATE_Z00_I_CONNECTIONTP      TYPE /BOBF/ACT_KEY VALUE '005056044E851EEB97DB9E677EED53CA',
 VALIDATE_Z00_I_CONNECTIONTP    TYPE /BOBF/ACT_KEY VALUE '005056044E851EEB97DB9E677EEDD3CA',
      END OF Z00_I_CONNECTIONTP,
    END OF SC_ACTION .
  constants:
    BEGIN OF SC_ACTION_ATTRIBUTE,
        BEGIN OF Z00_I_CARRIERTP,
        BEGIN OF LOCK_Z00_I_CARRIERTP,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
 LEGACY_DAC_KEY                 TYPE STRING VALUE 'LEGACY_DAC_KEY',
        END OF LOCK_Z00_I_CARRIERTP,
        BEGIN OF UNLOCK_Z00_I_CARRIERTP,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
 LEGACY_DAC_KEY                 TYPE STRING VALUE 'LEGACY_DAC_KEY',
        END OF UNLOCK_Z00_I_CARRIERTP,
      END OF Z00_I_CARRIERTP,
    END OF SC_ACTION_ATTRIBUTE .
  constants:
    BEGIN OF SC_ALTERNATIVE_KEY,
      BEGIN OF Z00_I_CARRIERTP,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '005056044E851EEB97DB9E677EE653CA',
      END OF Z00_I_CARRIERTP,
      BEGIN OF Z00_I_CONNECTIONTP,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '005056044E851EEB97DB9E677EE693CA',
 PARENT_KEY                     TYPE /BOBF/OBM_ALTKEY_KEY VALUE '005056044E851EEB97DB9E677EE6B3CA',
      END OF Z00_I_CONNECTIONTP,
    END OF SC_ALTERNATIVE_KEY .
  constants:
    BEGIN OF SC_ASSOCIATION,
      BEGIN OF Z00_I_CARRIERTP,
 LOCK                           TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EEB97DB9E2D0EEE73B0',
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EEB97DB9E2D0EEE33B0',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EEB97DB9E2D0EEF33B0',
 _CONNECTIONS                   TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EEB97DB9E677EEC53CA',
      END OF Z00_I_CARRIERTP,
      BEGIN OF Z00_I_CARRIERTP_LOCK,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EEB97DB9E2D0EF0B3B0',
      END OF Z00_I_CARRIERTP_LOCK,
      BEGIN OF Z00_I_CARRIERTP_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EEB97DB9E2D0EF093B0',
      END OF Z00_I_CARRIERTP_MESSAGE,
      BEGIN OF Z00_I_CARRIERTP_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EEB97DB9E2D0EF0D3B0',
      END OF Z00_I_CARRIERTP_PROPERTY,
      BEGIN OF Z00_I_CONNECTIONTP,
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EEB97DB9E677EECB3CA',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EEB97DB9E677EECF3CA',
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EEB97DB9E677EEE53CA',
 TO_ROOT                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EEB97DB9E677EEE73CA',
      END OF Z00_I_CONNECTIONTP,
      BEGIN OF Z00_I_CONNECTIONTP_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EEB97DB9E677EEE93CA',
      END OF Z00_I_CONNECTIONTP_MESSAGE,
      BEGIN OF Z00_I_CONNECTIONTP_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EEB97DB9E677EEEB3CA',
      END OF Z00_I_CONNECTIONTP_PROPERTY,
    END OF SC_ASSOCIATION .
  constants:
    BEGIN OF SC_ASSOCIATION_ATTRIBUTE,
      BEGIN OF Z00_I_CARRIERTP,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF Z00_I_CARRIERTP,
      BEGIN OF Z00_I_CONNECTIONTP,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF Z00_I_CONNECTIONTP,
    END OF SC_ASSOCIATION_ATTRIBUTE .
  constants:
    SC_BO_KEY  TYPE /BOBF/OBM_BO_KEY VALUE '005056044E851EEB97DB9E2D0EED93B0' .
  constants:
    SC_BO_NAME TYPE /BOBF/OBM_NAME VALUE 'Z00_I_CARRIERTP' .
  constants:
    BEGIN OF SC_DETERMINATION,
      BEGIN OF Z00_I_CARRIERTP,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '005056044E851EEB97DB9E677EE673CA',
      END OF Z00_I_CARRIERTP,
      BEGIN OF Z00_I_CONNECTIONTP,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '005056044E851EEB97DB9E677EE6D3CA',
      END OF Z00_I_CONNECTIONTP,
    END OF SC_DETERMINATION .
  constants:
    SC_MODEL_VERSION TYPE /BOBF/CONF_VERSION VALUE '00000' .
  constants:
    BEGIN OF SC_NODE,
 Z00_I_CARRIERTP                TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EEB97DB9E2D0EEDD3B0',
 Z00_I_CARRIERTP_LOCK           TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EEB97DB9E2D0EEE53B0',
 Z00_I_CARRIERTP_MESSAGE        TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EEB97DB9E2D0EEE13B0',
 Z00_I_CARRIERTP_PROPERTY       TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EEB97DB9E2D0EEF13B0',
 Z00_I_CONNECTIONTP             TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EEB97DB9E677EE5D3CA',
 Z00_I_CONNECTIONTP_MESSAGE     TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EEB97DB9E677EEC93CA',
 Z00_I_CONNECTIONTP_PROPERTY    TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EEB97DB9E677EECD3CA',
    END OF SC_NODE .
  constants:
    BEGIN OF SC_NODE_ATTRIBUTE,
      BEGIN OF Z00_I_CARRIERTP,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  CARRIERID                      TYPE STRING VALUE 'CARRIERID',
  CARRIERNAME                    TYPE STRING VALUE 'CARRIERNAME',
  CURRENCYCODE                   TYPE STRING VALUE 'CURRENCYCODE',
  URL                            TYPE STRING VALUE 'URL',
      END OF Z00_I_CARRIERTP,
      BEGIN OF Z00_I_CONNECTIONTP,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  CARRID                         TYPE STRING VALUE 'CARRID',
  CONNID                         TYPE STRING VALUE 'CONNID',
  COUNTRYFR                      TYPE STRING VALUE 'COUNTRYFR',
  CITYFROM                       TYPE STRING VALUE 'CITYFROM',
  AIRPFROM                       TYPE STRING VALUE 'AIRPFROM',
  COUNTRYTO                      TYPE STRING VALUE 'COUNTRYTO',
  CITYTO                         TYPE STRING VALUE 'CITYTO',
  AIRPTO                         TYPE STRING VALUE 'AIRPTO',
  FLTIME                         TYPE STRING VALUE 'FLTIME',
  DEPTIME                        TYPE STRING VALUE 'DEPTIME',
  ARRTIME                        TYPE STRING VALUE 'ARRTIME',
  DISTANCE                       TYPE STRING VALUE 'DISTANCE',
  DISTID                         TYPE STRING VALUE 'DISTID',
  FLTYPE                         TYPE STRING VALUE 'FLTYPE',
  PERIOD                         TYPE STRING VALUE 'PERIOD',
      END OF Z00_I_CONNECTIONTP,
    END OF SC_NODE_ATTRIBUTE .
  constants:
    BEGIN OF SC_NODE_CATEGORY,
      BEGIN OF Z00_I_CARRIERTP,
 ROOT                           TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '005056044E851EEB97DB9E2D0EEDF3B0',
      END OF Z00_I_CARRIERTP,
      BEGIN OF Z00_I_CONNECTIONTP,
 Z00_I_CONNECTIONTP             TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '005056044E851EEB97DB9E677EEC33CA',
      END OF Z00_I_CONNECTIONTP,
    END OF SC_NODE_CATEGORY .
endinterface.