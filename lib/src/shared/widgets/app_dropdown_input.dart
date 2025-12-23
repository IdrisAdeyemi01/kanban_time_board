import 'package:flutter/material.dart';

class AppDropdownInput<T> extends StatelessWidget {
  const AppDropdownInput({
    required this.options,
    required this.value,
    super.key,
    this.onChanged,
    this.validator,
    this.labelText,
    this.hintText,
    this.headingText,
    this.prefixIcon,
    this.enabled = true,
    this.fillColor,
    this.focusNode,
    this.customItem,
    this.getLabel,
    this.hasBorder = true,
    this.hintStyle,
    this.labelStyle,
    this.borderColor,
    this.textFieldColor = Colors.white,
    this.onTap,
    this.autovalidateMode,
    this.borderRadius = 8,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 14,
    ),
  });

  const AppDropdownInput.questionnaire({
    required this.options,
    required this.value,
    super.key,
    this.onChanged,
    this.validator,
    this.labelText,
    this.hintText,
    this.headingText,
    this.prefixIcon,
    this.enabled = true,
    this.fillColor,
    this.focusNode,
    this.customItem,
    this.getLabel,
    this.hasBorder = true,
    this.hintStyle,
    this.labelStyle,
    this.borderColor,
    this.textFieldColor = Colors.white,
    this.onTap,
    this.autovalidateMode,
  }) : borderRadius = 9,
       contentPadding = const EdgeInsets.all(11);
  final List<T>? options;
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final Widget Function(T)? customItem;
  final String Function(T)? getLabel;
  final void Function()? onTap;
  final String? labelText;
  final String? hintText;
  final String? headingText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final bool enabled;
  final Color? fillColor;
  final bool hasBorder;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Color? borderColor;
  final Color textFieldColor;
  final AutovalidateMode? autovalidateMode;
  final double borderRadius;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      items: options?.map((T item) {
        if (customItem != null) {
          return AppDropdownMenuItem(value: item, child: customItem!(item));
        }
        return AppDropdownMenuItem(
          value: item,
          child: Text(
            getLabel != null ? getLabel!(item) : item.toString(),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        );
      }).toList(),
      onTap: onTap,
      isExpanded: true,
      onChanged: enabled ? onChanged : null,
      validator: validator,
      autovalidateMode: autovalidateMode,
      initialValue: value,
      focusNode: focusNode,

      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        enabled: enabled,
        isDense: true,
        filled: true,
        fillColor: textFieldColor,
        labelText: labelText,
        labelStyle: labelStyle,
        hintText: hintText,
        hintStyle: hintStyle,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? Colors.grey, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Colors.black,
            width: 0.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Colors.red.shade700,
            width: 0.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? Colors.grey, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? Colors.grey, width: 0.5),
        ),
      ),
    );
  }
}

class AppDropdownMenuItem<T> extends DropdownMenuItem<T> {
  const AppDropdownMenuItem({
    required super.child,
    super.key,
    this.height = 46,
    super.value,
  });
  final double height;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height),
      child: DropdownMenuItem(
        alignment: alignment,
        enabled: enabled,
        onTap: onTap,
        value: value,
        child: child,
      ),
    );
  }
}
