import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';

class ScheduleSurveySheet extends StatefulWidget {
  const ScheduleSurveySheet({
    super.key,
    required this.onSubmit,
    this.initialDate,
    this.initialTime,
  });

  final Future<void> Function({
    required String date, // yyyy-MM-dd
    required String time, // HH:mm
    String? notes,
    String? costFormatted,
  })
  onSubmit;

  final String? initialDate; // yyyy-MM-dd
  final String? initialTime; // HH:mm

  @override
  State<ScheduleSurveySheet> createState() => _ScheduleSurveySheetState();
}

class _ScheduleSurveySheetState extends State<ScheduleSurveySheet> {
  final _costC = TextEditingController();
  final _dateC = TextEditingController();
  final _timeC = TextEditingController();
  final _notesC = TextEditingController();

  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) _dateC.text = widget.initialDate!;
    if (widget.initialTime != null) _timeC.text = widget.initialTime!;
  }

  @override
  void dispose() {
    _costC.dispose();
    _dateC.dispose();
    _timeC.dispose();
    _notesC.dispose();
    super.dispose();
  }

  Future<void> _pickTime() async {
    final now = TimeOfDay.now();
    final picked = await showTimePicker(context: context, initialTime: now);
    if (picked != null) {
      final dt = DateTime(0, 1, 1, picked.hour, picked.minute);
      final formatted = DateFormat('HH:mm').format(dt);
      _timeC.text = formatted;
      setState(() {});
    }
  }

  Future<void> _handleSubmit() async {
    final date = _dateC.text.trim();
    final time = _timeC.text.trim();
    final notes = _notesC.text.trim().isEmpty ? null : _notesC.text.trim();
    final cost = _costC.text.trim().isEmpty ? null : _costC.text.trim();
    if (date.isEmpty || time.isEmpty) {
      // Simple inline validation
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tanggal dan Waktu wajib diisi')),
      );
      return;
    }
    setState(() => _submitting = true);
    try {
      await widget.onSubmit(
        date: date,
        time: time,
        notes: notes,
        costFormatted: cost,
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 48,
              ), // spacer to center title visually with close icon
              const Text(
                'Jadwalkan Survey',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: _submitting
                    ? null
                    : () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          PkpTextFormField(
            controller: _costC,
            labelText: 'Survey Cost',
            hintText: '123.456.789',
            type: PkpTextFormFieldType.currency,
          ),
          const SizedBox(height: 16),
          PkpTextFormField(
            controller: _dateC,
            labelText: 'Date',
            hintText: DateFormat('dd MMM yyyy').format(DateTime.now()),
            type: PkpTextFormFieldType.datetime,
            onChanged: (value) {
              // value is yyyy-MM-dd
            },
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Time', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _timeC,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: '12.00 WIB',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.schedule),
                    onPressed: _pickTime,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          PkpTextFormField(
            controller: _notesC,
            labelText: 'Notes',
            hintText: 'Additional Info',
            type: PkpTextFormFieldType.multiline,
          ),
          const SizedBox(height: 16),
          PkpElevatedButton(
            onPressed: _submitting ? null : _handleSubmit,
            text: 'Submit',
            isLoading: _submitting,
            enabled: true,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
