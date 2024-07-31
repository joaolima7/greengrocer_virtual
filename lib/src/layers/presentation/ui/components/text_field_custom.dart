import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class TextFieldCustom extends StatefulWidget {
  TextEditingController controller;
  Icon prefixIcon;
  Icon? sufixIcon;
  bool isSecret;
  String? label;
  String? hintText;
  bool isObscure;
  bool containBorder;
  bool readOnly;
  TextInputType? textInputType;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  Function(String)? onSubmitted;
  Function(String)? onChanged;
  Function()? onSuffixIconPressed;

  TextFieldCustom({
    super.key,
    this.isSecret = false,
    this.isObscure = false,
    this.containBorder = true,
    this.readOnly = false,
    this.inputFormatters,
    this.hintText,
    this.label,
    this.validator,
    this.textInputType,
    this.onSubmitted,
    this.sufixIcon,
    this.onChanged,
    this.onSuffixIconPressed,
    required this.controller,
    required this.prefixIcon,
  });

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  void initState() {
    super.initState();
    widget.isSecret = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        keyboardType: widget.textInputType,
        validator: widget.validator,
        readOnly: widget.readOnly,
        inputFormatters: widget.inputFormatters,
        obscureText: widget.isSecret,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText != null ? widget.hintText : null,
          label: widget.label != null ? Text(widget.label!) : null,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isObscure
              ? widget.isSecret
                  ? IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          widget.isSecret = !widget.isSecret;
                        });
                      },
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          widget.isSecret = !widget.isSecret;
                        });
                      },
                      icon: const Icon(
                        Icons.visibility_off,
                      ))
              : widget.sufixIcon != null
                  ? IconButton(
                      icon: widget.sufixIcon!,
                      onPressed: widget.onSuffixIconPressed,
                    )
                  : null,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: widget.containBorder
                ? const BorderSide(
                    width: 0,
                  )
                : const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
          ),
        ),
      ),
    );
  }
}
