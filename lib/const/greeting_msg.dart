String greetingMessage(String? name) {
  var timeNow = DateTime.now().hour;
  if (timeNow <= 12) {
    return 'Доброе утро, $name';
  } else if ((timeNow > 12) && (timeNow <= 16)) {
    return 'Добрый день, $name';
  } else if ((timeNow > 16) && (timeNow < 20)) {
    return 'Добрый вечер, $name';
  } else {
    return 'Доброй ночи, $name';
  }
}
