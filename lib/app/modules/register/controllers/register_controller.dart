import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/error/error_handler.dart';
import 'package:mobile/app/core/error/exceptions.dart';
import 'package:mobile/app/core/error/failures.dart';
import 'package:mobile/app/core/values/constants.dart';
import 'package:mobile/app/data/enums/gender.dart';
import 'package:mobile/app/data/models/birthday_date.dart';
import 'package:mobile/app/data/models/general_data_form.dart';
import 'package:mobile/app/data/models/user/user_data.dart';
import 'package:mobile/app/modules/register/data/enums/verification_method.dart';
import 'package:mobile/app/modules/register/data/register_api.dart';
import 'package:mobile/app/modules/register/data/register_repository.dart';
import 'package:mobile/app/modules/register/views/verification_view.dart';
import 'package:mobile/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  VerificationMethod? verificationMethod;

  int? _discountCode;

  String? addr;

  Region? _region;

  Office? office;

  set region(Region? region) {
    if (region == null) {
      if (subregions == null) return;
      subregions = null;
      update([idCitiesBuilder]);
    }
    _region = region;
    handleFutureErrors<List<Subregion>>(repository.getSubregions(region!))
        .then((value) {
      subregions = value;
      update([idSubregionsBuilder]);
    });
  }

  Region? get region => _region;

  Subregion? subregion;

  City? _city;

  set city(City? city) {
    if (city == null) {
      if (regions == null) return;
      regions = null;
      update([idRegionsBuilder]);
    }
    _city = city;
    handleFutureErrors(repository.getRegions(city!)).then((value) {
      regions = value;
      update([idRegionsBuilder]);
    });
  }

  City? get city => _city;

  Country? _country;

  set country(Country? country) {
    if (country == null) {
      if (cities == null) return;
      cities = null;
      update([idCitiesBuilder]);
    }
    _country = country;
    handleFutureErrors(repository.getCities(country!)).then((value) {
      cities = value;
      update([idCitiesBuilder]);
    });
  }

  Country? get country => _country;

  Gender? gender;

  BirthdayDate? birthDate;

  String? password;

  int? _kimlikNo;

  String? email;

  String? phone;

  UserType? userType;

  String? surname;

  String? name;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int idBodyBuilder = 0;
  int idCitiesBuilder = 1;
  int idRegionsBuilder = 2;
  int idSubregionsBuilder = 3;

  String? get kimlikNo => _kimlikNo?.toString();
  set kimlikNo(String? value) => _kimlikNo = parse(value);

  String? get discountCode => _discountCode?.toString();

  set discountCode(String? value) => _discountCode = parse(value);

  int? _invitationCode;
  String? get invitationCode => _invitationCode?.toString();

  set invitationCode(String? value) => _invitationCode = parse(value);

  Currency? currency;

  int? parse(String? value) => value == null || value.trim().isEmpty
      ? null
      : int.tryParse(value.toString());

  var languages = {
    'Fa': false,
    'En': false,
    'Ar': false,
    'Tur': false,
    'Russ': false
  };

  late List<UserType> userTypes;
  late List<Office> offices;
  late List<Country> countries;
  List<City>? cities;
  List<Region>? regions;
  List<Subregion>? subregions;
  late List<Currency> currencies;

  late final RegisterRepository repository;
  bool initialFormDataLoaded = false;
  bool isThereError = false;
  String? errorTitle;
  String? errorMessage;

  void init(RegisterRepository registerRepository) async {
    repository = registerRepository;
    await _fetchFormInitialData();
  }

  Future<void> _fetchFormInitialData() async {
    try {
      await _waitForFormData();
      initialFormDataLoaded = true;
      update([idBodyBuilder]);
    } on ServerException catch (e) {
      isThereError = true;
      errorTitle = e.runtimeType.toString();
      errorMessage = e.message;
    }
  }

  Future<void> _waitForFormData() async {
    await Future.wait([
      repository.getUserTypes().then((value) => userTypes = value),
      repository.getOffices().then((value) => offices = value),
      repository.getCountries().then((value) => countries = value),
      repository.getCurrencies().then((value) => currencies = value)
    ]);
  }

  @override
  void onReady() {
    if (isThereError) {
      showErrorMessageSnackBar(
          errorTitle!, errorMessage ?? Constants.messageServerFailure);
    }
    super.onReady();
  }

  void toLoginPage() => Get.offAndToNamed(Routes.LOGIN);

  void createAccount() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final data = UserData(
          idNumber: kimlikNo,
          name: name!,
          sureName: surname!,
          email: email!,
          password: password!,
          userType: userType!,
          saleOffice: office!,
          currency: currency!,
          gender: gender!,
          birthday: birthDate!,
          country: country!,
          city: city!,
          region: region!,
          subregion: subregion!,
          inviteCode: invitationCode,
          discountCode: discountCode,
          phone: phone);
      final result = await repository.registerUser(data);
      result.fold(handleFailure, (token) {
        // register success
        Get.snackbar(Constants.messageRegisterSuccess, token);
        // Get.to(() => VerificationView(), transition: Transition.rightToLeft);
      });
    }
  }

  void uploadPhoto() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
    } else {
      // User canceled the picker
    }
  }

  Future<void> uploadDocs() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
    } else {
      // User canceled the picker
    }
  }

  String? discountCodeValidator(String? value) {
    value = value?.trim();
    debugPrint(value);
    if (value != null && value.trim().isNotEmpty && !value.isNum) {
      return 'Wrong Input';
    }
    return null;
  }

  String? invitationCodeValidator(String? value) {
    value = value?.trim();
    debugPrint(value);
    if (value != null && value.trim().isNotEmpty && !value.isNum) {
      return 'Wrong Input';
    }
    return null;
  }

  String? addrValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Provide your Sub Region or Address';
    }
    return null;
  }

  String? regionValidator(Region? value) {
    if (value == null) {
      return 'Select Region';
    }
    return null;
  }

  String? cityValidator(City? value) {
    if (value == null) {
      return 'Select City';
    }
    return null;
  }

  String? countryValidator(Country? value) {
    if (value == null) {
      return 'Select Country';
    }
    return null;
  }

  String? genderValidator(Gender? value) {
    if (value == null) {
      return 'Select your gender';
    }
    return null;
  }

  String? kimlikValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Provide Kimlik number';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  String? passwordRetypeValidator(String? value) {
    if (value == null || value != password) {
      return 'Retype password dose not match typed password';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!EmailValidator.validate(value)) {
      return 'Wrong email address';
    }
    return null;
  }

  String? userTypeValidator(UserType? value) {
    if (value == null) {
      return 'Select User Type';
    }
    return null;
  }

  String? surnameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Surname is required';
    }
    return null;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? verificationMethodValidator(VerificationMethod? value) {
    if (value == null) {
      return 'Select a verification method';
    }
    return null;
  }

  String? languagesValidator(Map<String, bool>? value) {
    if (value == null || value.isEmpty || !value.values.contains(true)) {
      return 'Select at least one language';
    }
    return null;
  }

  String? birthDateValidator(DateTime? value) {
    if (value == null) {
      return 'Birth date is required';
    }
    return null;
  }

  String? subregionValidator(Subregion? value) {
    if (value == null) {
      return 'subregion is required';
    }
    return null;
  }

  String? currencyValidator(Currency? value) {
    if (value == null) {
      return 'currency is required';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    return null;
  }
}
