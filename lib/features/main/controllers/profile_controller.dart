import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/entity/user.dart';

class ProfileController extends BaseController {
  ProfileController(this._userStorage);

  final UserStorage _userStorage;

  final RxString userName = AppStrings.profilePlaceholderName.obs;
  final RxString userEmail = AppStrings.profilePlaceholderEmail.obs;
  final RxBool isVerified = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUser();
  }

  @override
  void onResumed() {
    super.onResumed();
    _loadUser();
  }

  Future<void> onPageVisible() async {
    if (!await _ensureLoggedIn()) return;
    await _loadUser();
  }

  Future<bool> _ensureLoggedIn() async {
    final token = await _userStorage.getToken();
    if (token == null || token.isEmpty) {
      navigateOffAll(AppRoutes.login);
      return false;
    }
    return true;
  }

  Future<void> _loadUser() async {
    final User? user = await _userStorage.getUser();
    userName.value = user?.fullName?.isNotEmpty == true
        ? user!.fullName!
        : AppStrings.profilePlaceholderName;
    userEmail.value = user?.email?.isNotEmpty == true
        ? user!.email!
        : AppStrings.profilePlaceholderEmail;
    isVerified.value = user?.status?.toLowerCase() == 'verified';
  }

  void onVerifyProfilePressed() {
    navigateTo(AppRoutes.kyc);
  }

  Future<void> onLogoutPressed() async {
    await _userStorage.clear();
    navigateOffAll(AppRoutes.main);
  }
}
