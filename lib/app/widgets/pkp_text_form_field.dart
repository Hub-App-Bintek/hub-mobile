import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final PkpTextFormFieldType type;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final bool enabled;

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
        ],
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
            suffixIcon: suffixIcon,
            prefixIcon: isCurrency
                ? SizedBox(
                    width: 40,
                    child: Center(
                      child: Text('Rp', style: AppTextStyles.bodyL),
                    ),
                  )
                : null,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
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
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (newDate != null) {
      final formattedDate = DateFormat('dd MMM yyyy', 'id_ID').format(newDate);
      setState(() {
        widget.controller?.text = formattedDate;
      });
      widget.onChanged?.call(formattedDate);
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
