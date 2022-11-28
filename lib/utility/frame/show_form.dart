import 'package:flutter/material.dart';
import 'package:tdvpnext/utility/frame/show_icon_button.dart';
import 'package:tdvpnext/utility/frame/show_text.dart';
import 'package:tdvpnext/utility/stylepro.dart';

class ShowForm extends StatelessWidget {
  final double? width;
  final String label;
  final IconData iconData;
  final Function(String) changeFunc;
  final bool? obscub;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Function()? pressFunc;
  final Color? colorTheme;
  final Widget? prefixWidget;
  final Color? colorSuffixIcon;
  final double? topMargin;
  const ShowForm({
    Key? key,
    this.width,
    required this.label,
    required this.iconData,
    required this.changeFunc,
    this.obscub,
    this.textInputType,
    this.controller,
    this.pressFunc,
    this.colorTheme,
    this.prefixWidget,
    this.colorSuffixIcon,
    this.topMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin ?? 16),
      width: width ?? 250,
      height: 40,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType ?? TextInputType.text,
        style: colorTheme == null
            ? StyleProjects().TopicMainT3
            : StyleProjects().TopicMainT3_1,
        obscureText: obscub ?? false,
        onChanged: changeFunc,
        decoration: InputDecoration(
          prefixIcon: prefixWidget,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          suffixIcon: ShowIconButton(
            color: colorSuffixIcon ?? colorTheme ?? Colors.white,
            iconData: iconData,
            pressFunc: pressFunc ?? () {},
          ),
          label: ShowTextNew(
            label: label,
            textStyle: colorTheme == null
                ? StyleProjects().TopicMainT3
                : StyleProjects().TopicMainT3_1,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: colorTheme ?? StyleProjects().lightColor),
            borderRadius: colorTheme == null
                ? BorderRadius.circular(30)
                : BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: StyleProjects().lightColor),
            borderRadius: colorTheme == null
                ? BorderRadius.circular(30)
                : BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
