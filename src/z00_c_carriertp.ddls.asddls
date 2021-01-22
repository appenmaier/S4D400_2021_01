@AbapCatalog.sqlViewName: 'Z00CCARRTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Carrier'
@Search.searchable: true
@Metadata.allowExtensions: true
@ObjectModel: {
    transactionalProcessingDelegated: true,
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view Z00_C_CarrierTP
  as select from Z00_I_CarrierTP
  association [*] to Z00_C_ConnectionTP as _connections on Z00_I_CarrierTP.CarrierId = _connections.carrid
{
      @Search.defaultSearchElement: true
  key CarrierId,
      @Search.defaultSearchElement: true
      CarrierName,
      CurrencyCode,
      URL,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _connections
}
