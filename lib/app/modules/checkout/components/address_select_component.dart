import 'package:bs_commerce/app/core/values/app_colors.dart';
import 'package:bs_commerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/app_values.dart';
import '../model/address.dart';
import 'checkout_form_view.dart';
class AddressSelection extends StatelessWidget {
  const AddressSelection({Key? key,required this.address,required this.shoppingAddressText}) : super(key: key);

  final Address address;
  final String shoppingAddressText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: getCardStyle(),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(flex:1,child: CircleAvatar(
                backgroundColor: AppColors.pageCartBackground,
                child: Padding(padding: EdgeInsets.all(8.0),child: CircleAvatar(
                  backgroundColor: AppColors.colorBlack,
                  child: Icon(Icons.home,color: AppColors.colorWhite,
                  ),
                ),),
              )),
              Expanded(flex:3,child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text(address.Name,style: getTitleTextStyle(),),
                  Space(height: AppValues.margin_2),
                  Text(address.address),
                ],
              )),
              Expanded(
                flex: 1,
                child: TextButton(onPressed: (){
                  Get.to(AddressForm(
                    address: address,
                  ));
                }, child: const Icon(Icons.edit,color: AppColors.colorPrimary,)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
