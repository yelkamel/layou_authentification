import 'dart:math';

const chars = "abcdefghijklmnopqrstuvwxyz0123456789";

class RandomUtils {
  static String randomString(int strlen) {
    Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < strlen; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }
}
