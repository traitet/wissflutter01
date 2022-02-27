class InterfaceSapPoModel {
//==============================================================================
// DECLARE PROPERTY
//==============================================================================
  // ignore: non_constant_identifier_names
  String? RIDTTIFPO;
  // ignore: non_constant_identifier_names
  String? PONUM;
  // ignore: non_constant_identifier_names
  String? ITEMID;
  // ignore: non_constant_identifier_names
  String? DOCTYPE;
  // ignore: non_constant_identifier_names
  String? VENDORID;
  // ignore: non_constant_identifier_names
  String? PAYMENTTERM;

//==============================================================================
// CONSTRUCTURE
//==============================================================================
  InterfaceSapPoModel({
    // ignore: non_constant_identifier_names
    this.RIDTTIFPO,
    // ignore: non_constant_identifier_names
    this.PONUM,
    // ignore: non_constant_identifier_names
    this.ITEMID,
    // ignore: non_constant_identifier_names
    this.DOCTYPE,
    // ignore: non_constant_identifier_names
    this.VENDORID,
    // ignore: non_constant_identifier_names
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
