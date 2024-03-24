import 'package:flutter/material.dart';
import 'package:smart_shop/core/utility/dialog_helper/locator.dart';
import 'dialog_handler.dart';
import 'dialog_request.dart';
import 'floating_dialog_card.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  const DialogManager({Key? key, required this.child}) : super(key: key);

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  OverlayEntry? _overlayEntry;
  late DialogHandler _dialogHandler;

  @override
  void initState() {
    super.initState();
    _dialogHandler = locator<DialogHandler>();
    _dialogHandler.registerShowDialogListener(_showDialog);
    _dialogHandler.registerDismissDialogListener(_dismissDialog);
  }

  @override
  void dispose() {
    _dialogHandler.registerShowDialogListener(_showDialog);
    _dialogHandler.registerDismissDialogListener(_dismissDialog);
    _dismissDialog();
    super.dispose();
  }

  void _showDialog(DialogRequest request) {
    final overlay = Overlay.of(context);
    if (overlay == null) return;

    _overlayEntry = _createOverlayEntry(request);
    overlay.insert(_overlayEntry!);

    if (request.autoDismiss) {
      Future.delayed(request.duration, () {
        if (mounted) _dismissDialog();
      });
    }
  }

  void _dismissDialog([bool status = false]) {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (mounted) _dialogHandler.dialogComplete(status);
  }

  OverlayEntry _createOverlayEntry(DialogRequest request) {
    return OverlayEntry(
      opaque: false,
      builder: (context) => Positioned.fill(
        child: Material(
          color: Colors.black.withOpacity(0.5),
          child: const Center(
            child: Text('Dialog'),
            //  FloatingDialogCard(
            //   request: request,
            //   dismissDialog: _dismissDialog,
            // ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
