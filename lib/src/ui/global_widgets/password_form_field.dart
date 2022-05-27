import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    Key key,
    this.focusNode,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.textInputAction,
    this.labelText = "Password",
    this.hintText = '*****',
    this.errorText,
    this.prefixIcon,
    this.validator,
  }) : super(key: key);
  final FocusNode focusNode;
  final Function(String) onChanged;
  final Function(String) onSaved;
  final Function(String) onFieldSubmitted;
  final TextInputAction textInputAction;
  final String labelText;
  final String hintText;
  final String errorText;
  final Widget prefixIcon;
  final FormFieldValidator<String> validator;
  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      autocorrect: false,
      enableSuggestions: false,
      onSaved: widget.onSaved,
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.text,
      obscureText: _hidePassword,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
          color: Colors.black,
          icon: Icon(_hidePassword ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
