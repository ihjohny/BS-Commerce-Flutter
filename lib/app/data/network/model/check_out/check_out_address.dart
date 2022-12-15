class CheckOutAddress {
  String? firstName;
  String? lastName;
  String? email;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? country;
  String? postCode;
  String? phoneNumber;

  CheckOutAddress(
      {this.firstName,
        this.lastName,
        this.email,
        this.addressLine1,
        this.addressLine2,
        this.city,
        this.country,
        this.postCode,
        this.phoneNumber});

  CheckOutAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    city = json['city'];
    country = json['country'];
    postCode = json['postCode'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['addressLine1'] = addressLine1;
    data['addressLine2'] = addressLine2;
    data['city'] = city;
    data['country'] = country;
    data['postCode'] = postCode;
    data['phoneNumber'] = phoneNumber;

    return data;
  }
}
