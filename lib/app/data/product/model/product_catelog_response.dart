class ProductCatalogResponse {
  dynamic code;
  List<Data>? data;

  ProductCatalogResponse({code, data});

  ProductCatalogResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data =  <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['code'] = code;
    data['data'] = this.data?.map((v) => v.toJson()).toList();

    return data;
  }
}

class Data {
  String? id;
  Info? info;
  Meta? meta;
  List<String>? tags;
  List<Photos>? photos;
  List<String>? brands;
  Manufacturer? manufacturer;
  List<Categories>? categories;
  String? createdAt;
  String? updatedAt;

  Data(
      {id,
        info,
        meta,
        tags,
        photos,
        brands,
        manufacturer,
        categories,
        createdAt,
        updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    info = json['info'] != null ?  Info.fromJson(json['info']) : null;
    meta = json['meta'] != null ?  Meta.fromJson(json['meta']) : null;
    tags = json['tags'].cast<String>();
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos?.add( Photos.fromJson(v));
      });
    }
    brands = json['brands'].cast<String>();
    manufacturer = json['manufacturer'] != null
        ?  Manufacturer.fromJson(json['manufacturer'])
        : null;
    if (json['categories'] != null) {
      categories =  <Categories>[];
      json['categories'].forEach((v) {
        categories?.add( Categories.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    if (info != null) {
      data['info'] = info?.toJson();
    }
    if (meta != null) {
      data['meta'] = meta?.toJson();
    }
    data['tags'] = tags;
    if (photos != null) {
      data['photos'] = photos?.map((v) => v.toJson()).toList();
    }
    data['brands'] = brands;
    if (manufacturer != null) {
      data['manufacturer'] = manufacturer?.toJson();
    }
    if (categories != null) {
      data['categories'] = categories?.map((v) => v?.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    return data;
  }
}

class Categories {
  String? id;
  String? name;

  Categories({id, name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;

    return data;
  }
}

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
    final Map<String, dynamic> data =  Map<String, dynamic>();
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
  List<String>? keywords;
  String? title;
  String? description;
  String? friendlyPageName;

  Meta({keywords, title, description, friendlyPageName});

  Meta.fromJson(Map<String, dynamic> json) {
    keywords = json['keywords'].cast<String>();
    title = json['title'];
    description = json['description'];
    friendlyPageName = json['friendlyPageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['keywords'] = keywords;
    data['title'] = title;
    data['description'] = description;
    data['friendlyPageName'] = friendlyPageName;

    return data;
  }
}

class Photos {
  String? url;
  String? id;
  String? title;
  String? alt;
  dynamic displayOrder;
  String? diplayOrder;
  String? displaOrder;

  Photos(
      {url,
        id,
        title,
        alt,
        displayOrder,
        diplayOrder,
        displaOrder});

  Photos.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    title = json['title'];
    alt = json['alt'];
    displayOrder = json['displayOrder'];
    diplayOrder = json['diplayOrder'];
    displaOrder = json['displaOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['url'] = url;
    data['id'] = id;
    data['title'] = title;
    data['alt'] = alt;
    data['displayOrder'] = displayOrder;
    data['diplayOrder'] = diplayOrder;
    data['displaOrder'] = displaOrder;

    return data;
  }
}

class Manufacturer {
  String? id;
  String? name;

  Manufacturer({id, name});

  Manufacturer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;

    return data;
  }
}
