
class ConfigDto {
  ConfigDto({
      dynamic userConfig, 
      dynamic dynamicConfig, 
      Config? config,}){
    _userConfig = userConfig;
    _dynamicConfig = dynamicConfig;
    _config = config;
}

  ConfigDto.fromJson(dynamic json) {
    _userConfig = json['userConfig'];
    _dynamicConfig = json['dynamicConfig'];
    _config = json['config'] != null ? Config.fromJson(json['config']) : null;
  }
  dynamic _userConfig;
  dynamic _dynamicConfig;
  Config? _config;

  dynamic get userConfig => _userConfig;
  dynamic get dynamicConfig => _dynamicConfig;
  Config? get config => _config;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userConfig'] = _userConfig;
    map['dynamicConfig'] = _dynamicConfig;
    if (_config != null) {
      map['config'] = _config?.toJson();
    }
    return map;
  }

}

class Config {
  Config({
      String? passwordstrengththreshold, 
      String? maxconsecutiveloginfailureipblock, 
      String? maxconsecutiveloginfailureipcaptcha, 
      String? logincustomtext, 
      String? passwordexpirationintervalhours, 
      String? fileServerUrl, 
      String? authType, 
      KeycloakConfig? keycloakConfig, 
      String? authServices, 
      String? defaultAuthServices, 
      String? telegramNotifBotUsername, 
      String? videoCallType, 
      String? deploymnetType, 
      String? showPublicPanelOnInitialLoading, 
      String? appminCompatibleVersion, 
      String? amplitudeApiKey, 
      Organization? organization, 
      Server? server,}){
    _passwordstrengththreshold = passwordstrengththreshold;
    _maxconsecutiveloginfailureipblock = maxconsecutiveloginfailureipblock;
    _maxconsecutiveloginfailureipcaptcha = maxconsecutiveloginfailureipcaptcha;
    _logincustomtext = logincustomtext;
    _passwordexpirationintervalhours = passwordexpirationintervalhours;
    _fileServerUrl = fileServerUrl;
    _authType = authType;
    _keycloakConfig = keycloakConfig;
    _authServices = authServices;
    _defaultAuthServices = defaultAuthServices;
    _telegramNotifBotUsername = telegramNotifBotUsername;
    _videoCallType = videoCallType;
    _deploymnetType = deploymnetType;
    _showPublicPanelOnInitialLoading = showPublicPanelOnInitialLoading;
    _appminCompatibleVersion = appminCompatibleVersion;
    _amplitudeApiKey = amplitudeApiKey;
    _organization = organization;
    _server = server;
}

  Config.fromJson(dynamic json) {
    _passwordstrengththreshold = json['password.strength.threshold'];
    _maxconsecutiveloginfailureipblock = json['max.consecutive.login.failure.ip.block'];
    _maxconsecutiveloginfailureipcaptcha = json['max.consecutive.login.failure.ip.captcha'];
    _logincustomtext = json['login.custom.text'];
    _passwordexpirationintervalhours = json['password.expiration.interval.hours'];
    _fileServerUrl = json['fileServerUrl'];
    _authType = json['authType'];
    _keycloakConfig = json['keycloakConfig'] != null ? KeycloakConfig.fromJson(json['keycloakConfig']) : null;
    _authServices = json['authServices'];
    _defaultAuthServices = json['defaultAuthServices'];
    _telegramNotifBotUsername = json['telegramNotifBotUsername'];
    _videoCallType = json['videoCallType'];
    _deploymnetType = json['deploymnetType'];
    _showPublicPanelOnInitialLoading = json['showPublicPanelOnInitialLoading'];
    _appminCompatibleVersion = json['app.minCompatibleVersion'];
    _amplitudeApiKey = json['amplitudeApiKey'];
    _organization = json['organization'] != null ? Organization.fromJson(json['organization']) : null;
    _server = json['server'] != null ? Server.fromJson(json['server']) : null;
  }
  String? _passwordstrengththreshold;
  String? _maxconsecutiveloginfailureipblock;
  String? _maxconsecutiveloginfailureipcaptcha;
  String? _logincustomtext;
  String? _passwordexpirationintervalhours;
  String? _fileServerUrl;
  String? _authType;
  KeycloakConfig? _keycloakConfig;
  String? _authServices;
  String? _defaultAuthServices;
  String? _telegramNotifBotUsername;
  String? _videoCallType;
  String? _deploymnetType;
  String? _showPublicPanelOnInitialLoading;
  String? _appminCompatibleVersion;
  String? _amplitudeApiKey;
  Organization? _organization;
  Server? _server;

