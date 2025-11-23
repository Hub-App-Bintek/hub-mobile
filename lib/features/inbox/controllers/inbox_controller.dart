import 'package:flutter/material.dart';
import 'package:pkp_hub/core/base/base_controller.dart';

class InboxItem {
  const InboxItem({
    required this.title,
    required this.message,
    required this.timeAgo,
    required this.icon,
    required this.iconColor,
    this.backgroundColor,
    this.showDot = false,
  });

  final String title;
  final String message;
  final String timeAgo;
  final IconData icon;
  final Color iconColor;
  final Color? backgroundColor;
  final bool showDot;
}

class InboxController extends BaseController {
  final List<InboxItem> items = const [
    InboxItem(
      title: 'Konsultasi Diterima',
      message:
          'Konsultan Ir. Ahmad Wijaya telah menerima permintaan konsultasi Anda untuk proyek Rumah Minimalis Modern.',
      timeAgo: '2 jam lalu',
      icon: Icons.verified_outlined,
      iconColor: Color(0xFF2ACDA0),
      backgroundColor: Color(0xFFEFF7F2),
      showDot: true,
    ),
    InboxItem(
      title: 'Pembayaran Berhasil',
      message:
          'Pembayaran termin 1 sebesar Rp 5.000.000 telah berhasil diverifikasi.',
      timeAgo: '5 jam lalu',
      icon: Icons.receipt_long_outlined,
      iconColor: Color(0xFF006FFD),
      backgroundColor: Color(0xFFF1F6FF),
      showDot: true,
    ),
    InboxItem(
      title: 'Draft Desain Tersedia',
      message:
          'Draft desain untuk proyek Villa Tropis Bali telah diunggah oleh konsultan. Silakan review dan berikan feedback.',
      timeAgo: '1 hari lalu',
      icon: Icons.description_outlined,
      iconColor: Color(0xFF006FFD),
    ),
    InboxItem(
      title: 'Revisi Diperlukan',
      message:
          'Pemilik proyek meminta revisi pada draft desain. Harap unggah revisi dalam 3 hari.',
      timeAgo: '1 hari lalu',
      icon: Icons.info_outline,
      iconColor: Color(0xFFE88330),
    ),
    InboxItem(
      title: 'Survey Dijadwalkan',
      message:
          'Survey lokasi untuk proyek Renovasi Kantor dijadwalkan pada 20 Nov 2025, pukul 10:00 WIB.',
      timeAgo: '2 hari lalu',
      icon: Icons.event_available_outlined,
      iconColor: Color(0xFF006FFD),
    ),
    InboxItem(
      title: 'Invoice Baru',
      message:
          'Invoice termin 2 sebesar Rp 3.500.000 telah diterbitkan untuk proyek Villa Tropis Bali.',
      timeAgo: '1 minggu lalu',
      icon: Icons.receipt_long_outlined,
      iconColor: Color(0xFF006FFD),
    ),
  ];
}
