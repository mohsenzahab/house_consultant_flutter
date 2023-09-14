// import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/core/values/constants.dart';
import 'package:mobile/app/core/values/durations.dart';
import 'package:mobile/app/data/enums/gender.dart';
import 'package:mobile/app/data/models/birthday_date.dart';
import 'package:mobile/app/data/models/general_data_form.dart';
import 'package:mobile/app/modules/register/data/enums/verification_method.dart';
import 'package:mobile/app/modules/register/widgets/group_checkbox_form_field.dart';
import 'package:mobile/app/modules/register/widgets/group_radio_form_field.dart';
import 'package:mobile/app/widgets/dropdown_picker.dart';
import 'package:mobile/app/widgets/form_fields/date_picker_button_form_field.dart';
import 'package:mobile/app/widgets/text_form_field.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: const FlutterLogo()),
        body: SafeArea(
          child: WillPopScope(
            onWillPop: () async {
              return await showDialog<bool>(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: Text(Constants.messageAlertCloseForm),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text('Cancel')),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red)),
                                onPressed: () => Navigator.pop(context, true),
                                child: Text('OK'))
                          ],
                        );
                      }) ??
                  false;
            },
            child: GetBuilder<RegisterController>(
                id: controller.idBodyBuilder,
                builder: (c) {
                  if (!c.initialFormDataLoaded) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  } else {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: controller.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            // padding: kPaddingDefault,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: MTextFormFiled(
                                        label: 'Name',
                                        initialValue: controller.name,
                                        onSaved: (newValue) =>
                                            controller.name = newValue,
                                        validator: controller.nameValidator),
                                  ),
                                  kSpaceHorizontal8,
                                  Expanded(
                                      child: MTextFormFiled(
                                    label: 'Surname',
                                    initialValue: controller.surname,
                                    onSaved: (newValue) =>
                                        controller.surname = newValue,
                                    validator: controller.surnameValidator,
                                  ))
                                ],
                              ),
                              kSpaceVertical8,
                              DropDownPicker<UserType>(
                                hint: 'User Type',
                                items: controller.userTypes,
                                onItemSelected: (selectedItem) =>
                                    controller.userType = selectedItem,
                                validator: controller.userTypeValidator,
                              ),
                              kSpaceVertical8,
                              _createOfficeNamePicker(),
                              kSpaceVertical8,
                              MTextFormFiled(
                                label: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                initialValue: controller.email,
                                onSaved: (newValue) =>
                                    controller.email = newValue,
                                validator: controller.emailValidator,
                              ),
                              kSpaceVertical8,
                              IntlPhoneField(
                                keyboardType: TextInputType.phone,
                                initialValue: controller.phone,

                                onChanged: (newValue) =>
                                    controller.phone = newValue.completeNumber,
                                // validator: controller.phoneValidator,
                              ),
                              // kSpaceVertical32,
                              _createPasswordField(context),
                              kSpaceVertical8,
                              MTextFormFiled(
                                label: 'Re-Type Password',
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                initialValue: controller.password,
                                validator: controller.passwordRetypeValidator,
                              ),
                              kSpaceVertical16,
                              MTextFormFiled(
                                label: 'Kimlik No.',
                                keyboardType: TextInputType.number,
                                initialValue: controller.kimlikNo,
                                onSaved: (newValue) =>
                                    controller.kimlikNo = newValue,
                                validator: controller.kimlikValidator,
                              ),
                              kSpaceVertical8,
                              Row(
                                children: [
                                  Expanded(
                                      child: DatePickerButtonFormField(
                                    initialValue: controller.birthDate?.date,
                                    title: 'Birth Date',
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: controller.birthDateValidator,
                                    onChanged: (date) {
                                      controller.birthDate = date == null
                                          ? null
                                          : BirthdayDate(date: date);
                                    },
                                  )),
                                  kSpaceHorizontal8,
                                  Expanded(
                                    child: DropDownPicker<Gender>(
                                        hint: 'Gender',
                                        items: Gender.values,
                                        value: controller.gender,
                                        onItemSelected: (item) =>
                                            controller.gender = item,
                                        validator: controller.genderValidator),
                                  )
                                ],
                              ),
                              kSpaceVertical8,
                              Row(
                                children: [
                                  Expanded(
                                      child: DropDownPicker<Country>(
                                    hint: 'Country',
                                    items: controller.countries,
                                    value: controller.country,
                                    onItemSelected: (item) =>
                                        controller.country = item,
                                    validator: controller.countryValidator,
                                  )),
                                  kSpaceHorizontal8,
                                  Expanded(
                                      child: GetBuilder<RegisterController>(
                                    id: controller.idCitiesBuilder,
                                    builder: (_) {
                                      return DropDownPicker<City>(
                                        hint: 'City',
                                        items: controller.cities ?? [],
                                        value: controller.city,
                                        onItemSelected: (item) =>
                                            controller.city = item,
                                        validator: controller.cityValidator,
                                      );
                                    },
                                  ))
                                ],
                              ),
                              kSpaceVertical8,
                              Row(
                                children: [
                                  Expanded(
                                    child: GetBuilder<RegisterController>(
                                      id: controller.idRegionsBuilder,
                                      builder: (_) {
                                        return DropDownPicker<Region>(
                                            hint: 'Region',
                                            items: controller.regions ?? [],
                                            value: controller.region,
                                            onItemSelected: (item) =>
                                                controller.region = item,
                                            validator:
                                                controller.regionValidator);
                                      },
                                    ),
                                  ),
                                  kSpaceHorizontal8,
                                  Expanded(
                                      child: GetBuilder<RegisterController>(
                                    id: controller.idSubregionsBuilder,
                                    builder: (_) {
                                      return DropDownPicker<Subregion>(
                                        hint: 'Sub Region / Address',
                                        value: controller.subregion,
                                        items: controller.subregions ?? [],
                                        onItemSelected: (newValue) =>
                                            controller.subregion = newValue!,
                                        validator:
                                            controller.subregionValidator,
                                      );
                                    },
                                  )),
                                  // Expanded(
                                  //     child: MTextFormFiled(
                                  //   label: 'Sub Region / Address',
                                  //   keyboardType: TextInputType.streetAddress,
                                  //   initialValue: controller.addr,
                                  //   onSaved: (newValue) =>
                                  //       controller.addr = newValue!,
                                  //   validator: controller.addrValidator,
                                  // )),
                                ],
                              ),
                              kSpaceVertical8,
                              DropDownPicker<Currency>(
                                hint: 'Currency',
                                value: controller.currency,
                                items: controller.currencies,
                                onItemSelected: (newValue) =>
                                    controller.currency = newValue!,
                                validator: controller.currencyValidator,
                              ),
                              kSpaceVertical8,
                              MTextFormFiled(
                                label: 'Invitation Code',
                                keyboardType: TextInputType.number,
                                initialValue: controller.invitationCode,
                                onSaved: (newValue) =>
                                    controller.invitationCode = newValue,
                                validator: controller.invitationCodeValidator,
                              ),
                              kSpaceVertical8,
                              MTextFormFiled(
                                label: 'Discount Code',
                                keyboardType: TextInputType.number,
                                initialValue: controller.discountCode,
                                onSaved: (newValue) =>
                                    controller.discountCode = newValue,
                                validator: controller.discountCodeValidator,
                              ),
                              kSpaceVertical8,
                              GroupCheckboxFormField<String>(
                                title: 'Languages',
                                options: controller.languages,
                                onChanged: (langs) =>
                                    controller.languages = langs,
                                validator: controller.languagesValidator,
                              ),
                              kSpaceVertical8,
                              GroupRadioFormField<VerificationMethod>(
                                  title: 'Verification',
                                  options: VerificationMethod.values,
                                  initialValue: controller.verificationMethod,
                                  validator:
                                      controller.verificationMethodValidator,
                                  onChanged: ((selectedItem) => controller
                                      .verificationMethod = selectedItem)),
                              kSpaceVertical8,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: controller.uploadDocs,
                                      child: const Text('Upload Documents')),
                                  kSpaceHorizontal8,
                                  ElevatedButton(
                                      onPressed: controller.uploadPhoto,
                                      child: const Text('Upload Photo')),
                                ],
                              ),
                              FractionallySizedBox(
                                widthFactor: 0.4,
                                child: ElevatedButton(
                                    onPressed: controller.createAccount,
                                    child: const Text('Create Account')),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }),
          ),
        ));
  }

  FancyPasswordField _createPasswordField(BuildContext context) {
    return FancyPasswordField(
      decoration: const InputDecoration()
          .applyDefaults(Theme.of(context).inputDecorationTheme)
          .copyWith(labelText: 'Password'),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validationRules: {MinAndMaxCharactersValidationRule(min: 4, max: 8)},
      hasStrengthIndicator: false,
      validationRuleBuilder: ((rules, value) {
        if (value.isEmpty) {
          return const SizedBox.shrink();
        }
        Widget? widget;
        for (ValidationRule rule in rules) {
          if (!rule.validate(value)) {
            widget = Text(
              rule.name,
              style: const TextStyle(color: Colors.red),
            );
            break;
          }
        }
        return AnimatedAlign(
          alignment: Alignment.centerLeft,
          heightFactor: widget == null ? 0 : 1,
          duration: kDurationShowError,
          child: widget,
        );
      }),
      initialValue: controller.password,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (newValue) => controller.password = newValue,
      validator: controller.passwordValidator,
    );
  }

  DropdownSearch<Office> _createOfficeNamePicker() {
    return DropdownSearch<Office>(
        popupProps: const PopupProps.menu(
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
                decoration: InputDecoration(labelText: 'Search'))),
        clearButtonProps: const ClearButtonProps(
          isVisible: true,
        ),
        dropdownButtonProps: DropdownButtonProps(
            padding: EdgeInsets.zero,
            icon: kDecorationDropDownPicker.suffixIcon!),
        dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
                suffixIcon: kDecorationDropDownPicker.suffixIcon,
                contentPadding: kDecorationDropDownPicker.contentPadding,
                hintText: 'Office name')),
        items: controller.offices,
        onChanged: ((value) => controller.office = value));
  }
}
