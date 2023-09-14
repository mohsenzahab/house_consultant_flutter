import 'package:flutter/material.dart';

class MTextFormFiled extends StatelessWidget {
  const MTextFormFiled(
      {Key? key,
      this.label,
      this.onSaved,
      this.validator,
      this.keyboardType,
      this.obscureText = false,
      this.suffix,
      this.initialValue})
      : super(key: key);

  final String? label;
  final String? suffix;
  final String? initialValue;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration()
          .applyDefaults(Theme.of(context).inputDecorationTheme)
          .copyWith(
              suffixText: suffix,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              labelText: label),
      onSaved: onSaved,
      validator: validator,
    );
  }
}
