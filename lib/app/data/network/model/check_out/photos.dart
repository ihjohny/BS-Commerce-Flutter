class Photos {
  String? url;
  String? id;
  String? title;
  String? alt;
  int? displayOrder;

  Photos({this.url, this.id, this.title, this.alt, this.displayOrder});

  Photos.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    title = json['title'];
    alt = json['alt'];
    displayOrder = json['displayOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['id'] = id;
    data['title'] = title;
    data['alt'] = alt;
    data['displayOrder'] = displayOrder;

    return data;
  }
}