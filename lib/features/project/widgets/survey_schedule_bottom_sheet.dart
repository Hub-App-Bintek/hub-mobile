import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/data/models/request/create_survey_schedule_request.dart';

class SurveyScheduleBottomSheet extends StatefulWidget {
  const SurveyScheduleBottomSheet({super.key, required this.onButtonPressed});

  final ValueChanged<CreateSurveyScheduleRequest> onButtonPressed;

  @override
  State<SurveyScheduleBottomSheet> createState() =>
      _SurveyScheduleBottomSheetState();
}

class _SurveyScheduleBottomSheetState extends State<SurveyScheduleBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _surveyCostController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _notesController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _dateError;
  String? _timeError;

  bool get _isCostFilled =>
      _surveyCostController.text.replaceAll(RegExp(r'[^0-9]'), '').isNotEmpty;
  bool get _isSubmitEnabled =>
      _isCostFilled && _selectedDate != null && _selectedTime != null;

  @override
  void dispose() {
    _surveyCostController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Container(
          color: AppColors.white,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: media.size.height),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PkpAppBar(
                  title: '',
                  showNavigation: true,
                  leading: Icons.close,
                  onLeadingPressed: () => Get.back(),
                  elevation: 0,
                ),
                Flexible(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PkpTextFormField(
                            controller: _surveyCostController,
                            labelText: 'Survey Cost',
                            hintText: '123.456.789',
                            type: PkpTextFormFieldType.currency,
                            onChanged: (_) => setState(() {}),
                          ),
                          const SizedBox(height: 16),
                          PkpTextFormField(
                            controller: _dateController,
                            labelText: 'Date',
                            hintText: '01 Jan 2026',
                            type: PkpTextFormFieldType.datetime,
                            errorText: _dateError,
                            onChanged: (value) {
                              setState(() {
                                _dateError = null;
                                try {
                                  _selectedDate = DateFormat(
                                    'dd MMM yyyy',
                                    'id_ID',
                                  ).parseStrict(value);
                                } catch (_) {
                                  _selectedDate = null;
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          PkpTextFormField(
                            controller: _timeController,
                            labelText: 'Time',
                            hintText: '12.00 WIB',
                            type: PkpTextFormFieldType.time,
                            errorText: _timeError,
                            onChanged: (value) {
                              setState(() {
                                _timeError = null;
                                try {
                                  final cleaned = value.replaceAll(' WIB', '');
                                  final dt = DateFormat(
                                    'HH.mm',
                                  ).parseStrict(cleaned);
                                  _selectedTime = TimeOfDay(
                                    hour: dt.hour,
                                    minute: dt.minute,
                                  );
                                } catch (_) {
                                  _selectedTime = null;
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          PkpTextFormField(
                            controller: _notesController,
                            labelText: 'Notes',
                            hintText: 'Additional Info',
                            type: PkpTextFormFieldType.multiline,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Pinned submit button; lifts with keyboard
                AnimatedPadding(
                  duration: const Duration(milliseconds: 160),
                  curve: Curves.easeOut,
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: PkpElevatedButton(
                      text: 'Ajukan',
                      enabled: _isSubmitEnabled,
                      onPressed: _onSubmit,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
    setState(() {
      _dateError = _selectedDate == null ? 'Pilih tanggal' : null;
      _timeError = _selectedTime == null ? 'Pilih waktu' : null;
    });
    if (_selectedDate == null || _selectedTime == null) return;

    final date = _selectedDate!;
    final time = _selectedTime!;
    final localDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    final digits = _surveyCostController.text.replaceAll(RegExp(r'[^0-9]'), '');
    final cost = digits.isEmpty ? null : double.tryParse(digits)?.toDouble();

    final request = CreateSurveyScheduleRequest(
      proposedDateTime: localDateTime.toUtc().toIso8601String(),
      surveyCost: cost,
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
    );

    widget.onButtonPressed(request);
  }
}
