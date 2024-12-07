

import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/filters.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(
          vertical: context.h * 0.005,
          horizontal: context.w * 0.03),
      height: context.h * 0.05,
      child: TextFormField(
        textDirection: context.preferenceProviderF.lang == "en"
            ? TextDirection.ltr
            : TextDirection.rtl,
        controller: TextEditingController.fromValue(
            TextEditingValue(
                text: context.formsProviderF.nameController.text,
                selection: TextSelection.collapsed(
                    offset: context.formsProviderF.nameController
                        .text.length))),
        cursorColor: Colors.black12,
        onChanged: (v) async{

          context.formsProviderF.setNameController(v);
          context.ordersProviderF.setTerm(v);
         int len =context.ordersProviderF.searchLength;
          if( context.ordersProviderF.orders.length<10 || len < v.length){
            context.ordersProviderF.setSearchLength(v.length);
            filterOrder(v, context);

          }else{
            context.ordersProviderF.setSearchLength(v.length);
           await context.ordersProviderF.reSetPagination(context, v);

          }

          // from helper file

        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search_rounded,
              color: UiColors.purple2),
          hintText: context.lang!.search,
          hintStyle: const TextStyle(
              height: 4,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: Assets.cairo,
              color: UiColors.purple2),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
