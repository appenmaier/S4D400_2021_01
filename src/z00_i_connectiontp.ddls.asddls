@AbapCatalog.sqlViewName: 'Z00ICONNTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional View: Connection'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel: {
//    compositionRoot: true,
//    transactionalProcessingEnabled: true,
    writeActivePersistence: 'SPFLI',

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,

//    modelCategory: #BUSINESS_OBJECT,
    representativeKey: ['CARRID', 'CONNID'],
    semanticKey: ['CARRID', 'CONNID']
}
define view Z00_I_ConnectionTP
  as select from Z00_I_Connection
  association [1] to Z00_I_CarrierTP as _carrier on Z00_I_Connection.carrid = _carrier.CarrierId
{
  key carrid,
  key connid,
      cityfrom,
      cityto,
      @ObjectModel.association.type: [#TO_COMPOSITION_ROOT, #TO_COMPOSITION_PARENT]
      _carrier
}
