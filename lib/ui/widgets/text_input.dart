import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({
    super.key,
    required this.hint,
    this.textEditingController,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.sentences,
    this.customBackground,
    this.customPadding,
    this.customTextStyle,
    this.hintStyle,
    this.textInputType = TextInputType.text,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.onChange,
    this.autoFocus = false,
    this.enabled = true,
    this.onSubmit,
    this.borderColor,
    this.icon,
    this.customBorderRadius,
    this.isPassword = false,
    this.suffix,
    this.validator,
  });

  final String hint;
  final TextEditingController? textEditingController;
  final TextAlign textAlign;
  final Color? customBackground;
  final EdgeInsets? customPadding;
  final TextStyle? customTextStyle;
  final BorderRadius? customBorderRadius;
  final TextStyle? hintStyle;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final void Function(String v)? onChange;
  final void Function(String v)? onSubmit;
  final bool autoFocus;
  final bool enabled;
  final Color? borderColor;
  final Widget? icon;
  final Widget? suffix;
  final bool isPassword;
  final String? Function(String?)? validator; // Validator function

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool _obscureText = true;
  String? _errorText; // Store error message

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: widget.customPadding ??
      //     EdgeInsets.symmetric(
      //       vertical: verticalSpacing,
      //       horizontal: horizontalSpacing,
      //     ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        //  color: widget.customBackground ?? AppColors.shapeBackground,
        borderRadius: widget.customBorderRadius ??
            BorderRadius.circular(
              horizontalSpacing / 2,
            ),
        border: Border.all(
          color: widget.borderColor ?? (Colors.transparent),
          width: widget.borderColor == null ? 0 : 1,
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: TextFormField(
        onChanged: (v) {
          setState(() {
            _errorText = widget.validator?.call(v); // Validate on change
          });
          widget.onChange?.call(v);
        },
        keyboardType: widget.isPassword
            ? TextInputType.visiblePassword
            : widget.textInputType,
        textCapitalization: widget.textCapitalization,
        controller: widget.textEditingController,
        textAlign: widget.textAlign,
        validator: widget.validator,
        // onSubmitted: (value) {
        //   setState(() {
        //     _errorText = widget.validator?.call(value);
        //   });
        //   if (_errorText == null) {
        //     widget.onSubmit?.call(value);
        //   }
        // },
        autofocus: widget.autoFocus,
        style: widget.customTextStyle,
        enabled: widget.enabled,
        textInputAction: (widget.minLines ?? 0) > 1
            ? TextInputAction.newline
            : TextInputAction.done,
        scrollPadding: EdgeInsets.zero,
        maxLines: widget.maxLines ?? widget.minLines ?? 1,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        textAlignVertical: TextAlignVertical.center,
        obscureText: widget.isPassword ? _obscureText : false,
        obscuringCharacter: '*',
        inputFormatters: [
          if (widget.textInputType == TextInputType.number)
            FilteringTextInputFormatter.allow(
              RegExp('[0-9.]'),
            )
        ],
        decoration: InputDecoration(
          hintText: widget.hint,
          icon: widget.icon,
          fillColor: AppColors.shapeBackground,
          filled: true,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.red,
            ),
            borderRadius: BorderRadius.circular(horizontalSpacing / 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.red,
            ),
            borderRadius: BorderRadius.circular(horizontalSpacing / 2),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )
              : widget.suffix,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: widget.hintStyle ??
              tStyles['grey16']
                  ?.copyWith(color: AppColors.grey.withOpacity(0.4)),
          counterText: '',
          border: InputBorder.none,
          isDense: true,
          errorText: _errorText,
          contentPadding: widget.customPadding ??
              EdgeInsets.symmetric(
                vertical: verticalSpacing,
                horizontal: horizontalSpacing,
              ),
        ),
      ),
    );
  }
}
