import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';


class DialogBox extends StatelessWidget {
  const DialogBox({Key? key, this.id, this.serviceId }) : super(key: key);
final int? id;
final int? serviceId;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h * 0.5,
      width: context.w,
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
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5,
                      (index) => InkWell(
                      onTap: () {

                        context.ordersProviderF.setRate(index);

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(
                          Icons.star,
                          color: index < context.ordersProvider.rate ? Colors.amber : Colors.grey,
                          size: context.h * 0.035,
                        ),
                      )))),
          Texts.messages(context.w, AppLocalizations.of(context)!.rateMessage),

          
          // SizedBox(
          //   width: context.w * 0.95,
          //   height: context.h * 0.15,
          //   child: TextFormField(
          //       onChanged: (v){
          //         context.ordersProviderF.setPreview(v);
          //       },
          //       cursorColor: Colors.black,
          //       maxLines: 4,
          //       decoration: InputDecoration(
          //         hintText: AppLocalizations.of(context)!.writeReview,
          //         focusedBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(6.0),
          //           borderSide: const BorderSide(color: UiColors.purple1),
          //         ),
          //         enabledBorder: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(6.0),
          //             borderSide: const BorderSide(color: UiColors.purple1)),
          //       )),
          // ),
          GestureDetector(
              onTap: () async{
                context.servicesProviderF.serviceRequest.orderId=id.toString();
                context.servicesProviderF.serviceRequest.rate=context.ordersProviderF.rate.toString();
                context.servicesProviderF.serviceRequest.serviceId=serviceId.toString();
             bool result= await  context.servicesProviderF.setServiceRate( context);
             if(result){
               Navigator.pop(context);
               show(text: context.lang!.rateServiceMessage, routName: "", context: context);
               context.servicesProviderF.setErrorMessage(null);

               context.ordersProviderF.clearOrderProvider();
             }else{
               Navigator.pop(context);
               show(text:context.servicesProviderF.errorMessage??"", routName: "", context: context);
               context.servicesProviderF.setErrorMessage(null);
               context.ordersProviderF.clearOrderProvider();
             }
              },
              child: Container(
                  width: context.w * 0.4,
                  height: context.h * 0.06,
                  decoration: BoxDecoration(
                    color: UiColors.purple1,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.09),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset:
                        const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  margin: EdgeInsets.only(bottom: context.h * 0.02),
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.rateButton,
                        style: TextStyle(
                            fontFamily: Assets.cairo,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: context.h * 0.02)),
                  )))
        ],
      ),
    );
  }


}

// bottom part
// top part
