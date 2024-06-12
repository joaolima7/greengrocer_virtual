import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustom extends StatefulWidget {
  TextEditingController controller;
  Icon prefixIcon;
  bool isSecret;
  String label;
  bool isObscure;
  List<TextInputFormatter>? inputFormatters;

  TextFieldCustom({
    super.key,
    this.isSecret = false,
    this.isObscure = false,
    this.inputFormatters,
    required this.controller,
    required this.prefixIcon,
    required this.label,
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
        inputFormatters: widget.inputFormatters,
        obscureText: widget.isSecret,
        controller: widget.controller,
        decoration: InputDecoration(
          label: Text(widget.label),
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
              : null,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
