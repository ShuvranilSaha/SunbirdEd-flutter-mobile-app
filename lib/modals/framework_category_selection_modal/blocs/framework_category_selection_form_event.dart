part of 'framework_category_selection_form_bloc.dart';

@immutable
abstract class FCSEvent {}

class FCSInitEvent extends FCSEvent {}

class FCSCategoryTermSelectionEvent extends FCSEvent {
  final int categoryIndex;
  final List<SelectOption> selectedOptions;

  FCSCategoryTermSelectionEvent({
    @required this.categoryIndex,
    @required this.selectedOptions,
  });

  @override
  String toString() {
    return 'FCSCategoryTermSelectionEvent{categoryIndex: $categoryIndex, selectedOptions: $selectedOptions}';
  }
}
