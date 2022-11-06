import 'model_product_categories.dart';
import 'model_product_info.dart';
import 'model_product_meta.dart';
import 'model_product_photos.dart';

class ProductHome {
  String? id;
  Info? info;
  Meta? meta;
  List<String>? tags;
  List<Photos>? photos;
  List<String>? brands;
  List<Categories>? categories;

  ProductHome(
      {id,
        info,
        meta,
        tags,
        photos,
        brands,
        categories,
      });

  ProductHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    tags = json['tags'].cast<String>();
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos?.add(Photos.fromJson(v));
      });
    }
    brands = json['brands'].cast<String>();
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    if (categories != null) {
      data['categories'] = categories?.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
