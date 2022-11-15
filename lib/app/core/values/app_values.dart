import 'package:flutter/material.dart';
abstract class AppValues {
  static const double padding = 16;
  static const double padding_zero = 0;
  static const double halfPadding = 8;
  static const double smallPadding = 10;
  static const double extraSmallPadding = 6;
  static const double largePadding = 24;
  static const double extraLargePadding = 32;
  static const double padding_4 = 4;
  static const double padding_2 = 2;
  static const double padding_3 = 3;
  static const double padding_80 = 80;
  static const double padding_90 = 90;
  static const double buttonVerticalPadding = 12;

  static const double margin = 16;
  static const double margin_zero = 0;
  static const double smallMargin = 8;
  static const double extraSmallMargin = 6;
  static const double largeMargin = 24;
  static const double margin_40 = 40;
  static const double margin_32 = 32;
  static const double margin_18 = 18;
  static const double margin_10 = 10;
  static const double margin_15 = 15;
  static const double margin_100 = 100;
  static const double margin_2 = 2;
  static const double margin_4 = 4;
  static const double margin_6 = 6;
  static const double margin_12 = 12;
  static const double margin_30 = 30;
  static const double margin_20 = 20;
  static const double extraLargeMargin = 36;
  static const double marginBelowVerticalLine = 64;
  static const double minimumSpacing = 16;
  static const double extraLargeSpacing = 96;
  static const double mainAxisSpacing = 70;

  static const double radius = 16;
  static const double radius_zero = 0;
  static const double smallRadius = 8;
  static const double radius_6 = 6;
  static const double radius_12 = 12;
  static const double largeRadius = 24;
  static const double roundedButtonRadius = 24;
  static const double extraLargeRadius = 36;
  static const double extraLargeRadius100 = 100;

  static const double elevation = 16;
  static const double elevation_half = 0.5;
  static const double smallElevation = 8;
  static const double extraSmallElevation = 4;
  static const double largeElevation = 24;

  static const double circularImageDefaultSize = 90;
  static const double circularImageSize_30 = 30;
  static const double circularImageDefaultBorderSize = 0;
  static const double circularImageDefaultElevation = 0;
  static const double momentThumbnailDefaultSize = 80;
  static const double momentSmallThumbnailDefaultSize = 32;
  static const double collectionThumbnailDefaultSize = 150;
  static const double defaultViewPortFraction = 0.9;
  static const int defaultAnimationDuration = 300;
  static const double listBottomEmptySpace = 200;
  static const double maxButtonWidth = 496;
  static const double stackedImageDefaultBorderSize = 4;
  static const double stackedImageDefaultSpaceFactor = 0.4;
  static const double stackedImageDefaultSize = 30;

  static const double iconDefaultSize = 24;
  static const double emoticonDefaultSize = 22;
  static const double iconSize_20 = 20;
  static const double iconSize_22 = 22;
  static const double iconSize_18 = 18;
  static const double iconSmallSize = 16;
  static const double iconSmallerSize = 12;
  static const double iconSize_14 = 14;
  static const double iconSize_28 = 28;
  static const double iconLargeSize = 36;
  static const double iconExtraLargerSize = 96;
  static const double appBarIconSize = 32;

  static const double customAppBarSize = 144.0;
  static const double collapsedAppBarSize = 70.0;

  static const int loggerLineLength = 120;
  static const int loggerErrorMethodCount = 8;
  static const int loggerMethodCount = 2;

  static const double fullViewPort = 1;
  static const double indicatorDefaultSize = 8;
  static const double indicatorShadowBlurRadius = 1;
  static const double indicatorShadowSpreadRadius = 0;
  static const double appbarActionRippleRadius = 50;
  static const double activeIndicatorSize = 8;
  static const double inactiveIndicatorSize = 10;
  static const double datePickerHeightOnIos = 270;
  static const int maxCharacterCountOfQuote = 108;
  static const double barrierColorOpacity = 0.4;

  static const int defaultPageSize = 10;
  static const int defaultPageNumber = 1;
  static const int defaultDebounceTimeInMilliSeconds = 1000;
  static const int defaultThrottleTimeInMilliSeconds = 500;

  static const double height_16 = 16;
  static const double text_height_18 = 18;

  static const double phoneNumberLength = 11;
  static const int value_24 = 24;
  static const int value_30 = 30;
  static const int status_code_201 = 201;

///String Value
  static const String description = "Description";
  static const String totalPrice = "Total Price";
  static const String addToCart = "Add To Cart";
  static const String verify = "Verify";
  static const String otp = "OTP";
  static const String signUp = "Sign Up";
  static const String signIn = "Sign In";
  static const String alreadyHaveAnAccount = "Already have an account?";
  static const String error = "Error";
  static const String enterYourNumberEmail = "Enter Your Number or Email";
  static const String forgotPassword = "Forgot Your Password?";
  static const String enterYourPassword = "Enter Your Password";
  static const String enterYourName = "Enter Your Name";
  static const String createYourAccount = "Create Your Account";
  static const String loginToYoureAccount = "Log In to Your Account";
  static const String tokenSaveSuccessfully = "Token Save Successfully";
  static const String thisFieldMustNotBeEmpty = 'This field must not be empty';

  static Widget getVerticalSpace(double spaceValue) {
    return SizedBox(
      height: spaceValue,
    );
  }
  static String getCustomizableString(
      {required String symbol, required String? value}) {
    return "$symbol$value";
  }

 static Widget getHorizontalSpace(double spaceValue) {
    return SizedBox(
      width: spaceValue,
    );
  }

  static const String AUTH_TOKEN = "auth_token";
}
