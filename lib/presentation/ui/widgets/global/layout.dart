import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';


class Layout extends StatelessWidget {
  const Layout({Key? key, required this.child, required this.title,this.isAuthenticated,this.action})
      : super(key: key);
  final Widget child;
  final String title;
  final bool? isAuthenticated;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset:false,
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
              leading: action??const SizedBox(),
              actions: [
                title == context.lang!.home&&isAuthenticated!
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                          context.notificationProvider.count>0?  const Icon(
                              Icons.circle,
                              size: 10,
                              color: Colors.deepOrange,
                            ):const SizedBox(),
                            InkWell(
                                onTap: () {
                                  context.notificationProviderF.clear();
                                  Navigator.pushNamed(context, notification);
                                },
                                child: const Icon(
                                  Icons.notifications,

                                ))
                          ],
                        ))
                    : const SizedBox(),
              ],
              title: Text(
                title,

              )),
          body: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                height: context.h,
                width: context.w,
                color: const Color(0xFFfafafa),
                child: child),
          )),
    );
  }
}
