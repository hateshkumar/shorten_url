import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shorten/app_core/app_constants/app_colors.dart';
import 'package:shorten/app_core/app_constants/app_constants.dart';
import 'package:shorten/app_core/app_constants/app_spacing.dart';
import 'package:shorten/view/history/bloc/history_bloc.dart';
import 'package:shorten/view/history/view/history_screen.dart';
import 'package:shorten/view/home/bloc/home_bloc.dart';
import 'package:shorten/view/home/view/home_screen.dart';
import 'package:shorten/view/intro/view/intro_view.dart';
import 'package:shorten/widget/app_spacers.dart';
import 'package:shorten/widget/button.dart';
import 'package:shorten/widget/image_util.dart';
import 'package:shorten/widget/snack_bar.dart';
import 'package:shorten/widget/text_field.dart';
import 'package:shorten/widget/text_widget.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController urlController = TextEditingController();
  final StreamController<int> errorListenerController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    errorListenerController.add(1);
    urlController.addListener(() {
      errorListenerController.sink.add(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: APPColors.appOffWhite,
        body: SafeArea(
          bottom: false,
          child:CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    SUSpacer(
                      height: 3.h,
                    ),
                    SUText.text(
                      textAlign: TextAlign.center,
                      text: APPConstants.app_name,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 10.w,
                          fontWeight: FontWeight.w700),
                    ),
                    const SvgLoader(
                      imagePath: APPConstants.illustration,
                      width: 100,
                      height: 35,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: SUText.text(
                        textAlign: TextAlign.center,
                        text: APPConstants.p3,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 4.8.w,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SUSpacer(),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: SUText.text(
                        textAlign: TextAlign.center,
                        text: APPConstants.d3,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 5.0.w,
                        ),
                      ),
                    ),
                    SUSpacer(
                      height: 5.h,
                    ),
                    Expanded(child: buildInputWidget(context))
                  ],
                ),
              ),
            ],
          )

        ));
  }

  Widget buildInputWidget(BuildContext context) {
    return Container(
      color: APPColors.appPrimaryViolet,
      child: Stack(
        children: [
          const Positioned(
            bottom: -45,
            right: 1,
            child: SvgLoader(
              imagePath: APPConstants.shape,
              width: 70,
              height: 60,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              SUSpacer(
                height: 7.h,
              ),
              StreamBuilder<int>(
                  stream: errorListenerController.stream,
                  builder: (context, snapshot) {
                    print(snapshot.data);
                    if (snapshot.data == null || snapshot.data == 1) {
                      return SUTextField(
                        hintText: APPConstants.shorten_hint,
                        borderRadius: 4,
                        error: false,
                        controller: urlController,
                      );
                    } else {
                      return SUTextField(
                        hintText: APPConstants.shorten_hint,
                        borderRadius: 4,
                        error: true,
                        controller: urlController,
                      );
                    }
                  }),
              BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
                if (state is ShortenUrlFailureState) {
                  ScaffoldMessenger.of(
                      context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SUSnackBar.critical(
                        caption: state.error,
                      ),
                    );
                }
                if (state is ShortenUrlState) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => BlocProvider(
                        create: (context) => HistoryBloc(),
                        child: const HistoryScreen(),
                      )));
                }
              }, builder: (context, state) {
                if (state is HomeLoadingState) {
                  return Center(
                    child: Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(top: 4),
                        child: const CircularProgressIndicator(
                            strokeWidth: 1, backgroundColor: Colors.white)),
                  );
                }
                return Center(
                  child: SUElevatedButton(
                      buttonWidth: 70.w,
                      buttonHeight: 8.h,
                      buttonText: APPConstants.shorten_it,
                      onPressed: () {
                        shortenUrl(urlController.text);
                      }),
                );
              })
            ],
          ),
        ],
      ),
    );
  }

  void shortenUrl(String url) {
    if (url.isEmpty) {
      errorListenerController.sink.add(0);
    } else {
      BlocProvider.of<HomeBloc>(context).add(UrlShortenEvent(url));
    }
  }
}
