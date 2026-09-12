import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.height,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;

  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  final bool obscureText;
  final bool enabled;
  final bool readOnly;

  final int maxLines;
  final int? maxLength;

  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  /// Allows each screen to control the field height.
  /// Defaults to the global input height.
  final double? height;

  @override
  Widget build(BuildContext context) {
    final double fieldHeight = height ?? AppSizes.inputHeight;

    return SizedBox(
      height: fieldHeight,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        enabled: enabled,
        readOnly: readOnly,
        maxLines: obscureText ? 1 : maxLines,
        maxLength: maxLength,
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 10,
          color: AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,

          hintStyle: AppTextStyles.bodySmall.copyWith(
            fontSize: 10,
            color: AppColors.textHint,
          ),

          labelStyle: AppTextStyles.bodySmall.copyWith(
            fontSize: 10,
            color: AppColors.textSecondary,
          ),

          filled: true,
          fillColor: AppColors.inputBackground,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 0,
          ),

          prefixIcon: prefixIcon == null
              ? null
              : Icon(
                  prefixIcon,
                  size: 16,
                  color: AppColors.textSecondary,
                ),

          suffixIcon: suffixIcon == null
              ? null
              : IconButton(
                  onPressed: onSuffixTap,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 32,
                  ),
                  icon: Icon(
                    suffixIcon,
                    size: 15,
                    color: AppColors.textSecondary,
                  ),
                ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusRound),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusRound),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusRound),
            borderSide: BorderSide.none,
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusRound),
            borderSide: BorderSide.none,
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusRound),
            borderSide: BorderSide.none,
          ),

          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusRound),
            borderSide: BorderSide.none,
          ),

          errorStyle: const TextStyle(
            fontSize: 9,
            height: 1,
          ),

          counterText: '',
        ),
      ),
    );
  }
}