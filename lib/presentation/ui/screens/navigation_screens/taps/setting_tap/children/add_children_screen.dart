import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/app/helper/validations.dart';
import 'package:we_care/data/setting/children/models/child_models.dart';
import 'package:we_care/domain/setting/children/entities/child.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/presentation/providers/setting/children_provider.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:we_care/presentation/ui/widgets/global/comment_description_field.dart';
import 'package:we_care/presentation/ui/widgets/global/dropdown_button.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/global/text_field_box.dart';


class AddChildrenScreen extends StatelessWidget {
  const AddChildrenScreen({Key? key, this.id, this.action, this.aChild, this.from})
      : super(key: key);
 static final keyForm = GlobalKey<FormState>();
  final int? id;
  final ActionTyp? action;
  final FromScreen? from;
  final AChild? aChild;




  @override
  Widget build(BuildContext context) {
    print(aChild);
    List<String> genders = [
      context.lang!.male,
      context.lang!.female,
    ];


    return Layout(
         action:
           InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();},)
         ,
        title: action == ActionTyp.edit
            ? context.lang!.edit
            : context.lang!.addChild,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding:
                  EdgeInsets.only(right: 10, left: 10, bottom: context.h * 0.1),
              child: Form(
                key: keyForm,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///Child name field
                      ChildNmeField(action: action!,aChildName: aChild?.name,),
                      ///child berth date
                      AgeField(action: action!,aChildAge: aChild?.age.toString()),
                      ///berth date field
                      BerthDateField(action: action!,aChildDate: aChild?.birthDate??"",),
                      ///gender dropdown
                      GenderDropdown(genders:genders,aChildGender: aChild?.gender,),
                      SpecialNeedsField(action: action!,aChildNeeds: aChild?.needs,),
                      Submit(action: action!, formKey: keyForm, aChild: aChild,from: from,)
                    ],
                  ),
                ),
              ),
            ),
            const Loading()
          ],
        ));
  }
}




///===========screen widgets ==========///

///Child name field
class ChildNmeField extends StatelessWidget {
  const ChildNmeField({Key? key,required this.action,this.aChildName}) : super(key: key);
  final  ActionTyp action;
  final String?  aChildName;
  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      initialValue:
      action == ActionTyp.edit ? aChildName : null,
      controller: action == ActionTyp.edit
          ? null
          : TextEditingController.fromValue(TextEditingValue(
          text:
          context.formsProviderF.nameController.text,
          selection: TextSelection.collapsed(
              offset: context.formsProviderF
                  .nameController.text.length))),
      validator: (name) {
        return nameValidation(context, name!);
      },
      keyboardType: TextInputType.text,
      label: AppLocalizations.of(context)!.name,
      onChanged: (v) {

        context.formsProviderF.setNameController(v);
      },
      onSubmitted: (v) {
        context.formsProviderF.nextFocus(
            context.formsProviderF.ageFocusNode, context);
        return;
      },
    );
  }
}

///child age
class AgeField extends StatelessWidget {
  const AgeField({Key? key,required this.action,this.aChildAge}) : super(key: key);
  final  ActionTyp action;
  final String?  aChildAge;
  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      initialValue:
           aChildAge =="null"?"":null,


      controller: action == ActionTyp.edit
          ? null
          : TextEditingController.fromValue(TextEditingValue(
          text: context.formsProviderF.ageController.text,
          selection: TextSelection.collapsed(
              offset: context.formsProviderF.ageController
                  .text.length))),
      validator: (date) {
        return generalValidation(context, date!);
      },
      focusNode: context.formsProviderF.ageFocusNode,

      // reaOnly: true,
      keyboardType: TextInputType.text,
      label: AppLocalizations.of(context)!.age,

      onChanged: (v) {

        context.formsProviderF.setAgeController(v);
      },
      onSubmitted: (v) {
        context.formsProviderF.nextFocus(
            context.formsProviderF.dateFocusNode, context);
        return;
      },
    );
  }
}

