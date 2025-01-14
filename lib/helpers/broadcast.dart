class Broadcast {
  final _observers = <String, List<Function>>{};

  static final Broadcast _instance = Broadcast.internal();

  factory Broadcast() => _instance;

  Broadcast.internal();

  void addObserver(String notificationId, Function callback) {
    if (!_observers.containsKey(notificationId)) {
      _observers[notificationId] = [];
    }
    _observers[notificationId]?.add(callback);
  }

  void removeObserver(String notificationId, {Function? callback}) {
    if (callback != null) {
      if (_observers.containsKey(notificationId)) {
        _observers[notificationId]!.remove(callback);
      }
    } else {
      _observers.remove(notificationId);
    }
  }

  void removeAllObserver() {
    _observers.clear();
  }

  void post(String notificationId, {dynamic data}) {
    if (_observers.containsKey(notificationId)) {
      final observer = _observers[notificationId]!;
      if (data != null) {
        for (var callback in observer) {
          callback(data);
        }
      } else {
        for (var callback in observer) {
          callback();
        }
      }
    }
  }
}
