class Meta {
  List<String>? keywords;
  String? title;
  String? description;

  Meta({keywords, title, description});

  Meta.fromJson(Map<String, dynamic> json) {
    keywords = json['keywords'].cast<String>();
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['keywords'] = keywords;
    data['title'] = title;
    data['description'] = description;

    return data;
  }
}