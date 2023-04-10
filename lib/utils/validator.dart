class Validator {
  static bool verifyThaiId(String idString) {
    //เช็ค 13 หลัก
    RegExp pattern = RegExp(r'^\d{1}\d{4}\d{5}\d{2}\d{1}$');
    if (!pattern.hasMatch(idString)) {
      return false;
    }

    //คำนวนผลรวม 12 ตัว
    String digits = idString.replaceAll('-', '');
    int total = 0;
    for (int i = 0; i < digits.length - 1; i++) {
      int weight = 13 - i;
      int digit = int.parse(digits[i]);
      total += weight * digit;
    }

    //เช็คจำนวนสุดท้าย
    int checkDigit = (11 - (total % 11)) % 10;
    int actualCheckDigit = int.parse(digits[digits.length - 1]);
    return checkDigit == actualCheckDigit;
  }
}
