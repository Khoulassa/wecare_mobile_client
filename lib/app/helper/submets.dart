import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/arguments.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/data/setting/contact/models/contact_request.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/domain/setting/address/entities/address.dart';
import 'package:we_care/presentation/providers/profile_provider.dart';
import 'package:we_care/presentation/providers/setting/children_provider.dart';
import 'package:we_care/presentation/providers/setting/contact_provider.dart';
import 'package:we_care/presentation/ui/widgets/dialogs/alart_daialog/custom_alert_dialog.dart';
import 'package:we_care/presentation/ui/widgets/dialogs/pup_up/Notification_pup.dart';
import 'package:we_care/presentation/ui/widgets/dialogs/pup_up/pup.dart';
import 'package:we_care/presentation/ui/widgets/dialogs/pup_up/pup_up.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/ratedialog.dart';

///========================================authFunctions==================================///
void logInSubmit(GlobalKey<FormState> formKey, BuildContext context) async {
  if (formKey.currentState!.validate()) {
    context.authProviderF.setState(States.loading);
    await context.authProviderF.signIn();
    if (!context.mounted) return;
    if (context.authProviderF.state == States.loaded) {
     await context.addressProviderF.getAddresses();
     if (!context.mounted) return;
      await context.childrenProviderF.getChildren();
     if (!context.mounted) return;
      await context.profileProviderF.getProfile();
     if (!context.mounted) return;
      context.navigator.pushReplacementNamed(navScreen);
      context.homeProviderF.setNavPage(0);
      context.preferenceProviderF.checkAuth();
      context.formsProviderF.resetControllers();
      context.authProviderF.resetErrorMessage();
      context.authProviderF.setState(States.initial);
    }
  }
}

void logUpSubmit(GlobalKey<FormState> formKey, BuildContext context) async {
  if (formKey.currentState!.validate()) {
    context.authProviderF.setState(States.loading);
    await context.authProviderF.signUps();
    if (!context.mounted) return;
    if (context.authProviderF.state == States.loaded) {
      context.navigator.pushReplacementNamed(verifyCode,
          arguments: CodeArg(context.lang!.codeMessage, true));

      context.formsProviderF.resetControllers();
      context.authProviderF.setState(States.initial);

    }
  }
}

void updateProfileSubmit(
  BuildContext context,
  user,
) async {
  show() => PupUpDialog.showDataAlert(context,
      PupDialog(text: context.lang!.updateProfileMessage, routName: ""));
  context.profileProviderF.setUser(user);
  context.profileProviderF.setState(ProfileState.loading);
  await context.profileProviderF.updateProfile();
  if (!context.mounted) return;
  if (context.profileProviderF.state == ProfileState.loaded) {
    show();
    context.formsProviderF.resetControllers();
    context.profileProviderF.setState(ProfileState.initial);
    context.profileProviderF.setReadOnly(true);
  }
}

void chickCodeSubmit(
    BuildContext context, GlobalKey<FormState> formKey, String code) async {
  final navigator = Navigator.of(context);
  if (formKey.currentState!.validate()) {
    bool result = await context.authProviderF.chickCode(code);

    if (result) {
      navigator.pushReplacementNamed(resetpass);
      if (!context.mounted) return;
      context.formsProviderF.resetControllers();
    }
  }
}

void signUpCodeSubmit(
    BuildContext context, GlobalKey<FormState> formKey, code) async {
  if (formKey.currentState!.validate()) {
    context.authProviderF.setState(States.loading);
    await context.authProviderF.checkSignUpCode(code);
    if (!context.mounted) return;
    if (context.authProviderF.state == States.loaded) {
      context.navigator.pushNamedAndRemoveUntil(signIn,arguments: SinInArg(fromOnBoarding: false), (rout) => false);
      context.authProviderF.setState(States.initial);
      context.formsProviderF.resetControllers();
      context.authProviderF.resetErrorMessage();
    }
  }
}

void resetPassSubmit(BuildContext context, GlobalKey<FormState> formKey) async {
  if (formKey.currentState!.validate()) {
    bool result = await context.authProviderF.restPass();

    if (result) {
      if (!context.mounted) return;
      context.navigator.pushReplacementNamed(signIn,arguments: SinInArg(fromOnBoarding: false));
      context.formsProviderF.resetControllers();
      context.authProviderF.resetErrorMessage();
    }
  }
}

void forgetPassSubmit(
    BuildContext context, GlobalKey<FormState> formKey) async {
  if (formKey.currentState!.validate()) {
    bool result = await context.authProviderF.forgetPass();

    if (result) {
      if (!context.mounted) return;
      context.navigator.pushReplacementNamed(verifyCode,
          arguments: CodeArg(context.lang!.code2Message, false));
      context.formsProviderF.resetControllers();
      context.authProviderF.resetErrorMessage();
    }
  }
}

