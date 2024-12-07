// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureAuthUseCasesModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) =>
          GetProfileUseCases(baseAuthRepository: c<BaseAuthRepository>()))
      ..registerFactory((c) =>
          SetProfileUseCases(baseAuthRepository: c<BaseAuthRepository>()))
      ..registerFactory(
          (c) => SignInUseCases(baseAuthRepository: c<BaseAuthRepository>()))
      ..registerFactory(
          (c) => SignUpUseCases(baseAuthRepository: c<BaseAuthRepository>()))
      ..registerFactory((c) =>
          SignUpCodeCheckUseCases(baseAuthRepository: c<BaseAuthRepository>()))
      ..registerFactory((c) =>
          ReSendCodeUseCases(baseAuthRepository: c<BaseAuthRepository>()))
      ..registerFactory((c) =>
          ForgetPassUseCases(baseAuthRepository: c<BaseAuthRepository>()))
      ..registerFactory((c) =>
          PassCodeCheckUseCases(baseAuthRepository: c<BaseAuthRepository>()))
      ..registerFactory(
          (c) => ResetPassUseCases(baseAuthRepository: c<BaseAuthRepository>()))
      ..registerFactory((c) =>
          CheckTokenUseCases(baseAuthRepository: c<BaseAuthRepository>()))
      ..registerFactory(
          (c) => SignOutUseCases(baseAuthRepository: c<BaseAuthRepository>()))
      ..registerFactory(
          (c) => DeactivateUseCases(baseAuthRepository: c<BaseAuthRepository>()))
      ..registerFactory<BaseAuthRepository>(
          (c) => AuthRepository(c<AuthBaseDataSource>()))
      ..registerFactory<AuthBaseDataSource>((c) => AuthDataSource());
  }

  @override
  void _configureOtherUseCasesModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) =>
          GetNotificationUseCase(baseOtherRepository: c<BaseOtherRepository>()))
      ..registerFactory((c) =>
          GetNationalityUseCase(baseOtherRepository: c<BaseOtherRepository>()))
      ..registerFactory((c) =>
          GetCitiesUseCase(baseOtherRepository: c<BaseOtherRepository>()))
      ..registerFactory<BaseOtherRepository>(
          (c) => OtherRepository(c<OtherBaseDataSource>()))
      ..registerFactory<OtherBaseDataSource>((c) => OtherDataSource());
  }

  @override
  void _configureOrderUseCasesModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) =>
          GetAllOrdersUseCases(baseOrderRepository: c<BaseOrderRepository>()))
      ..registerFactory((c) =>
          CheckCouponUseCases(baseOrderRepository: c<BaseOrderRepository>()))
      ..registerFactory((c) =>
          FillOrderUseCases(baseOrderRepository: c<BaseOrderRepository>()))
      ..registerFactory((c) =>
          GetTaxTotalUseCases(baseOrderRepository: c<BaseOrderRepository>()))
      ..registerFactory((c) => OrderCancellationUseCases(
          baseOrderRepository: c<BaseOrderRepository>()))
      ..registerFactory((c) =>
          OrderDetailsUseCases(baseOrderRepository: c<BaseOrderRepository>()))
      ..registerFactory((c) =>
          FilterOrdersUseCases(baseOrderRepository: c<BaseOrderRepository>()))
      ..registerFactory((c) =>
          OrderPaymentUseCases(baseOrderRepository: c<BaseOrderRepository>()))
      ..registerFactory(
          (c) => SetRateUseCases(baseOrderRepository: c<BaseOrderRepository>()))
      ..registerFactory<BaseOrderRepository>(
          (c) => OrderRepository(c<OrderBaseDataSource>()))
      ..registerFactory<OrderBaseDataSource>((c) => OrderDataSource());
  }

  @override
  void _configureServiceUseCasesModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) =>
          GetAllSections(baseServiceRepository: c<BaseServiceRepository>()))
      ..registerFactory((c) =>
          GetServicesFilter(baseServiceRepository: c<BaseServiceRepository>()))
      ..registerFactory((c) => GetServicesBySectionId(
          baseServiceRepository: c<BaseServiceRepository>()))
      ..registerFactory((c) =>
          GetServiceById(baseServiceRepository: c<BaseServiceRepository>()))
      ..registerFactory(
          (c) => GetFavorite(baseServiceRepository: c<BaseServiceRepository>()))
      ..registerFactory(
          (c) => SetFavorite(baseServiceRepository: c<BaseServiceRepository>()))
      ..registerFactory(
              (c) => SetRate(baseServiceRepository: c<BaseServiceRepository>()))
      ..registerFactory<BaseServiceRepository>(
          (c) => ServiceRepository(c<ServiceBaseDataSource>()))
      ..registerFactory<ServiceBaseDataSource>((c) => ServiceDataSource());
  }

  @override
  void _configureAddressUseCasesModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) =>
          AddAddressUsCase(baseAddressRepository: c<BaseAddressRepository>()))
      ..registerFactory((c) =>
          GetAddressesUsCase(baseAddressRepository: c<BaseAddressRepository>()))
      ..registerFactory((c) => RemoveAddressUsCase(
          baseAddressRepository: c<BaseAddressRepository>()))
      ..registerFactory((c) => UpdateAddressUsCase(
          baseAddressRepository: c<BaseAddressRepository>()))
      ..registerFactory<BaseAddressRepository>(
          (c) => AddressRepository(dataSource: c<AddressBaseDataSource>()))
      ..registerFactory<AddressBaseDataSource>((c) => AddressDataSource());
  }

  @override
  void _configureChildUseCasesModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) =>
          AddChildUsCase(baseChildrenRepository: c<BaseChildrenRepository>()))
      ..registerFactory((c) => GetChildrenUsCase(
          baseChildrenRepository: c<BaseChildrenRepository>()))
      ..registerFactory((c) => RemoveChildUsCase(
          baseChildrenRepository: c<BaseChildrenRepository>()))
      ..registerFactory((c) => UpdateChildUsCase(
          baseChildrenRepository: c<BaseChildrenRepository>()))
      ..registerFactory<BaseChildrenRepository>(
          (c) => ChildrenRepository(dataSource: c<ChildrenBaseDataSource>()))
      ..registerFactory<ChildrenBaseDataSource>((c) => ChildrenDataSource());
  }

  @override
  void _configureContactUseCasesModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) =>
          GetContactUsCase(baseContactRepository: c<BaseContactRepository>()))
      ..registerFactory((c) =>
          SetContactUsCase(baseContactRepository: c<BaseContactRepository>()))
      ..registerFactory<BaseContactRepository>(
          (c) => ContactRepository(dataSource: c<BaseContactDataSource>()))
      ..registerFactory<BaseContactDataSource>((c) => ContactDataSource());
  }

  @override
  void _configureFAQUseCasesModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory(
          (c) => GetFeedUseCases(baseFAQRepository: c<BaseFAQRepository>()))
      ..registerFactory(
          (c) => GetFAQUseCases(baseFAQRepository: c<BaseFAQRepository>()))
      ..registerFactory(
          (c) => SetFeedUsCase(baseFAQRepository: c<BaseFAQRepository>()))
      ..registerFactory<BaseFAQRepository>(
          (c) => FQARepository(dataSource: c<BaseFAQDataSource>()))
      ..registerFactory<BaseFAQDataSource>((c) => FAQDataSource());
  }

  @override
  void _configureAboutAndTermsCasesModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => GetAboutUsCase(
          baseTermsAndAboutUsRepository: c<BaseTermsAndAboutUsRepository>()))
      ..registerFactory((c) => GetTermsUsCase(
          baseTermsAndAboutUsRepository: c<BaseTermsAndAboutUsRepository>()))
      ..registerFactory<BaseTermsAndAboutUsRepository>((c) =>
          AboutUsAndTermsRepository(
              dataSource: c<BaseAboutAndTermDataSource>()))
      ..registerFactory<BaseAboutAndTermDataSource>(
          (c) => AboutAnaTermDataSource());
  }

  @override
  void _configureHomePageCasesModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory(
          (c) => GetHomeUseCases(baseHomeRepository: c<BaseHomeRepository>()))
      ..registerFactory(
              (c) => GetHomeServicesUseCases(baseHomeRepository: c<BaseHomeRepository>()))
      ..registerFactory<BaseHomeRepository>(
          (c) => HomePageRepository(dataSource: c<HoneBaseDataSource>()))
      ..registerFactory<HoneBaseDataSource>((c) => HomeDataSource());
  }
}
