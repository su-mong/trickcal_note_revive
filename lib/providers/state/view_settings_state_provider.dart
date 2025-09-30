import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class ViewSettings {
  final bool isShowName;
  const ViewSettings({
    required this.isShowName,
  });
}

class ViewSettingsNotifier extends StateNotifier<ViewSettings> {
  ViewSettingsNotifier._(super.state);

  factory ViewSettingsNotifier.initial() => ViewSettingsNotifier._(
    ViewSettings(
      isShowName: false,
    ),
  );

  void toggleIsShowName() {
    state = ViewSettings(
      isShowName: !state.isShowName,
    );
  }
}

final viewSettingsStateProvider = StateNotifierProvider<ViewSettingsNotifier, ViewSettings>(
  (ref) => ViewSettingsNotifier.initial(),
);

final isShowNameProvider = Provider<bool>(
  (ref) => ref.watch(viewSettingsStateProvider.select((state) => state.isShowName)),
);