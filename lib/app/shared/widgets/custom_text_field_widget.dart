import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:pjorclt/app/shared/style/colors.dart';

class DefaultTextFieldWidget extends StatefulWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Function? onTap;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? disable;
  final bool? autoFocus;
  final FocusNode? focusNode;
  final String? message;
  final int? lines;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  final void Function(String?)? onValidator;

  DefaultTextFieldWidget({
    this.hintText,
    this.keyboardType,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.obscureText = false,
    this.disable = false,
    this.focusNode,
    this.autoFocus = false,
    this.message,
    this.onChanged,
    this.onValidator,
    this.lines = 1,
    this.inputFormatters,
  });

  @override
  _DefaultTextFieldWidgetState createState() => _DefaultTextFieldWidgetState();
}

class _DefaultTextFieldWidgetState extends State<DefaultTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TextFormField(
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText ?? false,
          controller: widget.controller,
          onChanged: widget.onChanged,
          readOnly: widget.onTap != null,
          inputFormatters: widget.inputFormatters ?? [],
          validator: (text) {
            if (text == null) {
              return "Campo não pode ser vazio";
            }
            return null;
          },
          maxLines: widget.lines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: widget.hintText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
