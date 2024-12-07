import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';





class FormsProvider with ChangeNotifier {

  String? validationMessage;

  setValidationMessage(m) {
    validationMessage = m;
    notifyListeners();
  }

  final TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController phone2Controller = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController childController = TextEditingController();
  final TextEditingController hoursController = TextEditingController();
  final TextEditingController nationController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController postalController = TextEditingController();
  final TextEditingController pointController = TextEditingController();
  final TextEditingController couponController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController otpCode1 = TextEditingController();
  final TextEditingController otpCode2 = TextEditingController();
  final TextEditingController otpCode3 = TextEditingController();
  final TextEditingController otpCode4 = TextEditingController();
  final TextEditingController needs = TextEditingController();


  final FocusNode nameFocusNode = FocusNode();

  final FocusNode ageFocusNode = FocusNode();
  final FocusNode colorFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode phone2FocusNode = FocusNode();
  final FocusNode cityFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  final FocusNode districtFocusNode = FocusNode();
  final FocusNode streetFocusNode = FocusNode();
  final FocusNode buildingFocusNode = FocusNode();
  final FocusNode floorFocusNode = FocusNode();
  final FocusNode postalFocusNode = FocusNode();
  final FocusNode pointFocusNode = FocusNode();
  final FocusNode couponFocusNode = FocusNode();
  final FocusNode nationFocusNode = FocusNode();
  final FocusNode genderFocusNode = FocusNode();
  final FocusNode statusFocusNode = FocusNode();
  final FocusNode dateFocusNode = FocusNode();

  String? date;

  nextFocus(FocusNode focusNode, BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  setDateController(date) {
    dateController.text = date;

    notifyListeners();
  }

  setNeedsController(date) {
    needs.text = date;

    notifyListeners();
  }

  setTimeController(time) {
    timeController.text = time;

    notifyListeners();
  }
  setAgeController(age) {
    ageController.text = age;

    notifyListeners();
  }

  setNameController(name) {
    nameController.text = name;

    notifyListeners();
  }

  setEmailController(email) {
    emailController.text = email;

    notifyListeners();
  }

  setPhoneController(phone) {
    phoneController.text = phone;

    notifyListeners();
  }

  setPhone2Controller(phone) {
    phone2Controller.text = phone;

    notifyListeners();
  }

  setPassController(pass) {
    passController.text = pass;

    notifyListeners();
  }

  setCityController(city) {
    cityController.text = city;

    notifyListeners();
  }

  setAddressController(address) {
    addressController.text = address;

    notifyListeners();
  }

  setChildController(child) {
    childController.text = child;

    notifyListeners();
  }

  setHoursController(hours) {
    hoursController.text = hours;

    notifyListeners();
  }

  setNationController(nation) {
    nationController.text = nation;

    notifyListeners();
  }

  setGenderController(gender) {
    genderController.text = gender;

    notifyListeners();
  }

  setStatusController(status) {
    statusController.text = status;

    notifyListeners();
  }

  setDistrictController(dis) {
    districtController.text = dis;

    notifyListeners();
  }

  setStreetController(str) {
    streetController.text = str;

    notifyListeners();
  }

  setBuildingController(build) {
    buildingController.text = build;

    notifyListeners();
  }

  setFloorController(floor) {
    floorController.text = floor;

    notifyListeners();
  }

  setPostalController(post) {
    postalController.text = post;

    notifyListeners();
  }

  setPointController(point) {
    pointController.text = point;

    notifyListeners();
  }

  setCouponController(code) {
    couponController.text = code;

    notifyListeners();
  }

  setOTPCode1(v) {
    otpCode1.text = v;
    notifyListeners();
  }

  setOTPCode2(v) {
    otpCode2.text = v;
    notifyListeners();
  }

  setOTPCode3(v) {
    otpCode3.text = v;
    notifyListeners();
  }

  setOTPCode4(v) {
    otpCode3.text = v;
    notifyListeners();
  }

  resetControllers() {
    dateController.text = "";
    nameController.text = "";
    timeController.text = "";
    emailController.text = "";
    phoneController.text = "";
    phone2Controller.text = "";
    passController.text = "";
    cityController.text = "";
    addressController.text = "";
    childController.text = "";
    hoursController.text = "";
    nationController.text = "";
    genderController.text = "";
    statusController.text = "";
    districtController.text = "";
    streetController.text = "";
    buildingController.text = "";
    floorController.text = "";
    postalController.text = "";
    pointController.text = "";
    couponController.text = "";
    ageController.text = "";
    otpCode1.text = "";
    otpCode2.text = "";
    otpCode3.text = "";
    otpCode4.text = "";
  }

  void showDatePicker(BuildContext context,double h) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: context,
        builder: (_) =>
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              height: h * 0.25,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                            child: Text(
                              AppLocalizations.of(context)!.done,
                              style: const TextStyle(fontFamily:Assets.cairo,color: UiColors.purple1,fontSize: 10),
                            ),
                            onPressed: () {
                              setDateController(date);
                              notifyListeners();
                              Navigator.of(context).pop();
                            }),
                        CupertinoButton(
                          child: Text(
                            AppLocalizations.of(context)!.dateCancel,
                            style: const TextStyle(color: UiColors.purple1,fontSize: 10),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: CupertinoTheme(
                        data: const CupertinoThemeData(
                          textTheme: CupertinoTextThemeData(
                            dateTimePickerTextStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (val) {
                              String year = val.year.toString();
                              String month = val.month.toString().padLeft(2, '0');
                              String day = val.day.toString().padLeft(2, '0');
                              date = "$year-$month-$day";

                            }),
                      )),
                  // Close the modal
                ],
              ),
            ));
  }

  String  code ="";
  setCode(){
    code="${otpCode1.text}${otpCode2.text}${otpCode3.text}${otpCode4.text}";
    notifyListeners();
  }


}
