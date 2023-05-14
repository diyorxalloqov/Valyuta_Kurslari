class UserModel {
  String? title;
  String? code;
  String? cbPrice;
  String? nbuBuyPrice;
  String? nbuCellPrice;
  String? date;

  UserModel(
      {this.title,
      this.code,
      this.cbPrice,
      this.nbuBuyPrice,
      this.nbuCellPrice,
      this.date});

  UserModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    code = json['code'];
    cbPrice = json['cb_price'];
    nbuBuyPrice = json['nbu_buy_price'];
    nbuCellPrice = json['nbu_cell_price'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['code'] = this.code;
    data['cb_price'] = this.cbPrice;
    data['nbu_buy_price'] = this.nbuBuyPrice;
    data['nbu_cell_price'] = this.nbuCellPrice;
    data['date'] = this.date;
    return data;
  }
}