/// berth date field
class BerthDateField extends StatelessWidget {
  const BerthDateField({Key? key,required this.action,required this.aChildDate}) : super(key: key);
  final  ActionTyp action;
  final String  aChildDate;
  @override
  Widget build(BuildContext context) {

    return TextFieldBox(
      onChanged: (v) {
        print(context.formsProviderF.date);
        context.formsProviderF
            .setDateController(context.formsProviderF.date);
      },


      controller: TextEditingController.fromValue(TextEditingValue(
          text:
          context.formsProvider.dateController.text==""?aChildDate:context.formsProvider.dateController.text,
          selection: TextSelection.collapsed(
              offset: context.formsProviderF
                  .dateController.text.length))),

      // reaOnly: true,
      keyboardType: TextInputType.text,
      label: AppLocalizations.of(context)!.birthDate,
      suffix: IconButton(
        icon: const Icon(
          Icons.calendar_month_rounded,
          color: UiColors.purple1,
        ),
        onPressed: () {
          context.formsProviderF
              .showDatePicker(context, context.h);
        },
      ),
    );
  }
}

///gender dropdown
class GenderDropdown extends StatelessWidget {
  const GenderDropdown({Key? key,this.aChildGender,required this.genders}) : super(key: key);
final String? aChildGender;
final List genders;
  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      value: aChildGender == null
          ? null
          : aChildGender == "male"
          ? context.lang!.male
          :  context.lang!.female,
      validator: (date) {
        return generalValidation(context, date.toString());
      },
      items: genders,
      text: AppLocalizations.of(context)!.gender,
      onChange: (value) {
        if (value == AppLocalizations.of(context)!.male) {
          context.formsProviderF.setGenderController("male");
        } else {
          context.formsProviderF
              .setGenderController("female");
        }
      },
    );
  }
}

///special needs field
class SpecialNeedsField extends StatelessWidget {
  const SpecialNeedsField({Key? key,required this.action,this.aChildNeeds}) : super(key: key);
  final  ActionTyp action;
  final String?  aChildNeeds;
  @override
  Widget build(BuildContext context) {
    return  CommentAndDescriptionField(
        controller: action == ActionTyp.edit
            ? null
            : TextEditingController.fromValue(
            TextEditingValue(
                text: context
                    .formsProviderF.statusController.text,
                selection: TextSelection.collapsed(
                    offset: context.formsProviderF
                        .statusController.text.length))),
        initialValue:
        action == ActionTyp.edit ? aChildNeeds : null,
        onChange: (v) {

          context.formsProviderF.setNeedsController(v);
        },
        label: AppLocalizations.of(context)!.specialNeeds);
  }
}

/// submit button
class Submit extends StatelessWidget {
  const Submit({Key? key,required this.action,this.aChild,this.from,required this.formKey}) : super(key: key);
  final  ActionTyp action;
  final AChild? aChild;

  final FromScreen? from;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Button(
      w: context.w,
      h: context.h,
      text: action == ActionTyp.edit
          ?context.lang!.edit
          : context.lang!.save,
      onTap: () {
        ChildModel  child= ChildModel(id: aChild?.id,age:context
            .formsProviderF.ageController.text.isEmpty
            ? aChild?.age
            : int.parse(
            context.formsProviderF.ageController.text),birthDate:context.formsProviderF.date ?? aChild?.birthDate,gender:context
            .formsProviderF.genderController.text.isEmpty
            ? aChild?.gender
            : context.formsProviderF.genderController.text,name: context.formsProviderF.nameController.text.isEmpty
            ? aChild?.name
            : context.formsProviderF.nameController.text,needs: context
            .formsProviderF.statusController.text.isEmpty
            ? aChild?.needs
            : context.formsProviderF.needs.text  );

        childSubmit(formKey, context, action, child,
             from ?? FromScreen.main);
      },
    );
  }
}

/// loading widget
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.childrenProvider.state == ChildFormState.loading
        ? const Center(
      child: CircularProgressIndicator(
        color: UiColors.pink,
      ),
    )
        : const SizedBox();
  }
}





