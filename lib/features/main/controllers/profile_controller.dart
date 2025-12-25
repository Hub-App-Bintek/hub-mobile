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
  void onResumed() {
    super.onResumed();
    _loadUser();
  }

  void onPageVisible() {
    _loadUser();
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

  void onChangePasswordPressed() {
    navigateTo(AppRoutes.changePassword);
  }

  Future<void> onLogoutPressed() async {
    await _userStorage.clear();
    navigateOffAll(AppRoutes.main);
  }
}
