class RecoveryViewModel {
  String? validator(String? value, String response) {
    if (value!.isEmpty) {
      return response;
    } else {
      return null;
    }
  }
}