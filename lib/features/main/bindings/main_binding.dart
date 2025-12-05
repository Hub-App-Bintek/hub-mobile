import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';
import 'package:pkp_hub/domain/repositories/wallet_repository.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/get_consultations_use_case.dart';
import 'package:pkp_hub/domain/usecases/wallet/get_wallet_balance_use_case.dart';
import 'package:pkp_hub/features/main/controllers/home_controller.dart';
import 'package:pkp_hub/features/main/controllers/main_controller.dart';
import 'package:pkp_hub/features/main/controllers/profile_controller.dart';
import 'package:pkp_hub/features/main/controllers/projects_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(Get.find<UserStorage>()));
    Get.lazyPut(
      () => GetWalletBalanceUseCase(Get.find<WalletRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => GetConsultationsUseCase(Get.find<ConsultationRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => HomeController(
        Get.find<UserStorage>(),
        Get.find<GetWalletBalanceUseCase>(),
        Get.find<GetConsultationsUseCase>(),
      ),
      fenix: true,
    );
    Get.lazyPut<CreateDirectChatRoomUseCase>(
      () => CreateDirectChatRoomUseCase(Get.find<ChatRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => ProjectsController(
        Get.find<UserStorage>(),
        Get.find<GetConsultationsUseCase>(),
        Get.find<CreateDirectChatRoomUseCase>(),
      ),
      fenix: true,
    );
    Get.lazyPut(() => ProfileController(Get.find<UserStorage>()), fenix: true);
  }
}
