



import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/presentation/providers/provider_list/providers_export.dart';


/// MediaQuery
extension ScreanSizeEx on BuildContext {
  double get w => MediaQuery.of(this).size.width;
  double get h => MediaQuery.of(this).size.height;
}
/// providers
extension ProviderEx on BuildContext {
  AuthProvider get authProvider => Provider.of<AuthProvider>(this);

  AuthProvider get authProviderF =>
      Provider.of<AuthProvider>(this, listen: false);

  FormsProvider get formsProvider => Provider.of<FormsProvider>(this);

  FormsProvider get formsProviderF =>
      Provider.of<FormsProvider>(this, listen: false);

  OrderProvider get ordersProvider => Provider.of<OrderProvider>(this);

  OrderProvider get ordersProviderF =>
      Provider.of<OrderProvider>(this, listen: false);

  ProfileProvider get profileProvider => Provider.of<ProfileProvider>(this);

  ProfileProvider get profileProviderF =>
      Provider.of<ProfileProvider>(this, listen: false);

  SharedPreferenceProvider get preferenceProvider =>
      Provider.of<SharedPreferenceProvider>(this);

  SharedPreferenceProvider get preferenceProviderF =>
      Provider.of<SharedPreferenceProvider>(this, listen: false);

  HomeProvider get homeProvider => Provider.of<HomeProvider>(this);

  HomeProvider get homeProviderF =>
      Provider.of<HomeProvider>(this, listen: false);

  FeedProvider get feedProvider => Provider.of<FeedProvider>(this);

  FeedProvider get feedProviderF =>
      Provider.of<FeedProvider>(this, listen: false);

  ServicesProvider get servicesProvider => Provider.of<ServicesProvider>(this);

  ServicesProvider get servicesProviderF =>
      Provider.of<ServicesProvider>(this, listen: false);

  ChildrenProvider get childrenProvider => Provider.of<ChildrenProvider>(this);

  ChildrenProvider get childrenProviderF =>
      Provider.of<ChildrenProvider>(this, listen: false);

  AddressProvider get addressProvider => Provider.of<AddressProvider>(this);

  AddressProvider get addressProviderF =>
      Provider.of<AddressProvider>(this, listen: false);

  ContactProvider get contactProvider => Provider.of<ContactProvider>(this);

  ContactProvider get contactProviderF =>
      Provider.of<ContactProvider>(this, listen: false);

  AboutUsProvider get aboutUsProvider => Provider.of<AboutUsProvider>(this);

  AboutUsProvider get aboutUsProviderF =>
      Provider.of<AboutUsProvider>(this, listen: false);

  FAQProvider get fAQProvider => Provider.of<FAQProvider>(this);

  FAQProvider get fAQProviderF => Provider.of<FAQProvider>(this, listen: false);

  TermsProvider get termsProvider => Provider.of<TermsProvider>(this);

  TermsProvider get termsProviderF =>
      Provider.of<TermsProvider>(this, listen: false);
  NotificationProvider get notificationProvider => Provider.of<NotificationProvider>(this);

  NotificationProvider get notificationProviderF =>
      Provider.of<NotificationProvider>(this, listen: false);
}
///  App localizations
extension Applocalizations on BuildContext {
  AppLocalizations? get lang => AppLocalizations.of(this);
}
///  App navigators
extension Navigators on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
}