void logOutSubmit(BuildContext context) async {

  bool result = await context.authProviderF.logOut();


  if (result) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AppConstants.keyAccessToken);
    if (!context.mounted) return;
    context.navigator.pushReplacementNamed(signIn,arguments: SinInArg(fromOnBoarding: false));
    context.formsProviderF.resetControllers();
    context.ordersProviderF.clearOrderProvider();
    context.servicesProviderF.clearFavorites();
  }
}
void deactivateSubmit(BuildContext context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AppConstants.keyAccessToken);
    if (!context.mounted) return;
    context.navigator.pushReplacementNamed(signIn,arguments: SinInArg(fromOnBoarding: false));
    context.formsProviderF.resetControllers();
    context.ordersProviderF.clearOrderProvider();
    context.servicesProviderF.clearFavorites();

}
askToAuthentication(BuildContext context) {
  CustomAlertDialog(Theme.of(context).platform).showAlert(
    context: context,
    content: " ${context.lang!.askToSignIn}",
    text1: context.lang!.signIn,
    text2: context.lang!.later,
    onPress1: () {
      Navigator.pushNamed(context, signIn,arguments: SinInArg(fromOnBoarding: true) );
    },
    onPress2: () {
      Navigator.pop(context);
    },
  );
}

///=====================================address and child function ==============================///

String getAddTableRowRout(TableName name) {
  switch (name) {
    case TableName.children:
      return addChildren;
    case TableName.address:
      return addAddress;
  }
}

// delete address or child
edit({
  required int id,
  required BuildContext context,
  tableType,
  required TableName name,
}) {
  String rout = getAddTableRowRout(name);
  Navigator.pushNamed(context, rout,
      arguments:
          UpdateArg(tableType: tableType, id: id, action: ActionTyp.edit));
}

delete(
    {required int id,
    required BuildContext context,
    required TableName name,
    setState}) async {
  CustomAlertDialog(Theme.of(context).platform).showAlert(
    context: context,
    content: " ${context.lang!.deleteChild}",
    text1: context.lang!.delete,
    text2: context.lang!.cancel,
    onPress1: () async {

      bool result;
      if(name == TableName.children){result = await context.childrenProviderF.removeChild(id);
      }else{
        result =   await context.addressProviderF.removeAddress(context.preferenceProviderF.lang, id);
      }


      if (result) {
        if (!context.mounted) return;
        name == TableName.children
            ? await context.childrenProviderF.getFuture()
            : await context.addressProviderF.getFuture();
        if (!context.mounted) return;
        context.navigator.pop();
      }
    },
    onPress2: () async {
      Navigator.pop(context);
    },
  );
}

//add address===========================================================
void addressSubmit(GlobalKey<FormState> formKey, Address anAddress,
    BuildContext context, ActionTyp action, FromScreen from) async {
  if (formKey.currentState!.validate()) {
    bool? result;
    if (action == ActionTyp.edit) {
      result = await context.addressProviderF.updateAddress(anAddress);
    } else {
      result = await context.addressProviderF.addAddresses(anAddress);
    }

    if (result) {
      if (!context.mounted) return;
      show(
          text: context.lang!.addAddressSuccessfully,
          routName: from == FromScreen.main ? address : fillOrder,
          context: context);

      context.addressProviderF.getFuture();
      context.addressProviderF.setState(States.initial);
      context.addressProviderF.getAddresses();
    } else {
      if (!context.mounted) return;
      showSnack(context: context);
      context.addressProviderF.setState(States.initial);
    }
    context.formsProviderF.resetControllers();
  }
}

//add child =================================================================
void childSubmit(GlobalKey<FormState> formKey, BuildContext context, action,
    child, FromScreen from) async {
  if (formKey.currentState!.validate()) {
    context.childrenProviderF.setChild(child);
    context.childrenProviderF.setState(ChildFormState.loading);
    if (action == ActionTyp.edit) {


      bool result = await context.childrenProviderF.updateChild();

      if (result) {
        if (!context.mounted) return;
        show(

            text: context.lang!.updateChildSuccessfully,
            routName: from == FromScreen.main ? children : fillOrder,
            context: context);
  if (!context.mounted) return;
        context.childrenProviderF.getFuture();
        context.childrenProviderF.setState(ChildFormState.initial);
      } else {
  if (!context.mounted) return;
        showSnack(context: context);
        context.childrenProviderF.setState(ChildFormState.initial);
      }
    } else {
      bool result = await context.childrenProviderF.addChild();
      if (result) {
      if (!context.mounted) return;
        show(

            text: context.lang!.addChildSuccessfully,
            routName: children,
            context: context);

        context.childrenProviderF.getFuture();
        context.childrenProviderF.getChildren();

        context.childrenProviderF.setState(ChildFormState.initial);
      } else {
  if (!context.mounted) return;
        showSnack(context: context);
        context.childrenProviderF.setState(ChildFormState.initial);
      }
    }

    context.childrenProviderF.resetChild();
    context.formsProviderF.resetControllers();
  }
}

