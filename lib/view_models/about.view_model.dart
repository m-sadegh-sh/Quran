import 'package:redux/redux.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/selectors/about.selector.dart';
import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/selectors/app.selector.dart';

class AboutViewModel {
  final String appVersionName;
  final GeneratorWNP<String> aboutOnGenerateTitle;
  final String aboutBackgroundImage;
  
  AboutViewModel({
    this.appVersionName,
    this.aboutOnGenerateTitle,
    this.aboutBackgroundImage
  });

  static AboutViewModel fromStore(Store<RootState> store) {
    final appState = appStateSelector(store.state);
    final aboutState = aboutStateSelector(store.state);

    return AboutViewModel(
      appVersionName: appVersionNameSelector(appState),
      aboutOnGenerateTitle: aboutOnGenerateTitleSelector(aboutState),
      aboutBackgroundImage: aboutBackgroundImageSelector(aboutState)
    );
  }
}
