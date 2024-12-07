import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/domain/auth/entities/profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:we_care/presentation/ui/widgets/global/dropdown_button.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/global/text_field_box.dart';




class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 static final formKey = GlobalKey<FormState>();
 getCities()async{ await  context.preferenceProviderF.getCities();
 setState((){});
 }

 @override void initState() {
  getCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> genders = [
      AppLocalizations.of(context)!.male,
      AppLocalizations.of(context)!.female,
    ];

    Profile? aUser = context.profileProviderF.user;

    return WillPopScope(
      onWillPop: ()async { context.profileProviderF.setReadOnly(false);
        return true;},
      ///common custom layout
      child: Layout(
          action:
          InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();},),
          title: AppLocalizations.of(context)!.editProfile,
          child: Container(
            padding:
              EdgeInsets.only(right: 10, left: 10,bottom: context.w*0.15 ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Texts.sort(context, context.h,
                            context.lang!.personalInformation),
                        /// activate editing  button
                        const ActivateEditingButton()
                      ],
                    ),
                    /// custom name text field
                    UserNameField(aUser: aUser),
                    /// custom nationality  dropdown
                    NationalityDropdown(aUser: aUser),
                    /// custom phone text field
                    UserPhoneField(aUser: aUser),
                    /// custom gender  dropdown
                    UserGenderField(aUser: aUser, genders: genders),
                    /// custom email text field
                    UserEmailField(aUser: aUser),
                    /// custom Status  dropdown
                    UserStatusField(aUser: aUser),
                    /// custom city  dropdown
                    UserCitiesField(aUser: aUser),
                    /// send profile editing button
                    SendProfileButton(aUser: aUser)
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class SendProfileButton extends StatelessWidget {
  const SendProfileButton({
    Key? key,
    required this.aUser,
  }) : super(key: key);

  final Profile? aUser;

  @override
  Widget build(BuildContext context) {
    return Button(
      w: context.w,
      h: context.h,
      text: AppLocalizations.of(context)!.edit,
      onTap: () {
      Profile  user =Profile(id:  aUser?.id,
            email :
            context.formsProviderF.emailController.text.isEmpty
                ? aUser?.email
                : context.formsProviderF.emailController.text,
            name :
            context.formsProviderF.nameController.text.isEmpty
                ? aUser?.name
                : context.formsProviderF.nameController.text,
            maritalStatus :
            context.formsProviderF.statusController.text.isEmpty
                ? aUser?.maritalStatus
                : context.formsProviderF.statusController.text,
          gender :
            context.formsProviderF.genderController.text.isEmpty
                ? aUser?.gender
                : context.formsProviderF.genderController.text,
            nationality :context
                .formsProviderF.nationController.text.isEmpty
                ? aUser?.nationality
                : context.preferenceProviderF.nationalities
                .firstWhere((element) =>
            element.name ==
                context.formsProviderF.nationController.text),
            city:context
                .formsProviderF.cityController.text.isEmpty
                ? aUser?.city
                : context.preferenceProviderF.cities.firstWhere(
                    (element) =>
                element.name ==
                    context.formsProviderF.cityController.text),
            phone :
            context.formsProviderF.phoneController.text.isEmpty
                ? aUser?.phone
                : context.formsProviderF.phoneController.text,
        );
       updateProfileSubmit(context, user);
      },
    );
  }
}

class UserCitiesField extends StatelessWidget {
  const UserCitiesField({
    Key? key,
    required this.aUser,
  }) : super(key: key);

  final Profile? aUser;

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      value:aUser?.city?.id!=null? context.preferenceProviderF.cities
          .firstWhere((element) => element.id == aUser?.city?.id)
          .name:context.preferenceProviderF.cities.first.name,
      items: context.preferenceProviderF.citiesName,
      text: AppLocalizations.of(context)!.city,
      onChange: !context.profileProvider.onlyRead
          ? (value) {
              context.formsProviderF.setCityController(value);
            }
          : null,
    );
  }
}

class UserStatusField extends StatelessWidget {
  const UserStatusField({
    Key? key,
    required this.aUser,
  }) : super(key: key);

  final Profile? aUser;

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      value: aUser?.maritalStatus == "single"
          ? AppLocalizations.of(context)!.single
          : AppLocalizations.of(context)!.married,
      items: context.profileProviderF.status(context),
      text: AppLocalizations.of(context)!.status,
      onChange:!context.profileProvider.onlyRead
          ? (value) {
        if (!context.profileProviderF.onlyRead) {
          if (value == AppLocalizations.of(context)!.single) {
            context.formsProviderF.setStatusController("single");
          } else {
            context.formsProviderF.setStatusController("married");
          }
        }
      }:null,
    );
  }
}

