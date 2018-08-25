import 'package:Quran/states/home_state.dart';
import 'package:Quran/states/root_state.dart';
import 'package:Quran/delegates/generate_drawer_items.dart';
import 'package:Quran/delegates/generate_action_items.dart';
import 'package:Quran/delegates/generate_tab_items.dart';
import 'package:Quran/delegates/generate_tab_contents.dart';
import 'package:Quran/delegates/generate_localized_string.dart';

HomeState homeStateSelector(RootState state) => state.homeState;
GenerateLocalizedString homeOnGenerateTitleSelector(HomeState state) => state.homeOnGenerateTitle;
GenerateLocalizedString homeOnGenerateAccountNameSelector(HomeState state) => state.homeOnGenerateAccountName;
GenerateLocalizedString homeOnGenerateAccountEmailSelector(HomeState state) => state.homeOnGenerateAccountEmail;
String homeAccountBackgroundImageSelector(HomeState state) => state.homeAccountBackgroundImage;
GenerateDrawerItems homeOnGenerateDrawerItemsSelector(HomeState state) => state.homeOnGenerateDrawerItems;
GenerateActionItems homeOnGenerateActionItemsSelector(HomeState state) => state.homeOnGenerateActionItems;
GenerateTabItems homeOnGenerateTabItemsSelector(HomeState state) => state.homeOnGenerateTabItems;
GenerateTabContents homeOnGenerateTabContentsSelector(HomeState state) => state.homeOnGenerateTabContents;