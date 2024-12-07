
import 'package:kiwi/kiwi.dart';

import 'package:we_care/data/auth/data_source/authe_data_source.dart';


import 'package:we_care/data/others/data_source/data_source_contruct.dart';
import 'package:we_care/data/others/data_source/other_data_source.dart';

import 'package:we_care/domain/auth/repository/base_auth_repository.dart';
import 'package:we_care/domain/home/usecases/home_uscases.dart';

import 'package:we_care/domain/other/usecases/other_usecaces.dart';

import 'data/auth/data_source/data_source_contruct.dart';
import 'data/auth/repository/auth_repository.dart';
import 'data/home/data_source/data_source_contruct.dart';
import 'data/home/data_source/home_datasource.dart';
import 'data/home/repository/home_page_repository.dart';
import 'data/orders/data_source/data_source_contruct.dart';
import 'data/orders/data_source/orders_data_source.dart';
import 'data/orders/repository/order_repository.dart';
import 'data/others/repositry/other_repository.dart';

import 'data/services/data_source/data_source_contruct.dart';
import 'data/services/data_source/service_data_source.dart';
import 'data/services/repository/service_repository.dart';
import 'data/setting/aboutus_terms/datasource/aboutus_trem_data_source.dart';
import 'data/setting/aboutus_terms/datasource/data_source_contruct.dart';
import 'data/setting/aboutus_terms/repository/abutus_terms_repository.dart';
import 'data/setting/address/data_source/address_data_source.dart';
import 'data/setting/address/data_source/data_source_contruct.dart';
import 'data/setting/address/repository/address_repository.dart';
import 'data/setting/children/data_source/children_data_source.dart';
import 'data/setting/children/data_source/data_source_contruct.dart';
import 'data/setting/children/repository/child_repository.dart';
import 'data/setting/contact/dota_source/contact_data_source.dart';
import 'data/setting/contact/dota_source/data_source_contruct.dart';
import 'data/setting/contact/repository/contact_repository.dart';
import 'data/setting/faqandfeedback/data_source/data_source_contruct.dart';
import 'data/setting/faqandfeedback/data_source/faqandfeed_data_source.dart';
import 'data/setting/faqandfeedback/repository/faqandfeedback_repository.dart';
import 'domain/auth/usecases/auth_usecaces.dart';
import 'domain/home/repository/base_home_repository.dart';
import 'domain/orders/reposetry/base_order_reposetry.dart';
import 'domain/orders/uscases/orders_usecases.dart';
import 'domain/other/repository/base_other_repository.dart';
import 'domain/services/repositry/base_service_repositry.dart';
import 'domain/services/usecases/service_usecases.dart';
import 'domain/setting/aboutus_terms/repository/termsandabout.dart';
import 'domain/setting/aboutus_terms/usecases/tremsandaboutus.dart';
import 'domain/setting/address/repository/base_address_repository.dart';
import 'domain/setting/address/usecases/address_uscases.dart';
import 'domain/setting/children/repository/base_children_repository.dart';
import 'domain/setting/children/usecases/children_uscases.dart';
import 'domain/setting/cotactus/repository/base_contact_repository.dart';
import 'domain/setting/cotactus/uscases/contact_uscases.dart';
import 'domain/setting/faqandfeedback/repository/base_faq_and_feedback.dart';
import 'domain/setting/faqandfeedback/usecases/faq_and_feed_usecases.dart';

part 'injector.g.dart';

abstract class Injector {
  static late  KiwiContainer container;


  static final  resolve = container.resolve;
  void _configure(){
    _configureAuthUseCasesModule();
    _configureOtherUseCasesModule();
    _configureOrderUseCasesModule();
    _configureServiceUseCasesModule();
    _configureAddressUseCasesModule();
    _configureChildUseCasesModule();
    _configureContactUseCasesModule();
    _configureFAQUseCasesModule();
    _configureAboutAndTermsUseCasesModule();
    _configureHomePageUseCasesModule();
  }

///!AuthUseCasesModule
  void _configureAuthUseCasesModule() {
    _configureAuthUseCasesModuleInstances();
    _configureAuthUseCasesModuleFactories();
  }

  void _configureAuthUseCasesModuleInstances() {}

  @Register.factory(GetProfileUseCases)
  @Register.factory(SetProfileUseCases)
  @Register.factory(SignInUseCases )
  @Register.factory(SignUpUseCases)
  @Register.factory(SignUpCodeCheckUseCases)
  @Register.factory(ReSendCodeUseCases)
  @Register.factory( ForgetPassUseCases)
  @Register.factory( PassCodeCheckUseCases)
  @Register.factory( ResetPassUseCases)
  @Register.factory(CheckTokenUseCases)
  @Register.factory(SignOutUseCases )
  @Register.factory(DeactivateUseCases )
  @Register.factory(BaseAuthRepository, from: AuthRepository)
  @Register.factory(AuthBaseDataSource, from: AuthDataSource)
  void _configureAuthUseCasesModuleFactories();

  ///!OtherUseCasesModule
  void _configureOtherUseCasesModule() {
    _configureOtherUseCasesModuleInstances();
    _configureOtherUseCasesModuleFactories();
  }

  void _configureOtherUseCasesModuleInstances() {}
  @Register.factory( GetNotificationUseCase)
  @Register.factory(GetNationalityUseCase)
  @Register.factory(GetCitiesUseCase)
  @Register.factory(BaseOtherRepository, from: OtherRepository)
  @Register.factory(OtherBaseDataSource, from: OtherDataSource)
  void _configureOtherUseCasesModuleFactories();


