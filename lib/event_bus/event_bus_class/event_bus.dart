import 'dart:async';
import 'dart:developer';

final class EventBus {
  final StreamController _streamController;

  StreamController get streamController => _streamController;
  dynamic _lastEvent;
  EventBus({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);

  EventBus.customController(StreamController controller)
      : _streamController = controller;

  Stream<T> onEvent<T>() {
    if (T == dynamic) {
      return streamController.stream as Stream<T>;
    } else {
      return streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  void send(
    event, {
    bool sendOnce = false,
  }) {
    log('', error: 'Event sended $event', name: 'Event');
    if (sendOnce == false) {
      streamController.add(event);
    } else {
      if (_lastEvent != event) {
        _lastEvent = event;
        streamController.add(event);
      }
    }
  }

  void close() {
    _streamController.close();
  }

  void drain() {
    _streamController.stream.drain();
  }
}