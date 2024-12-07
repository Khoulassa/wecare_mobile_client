import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/app/helper/validations.dart';
import 'package:we_care/data/setting/address/models/adress_model.dart';

import 'package:we_care/domain/setting/address/entities/address.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:we_care/presentation/ui/widgets/global/dropdown_button.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/global/text_field_box.dart';


class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({Key? key, this.id, required this.action, this.anAddress, this.from})
      : super(key: key);
 static final fKey = GlobalKey<FormState>();
  final int? id;
  final ActionTyp action;
  final FromScreen? from;
  final Address? anAddress;

  @override
  Widget build(BuildContext context) {
  

    ///common custom layout
    return Layout(
        action:
        InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();},)
        ,
        title: action == ActionTyp.edit
            ? AppLocalizations.of(context)!.edit
            : AppLocalizations.of(context)!.addAddress,
        child: Stack(
          children: [
            Container(
              padding:
                  EdgeInsets.only(right: 10, left: 10, bottom: context.h * 0.1),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: context.h * 0.9,
                      child: Form(
                        key: fKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///custom name text field
                            NameField(action: action, anAddressName:anAddress?.name,),

                            ///custom city drop down
                            CityDropdown(action: action,addressCity: anAddress?.city?.name!,),

                            ///custom district text field
                            DistrictField(action: action,addressState: anAddress?.state!,),

                            ///custom street text field
                            StreetField(action: action,addressStreet: anAddress?.street!,),

                            ///custom building text field
                            BuildingField(action: action,addressBuilding: anAddress?.buildingNo!,),

                            ///custom floor text field
                            FloorField(action: action,addressFloor: anAddress?.flatNo!,),

                            ///custom district text field
                            PostField(action: action,addressPost: anAddress?.postcode!,),

                            ///custom main mobile text field
                            MainMobileField(action: action,addressMainMobile: anAddress?.mainMobile!,),

                            ///custom sub mobile text field
                            SubMobile(action: action,addressSubMobile: anAddress?.subMobile!,),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: context.h * 0.05,
                    ),

                    ///data submission button
                    SubmitButton(anAddress: anAddress, action: action, formKey: fKey,from: from, ),
                    SizedBox(
                      height: context.h * 0.1,
                    ),
                  ],
                ),
              ),
            ),

            ///  api request loading indicator
            context.addressProvider.state == States.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: UiColors.purple1,
                    ),
                  )
                : const SizedBox()
          ],
        ));
  }
}


///=======screenWidgets========///


/// name field
class NameField extends StatelessWidget {
  const NameField({Key? key,required this.action, this.anAddressName}) : super(key: key);
final  ActionTyp action;
final String?  anAddressName;
  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      validator: (v) {
        return nameValidation(context, v!);
      },
      initialValue: action == ActionTyp.edit
          ? anAddressName
          : null,
      focusNode: context.formsProviderF.nameFocusNode,
      controller: action == ActionTyp.edit
          ? null
          : TextEditingController.fromValue(
          TextEditingValue(
              text: context.formsProviderF
                  .nameController.text,
              selection: TextSelection.collapsed(
                  offset: context
                      .formsProviderF
                      .nameController
                      .text
                      .length))),
      keyboardType: TextInputType.text,
      label: context.lang!.anAddress,
      onChanged: (v) {
        context.formsProviderF.setNameController(v);
      },
      onSubmitted: (v) {
        context.formsProviderF.nextFocus(
            context.formsProviderF.cityFocusNode,
            context);
        return null;
      },
    );
  }
}

///cities dropdown
class CityDropdown extends StatelessWidget {
  const CityDropdown({Key? key,required this.action,this.addressCity}) : super(key: key);
final ActionTyp action ;
final String? addressCity;
  @override
  Widget build(BuildContext context) {
    return  CustomDropDownButton(
      validator: (v) {
        return generalValidation(context, v);
      },
      value: action == ActionTyp.edit
          ? addressCity
          : null,
      focusNode: context.formsProviderF.cityFocusNode,
      items: context.preferenceProviderF.citiesName,
      text: AppLocalizations.of(context)!.city,
      onChange: (v) {
        context.formsProviderF.setCityController(v);
        context.formsProviderF.nextFocus(
            context.formsProviderF.districtFocusNode,
            context);
      },
    );
  }
}

