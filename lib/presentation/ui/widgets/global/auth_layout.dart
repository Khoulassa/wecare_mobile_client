import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';

import 'CurveClip.dart';
import 'custom_appbar.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({Key? key, this.children, this.title, required this.fromOnBoarding}) : super(key: key);
  final List<Widget>? children;
  final String? title;
  final bool fromOnBoarding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(

        resizeToAvoidBottomInset: false,
          appBar: appBar(
              context: context,
              color: UiColors.purple4,
              title: title,
              elevation: 0,
              width: context.w, onTap: fromOnBoarding?true:false),
          body:  Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: context.h,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              ClipPath(
                                clipper: CurveClip(),
                                child: Container(
                                  color: UiColors.purple4,
                                  height: context.h * 0.17,
                                ),
                              ),
                              Positioned(
                                  top: context.h * 0.07,
                                  child: SvgPicture.asset(
                                    Assets.logonLogo,
                                    height: context.h * 0.1,
                                    width: context.w * 0.1,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: context.h * 0.68,
                            child: ListView(children: children!),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                context.authProvider.state == States.loading
                    ? Positioned(
                        top: context.h * 0.5,
                        child: const CircularProgressIndicator(
                          color: UiColors.pink2,
                        ))
                    : const SizedBox()
              ],
            ),
          )
    );
  }
}
