import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/filters.dart';
import 'package:we_care/domain/services/entities/service.dart';
import 'package:we_care/presentation/ui/widgets/global/futuer_builder.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/global/rows_and_columns.dart';
import 'package:we_care/presentation/ui/widgets/global/services_card.dart';



class ServiceProviderScreen extends StatefulWidget {
  const ServiceProviderScreen({Key? key, required this.id, required this.name})
      : super(key: key);
  final int id;
  final String name;

  @override
  State<ServiceProviderScreen> createState() => _ServiceProviderScreenState();
}

class _ServiceProviderScreenState extends State<ServiceProviderScreen> {


  @override
  void initState() {
   Future(() => context.servicesProviderF.getServicesFuture(
        widget.id, context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// filter types
    List filter = [
      {"filter": AppLocalizations.of(context)!.all, "apiFilter": null},
      {
        "filter": AppLocalizations.of(context)!.fromHighToLow,
        "apiFilter": "high_low"
      },
      {
        "filter": AppLocalizations.of(context)!.fromLowToHigh,
        "apiFilter": "low_high"
      },
      {
        "filter": AppLocalizations.of(context)!.highest,
        "apiFilter": "most_rated"
      }
    ];

/// common custom layout
    return Layout(
        action: InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();},),
        title: AppLocalizations.of(context)!.serviceProvider,
        child: AppFutureBuilder(
          onTap: () {
            onTaps(context: context, id:widget. id);

          },
          future: getFuture( context,  widget.id),
          builder: (context, snapshot) {
            List<ServiceM> data = getData( context, snapshot);

            return Column(
              children: [
                /// service searching text field
                SearchBar(id: widget.id,),
                FilterText(isNotEmpty: data.isNotEmpty,),
                Expanded(
                    flex: 14,
                    /// services amd filter views  stack
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Texts.titles(context, context.h, widget.name),
                            Expanded(
                              flex: 12,
                              child: data.isEmpty||context.servicesProvider.errorMessage!=null

                                  ? Center(
                                      child: Text(context.lang!.noData),
                                    )
                                  : ServiceList (data: data,),
                            ),
                          ],
                        ),
                        /// filter  view
                        FilterView(id: widget.id, filter:filter,)
                      ],
                    ))
              ],
            );
          },
        ));
  }
}
 class SearchBar extends StatelessWidget {
   const SearchBar({Key? key,required this.id}) : super(key: key);
 final int id;
   @override
   Widget build(BuildContext context) {
     return Container(
       margin: EdgeInsets.symmetric(
           vertical: context.h * 0.01, horizontal: context.w * 0.03),
       height: context.h * 0.06,
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
           context.servicesProviderF.setTerm(v);
           int len =context.servicesProviderF.searchLength;
           if( context.servicesProvider.services.length<10 || len < v.length){
             context.servicesProviderF.setSearchLength(v.length);
             filterSearch(v, context, context.servicesProviderF.servicesFuture!,
                 context.preferenceProviderF.lang,id);

           }else{
             context.servicesProviderF.setSearchLength(v.length);
             context
                 .servicesProviderF
                 .getServicesFuture(

                 id,
                 context);
             context.servicesProviderF.setErrorMessage(null);

           }




         },
         keyboardType: TextInputType.text,
         decoration: InputDecoration(
           prefixIcon: const Icon(Icons.search_rounded,
               color: UiColors.purple2),
           hintText: AppLocalizations.of(context)!.search,
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
 class  FilterText extends StatelessWidget {
   const  FilterText({Key? key,required this.isNotEmpty}) : super(key: key);
 final bool isNotEmpty;
   @override
   Widget build(BuildContext context) {
     return  Components.buildFilter(
         context, context.h, context.servicesProvider.isFilter, () {
       isNotEmpty
           ? context.servicesProviderF.setFilterState()
           : null;
     });
   }
 }

 class ServiceList extends StatelessWidget {
   const ServiceList({Key? key,required this.data}) : super(key: key);
 final List<ServiceM> data;
   @override
   Widget build(BuildContext context) {
     return ListView.builder(
         itemCount: data.length,
         itemBuilder: (BuildContext context,
             int index) =>
             ServicesCard(
               favorite: data[index].isFave,
               location: data[index].city!.name,
               section: data[index].name,
               id: data[index].id,
               image: data[index].image,
               name: data[index].providerName,
               rate: data[index].rate,
               price: data[index].price,
               description: context
                   .preferenceProviderF
                   .lang ==
                   "ar"
                   ? data[index].descriptionAr
                   : data[index].descriptionEn,
             ));
   }
 }

 class FilterType extends StatelessWidget {
   const FilterType({Key? key,required this.index,required this.filter,required this.id}) : super(key: key);
  final int index;
  final List filter;
  final int id;
   @override
   Widget build(BuildContext context) {

     return InkWell(
       onTap: () async {
         context.servicesProviderF
             .setFilter(filter[
         index]
         ["apiFilter"]);
         context.servicesProviderF
             .setFilterState();
         context.servicesProviderF
             .setFiltering(
             index == 0
                 ? false
                 : true);
         context
             .servicesProviderF
             .getServicesFuture(

            id,
             context);

       },
       child: Texts.sort(
           context,
           context.h,
           filter[index]
           ["filter"]),
     );
   }
 }
 class FilterView extends StatelessWidget {
   const FilterView({Key? key,required this.id,required this.filter}) : super(key: key);
 final List filter;
 final int id;
   @override
   Widget build(BuildContext context) {
     return  context.servicesProvider.isFilter

         ? InkWell(
       onTap: () {
         context.servicesProviderF.setFilterState();
       },
       child: SizedBox(
         child: Column(
           children: [
             Expanded(
                 flex: 1,
                 child: Container(
                   padding: const EdgeInsets.symmetric(
                       horizontal: 8, vertical: 8),
                   width: context.w,
                   color: const Color(0xFFfafafa),
                   child: Column(
                       crossAxisAlignment:
                       CrossAxisAlignment.start,
                       mainAxisAlignment:
                       MainAxisAlignment
                           .spaceEvenly,
                       children: List.generate(
                         filter.length,
                             (index) => FilterType(index: index, filter:filter, id: id,),
                       )),
                 )),
             Expanded(
                 flex: 3,
                 child: Container(
                   width: context.w,
                   color:
                   Colors.black.withOpacity(0.5),
                 )),
           ],
         ),
       ),
     )
         : const SizedBox();
   }
 }


 /// ========= screen functions ===========///
 void onTaps({required BuildContext context, required int id}){
   context.servicesProviderF.setFiltering(false);
   context.servicesProviderF.getServicesFuture(
       id, context);
 }

 List<ServiceM> getData(BuildContext context,AsyncSnapshot snapshot){
   List<ServiceM> data = context.servicesProviderF.fromSearch
       ? context.servicesProviderF.services
       : snapshot.data ?? [];
   return data;
 }
 Future getFuture(BuildContext context, int id){
  var future=context.servicesProvider.servicesFuture??context.servicesProviderF.getServicesBSI(  id);
  return future;
 }