class UserEmailField extends StatelessWidget {
  const UserEmailField({
    Key? key,
    required this.aUser,
  }) : super(key: key);

  final Profile? aUser;

  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      reaOnly: context.profileProvider.onlyRead,
      focusNode: context.formsProviderF.emailFocusNode,
      onChanged: (String? value) {
        context.formsProviderF.setEmailController(value);
      },
      onSubmitted: (v) {
        context.formsProviderF.nextFocus(
            context.formsProviderF.statusFocusNode, context);

        return null;
      },
      controller: TextEditingController.fromValue(
          TextEditingValue(
              text: (context
                      .formsProviderF.emailController.text.isEmpty
                  ? aUser?.email
                  : context.formsProviderF.emailController.text)??"",
              selection: TextSelection.collapsed(
                  offset: context.formsProviderF.emailController
                      .text.length))),
      keyboardType: TextInputType.emailAddress,
      label: AppLocalizations.of(context)!.email,
    );
  }
}

class UserGenderField extends StatelessWidget {
  const UserGenderField({
    Key? key,
    required this.aUser,
    required this.genders,
  }) : super(key: key);

  final Profile? aUser;
  final List<String> genders;

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      value: aUser?.gender == "female"
          ? context.lang!.female
          : context.lang!.male,
      items: genders,
      text: AppLocalizations.of(context)!.gender,
      onChange: (value) {
        if (!context.profileProviderF.onlyRead) {
          value == context.lang!.female
              ? context.formsProviderF
                  .setGenderController("female")
              : context.formsProviderF
                  .setGenderController("male");
        }
      },
    );
  }
}

class UserPhoneField extends StatelessWidget {
  const UserPhoneField({
    Key? key,
    required this.aUser,
  }) : super(key: key);

  final Profile? aUser;

  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      reaOnly: context.profileProvider.onlyRead,
      onChanged: (String? value) {
        context.formsProviderF.setPhoneController(value);
      },
      onSubmitted: (v) {
        context.formsProviderF.nextFocus(
            context.formsProviderF.genderFocusNode, context);

        return null;
      },
      controller: TextEditingController.fromValue(
          TextEditingValue(
              text: (context
                      .formsProviderF.phoneController.text.isEmpty
                  ? aUser?.phone
                  : context.formsProviderF.phoneController.text)??"",
              selection: TextSelection.collapsed(
                  offset: context.formsProviderF.phoneController
                      .text.length))),
      keyboardType: TextInputType.phone,
      label: AppLocalizations.of(context)!.phone,
    );
  }
}

class NationalityDropdown extends StatelessWidget {
  const NationalityDropdown({
    Key? key,
    required this.aUser,
  }) : super(key: key);

  final Profile? aUser;

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      value:(aUser?.nationality!.id!=null? context.preferenceProviderF.nationalities
          .firstWhere(
              (element) => element.id == aUser?.nationality!.id)
          .name:context.preferenceProviderF.nationalities
          [0].name),
      items: context.preferenceProvider.nationalitiesName,
      text: AppLocalizations.of(context)!.nationality,
      onChange: (val) {
        if (!context.profileProvider.onlyRead) {
          context.formsProvider.setNationController(val);
        }
      },
    );
  }
}

class UserNameField extends StatelessWidget {
  const UserNameField({
    Key? key,
    required this.aUser,
  }) : super(key: key);

  final Profile? aUser;

  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      reaOnly: context.profileProvider.onlyRead,
      focusNode: context.formsProviderF.nameFocusNode,
      controller: TextEditingController.fromValue(
          TextEditingValue(
              text: (context
                      .formsProviderF.nameController.text.isEmpty
                  ? aUser?.name
                  : context.formsProviderF.nameController.text)??"",
              selection: TextSelection.collapsed(
                  offset: context.formsProviderF.nameController
                      .text.length))),
      keyboardType: TextInputType.text,
      label: AppLocalizations.of(context)!.name,
      onChanged: (String? value) {
        context.formsProviderF.setNameController(value);
      },
      onSubmitted: (v) {
        context.formsProviderF.nextFocus(
            context.formsProviderF.nationFocusNode, context);
        return;
      },
    );
  }
}

class ActivateEditingButton extends StatelessWidget {
  const ActivateEditingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.profileProviderF.setReadOnly(false);
        },
        icon: const Icon(
          Icons.edit_outlined,
          color: UiColors.purple1,
        ));
  }
}
