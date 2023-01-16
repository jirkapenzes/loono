import 'package:flutter_test/flutter_test.dart';
import 'package:loono/ui/screens/hospital/find_hospital_screen.dart';

import '../../../test_helpers/e2e_action_logging.dart';
import '../../../test_helpers/verify_visibility_state_helper.dart';
import '../../../test_helpers/widget_tester_extensions.dart';

/// * Corresponding screen: [FindHospitalScreen]
class FindHospitalPage with VerifyVisibilityStateHelper {
  FindHospitalPage(this.tester);

  final WidgetTester tester;

  /// Page methods
  Future<void> verifyScreenIsShown() async {
    logTestEvent();
    await tester.pumpUntilFound(find.byType(FindHospitalScreen));
  }
}
