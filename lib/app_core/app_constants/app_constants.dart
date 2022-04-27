import 'package:flutter/material.dart';

class APPConstants {
  static const String AssetsPath = "assets/svg/";

  /*Assets Path*/
  static const String logo = "${AssetsPath}logo.svg";
  static const String illustration = "${AssetsPath}illustration.svg";
  static const String diagram = "${AssetsPath}diagram.svg";
  static const String gauge = "${AssetsPath}Gauge.svg";
  static const String tools = "${AssetsPath}tools.svg";
  static const String shape = "${AssetsPath}shape.svg";
  static const String del = "${AssetsPath}del.svg";

  /*String literal*/
  static const String start = "START";
  static const String shorten_it = "SHORTEN IT!";
  static const String copy = "COPY";
  static const String copied = "COPIED!";
  static const String shorten_hint = "Shorten a link here...";
  static const String shorten_hint_error = "Please add a link here";
  static const String history_title = "Your Link History";
  static const String app_name = "Shortly";
  static const String p1 = "More than just shorter links";
  static const String p2 =
      "Build your brand's reorganization and get detailed insights on how your links are performing";
  static const String p3 = "Let's get Started!";
  static const String d3 = "Paste your first link into the field to shorten it";
  static final sliderList = [
    SliderContentHolder(st1, sd1, diagram),
    SliderContentHolder(st2, sd2, gauge),
    SliderContentHolder(st3, sd3, tools),
  ];
  static const String st1 = "Brand Reorganization";
  static const String st2 = "Detail Records";
  static const String st3 = "Fully Customizable";
  static const String sd1 =
      "Boost your brand recognition with each click. Generic links don't mean a thing. Branded links help install confidence in your content";
  static const String sd2 =
      "Gain insights into who is clicking your links. Knowing when and where people engage with your context helps inform better decisions";
  static const String sd3 =
      "Improve branch awareness and content discoverability through customizable links, supercharging audience engagement.";
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class SliderContentHolder {
  String? title;
  String? desc;
  String? image;

  SliderContentHolder(this.title, this.desc, this.image);
}
