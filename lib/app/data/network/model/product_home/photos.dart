class Photos {
  String? url;
  String? id;
  String? title;
  String? alt;

  Photos({url, id, title, alt});

  Photos.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    title = json['title'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = url;
    data['id'] = id;
    data['title'] = title;
    data['alt'] = alt;

    return data;
  }
}