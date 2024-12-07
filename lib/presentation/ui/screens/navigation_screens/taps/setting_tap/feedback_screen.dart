import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/domain/setting/faqandfeedback/entitie/faq.dart';
import 'package:we_care/presentation/ui/widgets/dialogs/pup_up/pup.dart';
import 'package:we_care/presentation/ui/widgets/dialogs/pup_up/pup_up.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:we_care/presentation/ui/widgets/global/comment_description_field.dart';
import 'package:we_care/presentation/ui/widgets/global/futuer_builder.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';



class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  void initState() {
    Future(() => context.feedProviderF.getFuture());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('---------------------');
    ///common custom layout
    return Layout(

      action:
      InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();
      reset(context);},),
      title: context.lang!.feedBack,
      child: SingleChildScrollView(
        child: Container(
          height: context.h,
          width: context.w,
          padding: EdgeInsets.symmetric(
              horizontal: context.w * 0.03, vertical: context.h * 0.01),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Texts.messages(
                      context.w, context.lang!.feedTitle)),
              SizedBox(
                width: context.w,

                /// feed back options
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      4,
                      (index) =>  FeeBackOptions(index: index,)),
                ),
              ),
              AppFutureBuilder(
                  onTap: () {
                    setFuture(context);
                  },
                  future: getFutures(context),
                  builder: (
                    context,
                    snapShot,
                  ) {
                    List<FAQs> data = snapShot.data ?? [];

                    /// feed back questions from server and it's options
                    return Column(
                      children: List.generate(
                          data.length,
                          (ind) => SizedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ///question
                                    Text(data[ind].question!),
                                    SizedBox(
                                      width: context.w,

                                      /// options
                                      child: Options(ind: ind,),
                                    )
                                  ],
                                ),
                              )),
                    );
                  }),

              /// feed back comment text field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.lang!.addComment,
                    style: TextStyle(
                        fontFamily: Assets.cairo,
                        fontSize: context.h * 0.015,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: context.w * 0.95,
                    height: context.h * 0.15,
                    ///comment field
                    child:  const Comment(),
                  ),
                ],
              ),

              /// send feed back button
              const Center(
                  child: SendFeedButton ())
            ],
          ),
        ),
      ),
    );
  }
}

///============screen widgets ==============//

/// feed back options
class FeeBackOptions extends StatelessWidget {
  const FeeBackOptions({Key? key,required this.index}) : super(key: key);
final int index;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.vertical,
      children: [
        Icon(context.feedProviderF.faces(context)[index]
        ["icon"]),
        Text(context.feedProviderF.faces(context)[index]
        ["title"])
      ],
    );
  }
}

/// options
class Options extends StatelessWidget {
  const Options({Key? key,required this.ind}) : super(key: key);
final int ind;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,
        children: List.generate(
          context.feedProviderF.rate.length,
              (index) => Radio<String>(
              activeColor: UiColors.purple1,
              value: context
                  .feedProviderF.rate[index],
             groupValue:
              context
                   .feedProvider.qRate[ind],
              onChanged: (v) {
                context.feedProviderF
                    .setRate(ind, index);
              }),
        ));
  }
}

///comment field
class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CommentAndDescriptionField(
      label: '',
      onChange: (v) {
        context.formsProviderF.setStatusController(v);
      },
    );
  }
}

/// send Feed button
class SendFeedButton  extends StatelessWidget {
  const SendFeedButton ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Button(
      onTap: () async {
        bool result = await context.feedProviderF.setFeed();
        if (result) {
          // ignore: use_build_context_synchronously
          PupUpDialog.showDataAlert(
              context,
              PupDialog(
                // ignore: use_build_context_synchronously
                  text: AppLocalizations.of(context)!
                      .updateProfileMessage,
                  routName: feedBack)
            // ignore: use_build_context_synchronously

          );
        } else {
          String? message = context.feedProviderF.errorMessage;
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(milliseconds: 2000),
              content: Text(message!)));
        }
      },
      text: AppLocalizations.of(context)!.save,
      w: context.w,
      h: context.h,
    );
  }
}

void reset(BuildContext context){
  context.feedProviderF.resetProvider();
}

void setFuture(BuildContext context){
  context.feedProviderF.getFuture();
}

Future? getFutures(BuildContext context){
  return context.feedProvider.future;

}