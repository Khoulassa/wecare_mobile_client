import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/app/helper/validations.dart';
import 'package:we_care/data/setting/contact/models/contact_request.dart';
import 'package:we_care/presentation/providers/setting/contact_provider.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:we_care/presentation/ui/widgets/global/comment_description_field.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/global/text_field_box.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    ///common custom layout
    return Layout(
        action:
        InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();},),
        title: AppLocalizations.of(context)!.contactUs,
        child: Container(
            padding: EdgeInsets.only(
                right: 10,
                left: 10,
                bottom: context.h * 0.15,
                top: context.h * 0.13),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.h * 0.50,
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            /// email custom text field
                            const EmailField(),
                            /// phone custom text field
                            const PhoneField(),
                            ///common custom text field for comment and description
                            const CommentField(),

                            /// social media contact
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: context.h * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                    context.contactProviderF.social.length,
                                    (index) => SocialIcons(index: index, social: context.contactProviderF.social,)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    /// send message button
                    SendMessageButton(formKey: formKey,)
                  ],
                ),
                const LoadingWidget()
              ],
            )));
  }
}

///============screen widgets =======///

/// email field
class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFieldBox(
      validator: (email) {
        return emailValidation(context, email!);
      },
      focusNode: context.formsProviderF.emailFocusNode,
      controller: TextEditingController.fromValue(
          TextEditingValue(
              text: context
                  .formsProviderF.emailController.text,
              selection: TextSelection.collapsed(
                  offset: context.formsProviderF
                      .emailController.text.length))),
      keyboardType: TextInputType.text,
      label: AppLocalizations.of(context)!.email,
      onChanged: (v) {
        context.formsProviderF.setEmailController(v);
      },
      onSubmitted: (v) {
        context.formsProvider.nextFocus(
            context.formsProvider.phoneFocusNode,
            context);
        return null;
      },
    );
  }
}


/// email field
class PhoneField extends StatelessWidget {
  const PhoneField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFieldBox(
      validator: (phone) {
        return phoneValidation(context, phone!);
      },
      focusNode: context.formsProviderF.phoneFocusNode,
      controller: TextEditingController.fromValue(
          TextEditingValue(
              text: context
                  .formsProviderF.phoneController.text,
              selection: TextSelection.collapsed(
                  offset: context.formsProviderF
                      .phoneController.text.length))),
      keyboardType: TextInputType.text,
      label: AppLocalizations.of(context)!.phone,
      onChanged: (v) {
        context.formsProviderF.setPhoneController(v);
      },
      onSubmitted: (v) {
        context.formsProvider.nextFocus(
            context.formsProvider.cityFocusNode,
            context);
        return null;
      },
    );
  }
}

///comment field
class CommentField extends StatelessWidget {
  const CommentField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommentAndDescriptionField(
        controller: TextEditingController.fromValue(
            TextEditingValue(
                text: context
                    .formsProvider.nameController.text,
                selection: TextSelection.collapsed(
                    offset: context.formsProviderF
                        .nameController.text.length))),
        onChange: (v) {
          context.formsProviderF.setNameController(v);
        },
        label: AppLocalizations.of(context)!.message);
  }
}

///social icons
class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key,required this.index,required this.social}) : super(key: key);
final List social;
final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          if (social[index]["name"] ==
              "whatsapp") {
            context.contactProviderF
                .openWhatsapp(
                social[index]["url"],
                context);
          } else {
            var url =
            Uri.parse(social[index]["url"]);
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              throw "could not launch";
            }
          }
        },
        child: SvgPicture.asset(
          social[index]["icon"],
          height: context.h * 0.05,
          width: context.w * 0.07,
        ));
  }
}

///send button
class SendMessageButton extends StatelessWidget {
  const SendMessageButton({Key? key,required this.formKey}) : super(key: key);
final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return  Button(
      text: AppLocalizations.of(context)!.send,
      h: context.h,
      w: context.w,
      onTap: () {
        ContactRequest contact = ContactRequest();
        contact.name = context.profileProviderF.user?.name ?? "";
        contact.phone = context.formsProviderF.phoneController.text?? "";
        contact.email =
            context.formsProviderF.emailController.text;
        contact.message =
            context.formsProviderF.nameController.text;
        contactMessageSubmit(context, formKey, contact);
      },
    );
  }
}

///loading
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   context.contactProvider.state == ContactState.loading
        ? const Center(
      child: CircularProgressIndicator(
        color: UiColors.purple1,
      ),
    )
        : const SizedBox();
  }
}




