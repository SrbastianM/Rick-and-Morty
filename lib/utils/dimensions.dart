import 'package:get/get.dart';

class Dimensions {
  static double screeHeight = Get.context?.height ?? 0;
  static double screenWidth = Get.context?.width ?? 0;
  static double pageView = screeHeight / 2.78;
  static double pageViewContainer = screeHeight / 4.04;
  static double pageViewTextContainer = screeHeight / 7.4;

  static double height10 = screeHeight / 89.03;
  static double height15 = screeHeight / 59.3;
  static double height20 = screeHeight / 44.5;
  static double height30 = screeHeight / 29.7;
  static double height45 = screeHeight / 19.7;
  static double height60 = screeHeight / 14.7;
  static double height70 = screeHeight / 10.3;

  // dynamic width, margin y padding
  static double width10 = screeHeight / 89.03;
  static double width15 = screeHeight / 59.3;
  static double width20 = screeHeight / 44.5;
  static double width30 = screeHeight / 29.7;
  static double width45 = screeHeight / 19.7;

  //Icon Size
  static double iconSize24 = screeHeight / 37;
  static double iconSize16 = screeHeight / 55.6;

  // List View Size

  static double listViewImg = screeHeight / 6.7;
  static double listViewTextContSize = screenWidth / 4.4;

  // font Size
  static double font20 = screeHeight / 44.5;
  static double font16 = screeHeight / 51.2;
  static double font26 = screeHeight / 34.2;

  static double radius15 = screeHeight / 59.3;
  static double radius20 = screeHeight / 44.5;
  static double radius30 = screeHeight / 29.7;
}
