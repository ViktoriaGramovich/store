namespace epam.sap.dev.kitchen_app.store;
 
using { cuid, managed } from '@sap/cds/common';
using { masterdata } from './master-data';
 
entity Products: managed, cuid {
  model         : String(15);
  status        : Association to one masterdata.Statuses;
  price         : Decimal(15, 2);
  taxrate       : Integer;
  height        : Decimal(13, 3);
  depth         : Decimal(13, 3);
  width         : Decimal(13, 3);
  sizeuom       : Association to one masterdata.UOM;
  productgroup  : Association to one masterdata.ProductGroups;
  @cascade : {all}
  market   : Composition of many Markets on market.toProduct = $self; 
}
 
entity Markets: managed, cuid {
      toMarketInfos    : Association to masterdata.MarketInfos;
      toProduct        : Association to Products;
      startDate        : Date;
      endDate          : Date;
      @cascade : {all}
      order   : Composition of many Orders on order.toMarket = $self;
}
 
entity Orders: managed, cuid {
    toMarket: Association to Markets;
    quantity         : Integer;
    calendarYear     : String;
    deliveryDate     : Date;
}
