import 'package:flutter/material.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/arguments.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';

class ServiceSubmitButton extends StatelessWidget {
  const ServiceSubmitButton({Key? key,required this.idTyp,required this.buttonText,required this.id, this.orderId}) : super(key: key);
final IdTyp idTyp;
final String buttonText;
final int id;
final int? orderId;

  @override
  Widget build(BuildContext context) {
    return  Button(
      w: context.w,
      h: context.h,
      text: buttonText,
      onTap: () {
        context.ordersProviderF.setErrorMessage(null);
        idTyp == IdTyp.service
            ? Navigator.of(context).pushNamed(fillOrder,
            arguments: ServicesBSIArg(id: id))
            : Navigator.pushNamed(context, cancellation,
            arguments: ServiceArg(id: orderId));
      },
    );
  }
}