  String? get passwordstrengththreshold => _passwordstrengththreshold;
  String? get maxconsecutiveloginfailureipblock => _maxconsecutiveloginfailureipblock;
  String? get maxconsecutiveloginfailureipcaptcha => _maxconsecutiveloginfailureipcaptcha;
  String? get logincustomtext => _logincustomtext;
  String? get passwordexpirationintervalhours => _passwordexpirationintervalhours;
  String? get fileServerUrl => _fileServerUrl;
  String? get authType => _authType;
  KeycloakConfig? get keycloakConfig => _keycloakConfig;
  String? get authServices => _authServices;
  String? get defaultAuthServices => _defaultAuthServices;
  String? get telegramNotifBotUsername => _telegramNotifBotUsername;
  String? get videoCallType => _videoCallType;
  String? get deploymnetType => _deploymnetType;
  String? get showPublicPanelOnInitialLoading => _showPublicPanelOnInitialLoading;
  String? get appminCompatibleVersion => _appminCompatibleVersion;
  String? get amplitudeApiKey => _amplitudeApiKey;
  Organization? get organization => _organization;
  Server? get server => _server;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['password.strength.threshold'] = _passwordstrengththreshold;
    map['max.consecutive.login.failure.ip.block'] = _maxconsecutiveloginfailureipblock;
    map['max.consecutive.login.failure.ip.captcha'] = _maxconsecutiveloginfailureipcaptcha;
    map['login.custom.text'] = _logincustomtext;
    map['password.expiration.interval.hours'] = _passwordexpirationintervalhours;
    map['fileServerUrl'] = _fileServerUrl;
    map['authType'] = _authType;
    if (_keycloakConfig != null) {
      map['keycloakConfig'] = _keycloakConfig?.toJson();
    }
    map['authServices'] = _authServices;
    map['defaultAuthServices'] = _defaultAuthServices;
    map['telegramNotifBotUsername'] = _telegramNotifBotUsername;
    map['videoCallType'] = _videoCallType;
    map['deploymnetType'] = _deploymnetType;
    map['showPublicPanelOnInitialLoading'] = _showPublicPanelOnInitialLoading;
    map['app.minCompatibleVersion'] = _appminCompatibleVersion;
    map['amplitudeApiKey'] = _amplitudeApiKey;
    if (_organization != null) {
      map['organization'] = _organization?.toJson();
    }
    if (_server != null) {
      map['server'] = _server?.toJson();
    }
    return map;
  }

}

class Server {
  Server({
      String? protocol, 
      String? port, 
      String? host, 
      String? contextPath,}){
    _protocol = protocol;
    _port = port;
    _host = host;
    _contextPath = contextPath;
}

  Server.fromJson(dynamic json) {
    _protocol = json['protocol'];
    _port = json['port'];
    _host = json['host'];
    _contextPath = json['contextPath'];
  }
  String? _protocol;
  String? _port;
  String? _host;
  String? _contextPath;

  String? get protocol => _protocol;
  String? get port => _port;
  String? get host => _host;
  String? get contextPath => _contextPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['protocol'] = _protocol;
    map['port'] = _port;
    map['host'] = _host;
    map['contextPath'] = _contextPath;
    return map;
  }

}

class Organization {
  Organization({
      dynamic background, 
      dynamic logo,}){
    _background = background;
    _logo = logo;
}

  Organization.fromJson(dynamic json) {
    _background = json['background'];
    _logo = json['logo'];
  }
  dynamic _background;
  dynamic _logo;

  dynamic get background => _background;
  dynamic get logo => _logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['background'] = _background;
    map['logo'] = _logo;
    return map;
  }

}


class KeycloakConfig {
  KeycloakConfig({
      String? realm, 
      String? authserverurl, 
      String? resource, 
      String? sslrequired,}){
    _realm = realm;
    _authserverurl = authserverurl;
    _resource = resource;
    _sslrequired = sslrequired;
}

  KeycloakConfig.fromJson(dynamic json) {
    _realm = json['realm'];
    _authserverurl = json['auth-server-url'];
    _resource = json['resource'];
    _sslrequired = json['ssl-required'];
  }
  String? _realm;
  String? _authserverurl;
  String? _resource;
  String? _sslrequired;

  String? get realm => _realm;
  String? get authserverurl => _authserverurl;
  String? get resource => _resource;
  String? get sslrequired => _sslrequired;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['realm'] = _realm;
    map['auth-server-url'] = _authserverurl;
    map['resource'] = _resource;
    map['ssl-required'] = _sslrequired;
    return map;
  }

}