///==================================orders functions ==========================================///

orderCancellation(
    GlobalKey<FormState> formKey, id, BuildContext context, reason) async {
  if (formKey.currentState!.validate()) {
    bool result = await context.ordersProviderF.orderCancellation(id, reason);
    if (result) {
      if (!context.mounted) return;
      context.ordersProviderF.clearOrderProvider();
      context.formsProviderF.resetControllers();
      await context.ordersProviderF.getOrders(context: context);
      if (!context.mounted) return;
      show(

          text: context.lang!.cancelOrderMessage,
          routName: "",
          context: context);
    } else {
      showSnack(context: context);
    }
  }
}

setOrder(
  GlobalKey<FormState> formKey,
  BuildContext context,
    Order order
) async {

  bool result = await context.ordersProviderF.setOrder(order: order);

  if (result) {
    if (!context.mounted) return;
    show(text: context.lang!.sendOrderMessage, routName: "", context: context);
    
    context.formsProviderF.resetControllers();
    context.ordersProviderF.setErrorMessage(null);
    context.ordersProviderF.setIsChecked(false);
    context.ordersProviderF.getOrders(context: context);
  }
}

void sendUserRate(int orderId, BuildContext context) async {
  bool result = await context.ordersProviderF.setUserRate(orderId.toString());
  if (result) {
    if (!context.mounted) return;
    context.navigator.pop();
  } else {
    if (!context.mounted) return;
    showSnack(context: context);
    context.ordersProviderF.clearOrderProvider();
  }
}

getTax(BuildContext context, GlobalKey<FormState> formKey,Order order) async {
  if (formKey.currentState!.validate()) {
    bool result = await context.ordersProviderF.getTaxAndTotal(order);
    if (result) {
      if (!context.mounted) return;
      context.ordersProviderF.setIsChecked(true);
    }
  }
}

void orderNavigation(BuildContext context, Order order) async {
  var nav= context.navigator;
   show() {showSnack(context: context);}
  var check=checkOrder(order: order, context: context);


  bool result = await context.ordersProviderF.getOrderDetails(order.id);

  if (result) {
    Map<String, dynamic> rout = await check;
    nav.pushNamed(rout["routName"], arguments: rout["argument"]);
  } else {
    show;
    if (!context.mounted) return;
    context.ordersProviderF.setCardLoading(false);
  }

}

Future<Map<String, dynamic>> checkOrder(
    {required Order order, required BuildContext context}) async {
  late String routName;
  Object? arguments;

  switch (order.status) {
    case AppConstants.currentOrderEn:

      if (!order.isPayed!) {
        
        bool? result1 =
            await context.ordersProviderF.payment(order.id);

        if (result1) {

          routName = paymentConfirm;
          arguments = null;

          context.ordersProviderF.setCardLoading(false);
        } else {

          showSnack(context: context);
          context.ordersProviderF.setCardLoading(false);
        }
      } else {
        routName = serviceById;

        arguments = ServiceArg(
            order: context.ordersProviderF.order,
            idTyp: IdTyp.order,
            id: order.id,
            buttonText: context.lang!.cancellation,
            routName: cancellation);
        context.ordersProviderF.setCardLoading(false);
      }

      break;

    case AppConstants.currentOrderAr:

      if (!order.isPayed!) {

        bool? result1 =
            await context.ordersProviderF.payment(order.id);
        if (result1) {
          routName = paymentConfirm;
          arguments = null;

          context.ordersProviderF.setCardLoading(false);
        } else {
          showSnack(context: context);
          context.ordersProviderF.setCardLoading(false);
        }
      } else {
        routName = serviceById;
        arguments = ServiceArg(

            idTyp: IdTyp.order,
            id: order.id,
            buttonText: context.lang!.cancellation,
            routName: cancellation);
        context.ordersProviderF.setCardLoading(false);
      }
      break;

    case AppConstants.completedOrderEn:
      routName = orderDetails;
      arguments = OrderDetailsArg(orderType: OrderType.completed);
      context.ordersProviderF.setCardLoading(false);
      break;

    case AppConstants.completedOrderAr:
      routName = orderDetails;
      arguments = OrderDetailsArg(orderType: OrderType.completed);
      context.ordersProviderF.setCardLoading(false);
      break;

    case AppConstants.canceledOrderEn:
      routName = orderDetails;
      arguments = OrderDetailsArg(orderType: OrderType.cancelled);
      context.ordersProviderF.setCardLoading(false);
      break;
    case AppConstants.canceledOrderAr:
      routName = orderDetails;
      arguments = OrderDetailsArg(orderType: OrderType.cancelled);
      context.ordersProviderF.setCardLoading(false);
      break;

    case AppConstants.rejectedOrderEn:
      routName = orderDetails;
      arguments = OrderDetailsArg(orderType: OrderType.rejected);
      context.ordersProviderF.setCardLoading(false);
      break;

    case AppConstants.rejectedOrderAr:
      routName = orderDetails;
      arguments = OrderDetailsArg(orderType: OrderType.rejected);
      context.ordersProviderF.setCardLoading(false);
      break;
    case AppConstants.waitingOrderEn:
      routName = paymentConfirm;
      arguments = OrderDetailsArg(orderType: OrderType.rejected);
      context.ordersProviderF.setCardLoading(false);
      break;
    case AppConstants.waitingOrderAr:
      routName = paymentConfirm;
      arguments = OrderDetailsArg(orderType: OrderType.rejected);
      context.ordersProviderF.setCardLoading(false);
  }

  return {"routName": routName, "argument": arguments};
}

