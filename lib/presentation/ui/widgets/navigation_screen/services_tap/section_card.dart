import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/arguments.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/presentation/ui/widgets/global/cache_image.dart';


class SectionCard extends StatelessWidget {
  const SectionCard(
      {Key? key, required this.name, required this.image, required this.id})
      : super(key: key);
  final int id;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, serviceProvider,
            arguments: ServicesBSIArg(id: id, name: name));

        context.servicesProviderF.setErrorMessage(null);
      },
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
            padding: const EdgeInsets.all(6),
            margin: EdgeInsets.only(
                bottom: context.h * 0.02,
                right: context.w * 0.04,
                left: context.w * 0.04),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.1),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: context.h * 0.12,
                  child: AspectRatio(
                    aspectRatio: 2 / 1,
                    child:CacheImage(
                        imageURL: image,
                        height: context.h ,

                        contentMode: BoxFit.fill,width: context.w, ),
                  ),
                ),
                Texts.sort(context, context.h, name)
              ],
            )),
      ),
    );
  }
}
