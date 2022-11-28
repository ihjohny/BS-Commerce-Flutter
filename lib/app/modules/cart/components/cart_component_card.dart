import 'package:bs_commerce/app/core/utils/utils.dart';
import 'package:bs_commerce/app/core/values/app_colors.dart';
import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:bs_commerce/app/modules/auth/model/cart_component_model.dart';
import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';

class CartComponentCard extends StatelessWidget {
  const CartComponentCard(
      {Key? key,
      required this.cartComponentModel,
      required this.onValueChanged,
      this.haveDeleteButton = false,
      required this.onValueDeleted})
      : super(key: key);
  final bool haveDeleteButton;
  final CartComponentModel cartComponentModel;
  final Function(double value) onValueChanged;
  final Function() onValueDeleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: getCardStyle(),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Material(
                  elevation: 0,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(AppValues.margin_15)),
                  child: Image.network(cartComponentModel.productImageUrl,
                      height: AppValues.margin_100),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Flexible(
                              fit: FlexFit.tight,
                              flex: 2,
                              child: Text(cartComponentModel.productName,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: getTitleTextStyle(),
                                  textWidthBasis: TextWidthBasis.parent)),
                          haveDeleteButton
                              ? const SizedBox()
                              : Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: IconButton(
                                      onPressed: onValueDeleted,
                                      icon: const Icon(Icons.delete)),
                                )
                        ],
                      ),
                      Space(height:  haveDeleteButton
                          ? AppValues.margin_15:0),
                      Row(
                        children: [
                          Text(
                              getCurrencyString("${cartComponentModel.productPrice} X ${cartComponentModel.productCount}")),
                        ],
                      ),
                      Space(height:  haveDeleteButton
                          ? AppValues.margin_15:0),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                 getCurrencyString( "${int.tryParse(cartComponentModel.productPrice)! * int.tryParse(cartComponentModel.productCount)!}"),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: getTitleTextStyle(),
                                  textWidthBasis: TextWidthBasis.parent),
                            ],
                          ),
                          haveDeleteButton
                              ?  CircleAvatar(child: Text(cartComponentModel.productCount,style: getSubTitleTextStyle()),backgroundColor: AppColors.pageCartBackground,)
                              : CustomizableCounter(
                            textSize: AppValues.margin_16,
                                  backgroundColor: AppColors.colorWhite,
                                  borderColor: AppColors.colorWhite,
                                  borderRadius: AppValues.margin_100,
                                  count: double.tryParse(
                                          cartComponentModel.productCount) ??
                                      0,
                                  onCountChange: onValueChanged,
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
