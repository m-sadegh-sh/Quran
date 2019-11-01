import 'package:redux/redux.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/selectors/about.selector.dart';
import 'package:quran/delegates/generator.delegate.dart';

class AboutViewModel {
  final GeneratorWNP<String> aboutOnGenerateTitle;
  final String aboutBackgroundImage;
  
  AboutViewModel({
    this.aboutOnGenerateTitle,
    this.aboutBackgroundImage
  });

  static AboutViewModel fromStore(Store<RootState> store) {
    final aboutState = aboutStateSelector(store.state);

    return AboutViewModel(
      aboutOnGenerateTitle: aboutOnGenerateTitleSelector(aboutState),
      aboutBackgroundImage: aboutBackgroundImageSelector(aboutState)
    );
  }
}
