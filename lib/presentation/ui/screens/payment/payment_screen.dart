import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/arguments.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';

import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key,required this.url }) : super(key: key);
   final String url;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late  WebViewController  controller ;
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  bool isLoading = true;


  @override
  void initState() {
    // Within initState():

      super.initState();
      if (mounted && Platform.isAndroid) {
        if (mounted && Platform.isAndroid) {
          WebView.platform = SurfaceAndroidWebView();
        }
      }
    }




  @override
  Widget build(BuildContext context) {
    return Layout(
      action:IconButton(onPressed: () {Navigator.pop(context);  }, icon: const Icon(Icons.arrow_back_ios,color: UiColors.purple1,),) ,
      title: AppLocalizations.of(context)!.pay,
      child: Stack(  // Wrap with Stack to overlay the loading indicator
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            debuggingEnabled: true,
            onWebViewCreated: (WebViewController webViewController) {
              controller = webViewController;
              _controller.complete(webViewController);
            },
            onProgress: (int progress) async {
              if (progress == 100) {
                setState(() {
                  isLoading = false;
                });
              }
              var x = await  controller.currentUrl()??"";
              if (x.contains("success")) {
                Navigator.pushReplacementNamed(context, paymentResult,
                    arguments: PaymentResultArg(message: context.lang!.paymentResult, result: 1));
                await context.ordersProviderF.getOrders(context: context);

              }else if (x.contains("errors")){
                Navigator.pushReplacementNamed(context, paymentResult,
                    arguments: PaymentResultArg(message: context.lang!.paymentError, result: 0));
              }
            },
            onWebResourceError: (error) {
              print("Web resource error occurred: $error");

            },
            gestureNavigationEnabled: true,
          ),
          // Show loading indicator while isLoading is true
          isLoading
              ? const Center(
            child: CircularProgressIndicator(color: UiColors.purple1,),
          )
              : const SizedBox.shrink(),  // Use SizedBox.shrink to display nothing when not loading
        ],
      ),
    );
  }


}
