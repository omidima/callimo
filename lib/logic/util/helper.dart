String? publicLinkFinder(String? text) {
  try {
    var regex = RegExp(
        r'https:\/\/(test|web|aplha).(limonadapp|limoo).(im|ir)\/Limonad\/api\/v1\/bbb\/join\/guest\/.*');
    var matcher = regex.allMatches(text ?? "");
    return matcher.first.group(0)?.replaceAll("(", "").replaceAll(")", "");
  } catch (e) {
    return null;
  }
}

String? adminLinkFinder(String? text) {
  try {
    var regex = RegExp(r'\(.*\)');
    var matcher = regex.allMatches(text ?? "");
    return matcher.first.group(0)?.replaceAll("(", "").replaceAll(")", "");
  } catch (e) {
    return null;
  }
}

String? titleFinder(String? text) {
  try {
    var regex = RegExp(r'\[.*\]');
    var matcher = regex.allMatches(text ?? "");
    return matcher.first.group(0)?.replaceAll("[", "").replaceAll("]", "");
  } catch (e) {
    return null;
  }
}

String? refreshTokenFinder(String? text) {
  try {
    var regex = RegExp(r'refresh:(.*)');
    var matcher = regex.allMatches(text ?? "");
    return matcher.first.group(1)?.replaceAll(" ", '');
  } catch (e) {
    return null;
  }
}

String? tokenFinder(String? text) {
  try {
    var regex = RegExp(r'token:(.*)');
    var matcher = regex.allMatches(text ?? "");
    return matcher.first.group(1)?.replaceAll(" ", '');
  } catch (e) {
    return null;
  }
}
