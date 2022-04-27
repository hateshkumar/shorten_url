import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shorten/app_core/app_constants/app_colors.dart';
import 'package:shorten/app_core/app_constants/app_constants.dart';
import 'package:shorten/app_core/app_constants/app_spacing.dart';
import 'package:shorten/view/history/bloc/history_bloc.dart';
import 'package:shorten/view/history/model/history_model.dart';
import 'package:shorten/widget/app_spacers.dart';
import 'package:shorten/widget/button.dart';
import 'package:shorten/widget/decorations.dart';
import 'package:shorten/widget/image_util.dart';
import 'package:shorten/widget/snack_bar.dart';
import 'package:shorten/widget/text_field.dart';
import 'package:shorten/widget/text_widget.dart';
import 'package:sizer/sizer.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  TextEditingController urlController = TextEditingController();
  final StreamController<int> errorListenerController =
      StreamController<int>.broadcast();

  final StreamController<int> copyListenerController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HistoryBloc>(context).add(HistoryListEvent());

    errorListenerController.add(1);
    copyListenerController.add(1);
    urlController.addListener(() {
      errorListenerController.sink.add(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true  ,
        backgroundColor: APPColors.appOffWhite,
        body: SafeArea(
          bottom: false,
          child: Column(children: [
            SUSpacer(
              height: 3.h,
            ),
            SUText.text(
              text: APPConstants.history_title,
              color: APPColors.appBlack,
              fontSize: 15.sp,
            ),
            BlocConsumer<HistoryBloc, HistoryState>(buildWhen: (prev, crt) {
              return crt is HistoryListState || crt is HistoryLoadingState;
            }, listener: (context, state) {
              if (state is UrlRemoveState) {
                BlocProvider.of<HistoryBloc>(context).add(HistoryListEvent());
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SUSnackBar.critical(
                      caption: "URL Removed!",
                    ),
                  );
              }
            }, builder: (context, state) {
              List<HistoryLocalModel> data = [];
              if (state is HistoryListState) {
                data = state.list;
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: data.isNotEmpty ? data.length : 0,
                  itemBuilder: (context, index) {
                    return buildListItemWidget(context, data[index]);
                  },
                ),
              );
            }),
            buildInputWidget(context)
          ]),
        ));
  }

  Widget buildInputWidget(BuildContext context) {
    return Container(
      color: APPColors.appPrimaryViolet,
      child: Stack(
        children: [
          const Positioned(
            bottom: -90,
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
                height: 3.h,
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
              BlocConsumer<HistoryBloc, HistoryState>(
                  listener: (context, state) {
                if (state is HistoryShortenUrlFailureState) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SUSnackBar.critical(
                        caption: state.error,
                      ),
                    );
                }
                if (state is HistoryShortenUrlState) {
                  BlocProvider.of<HistoryBloc>(context).add(HistoryListEvent());
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SUSnackBar.critical(
                        caption: "URL Shortened!",
                      ),
                    );
                }
              }, builder: (context, state) {
                if (state is HistoryShortenLoadingState) {
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
              }),
              SUSpacer(
                height: 3.h,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildListItemWidget(BuildContext context, HistoryLocalModel data) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w),
      child: Container(
        margin: EdgeInsets.only(top: 3.h),
        decoration:
            SUDecorations.cicularWithShadowNwithoutBorder(circularSpace: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SUSpacer(
              height: 2.h,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: SUSpace.padding,
                right: SUSpace.padding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      strutStyle: const StrutStyle(fontSize: 12.0),
                      text: TextSpan(
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                          text: "${data.long}"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      removeItem(data.id);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 2, right: 4.w),
                      child: const SvgLoader(
                          imagePath: APPConstants.del, width: 5, height: 5),
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.black54,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: SUSpace.padding,
                right: SUSpace.padding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SUText.text(
                    text: "${data.shortUrl}",
                    color: APPColors.appPrimaryCyan,
                    fontSize: 13.sp,
                  ),
                  SUSpacer(
                    height: 3.h,
                  ),
                  StreamBuilder(
                      stream: copyListenerController.stream,
                      builder: (context, snapshot) {
                        return Center(
                          child: SUElevatedButton(
                              buttonWidth: 90.w,
                              buttonHeight: 6.5.h,
                              buttonText: data.isCopied! ?APPConstants.copied:APPConstants.copy,

                              disabled:data.isCopied! ? true:false,
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: "${data.shortUrl}"));
                                data.isCopied = true;
                                copyListenerController.sink.add(0);
                              }),
                        );
                      }),
                  SUSpacer(
                    height: 4.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void shortenUrl(String url) {
    if (url.isEmpty) {
      errorListenerController.sink.add(0);
    } else {
      BlocProvider.of<HistoryBloc>(context).add(HistoryUrlShortenEvent(url));
    }
  }

  void removeItem(data) {
    BlocProvider.of<HistoryBloc>(context).add(RemoveUrlEvent(data));
  }
}
