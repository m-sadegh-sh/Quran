import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/states/about.state.dart';

AboutState aboutStateSelector(RootState state) => state.aboutState;
GeneratorWNP<String> aboutOnGenerateTitleSelector(AboutState state) => state.aboutOnGenerateTitle;
String aboutBackgroundImageSelector(AboutState state) => state.aboutBackgroundImage;