  ///!OrdersCasesModule
  void _configureOrderUseCasesModule() {
    _configureOrderUseCasesModuleInstances();
    _configureOrderUseCasesModuleFactories();
  }

  void _configureOrderUseCasesModuleInstances() {}
  @Register.factory(GetAllOrdersUseCases)
  @Register.factory(CheckCouponUseCases)
  @Register.factory(FillOrderUseCases )
  @Register.factory(GetTaxTotalUseCases)
  @Register.factory(OrderCancellationUseCases)
  @Register.factory(OrderDetailsUseCases)
  @Register.factory(FilterOrdersUseCases)
  @Register.factory(OrderPaymentUseCases)
  @Register.factory( SetRateUseCases)
  @Register.factory(BaseOrderRepository, from: OrderRepository)
  @Register.factory(OrderBaseDataSource, from: OrderDataSource)
  void _configureOrderUseCasesModuleFactories();


  ///!serviceUseCasesModule
  void _configureServiceUseCasesModule() {
    _configureServiceUseCasesModuleInstances();
    _configureServiceUseCasesModuleFactories();
  }

  void _configureServiceUseCasesModuleInstances() {}
  @Register.factory( GetAllSections )
  @Register.factory(GetServicesFilter)
  @Register.factory(GetServicesBySectionId )
  @Register.factory(GetServiceById )
  @Register.factory(GetFavorite )
  @Register.factory(SetFavorite )
  @Register.factory(SetRate )
  @Register.factory(BaseServiceRepository, from: ServiceRepository)
  @Register.factory(ServiceBaseDataSource, from: ServiceDataSource)
  void _configureServiceUseCasesModuleFactories();


  ///!addressUseCasesModule
  void _configureAddressUseCasesModule() {
    _configureAddressUseCasesModuleInstances();
    _configureAddressUseCasesModuleFactories();
  }

  void _configureAddressUseCasesModuleInstances() {}
  @Register.factory( AddAddressUsCase)
  @Register.factory(GetAddressesUsCase)
  @Register.factory(RemoveAddressUsCase)
  @Register.factory(UpdateAddressUsCase )
  @Register.factory(BaseAddressRepository, from: AddressRepository)
  @Register.factory(AddressBaseDataSource, from: AddressDataSource)
  void _configureAddressUseCasesModuleFactories();

  ///!childrenUseCasesModule
  void _configureChildUseCasesModule() {
    _configureChildUseCasesModuleInstances();
    _configureChildUseCasesModuleFactories();
  }

  void _configureChildUseCasesModuleInstances() {}
  @Register.factory( AddChildUsCase)
  @Register.factory(GetChildrenUsCase)
  @Register.factory(RemoveChildUsCase)
  @Register.factory(UpdateChildUsCase )
  @Register.factory(BaseChildrenRepository, from: ChildrenRepository)
  @Register.factory(ChildrenBaseDataSource, from: ChildrenDataSource)
  void _configureChildUseCasesModuleFactories();

  ///!contactUseCasesModule
  void _configureContactUseCasesModule() {
    _configureContactUseCasesModuleInstances();
    _configureContactUseCasesModuleFactories();
  }

  void _configureContactUseCasesModuleInstances() {}
  @Register.factory( GetContactUsCase)
  @Register.factory(SetContactUsCase)
  @Register.factory(BaseContactRepository, from: ContactRepository)
  @Register.factory(BaseContactDataSource, from: ContactDataSource)
  void _configureContactUseCasesModuleFactories();

  ///!fqa and feed UseCasesModule
  void _configureFAQUseCasesModule() {
    _configureFAQUseCasesModuleInstances();
    _configureFAQUseCasesModuleFactories();
  }

  void _configureFAQUseCasesModuleInstances() {}
  @Register.factory( GetFeedUseCases)
  @Register.factory(GetFAQUseCases)
  @Register.factory(SetFeedUsCase)
  @Register.factory(BaseFAQRepository, from: FQARepository)
  @Register.factory(BaseFAQDataSource, from: FAQDataSource)
  void _configureFAQUseCasesModuleFactories();

  ///!about us  and terms UseCasesModule
  void _configureAboutAndTermsUseCasesModule() {
    _configureAboutAndTermsUseCasesModuleInstances();
    _configureAboutAndTermsCasesModuleFactories();
  }

  void _configureAboutAndTermsUseCasesModuleInstances() {}
  @Register.factory( GetAboutUsCase)
  @Register.factory(GetTermsUsCase)
  @Register.factory(BaseTermsAndAboutUsRepository, from: AboutUsAndTermsRepository)
  @Register.factory(BaseAboutAndTermDataSource, from: AboutAnaTermDataSource)
  void _configureAboutAndTermsCasesModuleFactories();

  ///!home page UseCasesModule
  void _configureHomePageUseCasesModule() {
    _configureHomePageUseCasesModuleInstances();
    _configureHomePageCasesModuleFactories();
  }

  void _configureHomePageUseCasesModuleInstances() {}
  @Register.factory(GetHomeUseCases)
  @Register.factory(GetHomeServicesUseCases)
  @Register.factory(BaseHomeRepository, from: HomePageRepository)
  @Register.factory(HoneBaseDataSource, from: HomeDataSource)
  void _configureHomePageCasesModuleFactories();

  static void setup() {
    container=KiwiContainer();
    var injector = _$Injector();
    injector._configure();
  }


}
