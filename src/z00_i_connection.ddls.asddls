@AbapCatalog.sqlViewName: 'ZI00CONN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Connection'
@VDM.viewType: #BASIC
define view Z00_I_Connection
  as select from spfli
{
  key carrid,
  key connid,
      cityfrom,
      cityto
}
