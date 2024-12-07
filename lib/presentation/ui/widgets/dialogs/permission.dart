import 'package:app_settings/app_settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:flutter/material.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';

class PermissionDialog extends StatefulWidget {
  const PermissionDialog({Key? key}) : super(key: key);

  @override
  State<PermissionDialog> createState() => _PermissionDialogState();
}

class _PermissionDialogState extends State<PermissionDialog> {


  @override
  Widget build(BuildContext context) {



    return Container(
      height: context.h * 0.3,
      width: context.w * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Texts.messages(context.w, AppLocalizations.of(context)!.permissionMas),
          Button(
            text: AppLocalizations.of(context)!.allow,
            w: context.w,
            h: context.h,
            onTap: () async {
              await AppSettings.openDeviceSettings();
              context.ordersProviderF.getUserLocation();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
