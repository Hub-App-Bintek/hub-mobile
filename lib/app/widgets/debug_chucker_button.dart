import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pkp_hub/core/config/environment.dart';
import 'package:flutter/scheduler.dart';

/// Inserts a draggable Chucker launcher into the app overlay when in debug
/// mode and logging is enabled.
class DebugChuckerButtonHost extends StatefulWidget {
  const DebugChuckerButtonHost({super.key, this.child});

  final Widget? child;

  @override
  State<DebugChuckerButtonHost> createState() => _DebugChuckerButtonHostState();
}

class _DebugChuckerButtonHostState extends State<DebugChuckerButtonHost> {
  OverlayEntry? _entry;
  Offset _offset = const Offset(16, 160);

  bool get _shouldShow =>
      kDebugMode && Environment.instance.enableLogging == true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((_) => _insertOverlay());
  }

  @override
  void dispose() {
    _entry?.remove();
    _entry = null;
    super.dispose();
  }

  void _insertOverlay() {
    if (!_shouldShow || _entry != null) return;
    final overlay =
        ChuckerFlutter.navigatorObserver.navigator?.overlay ??
        Overlay.of(context, rootOverlay: true);
    _entry = OverlayEntry(builder: (_) => _buildButton());
    overlay.insert(_entry!);
  }

  Widget _buildButton() {
    final mediaQuery = MediaQuery.of(context);
    final maxX = mediaQuery.size.width - 56;
    final maxY = mediaQuery.size.height - 120;

    return Positioned(
      left: _offset.dx.clamp(0, maxX),
      top: _offset.dy.clamp(0, maxY),
      child: Draggable(
        feedback: _fab(),
        childWhenDragging: const SizedBox.shrink(),
        onDragEnd: (details) {
          setState(() {
            _offset = Offset(
              details.offset.dx.clamp(0, maxX),
              details.offset.dy.clamp(0, maxY),
            );
          });
        },
        child: _fab(),
      ),
    );
  }

  Widget _fab() {
    return FloatingActionButton.small(
      onPressed: ChuckerFlutter.showChuckerScreen,
      child: const Icon(Icons.bug_report_outlined),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Host renders the normal child; overlay entry renders the button.
    return widget.child ?? const SizedBox.shrink();
  }
}
