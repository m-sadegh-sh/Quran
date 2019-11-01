import 'package:redux/redux.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/selectors/help_and_support.selector.dart';
import 'package:quran/delegates/generator.delegate.dart';

class HelpAndSupportViewModel {
  final GeneratorWNP<String> helpAndSupportOnGenerateTitle;
  final String helpAndSupportBackgroundImage;
  
  HelpAndSupportViewModel({
    this.helpAndSupportOnGenerateTitle,
    this.helpAndSupportBackgroundImage
  });

  static HelpAndSupportViewModel fromStore(Store<RootState> store) {
    final helpAndSupportState = helpAndSupportStateSelector(store.state);

    return HelpAndSupportViewModel(
      helpAndSupportOnGenerateTitle: helpAndSupportOnGenerateTitleSelector(helpAndSupportState),
      helpAndSupportBackgroundImage: helpAndSupportBackgroundImageSelector(helpAndSupportState)
    );
  }
}
