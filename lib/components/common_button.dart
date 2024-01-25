import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {super.key,
      required this.onPressed,
      required this.buttonTitle,
      this.buttonHeight = 40,
      this.buttonWidth = double.infinity,
      this.padding = const EdgeInsets.all(16),
        this.backgroundColor, this.borderSide, this.textStyle});
  final String buttonTitle;
  final void Function() onPressed;
  final double? buttonHeight;
  final double? buttonWidth;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final BorderSide? borderSide;
  final TextStyle? textStyle;

  factory CommonButton.disabledButton(
  {
  required String buttonTitle,
  required void Function() onPressed,
    double? buttonHeight=40,
    double? buttonWidth=double.infinity,
    EdgeInsetsGeometry? padding = const EdgeInsets.all(16),
}
      ){
    return CommonButton(
        onPressed: onPressed,
        buttonTitle: buttonTitle,
        buttonHeight: buttonHeight,
        padding: padding,
        buttonWidth: buttonWidth,
        backgroundColor: Colors.grey.shade400,
        textStyle: const TextStyle(color: Colors.white70,fontWeight: FontWeight.w700),
    );
  }

  factory CommonButton.defaultButton(
      {
        required String buttonTitle,
        required void Function() onPressed,
        double? buttonHeight=40,
        double? buttonWidth=double.infinity,
        EdgeInsetsGeometry? padding = const EdgeInsets.all(16),
      }
      ){
    return CommonButton(
      onPressed: onPressed,
      buttonTitle: buttonTitle,
      buttonHeight: buttonHeight,
      padding: padding,
      buttonWidth: buttonWidth,
      backgroundColor: const Color(0xff80C58D),
      textStyle: const TextStyle(color: Colors.white70,fontWeight: FontWeight.w700),
    );
  }

  factory CommonButton.hoverButton(
      {
        required String buttonTitle,
        required void Function() onPressed,
        double? buttonHeight=40,
        double? buttonWidth=double.infinity,
        EdgeInsetsGeometry? padding = const EdgeInsets.all(16),
      }
      ){
    return CommonButton(
      onPressed: onPressed,
      buttonTitle: buttonTitle,
      buttonHeight: buttonHeight,
      padding: padding,
      buttonWidth: buttonWidth,
      backgroundColor: const Color(0xff518074),
      textStyle: const TextStyle(color: Colors.white70,fontWeight: FontWeight.w700),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: SizedBox(
          height: buttonHeight,
          width: buttonWidth,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: borderSide,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary
              ),
              onPressed: onPressed, child: Text(buttonTitle,style: textStyle,))),
    );
  }
}
