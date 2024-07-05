import 'package:get_storage/get_storage.dart';

class StorageUtil {
  static final GetStorage _box = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  static void write(String key, dynamic value) {
    _box.write(key, value);
  }

  static dynamic read(String key) {
    return _box.read(key);
  }

  static void remove(String key) {
    _box.remove(key);
  }

  static void clear() {
    _box.erase();
    //Get.to(()=>StartScreen());
  }
}
