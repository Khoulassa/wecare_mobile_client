import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';


import 'error_message.dart';

class AppFutureBuilder extends StatelessWidget {
  const AppFutureBuilder(
      {Key? key, required this.builder, this.future, this.onTap, this.loading})
      : super(key: key);

  final Widget Function(BuildContext, AsyncSnapshot<dynamic>) builder;
  final Future? future;
  final VoidCallback? onTap;
  final Widget ?loading;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
       
        if (snapshot.hasData || future == null) {
          return builder(context, snapshot);
        } else if (snapshot.hasError) {
          return Center(
              child: ErrorMessage(
            onTap: onTap!,
          ));
        } else {
          return  Center(
            child:loading?? const CircularProgressIndicator(
              color: UiColors.purple1,
            ),
          );
        }
      },
    );
  }
}
