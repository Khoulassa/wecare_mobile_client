import 'package:flutter/material.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';

import 'package:we_care/presentation/ui/screens/screens_export.dart';
import 'arguments.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const NavScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case signIn:
        final arg = settings.arguments as SinInArg;
        return MaterialPageRoute(builder: (_) =>  SignInScreen(fromOnBoarding: arg.fromOnBoarding,));
      case forget:
        return MaterialPageRoute(builder: (_) => const ForgetPassScreen());
      case resetpass:
        return MaterialPageRoute(builder: (_) => const ResetPassScreen());
      case notification:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case orderDetails:
        final arg = settings.arguments as OrderDetailsArg;
        return MaterialPageRoute(
            builder: (_) => OrderDetailScreen(
                  orderType: arg.orderType,
                ));
      case paymentResult:
        final arg = settings.arguments as PaymentResultArg;
        return MaterialPageRoute(builder: (_) => PaymentResultScreen(
          message:arg.message, result:arg.result ,
        ));
      case verifyCode:
        final arg = settings.arguments as CodeArg;
        return MaterialPageRoute(
            builder: (_) => VerifyCodeScreen(
                  message: arg.message,
                  fromSignUp: arg.fromSignUp!,
                ));
      case payment:
        final arg = settings.arguments as PaymentArg;
        return MaterialPageRoute(
            builder: (_) => PaymentScreen(
                  url: arg.url,
                ));
      case paymentConfirm:
        return MaterialPageRoute(
            builder: (_) => const PaymentConfirmationScreen());
      case navScreen:
        return MaterialPageRoute(builder: (_) => const NavScreen());
      case serviceProvider:
        final arg = settings.arguments as ServicesBSIArg;
        return MaterialPageRoute(
            builder: (_) => ServiceProviderScreen(
                  name: arg.name!,
                  id: arg.id!,
                ));
      case serviceById:
        final arg = settings.arguments as ServiceArg;
        return MaterialPageRoute(
            builder: (_) => ServiceScreen(
                  order: arg.order,
                  idTyp: arg.idTyp!,
                  name: arg.name,
                  buttonText: arg.buttonText!,
                  routName: arg.routName!,
                  id: arg.id!,
                ));
      case fillOrder:
        final arg = settings.arguments as ServicesBSIArg;
        return MaterialPageRoute(
            maintainState: true,
            builder: (_) => FillOrderScreen(
                  serviceId: arg.id!,
                ));
      case cancellation:
        final arg = settings.arguments as ServiceArg;
        return MaterialPageRoute(
            builder: (_) => CancellationScreen(
                  id: arg.id!,
                ));
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case children:
        return MaterialPageRoute(builder: (_) => const ChildrenScreen());
      case addChildren:
        final arg = settings.arguments as UpdateArg;
        return MaterialPageRoute(
            builder: (_) => AddChildrenScreen(
                  from: arg.from,
                  aChild: arg.tableType,
                  id: arg.id,
                  action: arg.action,
                ));
      case address:
        return MaterialPageRoute(builder: (_) => const AddressScreen());
      case addAddress:
        final arg = settings.arguments as UpdateArg;
        return MaterialPageRoute(
            builder: (_) => AddAddressScreen(
                  id: arg.id,
                  action: arg.action,
                  anAddress: arg.tableType,
                  from: arg.from,
                ));
      case callUs:
        return MaterialPageRoute(builder: (_) => ContactScreen());
      case lang:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case feedBack:
        return MaterialPageRoute(builder: (_) => const FeedBackScreen());
      case aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());

      case terms:
        return MaterialPageRoute(builder: (_) => const TermsScreen());
      case fag:
        return MaterialPageRoute(builder: (_) => const FagScreen());


      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
