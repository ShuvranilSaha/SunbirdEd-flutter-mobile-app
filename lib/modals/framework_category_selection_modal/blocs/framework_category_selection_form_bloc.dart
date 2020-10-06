import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/forms/select_input/select_input.dart';
import 'package:sunbird_flutter_client_services/core.dart';
import 'package:sunbird_flutter_client_services/models.dart';
import 'package:sunbird_flutter_client_services/services.dart';

part 'framework_category_selection_form_event.dart';

part 'framework_category_selection_form_state.dart';

class CategoryConfig {
  final String display;
  final String code;
  final bool multiSelect;

  CategoryConfig(
      {@required this.display, @required this.code, @required this.multiSelect});
}

class FrameworkCategorySelectionFormBloc extends Bloc<FCSEvent, FCSState> {
  final List<CategoryConfig> categories;
  final String channelId;

  Framework _frameworkCache;

  FrameworkCategorySelectionFormBloc(
      {@required this.categories, @required this.channelId})
      : super(FCSInitialState());

  CsFrameworkService _frameworkService = CsModule().frameworkService;

  @override
  Stream<FCSState> mapEventToState(FCSEvent event,) async* {
    if (event is FCSInitEvent) {
      var channel = await _frameworkService.getChannel(channelId);
      var suggestedFrameworks =
      await _frameworkService.getChannelSuggestedFrameworkList(channel);

      yield FCSSuggestedFrameworksLoadedState.fromSuggestedFramework(
        prevState: state,
        suggestedFrameworks: suggestedFrameworks,
      );
    } else if (event is FCSCategoryTermSelectionEvent) {
      yield FCSCategoryTermsSelectedState.fromSelections(
        categoryIndex: event.categoryIndex,
        prevState: state,
        selections: event.selectedOptions,
      );

      if (event.categoryIndex == 0) {
        _frameworkCache = await _frameworkService
            .getFramework(event.selectedOptions.first.value);

        final frameworkCategoryTerms =
        await _frameworkService.getFrameworkCategoryTerms(
          _frameworkCache,
          categories[event.categoryIndex].code,
        );

        if (frameworkCategoryTerms.isEmpty) {
          return;
        }

        event.selectedOptions.clear();
        event.selectedOptions.add(SelectOption(
          label: frameworkCategoryTerms.first.name,
          value: frameworkCategoryTerms.first.code,
        ));
      }

      if (categories.length > event.categoryIndex + 1) {
        final categoryTerms = await _frameworkService.getFrameworkCategoryTerms(
          _frameworkCache,
          categories[event.categoryIndex + 1].code,
          event.categoryIndex == 0 ? null : categories[event.categoryIndex]
              .code,
          event.selectedOptions.map((o) => o.value as String).toList(),
        );

        yield FCSCategoryTermsLoadedState.fromCategoryTerms(
          categoryIndex: event.categoryIndex,
          prevState: state,
          categoryTerms: categoryTerms,
        );
      }

      if (categories.length == event.categoryIndex + 1) {
        yield FCSCompleteState(prevState: state);
      }
    }
  }
}
