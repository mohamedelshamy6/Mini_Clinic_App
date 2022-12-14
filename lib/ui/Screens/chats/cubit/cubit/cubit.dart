import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/tab_model.dart';
import '../states/states.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(InitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  List<TabModel> tabs = const <TabModel>[
    TabModel(id: 0, text: 'All chats'),
    TabModel(id: 1, text: 'Personal'),
    TabModel(id: 2, text: 'Work'),
    TabModel(id: 3, text: 'Groups'),
  ];

  int selectedTab = 0;

  void changeTab(TabModel tab) {
    selectedTab = tab.id;

    emit(ChangeSelectionState());
  }
}
