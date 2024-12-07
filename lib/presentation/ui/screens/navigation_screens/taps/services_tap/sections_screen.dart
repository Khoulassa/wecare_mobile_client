import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/domain/services/entities/section.dart';
import 'package:we_care/presentation/ui/widgets/global/futuer_builder.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/services_tap/section_card.dart';


class SectionsScreen extends StatefulWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  late Future future;

  @override
  void initState() {
    future = Future(() => context.servicesProviderF
        .getSectionsFuture());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///common custom layout
    return Layout(
        title: AppLocalizations.of(context)!.serviceChoose,
        child: AppFutureBuilder(
          loading:const Loading() ,
          onTap: () {

              context.servicesProviderF
                  .getSectionsFuture();

          },
          future: future,
          builder: (context, snapshot) {
            List<Section> data = snapshot.data;
            /// all sections widget
            return Container(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              width: context.w,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: context.h * 0.2,
                  ),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SectionCard(
                      name: data[index].name!,
                      image: data[index].image??"",
                      id: data[index].id!,
                    );
                  }),
            );
          },
        ));
  }
}
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      width: context.w,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: context.h * 0.2,
          ),
          itemCount:6,
          itemBuilder: (BuildContext context, int index) {
            return  Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: const SectionCard(
              name: '',
              image:"",
              id: 1,
            ));
          }),
    );
  }
}

