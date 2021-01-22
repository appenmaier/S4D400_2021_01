@AbapCatalog.sqlViewName: 'Z00ICARRTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional View: Carrier'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel: {
    compositionRoot: true,
    transactionalProcessingEnabled: true,
    //writeActivePersistence: 'SCARR',
    writeActivePersistence: 'Z00_V_CARRIER',

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,

    modelCategory: #BUSINESS_OBJECT,
    representativeKey: 'CarrierID',
    semanticKey: ['CarrierID']
}
define view Z00_I_CarrierTP
  as select from Z00_I_Carrier
  association [*] to Z00_I_ConnectionTP as _connections on Z00_I_Carrier.CarrierId = _connections.carrid
{
  key CarrierId,
      CarrierName,
      CurrencyCode,
      URL,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _connections
}