/// district text field
class DistrictField extends StatelessWidget {
  const DistrictField({Key? key,required this.action,this.addressState}) : super(key: key);
  final ActionTyp action ;
  final String? addressState;
  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      validator: (v) {
        return generalValidation(context, v!);
      },
      initialValue: action == ActionTyp.edit
          ? addressState
          : null,
      focusNode:
      context.formsProviderF.districtFocusNode,
      controller: action == ActionTyp.edit
          ? null
          : TextEditingController.fromValue(
          TextEditingValue(
              text: context.formsProviderF
                  .districtController.text,
              selection: TextSelection.collapsed(
                  offset: context
                      .formsProviderF
                      .districtController
                      .text
                      .length))),
      keyboardType: TextInputType.text,
      label: AppLocalizations.of(context)!.district,
      onChanged: (v) {
        context.formsProviderF.setDistrictController(v);
      },
      onSubmitted: (v) {
        context.formsProviderF.nextFocus(
            context.formsProviderF.buildingFocusNode,
            context);
        return null;
      },
    );
  }
}


///custom street text field
class StreetField extends StatelessWidget {
  const StreetField({Key? key,required this.action,this.addressStreet}) : super(key: key);
  final ActionTyp action ;
  final String? addressStreet;
  @override
  Widget build(BuildContext context) {

    return TextFieldBox(
      validator: (v) {
        return generalValidation(context, v!);
      },
      initialValue: action == ActionTyp.edit
          ? addressStreet
          : null,
      focusNode: context.formsProviderF.streetFocusNode,
      controller: action == ActionTyp.edit
          ? null
          : TextEditingController.fromValue(
          TextEditingValue(
              text: context.formsProviderF
                  .streetController.text,
              selection: TextSelection.collapsed(
                  offset: context
                      .formsProviderF
                      .streetController
                      .text
                      .length))),
      keyboardType: TextInputType.text,
      label: AppLocalizations.of(context)!.street,
      onChanged: (v) {
        context.formsProviderF.setStreetController(v);
      },
      onSubmitted: (v) {
        context.formsProviderF.nextFocus(
            context.formsProviderF.buildingFocusNode,
            context);
        return null;
      },
    );
  }
}

/// building text field
class BuildingField extends StatelessWidget {
  const BuildingField({Key? key,required this.action,this.addressBuilding}) : super(key: key);
  final ActionTyp action ;
  final String? addressBuilding;
  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      validator: (v) {
        return generalValidation(context, v!);
      },
      initialValue: action == ActionTyp.edit
          ? addressBuilding
          : null,
      focusNode:
      context.formsProviderF.buildingFocusNode,
      controller: action == ActionTyp.edit
          ? null
          : TextEditingController.fromValue(
          TextEditingValue(
              text: context.formsProviderF
                  .buildingController.text,
              selection: TextSelection.collapsed(
                  offset: context
                      .formsProviderF
                      .buildingController
                      .text
                      .length))),
      keyboardType: TextInputType.number,
      label: AppLocalizations.of(context)!.building,
      onChanged: (v) {
        context.formsProviderF.setBuildingController(v);
      },
      onSubmitted: (v) {
        context.formsProviderF.nextFocus(
            context.formsProviderF.floorFocusNode,
            context);
        return null;
      },
    );
  }
}


///floor text field
class FloorField extends StatelessWidget {
  const FloorField({Key? key,required this.action,this.addressFloor}) : super(key: key);
  final ActionTyp action ;
  final String? addressFloor;
  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      validator: (v) {
        return generalValidation(context, v!);
      },
      initialValue: action == ActionTyp.edit
          ? addressFloor
          : null,
      focusNode: context.formsProviderF.floorFocusNode,
      controller: action == ActionTyp.edit
          ? null
          : TextEditingController.fromValue(
          TextEditingValue(
              text: context.formsProviderF
                  .floorController.text,
              selection: TextSelection.collapsed(
                  offset: context
                      .formsProviderF
                      .floorController
                      .text
                      .length))),
      keyboardType: TextInputType.number,
      label: AppLocalizations.of(context)!.floor,
      onChanged: (v) {
        context.formsProviderF.setFloorController(v);
      },
      onSubmitted: (v) {
        context.formsProviderF.nextFocus(
            context.formsProviderF.postalFocusNode,
            context);
        return null;
      },
    );
  }
}


/// post text field
class PostField extends StatelessWidget {
  const PostField({Key? key,required this.action,this.addressPost}) : super(key: key);
  final ActionTyp action ;
  final String? addressPost;
  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      validator: (v) {
        return generalValidation(context, v!);
      },
      initialValue: action == ActionTyp.edit
          ? addressPost
          : null,
      focusNode: context.formsProviderF.postalFocusNode,
      controller: action == ActionTyp.edit
          ? null
          : TextEditingController.fromValue(
          TextEditingValue(
              text: context.formsProviderF
                  .postalController.text,
              selection: TextSelection.collapsed(
                  offset: context
                      .formsProviderF
                      .postalController
                      .text
                      .length))),
      keyboardType: TextInputType.number,
      label: AppLocalizations.of(context)!.postal,
      onChanged: (v) {
        context.formsProviderF.setPostalController(v);
      },
      onSubmitted: (v) {
        context.formsProviderF.nextFocus(
            context.formsProviderF.phoneFocusNode,
            context);
        return null;
      },
    );
  }
}


