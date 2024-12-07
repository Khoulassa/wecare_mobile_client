import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/data/others/models/notification.dart';
import 'package:we_care/domain/other/entities/notification.dart';
import 'package:we_care/presentation/providers/provider_list/providers_export.dart';
import 'package:we_care/presentation/ui/widgets/dialogs/pup_up/pup_up.dart';
import 'package:we_care/presentation/ui/widgets/dialogs/pup_up/show_notification.dart';
import 'package:we_care/presentation/ui/widgets/global/futuer_builder.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/notifications/notification_card.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Future future;
  @override
  void initState() {
    NotificationProvider provider=NotificationProvider();

    provider.clear();
    future = Future(() => context.notificationProviderF
        .getNotificationFuture());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Layout(
      action: InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();},),
        title: context.lang!.notifications,
        child: AppFutureBuilder(
          future: future,
          onTap: () {
            setState(() {
              context.notificationProviderF
                  .getNotificationFuture();
            });
          },
          builder: (context, snapshot) {
            List<ANotification> notifications = snapshot.data;
            return notifications.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) => NotificationCard(
                      title: notifications[index].title ?? "",
                      body: notifications[index].body ?? "",
                      date: notifications[index].date ?? "",
                      onTap: () {
                        PupUpDialog.showDataAlert(
                            context,
                            ShowNotification(
                              title: notifications[index].title ?? "",
                              body: notifications[index].body ?? "",
                            ));
                      },
                    ),
                    itemCount: notifications.length,
                  )
                : Center(
                    child: Text(context.lang!.noResult),
                  );
          },
        ));
  }
}
