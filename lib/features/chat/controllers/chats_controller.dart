import 'package:get/get.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';

class InboxItem {
  InboxItem({required this.name, required this.preview});

  final String name;
  final String preview;
}

class ChatsController extends BaseController {
  final items = <InboxItem>[
    InboxItem(name: 'Haley James', preview: 'Stand up for what you believe in'),
    InboxItem(
      name: 'Nathan Scott',
      preview:
          'One day you’re seventeen and planning for someday. And then quietly and without…',
    ),
    InboxItem(name: 'Brooke Davis', preview: 'I am who I am. No excuses.'),
    InboxItem(
      name: 'Jamie Scott',
      preview: 'Some people are a little different. I think that’s cool.',
    ),
    InboxItem(
      name: 'Marvin McFadden',
      preview:
          'Last night in the NBA the Charlotte Bobcats quietly made a move that most sports fans…',
    ),
    InboxItem(name: 'Antwon Taylor', preview: 'Meet me at the Rivercourt'),
    InboxItem(
      name: 'Jake Jagielski',
      preview:
          'In your life, you’re gonna go to some great places, and do some wonderful things.',
    ),
    InboxItem(
      name: 'Peyton Sawyer',
      preview: 'Every song ends, is that any reason not to enjoy the music?',
    ),
  ].obs;

  void openChat(InboxItem item) {
    navigateTo(AppRoutes.chat, arguments: {'name': item.name});
  }
}
