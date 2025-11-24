import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';

/// An enum to define the behavior and appearance of the text form field.
enum PkpTextFormFieldType {
  email,
  password,
  datetime,
  time,
  text,
  multiline,
  number,
  currency,
  percentage,
  dropdown,
}

/// A reusable and configurable text form field widget for the app,
/// which intelligently handles different input types.
class PkpTextFormField extends StatefulWidget {
  const PkpTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.type = PkpTextFormFieldType.text,
    this.errorText,
    this.onChanged,
    this.enabled = true,
    this.options = const [],
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.filled,
    this.fillColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius = 16,
    this.hintStyle,
    this.labelStyle,
    this.contentPadding,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final PkpTextFormFieldType type;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final List<String>? options;
  // New: optional constraints for datetime picker
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final bool? filled;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderWidth;
  final double borderRadius;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<PkpTextFormField> createState() => _PkpTextFormFieldState();
}

class _PkpTextFormFieldState extends State<PkpTextFormField> {
  bool _isPasswordVisible = false;

  String _formatCurrency(String value) {
    final cleaned = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleaned.isEmpty) return '';
    final number = int.tryParse(cleaned);
    if (number == null || number == 0) return '';
    final formatter = NumberFormat.decimalPattern('id_ID');
    return formatter.format(number);
  }

  String _formatPercentage(String value) {
    // Keep only digits; do not force % in the text as a suffix widget will render it.
    return value.replaceAll(RegExp(r'[^0-9]'), '');
  }

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.type == PkpTextFormFieldType.password;
    final isDateTime = widget.type == PkpTextFormFieldType.datetime;
    final isTime = widget.type == PkpTextFormFieldType.time;
    final isMultiline = widget.type == PkpTextFormFieldType.multiline;
    final isNumber = widget.type == PkpTextFormFieldType.number;
    final isCurrency = widget.type == PkpTextFormFieldType.currency;
    final isPercentage = widget.type == PkpTextFormFieldType.percentage;
    final isDropdown = widget.type == PkpTextFormFieldType.dropdown;
    final keyboardType = _getKeyboardType();
    final obscureText = isPassword && !_isPasswordVisible;

    Widget? suffixIcon;
    if (isPassword) {
      suffixIcon = _buildPasswordSuffixIcon();
    } else if (isDateTime) {
      suffixIcon = _buildCalendarSuffixIcon(context);
    } else if (isTime) {
      suffixIcon = _buildTimeSuffixIcon(context);
    } else if (isPercentage) {
      suffixIcon = _buildPercentSuffix();
    }

    final theme = Theme.of(context);
    final effectiveBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: widget.borderColor == null && widget.borderWidth == null
          ? const BorderSide(color: AppColors.inputBorder)
          : BorderSide(
              color:
                  widget.borderColor ??
                  theme.inputDecorationTheme.enabledBorder?.borderSide.color ??
                  AppColors.inputBorder,
              width: widget.borderWidth ?? 1,
            ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(widget.labelText!, style: AppTextStyles.bodyS),
          const SizedBox(height: 4),
        ],
        if (isDropdown)
          _buildDropdownField(context)
        else
          TextFormField(
            controller: widget.controller,
            enabled: widget.enabled,
            obscureText: obscureText,
            keyboardType: keyboardType,
            readOnly: isDateTime || isTime,
            onChanged: (value) {
              if (!widget.enabled) return; // ignore changes when disabled
              if (isNumber || isCurrency) {
                final formatted = _formatCurrency(value);
                widget.controller?.value = TextEditingValue(
                  text: formatted,
                  selection: TextSelection.collapsed(offset: formatted.length),
                );
                widget.onChanged?.call(formatted);
              } else if (isPercentage) {
                final digits = _formatPercentage(value);
                widget.controller?.value = TextEditingValue(
                  text: digits,
                  selection: TextSelection.collapsed(offset: digits.length),
                );
                widget.onChanged?.call(digits);
              } else {
                widget.onChanged?.call(value);
              }
            },
            // Allow multiple lines for multiline type, otherwise 1.
            maxLines: isMultiline ? null : 1,
            minLines: isMultiline ? 3 : 1,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle:
                  widget.hintStyle ??
                  AppTextStyles.bodyS.copyWith(
                    color: AppColors.neutralMediumLight,
                  ),
              suffixIcon: suffixIcon,
              prefixIcon: isCurrency
                  ? SizedBox(
                      width: 40,
                      child: Center(
                        child: Text('Rp', style: AppTextStyles.bodyS),
                      ),
                    )
                  : null,
              filled: widget.filled,
              fillColor: widget.fillColor,
              border: effectiveBorder,
              enabledBorder: effectiveBorder,
              focusedBorder: effectiveBorder.copyWith(
                borderSide:
                    widget.borderColor == null && widget.borderWidth == null
                    ? const BorderSide(color: AppColors.inputBorder)
                    : BorderSide(
                        color: widget.borderColor ?? theme.colorScheme.primary,
                        width: widget.borderWidth ?? 1,
                      ),
              ),
              contentPadding:
                  widget.contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              errorText: widget.errorText,
            ),
            onTap: widget.enabled
                ? (isDateTime
                      ? () => _selectDate(context)
                      : isTime
                      ? () => _selectTime(context)
                      : null)
                : null,
          ),
      ],
    );
  }

  Widget _buildDropdownField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.fillColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: widget.borderColor ?? AppColors.inputBorder,
          width: widget.borderWidth ?? 0.616,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.controller?.text.isNotEmpty == true
              ? widget.controller?.text
              : null,
          icon: const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.expand_more, color: AppColors.neutralMediumLight),
          ),
          isExpanded: true,
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              widget.hintText ?? '',
              style:
                  widget.hintStyle ??
                  AppTextStyles.bodyM.copyWith(
                    color: AppColors.neutralMediumLight,
                    height: 21 / 14,
                  ),
            ),
          ),
          items: (widget.options ?? [])
              .map(
                (opt) => DropdownMenuItem<String>(
                  value: opt,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(
                      opt,
                      style: AppTextStyles.bodyS.copyWith(
                        color: AppColors.neutralDarkest,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: widget.enabled
              ? (val) {
                  if (val == null) return;
                  widget.controller?.text = val;
                  widget.onChanged?.call(val);
                  setState(() {});
                }
              : null,
        ),
      ),
    );
  }

  TextInputType _getKeyboardType() {
    return switch (widget.type) {
      PkpTextFormFieldType.email => TextInputType.emailAddress,
      PkpTextFormFieldType.password => TextInputType.visiblePassword,
      PkpTextFormFieldType.datetime => TextInputType.none,
      PkpTextFormFieldType.time => TextInputType.none,
      PkpTextFormFieldType.text => TextInputType.text,
      PkpTextFormFieldType.multiline => TextInputType.multiline,
      PkpTextFormFieldType.number => const TextInputType.numberWithOptions(
        decimal: false,
      ),
      PkpTextFormFieldType.currency => const TextInputType.numberWithOptions(
        decimal: false,
      ),
      PkpTextFormFieldType.percentage => const TextInputType.numberWithOptions(
        decimal: false,
      ),
      PkpTextFormFieldType.dropdown => TextInputType.text,
    };
  }

  Widget _buildPasswordSuffixIcon() {
    return IconButton(
      icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
      onPressed: widget.enabled
          ? () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            }
          : null,
    );
  }

  Widget _buildCalendarSuffixIcon(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.calendar_today),
      onPressed: widget.enabled ? () => _selectDate(context) : null,
    );
  }

  Widget _buildTimeSuffixIcon(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.access_time),
      onPressed: widget.enabled ? () => _selectTime(context) : null,
    );
  }

  Widget _buildPercentSuffix() {
    return SizedBox(
      width: 40,
      child: Center(child: Text('%', style: AppTextStyles.bodyL)),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final first = widget.firstDate ?? DateTime(1900);
    final last = widget.lastDate ?? DateTime(2100);

    DateTime initial = _tryParseDisplayedDate() ?? widget.initialDate ?? now;
    if (initial.isBefore(first)) initial = first;
    if (initial.isAfter(last)) initial = last;

    final newDate = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: first,
      lastDate: last,
    );

    if (newDate != null) {
      final formattedDate = DateFormat('dd MMM yyyy', 'id_ID').format(newDate);
      setState(() {
        widget.controller?.text = formattedDate;
      });
      widget.onChanged?.call(formattedDate);
    }
  }

  DateTime? _tryParseDisplayedDate() {
    final t = widget.controller?.text;
    if (t == null || t.trim().isEmpty) return null;
    try {
      return DateFormat('dd MMM yyyy', 'id_ID').parseStrict(t.trim());
    } catch (_) {
      return null;
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final initialTime = TimeOfDay.now();
    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (picked != null) {
      final now = DateTime.now();
      final dt = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );
      final formatted = '${DateFormat('HH.mm').format(dt)} WIB';
      setState(() {
        widget.controller?.text = formatted;
      });
      widget.onChanged?.call(formatted);
    }
  }
}
