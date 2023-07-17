import 'package:flutter/material.dart';
import 'package:flutter_tools/event_bus/event_bus_class/event_bus.dart';

import 'execute_on_event.dart';

class GlobalEventsBuilder extends StatefulWidget {
  final Widget child;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final EventBus eventBus;
  final VoidCallback? onInit;
  final Function(dynamic event)? customEvents;
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget noInternetPage;
  final Widget blockUserPagePage;
  const GlobalEventsBuilder({
    Key? key,
    required this.child,
    required this.scaffoldMessengerKey,
    required this.eventBus,
    required this.navigatorKey,
    required this.noInternetPage,
    required this.blockUserPagePage,
    this.onInit,
    this.customEvents,
  }) : super(key: key);

  @override
  State<GlobalEventsBuilder> createState() => _GloblEventsBuilderState();
}

class _GloblEventsBuilderState extends State<GlobalEventsBuilder> {
  bool lockTouch = false;
  @override
  void initState() {
    super.initState();
    widget.eventBus.onEvent().listen(
      (event) async {
        widget.customEvents?.call(event);
        OnAutoPopEvent.execute(
          event,
          widget.navigatorKey,
        );
        OnSnackbarEvent.execute(
          event,
          widget.scaffoldMessengerKey,
          widget.navigatorKey,
        );
        OnAutoNavigateEvent.execute(
          event,
          widget.navigatorKey,
        );
        OnNoInternetEvent.execute(
          event,
          widget.navigatorKey,
          noInternetPage: widget.noInternetPage,
        );
        OnBlockDeviceEvent.execute(
          event,
          widget.navigatorKey,
          blockUserPage: widget.blockUserPagePage,
        );
        setState(() {
          lockTouch = OnBlockTouchEvent.lockAndUnlockTouch(event);
        });
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      widget.onInit?.call();
    });
  }

  @override
  void dispose() {
    widget.eventBus
      ..drain()
      ..close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(!lockTouch);
      },
      child: IgnorePointer(
        ignoring: lockTouch,
        child: widget.child,
      ),
    );
  }
}
