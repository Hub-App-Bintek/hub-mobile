import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// An enum to define the behavior and appearance of the text form field.
enum PkpTextFormFieldType { email, password, datetime, text }

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
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final PkpTextFormFieldType type;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  @override
  State<PkpTextFormField> createState() => _PkpTextFormFieldState();
}

class _PkpTextFormFieldState extends State<PkpTextFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.type == PkpTextFormFieldType.password;
    final isDateTime = widget.type == PkpTextFormFieldType.datetime;
    final keyboardType = _getKeyboardType();
    final obscureText = isPassword && !_isPasswordVisible;

    Widget? suffixIcon;
    if (isPassword) {
      suffixIcon = _buildPasswordSuffixIcon();
    } else if (isDateTime) {
      suffixIcon = _buildCalendarSuffixIcon(context);
    }

    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText ?? '',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          readOnly: isDateTime,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            // labelText: widget.labelText,
            hintText: widget.hintText,
            suffixIcon: suffixIcon,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            errorText: widget.errorText,
          ),
          onTap: isDateTime ? () => _selectDate(context) : null,
        ),
      ],
    );
  }

  TextInputType _getKeyboardType() {
    return switch (widget.type) {
      PkpTextFormFieldType.email => TextInputType.emailAddress,
      PkpTextFormFieldType.password => TextInputType.visiblePassword,
      PkpTextFormFieldType.datetime => TextInputType.none,
      PkpTextFormFieldType.text => TextInputType.text,
    };
  }

  // The icon color is now inherited from the theme.
  Widget _buildPasswordSuffixIcon() {
    return IconButton(
      icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
    );
  }

  // The icon color is now inherited from the theme.
  Widget _buildCalendarSuffixIcon(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.calendar_today),
      onPressed: () => _selectDate(context),
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
      final formattedDate = DateFormat('yyyy-MM-dd').format(newDate);
      setState(() {
        widget.controller?.text = formattedDate;
      });
    }
  }
}
