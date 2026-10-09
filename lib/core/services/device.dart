/*
core/
└── services/
    ├── device/
    ├── permission/
    ├── notification/
    └── launcher/
    --------------------------
    abstract interface class DeviceService {
  Future<String> getDeviceId();

  Future<String> getDeviceModel();
}
-------------------------------------
abstract interface class PermissionService {
  Future<bool> requestCameraPermission();

  Future<bool> requestNotificationPermission();
}
----------------------------------------------------
abstract interface class NotificationService {
  Future<void> initialize();

  Future<void> show({
    required String title,
    required String body,
  });
}

*/