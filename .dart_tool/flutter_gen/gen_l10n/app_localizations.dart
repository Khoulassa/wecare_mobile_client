import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @weCare.
  ///
  /// In ar, this message translates to:
  /// **'نحن نهتم'**
  String get weCare;

  /// No description provided for @allAbout.
  ///
  /// In ar, this message translates to:
  /// **'كل شيء عن رعاية الطفل'**
  String get allAbout;

  /// No description provided for @start.
  ///
  /// In ar, this message translates to:
  /// **'إبدأ'**
  String get start;

  /// No description provided for @single.
  ///
  /// In ar, this message translates to:
  /// **'أعزب'**
  String get single;

  /// No description provided for @apply.
  ///
  /// In ar, this message translates to:
  /// **'تفعيل'**
  String get apply;

  /// No description provided for @later.
  ///
  /// In ar, this message translates to:
  /// **'لاحقاً '**
  String get later;

  /// No description provided for @discount.
  ///
  /// In ar, this message translates to:
  /// **'خصومات'**
  String get discount;

  /// No description provided for @notifications.
  ///
  /// In ar, this message translates to:
  /// **'الإشعارات'**
  String get notifications;

  /// No description provided for @vat.
  ///
  /// In ar, this message translates to:
  /// **'الضريبة'**
  String get vat;

  /// No description provided for @subtotal.
  ///
  /// In ar, this message translates to:
  /// **'المجموع الفرعي'**
  String get subtotal;

  /// No description provided for @pointsMessage.
  ///
  /// In ar, this message translates to:
  /// **'رصيدك من النقاط غير كاف'**
  String get pointsMessage;

  /// No description provided for @sendOrderMessage.
  ///
  /// In ar, this message translates to:
  /// **'تم رفع طلبك بنجاح، الرجاء انتظار تأكيد الطلب '**
  String get sendOrderMessage;

  /// No description provided for @approvedOrderMessage.
  ///
  /// In ar, this message translates to:
  /// **'تم قبول الطلب بنجاح'**
  String get approvedOrderMessage;

  /// No description provided for @canceledOrderMessage.
  ///
  /// In ar, this message translates to:
  /// **'تم إلغاء الخدمة عن طريق مقدم الخدمة /n ملاحظة : رسوم الخدمة ستحول الى النقاط في التطبيق '**
  String get canceledOrderMessage;

  /// No description provided for @rejectedOrderMessage.
  ///
  /// In ar, this message translates to:
  /// **' عذراً لم يتم قبول الطلب  '**
  String get rejectedOrderMessage;

  /// No description provided for @details.
  ///
  /// In ar, this message translates to:
  /// **'التفاصيل'**
  String get details;

  /// No description provided for @completedOrderMessage.
  ///
  /// In ar, this message translates to:
  /// **'شكرا لاختياركم لنا،نسعد بتقييمكم '**
  String get completedOrderMessage;

  /// No description provided for @pay.
  ///
  /// In ar, this message translates to:
  /// **'الدفع الآن'**
  String get pay;

  /// No description provided for @payConfirm.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الدفع'**
  String get payConfirm;

  /// No description provided for @noResult.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد نتائج'**
  String get noResult;

  /// No description provided for @askToSignIn.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم بتسجيل الدخول أولاً '**
  String get askToSignIn;

  /// No description provided for @completed.
  ///
  /// In ar, this message translates to:
  /// **'الطلبات المكتملة'**
  String get completed;

  /// No description provided for @completedOrder.
  ///
  /// In ar, this message translates to:
  /// **'مكتملة'**
  String get completedOrder;

  /// No description provided for @current.
  ///
  /// In ar, this message translates to:
  /// **'الطلبات الحالية'**
  String get current;

  /// No description provided for @currentOrder.
  ///
  /// In ar, this message translates to:
  /// **'حالية'**
  String get currentOrder;

  /// No description provided for @canceled.
  ///
  /// In ar, this message translates to:
  /// **'الطلبات الملغية'**
  String get canceled;

  /// No description provided for @canceledOrder.
  ///
  /// In ar, this message translates to:
  /// **'ملغية'**
  String get canceledOrder;

  /// No description provided for @waitingOrder.
  ///
  /// In ar, this message translates to:
  /// **'في الانتظار'**
  String get waitingOrder;

  /// No description provided for @rejected.
  ///
  /// In ar, this message translates to:
  /// **'الطلبات المرفوضة'**
  String get rejected;

  /// No description provided for @rejectedOrder.
  ///
  /// In ar, this message translates to:
  /// **'مرفوضة'**
  String get rejectedOrder;

  /// No description provided for @married.
  ///
  /// In ar, this message translates to:
  /// **'متزوج'**
  String get married;

  /// No description provided for @addAddressSuccessfully.
  ///
  /// In ar, this message translates to:
  /// **'.رائع تم حفظ العنوان بنجاح'**
  String get addAddressSuccessfully;

  /// No description provided for @addChildSuccessfully.
  ///
  /// In ar, this message translates to:
  /// **'.رائع تم اضافة طفل بنجاح'**
  String get addChildSuccessfully;

  /// No description provided for @updateChildSuccessfully.
  ///
  /// In ar, this message translates to:
  /// **'.رائع تم الطلب بنجاح'**
  String get updateChildSuccessfully;

  /// No description provided for @feedBackMessage.
  ///
  /// In ar, this message translates to:
  /// **'شكراً لك على إرسال ملاحظاتك،نحن دائماً مقدر آراء عملائنا'**
  String get feedBackMessage;

  /// No description provided for @updateProfileMessage.
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ المعلومات الخاصة بك بنجاح.'**
  String get updateProfileMessage;

  /// No description provided for @cancelOrderMessage.
  ///
  /// In ar, this message translates to:
  /// **'تم إلغاء الطلب'**
  String get cancelOrderMessage;

  /// No description provided for @skipSignIn.
  ///
  /// In ar, this message translates to:
  /// **'تخطي تسجيل الحساب'**
  String get skipSignIn;

  /// No description provided for @age.
  ///
  /// In ar, this message translates to:
  /// **'العمر'**
  String get age;

  /// No description provided for @birthDate.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الميلاد'**
  String get birthDate;

  /// No description provided for @deleteChild.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الحذف'**
  String get deleteChild;

  /// No description provided for @delete.
  ///
  /// In ar, this message translates to:
  /// **' حذف'**
  String get delete;

  /// No description provided for @back.
  ///
  /// In ar, this message translates to:
  /// **' عودة'**
  String get back;

  /// No description provided for @cancel.
  ///
  /// In ar, this message translates to:
  /// **' إلغاء'**
  String get cancel;

  /// No description provided for @signIn.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get signIn;

  /// No description provided for @forget.
  ///
  /// In ar, this message translates to:
  /// **'نسيت كلمة المرور؟'**
  String get forget;

  /// No description provided for @email.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get email;

  /// No description provided for @password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get password;

  /// No description provided for @newRegister.
  ///
  /// In ar, this message translates to:
  /// **'مستخدم جديد؟'**
  String get newRegister;

  /// No description provided for @signUp.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الحساب'**
  String get signUp;

  /// No description provided for @signOut.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get signOut;

  /// No description provided for @haveAnAccount.
  ///
  /// In ar, this message translates to:
  /// **'لديك حساب بالفعل؟'**
  String get haveAnAccount;

  /// No description provided for @requiredValidation.
  ///
  /// In ar, this message translates to:
  /// **'هذا الحقل مطلوب'**
  String get requiredValidation;

  /// No description provided for @emailValidation.
  ///
  /// In ar, this message translates to:
  /// **'الرجاء التحقق من ادخال البريد بصيغة صحيحة'**
  String get emailValidation;

  /// No description provided for @phoneDValidation.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف يجب أن يحتوي على ١٠ خانات'**
  String get phoneDValidation;

  /// No description provided for @phoneSValidation.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف يجب أن يبدأ ب(05)'**
  String get phoneSValidation;

  /// No description provided for @codeNote.
  ///
  /// In ar, this message translates to:
  /// **'*سيصلك رمز التحقق عبر البريد الإلكتروني '**
  String get codeNote;

  /// No description provided for @passDValidation.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور يجب أن تحتوي على 6 عناصر'**
  String get passDValidation;

  /// No description provided for @passLValidation.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور يجب أن تحتوي على حرف على الأقل'**
  String get passLValidation;

  /// No description provided for @passNValidation.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور يجب أن تحتوي على رقم على الأقل'**
  String get passNValidation;

  /// No description provided for @name.
  ///
  /// In ar, this message translates to:
  /// **'الاسم'**
  String get name;

  /// No description provided for @phone.
  ///
  /// In ar, this message translates to:
  /// **'رقم الجوال'**
  String get phone;

  /// No description provided for @hallo.
  ///
  /// In ar, this message translates to:
  /// **'مرحبا ً،'**
  String get hallo;

  /// No description provided for @codeMessage.
  ///
  /// In ar, this message translates to:
  /// **'لقد وصل لك رمز تحقق إلى رقم جوالك،\n الرجاء إدخاله لاستكمال التسجيل'**
  String get codeMessage;

  /// No description provided for @code2Message.
  ///
  /// In ar, this message translates to:
  /// **'لقد وصل لك رمز تحقق إلى بريدك الإلكترووني،\n الرجاء إدخاله '**
  String get code2Message;

  /// No description provided for @resetPass.
  ///
  /// In ar, this message translates to:
  /// **'إعادة تعيين كلمة المرور'**
  String get resetPass;

  /// No description provided for @messageResend.
  ///
  /// In ar, this message translates to:
  /// **'إعادة إرسال الرمز'**
  String get messageResend;

  /// No description provided for @enter.
  ///
  /// In ar, this message translates to:
  /// **'إدخال الرمز'**
  String get enter;

  /// No description provided for @home.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get home;

  /// No description provided for @services.
  ///
  /// In ar, this message translates to:
  /// **'الخدمات'**
  String get services;

  /// No description provided for @chooseService.
  ///
  /// In ar, this message translates to:
  /// **'اختر خدمة'**
  String get chooseService;

  /// No description provided for @serviceChoose.
  ///
  /// In ar, this message translates to:
  /// **'اختيار الخدمة'**
  String get serviceChoose;

  /// No description provided for @favorite.
  ///
  /// In ar, this message translates to:
  /// **'المفضلة'**
  String get favorite;

  /// No description provided for @setting.
  ///
  /// In ar, this message translates to:
  /// **'الاعدادات'**
  String get setting;

  /// No description provided for @provider.
  ///
  /// In ar, this message translates to:
  /// **'مقدم الخدمة'**
  String get provider;

  /// No description provided for @retry.
  ///
  /// In ar, this message translates to:
  /// **'حاول مجدداً '**
  String get retry;

  /// No description provided for @price.
  ///
  /// In ar, this message translates to:
  /// **'السعر'**
  String get price;

  /// No description provided for @errorMessage.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ ما !'**
  String get errorMessage;

  /// No description provided for @cancellation.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء الخدمة'**
  String get cancellation;

  /// No description provided for @cancellationConfirm.
  ///
  /// In ar, this message translates to:
  /// **'هل أنت متأكد من أنك تريد إلغاء الخدمة؟ '**
  String get cancellationConfirm;

  /// No description provided for @newServices.
  ///
  /// In ar, this message translates to:
  /// **'خدمات جديدة'**
  String get newServices;

  /// No description provided for @reason.
  ///
  /// In ar, this message translates to:
  /// **'السبب'**
  String get reason;

  /// No description provided for @note.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظة:'**
  String get note;

  /// No description provided for @noteMessage.
  ///
  /// In ar, this message translates to:
  /// **'سيتم إضافة رسوم الخدمة إلى نقاطك في التطبيق , كل (١) نقطة يمكن استبدالها مقابل (١) ريال.'**
  String get noteMessage;

  /// No description provided for @orders.
  ///
  /// In ar, this message translates to:
  /// **'طلباتي'**
  String get orders;

  /// No description provided for @search.
  ///
  /// In ar, this message translates to:
  /// **'البـحـث'**
  String get search;

  /// No description provided for @sort.
  ///
  /// In ar, this message translates to:
  /// **'الترتيب حسب'**
  String get sort;

  /// No description provided for @serviceProvider.
  ///
  /// In ar, this message translates to:
  /// **'اختر مقدمي الخدمة'**
  String get serviceProvider;

  /// No description provided for @fromHighToLow.
  ///
  /// In ar, this message translates to:
  /// **'السعر من الأعلى إلى الأقل'**
  String get fromHighToLow;

  /// No description provided for @fromLowToHigh.
  ///
  /// In ar, this message translates to:
  /// **'السعر من الأقل إلى الأعلى'**
  String get fromLowToHigh;

  /// No description provided for @highest.
  ///
  /// In ar, this message translates to:
  /// **'الأعلى تقييم'**
  String get highest;

  /// No description provided for @noData.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد بيانات '**
  String get noData;

  /// No description provided for @sendMessageSuccessfully.
  ///
  /// In ar, this message translates to:
  /// **'شكراً لتواصلك سيتم الرد عليك في أقرب وقت ممكن'**
  String get sendMessageSuccessfully;

  /// No description provided for @points.
  ///
  /// In ar, this message translates to:
  /// **'النقاط'**
  String get points;

  /// No description provided for @wellCome.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً، '**
  String get wellCome;

  /// No description provided for @profile.
  ///
  /// In ar, this message translates to:
  /// **'الملف الشخصي'**
  String get profile;

  /// No description provided for @children.
  ///
  /// In ar, this message translates to:
  /// **'الأطفال'**
  String get children;

  /// No description provided for @address.
  ///
  /// In ar, this message translates to:
  /// **'العناوين'**
  String get address;

  /// No description provided for @contactUs.
  ///
  /// In ar, this message translates to:
  /// **'تواصل معنا'**
  String get contactUs;

  /// No description provided for @language.
  ///
  /// In ar, this message translates to:
  /// **'اللغة'**
  String get language;

  /// No description provided for @feedBack.
  ///
  /// In ar, this message translates to:
  /// **'رأيك'**
  String get feedBack;

  /// No description provided for @rate.
  ///
  /// In ar, this message translates to:
  /// **'قيم تطبيقنا'**
  String get rate;

  /// No description provided for @share.
  ///
  /// In ar, this message translates to:
  /// **'شارك التطبيق'**
  String get share;

  /// No description provided for @introduction.
  ///
  /// In ar, this message translates to:
  /// **'مقدمة عن التطبيق'**
  String get introduction;

  /// No description provided for @faq.
  ///
  /// In ar, this message translates to:
  /// **'الأسئلة الشائعة'**
  String get faq;

  /// No description provided for @terms.
  ///
  /// In ar, this message translates to:
  /// **'الشروط والأحكام'**
  String get terms;

  /// No description provided for @registerAs.
  ///
  /// In ar, this message translates to:
  /// **'التسجيل كمقدم خدمة'**
  String get registerAs;

  /// No description provided for @location.
  ///
  /// In ar, this message translates to:
  /// **'الموقع'**
  String get location;

  /// No description provided for @fill.
  ///
  /// In ar, this message translates to:
  /// **'تعبئة المعلومات'**
  String get fill;

  /// No description provided for @fillInfo.
  ///
  /// In ar, this message translates to:
  /// **' تعبئة معلومات الطلب'**
  String get fillInfo;

  /// No description provided for @calendar.
  ///
  /// In ar, this message translates to:
  /// **'التاريخ'**
  String get calendar;

  /// No description provided for @totalHours.
  ///
  /// In ar, this message translates to:
  /// **'مجموع الساعات'**
  String get totalHours;

  /// No description provided for @comments.
  ///
  /// In ar, this message translates to:
  /// **'التعليقات'**
  String get comments;

  /// No description provided for @agreeWith.
  ///
  /// In ar, this message translates to:
  /// **'موافق على سياسة الخصوصية للتطبيق'**
  String get agreeWith;

  /// No description provided for @continues.
  ///
  /// In ar, this message translates to:
  /// **'المتابعة'**
  String get continues;

  /// No description provided for @addAddress.
  ///
  /// In ar, this message translates to:
  /// **'أضف عنوان'**
  String get addAddress;

  /// No description provided for @done.
  ///
  /// In ar, this message translates to:
  /// **'تم'**
  String get done;

  /// No description provided for @dateCancel.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get dateCancel;

  /// No description provided for @hour.
  ///
  /// In ar, this message translates to:
  /// **'ساعة'**
  String get hour;

  /// No description provided for @addChild.
  ///
  /// In ar, this message translates to:
  /// **'أضف طفل'**
  String get addChild;

  /// No description provided for @nationality.
  ///
  /// In ar, this message translates to:
  /// **'الجنسية'**
  String get nationality;

  /// No description provided for @gender.
  ///
  /// In ar, this message translates to:
  /// **'الجنس'**
  String get gender;

  /// No description provided for @status.
  ///
  /// In ar, this message translates to:
  /// **'الحالة الإجتماعية'**
  String get status;

  /// No description provided for @edit.
  ///
  /// In ar, this message translates to:
  /// **'تعديل'**
  String get edit;

  /// No description provided for @editProfile.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الملف الشخصي'**
  String get editProfile;

  /// No description provided for @personalInformation.
  ///
  /// In ar, this message translates to:
  /// **'المعلومات الشخصية'**
  String get personalInformation;

  /// No description provided for @male.
  ///
  /// In ar, this message translates to:
  /// **'ذكر'**
  String get male;

  /// No description provided for @female.
  ///
  /// In ar, this message translates to:
  /// **'أنثى'**
  String get female;

  /// No description provided for @childAdd.
  ///
  /// In ar, this message translates to:
  /// **'إضافة طفل'**
  String get childAdd;

  /// No description provided for @specialNeeds.
  ///
  /// In ar, this message translates to:
  /// **'احتياجات خاصة'**
  String get specialNeeds;

  /// No description provided for @save.
  ///
  /// In ar, this message translates to:
  /// **'حفظ'**
  String get save;

  /// No description provided for @city.
  ///
  /// In ar, this message translates to:
  /// **'المدينة'**
  String get city;

  /// No description provided for @district.
  ///
  /// In ar, this message translates to:
  /// **'المنطقة'**
  String get district;

  /// No description provided for @street.
  ///
  /// In ar, this message translates to:
  /// **'الشارع'**
  String get street;

  /// No description provided for @building.
  ///
  /// In ar, this message translates to:
  /// **'رقم المبني'**
  String get building;

  /// No description provided for @floor.
  ///
  /// In ar, this message translates to:
  /// **'رقم الطابق'**
  String get floor;

  /// No description provided for @postal.
  ///
  /// In ar, this message translates to:
  /// **'الرمز البريدي'**
  String get postal;

  /// No description provided for @primary.
  ///
  /// In ar, this message translates to:
  /// **'رقم الجوال الرئيسي'**
  String get primary;

  /// No description provided for @secondary.
  ///
  /// In ar, this message translates to:
  /// **'رقم الجوال الفرعي'**
  String get secondary;

  /// No description provided for @setLocation.
  ///
  /// In ar, this message translates to:
  /// **'تحديد من خلال الخريطة'**
  String get setLocation;

  /// No description provided for @or.
  ///
  /// In ar, this message translates to:
  /// **'أو'**
  String get or;

  /// No description provided for @anAddress.
  ///
  /// In ar, this message translates to:
  /// **'العنوان'**
  String get anAddress;

  /// No description provided for @tools.
  ///
  /// In ar, this message translates to:
  /// **'الأدوات'**
  String get tools;

  /// No description provided for @message.
  ///
  /// In ar, this message translates to:
  /// **'الرسالة'**
  String get message;

  /// No description provided for @send.
  ///
  /// In ar, this message translates to:
  /// **'ارسال'**
  String get send;

  /// No description provided for @chooseLang.
  ///
  /// In ar, this message translates to:
  /// **'فصلاً اختر اللغة المفضلة لديك'**
  String get chooseLang;

  /// No description provided for @feedTitle.
  ///
  /// In ar, this message translates to:
  /// **'أجب على الأسئلة حسب تجربتك'**
  String get feedTitle;

  /// No description provided for @sad.
  ///
  /// In ar, this message translates to:
  /// **'حزين'**
  String get sad;

  /// No description provided for @neutral.
  ///
  /// In ar, this message translates to:
  /// **'محايد'**
  String get neutral;

  /// No description provided for @happy.
  ///
  /// In ar, this message translates to:
  /// **'سعيد'**
  String get happy;

  /// No description provided for @veryHappy.
  ///
  /// In ar, this message translates to:
  /// **'سعيد جداً '**
  String get veryHappy;

  /// No description provided for @addComment.
  ///
  /// In ar, this message translates to:
  /// **'أضف تعليقك:'**
  String get addComment;

  /// No description provided for @rateMessage.
  ///
  /// In ar, this message translates to:
  /// **'نرجو منك عميلنا العزيز تقييم الخدمة'**
  String get rateMessage;

  /// No description provided for @writeReview.
  ///
  /// In ar, this message translates to:
  /// **'أكتب تعليقك'**
  String get writeReview;

  /// No description provided for @rateButton.
  ///
  /// In ar, this message translates to:
  /// **'تقييم'**
  String get rateButton;

  /// No description provided for @shareWith.
  ///
  /// In ar, this message translates to:
  /// **'شاركه عبر'**
  String get shareWith;

  /// No description provided for @orShare.
  ///
  /// In ar, this message translates to:
  /// **'أو شاركه عبر الرابط'**
  String get orShare;

  /// No description provided for @serviceTypes.
  ///
  /// In ar, this message translates to:
  /// **'نوع الخدمة'**
  String get serviceTypes;

  /// No description provided for @perHour.
  ///
  /// In ar, this message translates to:
  /// **'الساعة'**
  String get perHour;

  /// No description provided for @enterPoint.
  ///
  /// In ar, this message translates to:
  /// **'أدخل النقاط'**
  String get enterPoint;

  /// No description provided for @am.
  ///
  /// In ar, this message translates to:
  /// **'ص'**
  String get am;

  /// No description provided for @morning.
  ///
  /// In ar, this message translates to:
  /// **'صباحباً '**
  String get morning;

  /// No description provided for @pm.
  ///
  /// In ar, this message translates to:
  /// **'م'**
  String get pm;

  /// No description provided for @night.
  ///
  /// In ar, this message translates to:
  /// **'مساءً '**
  String get night;

  /// No description provided for @coupon.
  ///
  /// In ar, this message translates to:
  /// **'كود الخصم'**
  String get coupon;

  /// No description provided for @totalPrice.
  ///
  /// In ar, this message translates to:
  /// **'اجمالي سعر الخدمة'**
  String get totalPrice;

  /// No description provided for @totalPrice2.
  ///
  /// In ar, this message translates to:
  /// **'اجمالي السعر بعد الخصم'**
  String get totalPrice2;

  /// No description provided for @all.
  ///
  /// In ar, this message translates to:
  /// **'الكل'**
  String get all;

  /// No description provided for @goToPay.
  ///
  /// In ar, this message translates to:
  /// **'الإنتقال لصفحة الدفع'**
  String get goToPay;

  /// No description provided for @map.
  ///
  /// In ar, this message translates to:
  /// **'تحديد الموقع '**
  String get map;

  /// No description provided for @close.
  ///
  /// In ar, this message translates to:
  /// **'إغلاق'**
  String get close;

  /// No description provided for @accountDelete.
  ///
  /// In ar, this message translates to:
  /// **'حذف الحساب'**
  String get accountDelete;

  /// No description provided for @permissionMas.
  ///
  /// In ar, this message translates to:
  /// **'التطبيق لا يمتلك صلاحية الوصول إالي موقعك'**
  String get permissionMas;

  /// No description provided for @allow.
  ///
  /// In ar, this message translates to:
  /// **'السماح'**
  String get allow;

  /// No description provided for @termAndConditionAccept.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن توافق على سياسة الخصوصية'**
  String get termAndConditionAccept;

  /// No description provided for @paymentResult.
  ///
  /// In ar, this message translates to:
  /// **'تمت عملية الدفع بنجاح'**
  String get paymentResult;

  /// No description provided for @paymentError.
  ///
  /// In ar, this message translates to:
  /// **'فشلت عملية الدفع'**
  String get paymentError;

  /// No description provided for @rateServiceMessage.
  ///
  /// In ar, this message translates to:
  /// **'شكراً لك على تقييمك! فهي تساعدنا على تقييمك بشكل أفضل.'**
  String get rateServiceMessage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
