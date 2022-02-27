class InterfaceSapPoModel {
//==============================================================================
// DECLARE PROPERTY
//==============================================================================
  String? RIDTTIFPO;
  String? PONUM;
  String? ITEMID;
  String? DOCTYPE;
  String? VENDORID;
  String? PAYMENTTERM;

//==============================================================================
// CONSTRUCTURE
//==============================================================================
  InterfaceSapPoModel({
    this.RIDTTIFPO,
    this.PONUM,
    this.ITEMID,
    this.DOCTYPE,
    this.VENDORID,
    this.PAYMENTTERM,
  });

//==============================================================================
// FROM JSON
//==============================================================================
  InterfaceSapPoModel.fromJson(Map<String, dynamic> json) {
    RIDTTIFPO = json['RIDTTIFPO'];
    PONUM = json['PONUM'];
    ITEMID = json['ITEMID'];
    DOCTYPE = json['DOCTYPE'];
    VENDORID = json['VENDORID'];
    PAYMENTTERM = json['PAYMENTTERM'];
  }
}
