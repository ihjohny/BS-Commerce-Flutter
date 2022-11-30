import 'package:bs_commerce/app/core/utils/utils.dart';
import 'package:bs_commerce/app/core/values/app_colors.dart';
import 'package:bs_commerce/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:bs_commerce/app/modules/checkout/model/address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/base_view.dart';
import '../../../core/values/app_values.dart';
import '../../auth/components/my_text_form_field.dart';

class AddressForm extends BaseView<CheckOutController> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  final Address? address;

  AddressForm({this.address}) {
    if (address != null) {
      nameController.text = address!.Name;
      cityController.text = address!.city;
      postalCodeController.text = address!.postalCode;
      mobileNumberController.text = address!.mobileNumber;
      addressController.text = address!.address;
    }
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colorWhite,
      elevation: 0,
      title: Text(
        "Add Shipping Address",
        style: getAppBarTitleTextStyle(),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      height: Get.height,
      color: AppColors.colorWhite,
      child: _getView(),
    );
  }

  Widget _getView() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getForm(),
                TextButton(
                    onPressed: () {
                      controller.setAddress(Address(
                          nameController.text,
                          mobileNumberController.text,
                          "",
                          addressController.text,
                          cityController.text,
                          postalCodeController.text));
                      Get.back();
                    },
                    style: getButtonStyle(true, true),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppValues.addNewAddress,
                              style: getTitleTextStyleWhite()),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column getForm() {
    return Column(
      children: [
        MyTextFormField(
            editingController: nameController,
            labelText: "Name",
            prefixIcon: const Icon(
              Icons.person_outline,
              color: AppColors.colorBlack,
            )),
        Space(height: AppValues.margin_10),
        MyTextFormField(
            editingController: mobileNumberController,
            labelText: "Mobile Number",
            prefixIcon: const Icon(Icons.phone_iphone_sharp,
                color: AppColors.colorBlack)),
        Space(height: AppValues.margin_10),
        MyTextFormField(
            editingController: addressController,
            labelText: "Address",
            prefixIcon: const Icon(Icons.home, color: AppColors.colorBlack)),
        Space(height: AppValues.margin_10),
        MyTextFormField(
            editingController: cityController,
            labelText: "City",
            prefixIcon: const Icon(Icons.location_city_outlined,
                color: AppColors.colorBlack)),
        Space(height: AppValues.margin_10),
        MyTextFormField(
            editingController: postalCodeController,
            labelText: "Postal Code",
            prefixIcon: const Icon(Icons.numbers_outlined,
                color: AppColors.colorBlack)),
        Space(height: AppValues.margin_20),
      ],
    );
  }
}
