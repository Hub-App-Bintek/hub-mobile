import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';

class DesignTypeController extends BaseController {
  void onSelectNonPrototype() {
    navigateTo(AppRoutes.consultation);
  }

  void onSelectPrototype() {
    navigateTo(AppRoutes.prototypeDesigns);
  }
}
