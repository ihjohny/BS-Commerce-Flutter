class AddToCartResponse {
  int? code;
  Data? data;

  AddToCartResponse({this.code, this.data});

  AddToCartResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }

    return data;
  }
}

class Data {
  String? id;
  String? userId;
  List<Items>? items;

  Data({this.id, this.userId, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Items {
  Product? product;
  String? productId;
  int? quantity;

  Items({this.product, this.productId, this.quantity});

  Items.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    productId = json['productId'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['productId'] = productId;
    data['quantity'] = quantity;

    return data;
  }
}

class Product {
  String? id;
  Info? info;
  Meta? meta;
  Photos? photos;

  Product({this.id, this.info, this.meta, this.photos});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    photos =
    json['photos'] != null ? Photos.fromJson(json['photos']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (photos != null) {
      data['photos'] = photos!.toJson();
    }

    return data;
  }
}

class Info {
  String? name;
  String? shortDescription;
  String? fullDescription;
  String? sku;
  int? price;
  int? oldPrice;
  int? cost;
  bool? showOnHomePage;
  bool? includeInTopMenu;
  bool? allowToSelectPageSize;
  bool? published;
  int? displayOrder;
  bool? isFeatured;
  String? publishDate;

  Info(
      {this.name,
        this.shortDescription,
        this.fullDescription,
        this.sku,
        this.price,
        this.oldPrice,
        this.cost,
        this.showOnHomePage,
        this.includeInTopMenu,
        this.allowToSelectPageSize,
        this.published,
        this.displayOrder,
        this.isFeatured,
        this.publishDate});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

class Meta {
  String? friendlyPageName;

  Meta({this.friendlyPageName});

  Meta.fromJson(Map<String, dynamic> json) {
    friendlyPageName = json['friendlyPageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['friendlyPageName'] = this.friendlyPageName;

    return data;
  }
}

class Photos {
  String? url;
  String? title;
  String? alt;
  int? displayOrder;

  Photos({this.url, this.title, this.alt, this.displayOrder});

  Photos.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    alt = json['alt'];
    displayOrder = json['displayOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['title'] = title;
    data['alt'] = alt;
    data['displayOrder'] = displayOrder;

    return data;
  }
}