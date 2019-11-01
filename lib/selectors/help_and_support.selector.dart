import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/states/help_and_support.state.dart';

HelpAndSupportState helpAndSupportStateSelector(RootState state) => state.helpAndSupportState;
GeneratorWNP<String> helpAndSupportOnGenerateTitleSelector(HelpAndSupportState state) => state.helpAndSupportOnGenerateTitle;