/// main mobile text field
class MainMobileField extends StatelessWidget {
  const MainMobileField({Key? key,required this.action,this.addressMainMobile}) : super(key: key);
  final ActionTyp action ;
  final String? addressMainMobile;
  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      validator: (v) {
        return phoneValidation(context, v!);
      },
      initialValue: action == ActionTyp.edit
          ? addressMainMobile
          : null,
      focusNode: context.formsProviderF.phoneFocusNode,
      controller: action == ActionTyp.edit
          ? null
          : TextEditingController.fromValue(
          TextEditingValue(
              text: context.formsProviderF
                  .phoneController.text,
              selection: TextSelection.collapsed(
                  offset: context
                      .formsProviderF
                      .phoneController
                      .text
                      .length))),
      keyboardType: TextInputType.phone,
      label: AppLocalizations.of(context)!.primary,
      onChanged: (v) {
        context.formsProviderF.setPhoneController(v);
      },
      onSubmitted: (v) {
        context.formsProviderF.nextFocus(
            context.formsProviderF.phone2FocusNode,
            context);
        return null;
      },
    );
  }
}


/// sub mobile text field
class SubMobile extends StatelessWidget {
  const SubMobile({Key? key,required this.action,this.addressSubMobile}) : super(key: key);
  final ActionTyp action ;
  final String? addressSubMobile;
  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      validator: (v) {
        return phoneValidation(context, v!);
      },
      initialValue: action == ActionTyp.edit
          ? addressSubMobile
          : null,
      focusNode: context.formsProviderF.phone2FocusNode,
      controller: action == ActionTyp.edit
          ? null
          : TextEditingController.fromValue(
          TextEditingValue(
              text: context.formsProviderF
                  .phone2Controller.text,
              selection: TextSelection.collapsed(
                  offset: context
                      .formsProviderF
                      .phone2Controller
                      .text
                      .length))),
      keyboardType: TextInputType.phone,
      label: context.lang!.secondary,
      onChanged: (v) {
        context.formsProviderF.setPhone2Controller(v);
      },
    );
  }
}


///data submission button
class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key, this.anAddress,required this.action,this.from,required this.formKey}) : super(key: key);
 final Address?  anAddress;
  final ActionTyp action ;

 final FromScreen? from;
final  GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Button(
      w: context.w,
      h: context.h,
      text: AppLocalizations.of(context)!.save,
      onTap: () {
     AddressModel   address = AddressModel(
          id: anAddress?.id,
          city:
          context.formsProviderF.cityController.text.isEmpty
              ? anAddress?.city
              : context.preferenceProviderF.cities
              .firstWhere((element) =>
          element.name ==
              context.formsProviderF.cityController
                  .text),
          state: context.formsProviderF.districtController.text
              .isEmpty
              ? anAddress?.state ?? ""
              : context.formsProviderF.districtController.text,
          name:
          context.formsProviderF.nameController.text.isEmpty
              ? anAddress?.name ?? ""
              : context.formsProviderF.nameController.text,
          street: context
              .formsProviderF.streetController.text.isEmpty
              ? anAddress?.street ?? ""
              : context.formsProviderF.streetController.text,
          buildingNo: context.formsProviderF.buildingController
              .text.isEmpty
              ? anAddress?.buildingNo ?? ""
              : context.formsProviderF.buildingController.text,
          flatNo: context
              .formsProviderF.floorController.text.isEmpty
              ? anAddress?.flatNo ?? ""
              : context.formsProviderF.floorController.text,
          mainMobile: context
              .formsProviderF.phoneController.text.isEmpty
              ? anAddress?.mainMobile ?? ""
              : context.formsProviderF.phoneController.text,
          postcode: context
              .formsProviderF.postalController.text.isEmpty
              ? anAddress?.postcode ?? ""
              : context.formsProviderF.postalController.text,
          subMobile: context
              .formsProviderF.phone2Controller.text.isEmpty
              ? anAddress?.subMobile ?? ""
              : context.formsProviderF.phone2Controller.text,
        );
        addressSubmit(formKey,  address, context,
            action, from ?? FromScreen.main);
      },
    );
  }
}









