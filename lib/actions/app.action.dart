class AppDiscoverPackageInfoAction { }

class AppDiscoverPackageInfoSucceededAction {
  final String appId;
  final String appName;
  final String appVersionCode;
  final String appVersionName;

  AppDiscoverPackageInfoSucceededAction({
    this.appId,
    this.appName,
    this.appVersionCode,
    this.appVersionName
  });
}

class AppDiscoverPackageInfoFailedAction {}