checkCoupon(BuildContext context, coupon) async {
  await context.ordersProviderF.checkCoupon(coupon);
}


Future<void> orderPayment(BuildContext context,id)async{
var result=  await context.ordersProviderF.payment(id);
if(result){
  if (!context.mounted) return;
  Navigator.pushNamed(context, payment,
      arguments: PaymentArg(
          context.ordersProviderF.taxAndTotal!.paymentUrl??""));
}else{
  if (!context.mounted) return;
  show(

       text:context.ordersProviderF.errorMessage!, routName: '', context: context );
}
}

///=======count available ours=======///
int countHours(int index, int list) {
  int hours = list - index;
  return hours;
}

List<String> hoursList(int length, BuildContext context) {
  List<String> hours = [];
  for (var i = 1; i < length + 1; ++i) {
    hours.add("${i.toString()} ${context.lang!.hour}");
  }
  return hours;
}

///============================== contact functions====================================///
void contactMessageSubmit(BuildContext context, GlobalKey<FormState> formKey,
    ContactRequest contact) async {
  if (formKey.currentState!.validate()) {
    context.contactProviderF.setContactRequest(contact);

    bool request = await context.contactProviderF.setContact();

    if (request) {
      if (!context.mounted) return;
      show(
          text: context.lang!.sendMessageSuccessfully,
          routName: "",
          context: context);
    } else {
      showSnack(context: context);
    }
    if (!context.mounted) return;
    context.formsProviderF.resetControllers();
    context.contactProviderF.resetContactRequest();
    context.contactProviderF.setState(ContactState.initial);
  }
}

///=================================Notifications Functions ==================================///
void readNotifications(BuildContext context, RemoteMessage message) {
  var id = message.data["type_id"];
  var body = message.data["body"];
  context.notificationProviderF.decrease();
  getNotification(context: context, type: message.data["type"], id: id, body: body );
}

void getNotification(
    {required BuildContext context, required String type, required id,required body}) {
  switch (type) {
    case AppConstants.fireTypAccepted:
      PupUpDialog.showDataAlert(
          context,
          NotificationPup(
            buttonText: context.lang!.pay,
            text: body,
            onTap: () async {
              bool result = await context.ordersProviderF.payment(id);
              if (!context.mounted) return;
              if (result) {
                bool result2 =
                    await context.ordersProviderF.getOrderDetails(id);
                if (result2) {
                  if (!context.mounted) return;
                  context.navigator.pushReplacementNamed(paymentConfirm);
                }
              }
            },
          ));
      break;
    case AppConstants.fireTypRejected:
      PupUpDialog.showDataAlert(
          context,
          NotificationPup(
            text: body,
            onTap: () async {
              bool result = await context.ordersProviderF.getOrderDetails(id);
              if (!result) {
                if (!context.mounted) return;
                context.navigator.pushReplacementNamed(orderDetails);
              }
            },
          ));
      break;
    case AppConstants.fireTypeCompleted:
      PupUpDialog.showDataAlert(
          context,
          NotificationPup(
            buttonText: context.lang!.rateButton,
            text: body,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                        insetPadding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        child:  DialogBox(id: id,),
                      ));
            },
          ));
      break;
    case AppConstants.fireTypeCanceled:
      PupUpDialog.showDataAlert(
          context,
          NotificationPup(
            text:body,
            onTap: () {
              context.navigator.popAndPushNamed(orderDetails);
            },
          ));
      break;
    default:
      context.navigator.pushNamed(notification);
      break;
  }
}

///____________________general functions _______________________///

void show(
    {required String text,
    required String routName,
    required BuildContext context}) {
  PupUpDialog.showDataAlert(context, PupDialog(text: text, routName: routName));
}

void showSnack({required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 200),
      content: Text(context.lang!.errorMessage)));
}
