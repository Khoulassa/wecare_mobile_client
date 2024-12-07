import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/domain/setting/address/entities/address.dart';
import 'package:we_care/domain/setting/children/entities/child.dart';
import 'package:we_care/more_icons.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/setting_tap/address_and_children/table/table_row.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/setting_tap/address_and_children/table/tablt_title.dart';


abstract class TableWidget<T> extends StatelessWidget {
  const TableWidget(
      {Key? key,
        required this.title,
        required this.onTap,
        required this.titles,
        required this.id,
        required this.details,
        required this.tableName,
        required this.tableType,

})
      : super(key: key);
  final String title;
  final List<T> tableType;
  final TableName tableName;
 final List<String> titles;
  final List<List<String?>> details;
 final List<int?> id;
  final Function() onTap;




  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Container(
        height: context.h,
        width: context.w,
        margin: EdgeInsets.only(
            top: context.h * 0.03,
            left: context.w * 0.01,
            right: context.w * 0.01,
            bottom: context.h * 0.15),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: context.w * 0.32),
                  width: context.w * 0.32,
                  child: AutoSizeText(
                    title,
                    presetFontSizes: const [14, 12, 10],
                    style: const TextStyle(
                      fontFamily: Assets.cairo,
                      color: UiColors.purple1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Icon(
                    More.icons8_add_1_1,
                    color: UiColors.purple1,
                    size: context.h * 0.03,
                  ),
                ),
              ],
            ),
          ),

          /// columns 0f table = titles length+1
          ColumnTitle (w: context.w, h: context.h, context: context, list: titles),
          details.isEmpty
              ?  Center(child: Text(context.lang!.noData),)
              : SizedBox(
            height: context.h * 0.7,
            /// table rows = details length
            child: ListView.builder(
                itemCount: details.length,
                itemBuilder: (context, index) =>

                    TableRows(
                        w: context.w,
                        h: context.h,
                        context: context,
                        color: index.isEven ? UiColors.purple3 : Colors.white,
                        texts: details[index],
                        onEdit: () {
                         edit(
                              id: id[index]!,
                              context: context,
                              tableType: tableType[index],
                              name: tableName,
                            );
                        },
                        onRemove: () async {
                          await delete(
                              id: id[index]!,
                              context: context,
                              name: tableName);
                        })),
          )
        ]),
      ),
    );
  }
}

class ChildrenTable extends TableWidget<AChild> {
  const ChildrenTable({super.key, required super.title, required super.onTap, required super.titles, required super.id, required super.details, required super.tableName, required super.tableType});


}
class AddressTable extends TableWidget<Address> {
  const AddressTable({super.key, required super.title, required super.onTap, required super.titles, required super.id, required super.details, required super.tableName, required super.tableType});

}
