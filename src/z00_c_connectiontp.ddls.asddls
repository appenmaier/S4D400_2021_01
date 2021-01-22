@AbapCatalog.sqlViewName: 'Z00CCONNTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Connection'
@VDM.viewType: #CONSUMPTION
//@Search.searchable: true
@Metadata.allowExtensions: true
@ObjectModel: {
//    transactionalProcessingDelegated: true,
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view Z00_C_ConnectionTP
  as select from Z00_I_ConnectionTP
  association [1] to Z00_C_CarrierTP as _carrier on Z00_I_ConnectionTP.carrid = _carrier.CarrierId
{
  key carrid,
  key connid,
      cityfrom,
      cityto,
      @ObjectModel.association.type: [#TO_COMPOSITION_ROOT, #TO_COMPOSITION_PARENT]
      _carrier
}
