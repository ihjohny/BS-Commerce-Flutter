class Info {
  String? name;
  String? shortDescription;
  String? fullDescription;
  String? sku;
  dynamic price;
  dynamic oldPrice;
  dynamic cost;
  bool? showOnHomePage;
  bool? includeInTopMenu;
  bool? allowToSelectPageSize;
  bool? published;
  dynamic displayOrder;
  bool? isFeatured;
  String? publishDate;

  Info(
      {name,
        shortDescription,
        fullDescription,
        sku,
        price,
        oldPrice,
        cost,
        showOnHomePage,
        includeInTopMenu,
        allowToSelectPageSize,
        published,
        displayOrder,
        isFeatured,
        publishDate});

  Info.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortDescription = json['shortDescription'];
    fullDescription = json['fullDescription'];
    sku = json['sku'];
    price = json['price'];
    oldPrice = json['oldPrice'];
    cost = json['cost'];
    showOnHomePage = json['showOnHomePage'];
    includeInTopMenu = json['includeInTopMenu'];
    allowToSelectPageSize = json['allowToSelectPageSize'];
    published = json['published'];
    displayOrder = json['displayOrder'];
    isFeatured = json['isFeatured'];
    publishDate = json['publishDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['shortDescription'] = shortDescription;
    data['fullDescription'] = fullDescription;
    data['sku'] = sku;
    data['price'] = price;
    data['oldPrice'] = oldPrice;
    data['cost'] = cost;
    data['showOnHomePage'] = showOnHomePage;
    data['includeInTopMenu'] = includeInTopMenu;
    data['allowToSelectPageSize'] = allowToSelectPageSize;
    data['published'] = published;
    data['displayOrder'] = displayOrder;
    data['isFeatured'] = isFeatured;
    data['publishDate'] = publishDate;

    return data;
  }
}