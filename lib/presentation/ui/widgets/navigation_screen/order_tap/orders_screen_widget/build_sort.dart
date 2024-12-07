import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/presentation/ui/widgets/global/rows_and_columns.dart';

class BuildFilter extends StatelessWidget {
  const BuildFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Components.buildFilter(
        context, context.h, context.ordersProvider.isFilter, () {
      context.ordersProviderF.setFilter();
    });
  }
}