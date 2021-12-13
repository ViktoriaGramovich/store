using epam.sap.dev.kitchen_app.store as store from '../db/schema';
using sap.common as common from '@sap/cds/common';
using masterdata as masterdata from '../db/master-data';
using {NorthWind as external} from './external/NorthWind.csn';
 
service ProductService {
    @odata.draft.enabled
    @Capabilities : { Deletable:true, Insertable:true}
    entity Products as projection on store.Products actions{
        action moveToNext();
    };
    @Capabilities : { Deletable:true, Insertable:true}
    entity Markets as projection on store.Markets actions{
        action confirmMarket();
    };
    @Capabilities : { Deletable:true, Insertable:true}
    entity Orders as projection on store.Orders;
    @cds.autoexpose entity ProductGroups as projection on masterdata.ProductGroups;
    @cds.autoexpose entity UOM as projection on masterdata.UnitOfMeasure;
    @cds.autoexpose entity MarketMDs as projection on masterdata.MarketInfos;
    @cds.autoexpose entity Statuses as projection on masterdata.Phases;
    entity Currencies as projection on common.Currencies;
    @readonly
   entity Suppliers as projection on store.Suppliers;
    // external.Suppliers {
    //     key ID: Integer, 
    //     Name: String
    // };
    @readonly
    entity Persons as projection on external.Persons {
        key ID, 
        Name
    };

    @readonly
    entity PersonDetails as projection on external.PersonDetails {
        key PersonID, 
        Phone
    };
}