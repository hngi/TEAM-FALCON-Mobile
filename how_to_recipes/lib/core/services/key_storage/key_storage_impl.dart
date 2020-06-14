import 'package:how_to_recipes/core/services/key_storage/key_storage_service.dart';
import 'package:how_to_recipes/core/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service that is responsible for storing/retrieving data in/from
/// local storage using the [SharedPreferences] package.
class KeyStorageServiceImpl implements KeyStorageService {
  static const notifications_key = 'notifications_key';
  static const first_time = 'first_time';
  static const api_key = 'api_key';
  static const theme = 'theme';

  static KeyStorageServiceImpl _instance;
  static SharedPreferences _preferences;

  static Future<KeyStorageServiceImpl> getInstance() async {
    _instance ??= KeyStorageServiceImpl();

    _preferences ??= await SharedPreferences.getInstance();

    return _instance;
  }

  @override
  bool get hasNotificationsEnabled => _getFromDisk(notifications_key) ?? false;
  set hasNotificationsEnabled(bool value) =>
      _saveToDisk(notifications_key, value);

  dynamic _getFromDisk(String key) {
    final value = _preferences.get(key);

    Logger.d('LocalStorageService: (Fetching) key: $key value: $value');

    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    Logger.d('LocalStorageService: (Saving) key: $key value: $content');

    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  @override
  bool get isFirstTime => _getFromDisk(first_time) ?? true;

  @override
  set isFirstTime(bool _isFirstTime) {
    _saveToDisk(first_time, _isFirstTime);
  }

  @override
  String get apiKey => _getFromDisk(api_key) ?? "";

  @override
  set apiKey(String _apiKey) {
    _saveToDisk(api_key, _apiKey);
  }

  @override
  bool get isDarkMOde => _getFromDisk(theme) ?? false;

  @override
    set isDarkMOde(bool _isDarkMOde) {
    _saveToDisk(theme, _isDarkMOde);
  }
}
