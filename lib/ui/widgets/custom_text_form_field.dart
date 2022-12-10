import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.borderStyle,
    required this.title,
  }) : super(key: key);

  final TextEditingController controller;
  final OutlineInputBorder borderStyle;
  final String title;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool? isVisible;

  @override
  void initState() {
    isVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.title == 'email'
              ? 'Email must be full'
              : 'Password must be full';
        }
        if (widget.title == 'email') {
          if (value.contains('@') == false) {
            return 'Email must have @';
          }
        } else {
          if (value.length < 8) {
            return 'Password must be at least 8 letters or numbers';
          }
        }
        return null;
      },
      obscureText: widget.title == 'email' ? false : !isVisible!,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.title == 'email' ? Icons.alternate_email : Icons.key,
          color: Colors.black,
        ),
        suffixIcon: widget.title == 'email'
            ? null
            : IconButton(
                icon:
                    Icon(isVisible! ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible!;
                  });
                },
                color: Colors.black,
              ),
        enabledBorder: widget.borderStyle,
        errorBorder: widget.borderStyle,
        hintText: widget.title == 'email' ? 'zzzzz@gmail.com' : '********',
        border: widget.borderStyle,
      ),
      keyboardType: widget.title == 'email'
          ? TextInputType.emailAddress
          : TextInputType.visiblePassword,
    );
  }
}
