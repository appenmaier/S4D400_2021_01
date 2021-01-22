@AbapCatalog.sqlViewName: 'Z00ICARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Carrier'
@VDM.viewType: #BASIC
define view Z00_I_Carrier
  as select from scarr
{
  key carrid   as CarrierId,
      carrname as CarrierName,
      currcode as CurrencyCode,
      url      as URL
}
