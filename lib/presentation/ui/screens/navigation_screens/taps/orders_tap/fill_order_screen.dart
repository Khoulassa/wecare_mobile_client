import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/style/colors.dart';

import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';

import 'package:we_care/app/rout/arguments.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/more_icons.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';

import 'package:we_care/presentation/ui/widgets/global/rows_and_columns.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/orders_screen_widget/fill_order_screen_widgets/dropdown_widgets.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/orders_screen_widget/fill_order_screen_widgets/periods_radio%20_row.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/orders_screen_widget/fill_order_screen_widgets/comment_text_field.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/orders_screen_widget/fill_order_screen_widgets/coupon_row.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/orders_screen_widget/fill_order_screen_widgets/errors_texests.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/orders_screen_widget/fill_order_screen_widgets/terms_row.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/orders_screen_widget/fill_order_screen_widgets/submet_button.dart';


class FillOrderScreen extends StatelessWidget {
  const FillOrderScreen({Key? key, required this.serviceId}) : super(key: key);
  static final forKey = GlobalKey<FormState>();
  final int serviceId;

  @override
  Widget build(BuildContext context) {




    return WillPopScope(
      onWillPop: () async {
        onWillPopDone( context);
        return true;
      },
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Layout(
            action:
            InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();},),
          title: AppLocalizations.of(context)!.fillInfo,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  right: 12, left: 12, bottom: context.h * 0.2, top: 15),
              child: Form(
                key: forKey,
                child: Column(
                  children: [

                    /// Custom Drop Down Button for choose address
                   const AddressDropdown(),
                    Components.buildRow(
                        onTap: () {
                          Navigator.pushNamed(context, addAddress,
                              arguments: UpdateArg(
                                  action: ActionTyp.add, from: FromScreen.order));
                        },
                        h: context.h,
                        text: AppLocalizations.of(context)!.addAddress,
                        icon: More.icons8_add_1_1,
                        siz: context.h * 0.025,
                        tSiz: context.h * 0.02),

                    /// common custom Text Field for choose children
                    const ChildrenDropdown(),

                    /// button to add new child
                    Components.buildRow(
                        onTap: () {
                          Navigator.pushNamed(context, addChildren,
                              arguments: UpdateArg(
                                  action: ActionTyp.add, from: FromScreen.order));
                        },
                        h: context.h,
                        text: AppLocalizations.of(context)!.addChild,
                        icon: More.icons8_add_1_1,
                        siz: context.h * 0.025,
                        tSiz: context.h * 0.02),

                    /// common custom Text Field for choose date
                    const DateDropdown(),
                    const PeriodsRow(),

                    /// common  Custom Drop Down Button for choose time
                    const TimeDropdown(),

                    /// common  Custom Drop Down Button for choose hours
                    const HoursDropdown(),

                    /// common   Comment And Description Field for add comment
                    const CommentTextField(),
                    const Divider(color: Colors.black),
                    const CouponRow(),
                    const OrderErrorMessage(),
                    const CouponErrorMessage(),
                    const PointsField(),

                    const Divider(color: Colors.black),
                    /// Tax And Total container widget
                    const TaxAndTotals(),

                    /// terms and conditions  chick box
                    const TermsRow(),
                    const ErrorMessage(),

                    /// custom button  for sent order
                    SubmitButton(serviceId: serviceId,formKey: forKey,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


void onWillPopDone(BuildContext context){
  context.formsProviderF.resetControllers();
  context.ordersProviderF.clearProvider();
}