part of 'framework_category_selection_form_bloc.dart';

class FCSField extends LinkedListEntry<FCSField> {
  List<SelectOption> options;
  List<SelectOption> selections;

  FCSField({@required this.options, @required this.selections});

  get isValid {
    return options.length > 0 && selections.length > 0;
  }
}

@immutable
abstract class FCSState {
  final LinkedList<FCSField> fields;

  FCSState({
    this.fields
  });

  FCSField valueAt(int index) {
    try {
      return fields.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  SelectOption selectionAt(int index) {
    try {
      return fields
          .elementAt(index)
          .selections
          .first;
    } catch (e) {
      return null;
    }
  }

  List<SelectOption> selectionsAt(int index) {
    try {
      return fields
          .elementAt(index)
          .selections;
    } catch (e) {
      return null;
    }
  }

  get isValid {
    return fields.every((f) => f.isValid);
  }
}

@immutable
class FCSInitialState extends FCSState {
  FCSInitialState() : super(
      fields: LinkedList<FCSField>()
  );
}

@immutable
class FCSSuggestedFrameworksLoadedState extends FCSState {
  factory FCSSuggestedFrameworksLoadedState.fromSuggestedFramework({
    @required FCSState prevState,
    @required List<Framework> suggestedFrameworks,
  }) {
    final field = prevState.fields;
    field.clear();
    field.addFirst(FCSField(
      options: suggestedFrameworks
          .map((f) => SelectOption<String>(label: f.name, value: f.identifier))
          .toList(),
      selections: List<SelectOption>(),
    ));
    return FCSSuggestedFrameworksLoadedState._(values: field);
  }

  FCSSuggestedFrameworksLoadedState._({LinkedList<FCSField> values})
      : super(fields: values);
}

@immutable
class FCSCategoryTermsSelectedState extends FCSState {
  factory FCSCategoryTermsSelectedState.fromSelections({
    @required int categoryIndex,
    @required FCSState prevState,
    @required List<SelectOption> selections,
  }) {
    final fields = prevState.fields;

    try {
      fields
          .elementAt(categoryIndex)
          .selections
          .clear();
      fields
          .elementAt(categoryIndex)
          .selections
          .addAll(selections);
    } catch (e) {}

    return FCSCategoryTermsSelectedState._(fields: fields);
  }

  FCSCategoryTermsSelectedState._({LinkedList<FCSField> fields})
      : super(fields: fields);
}

@immutable
class FCSCategoryTermsLoadedState extends FCSState {
  factory FCSCategoryTermsLoadedState.fromCategoryTerms({
    @required int categoryIndex,
    @required FCSState prevState,
    @required List<CategoryTerm> categoryTerms,
  }) {
    final fields = prevState.fields;

    try {
      while (fields.length != categoryIndex) {
        fields.elementAt(categoryIndex + 1).unlink();
      }
    } catch (e) {} finally {
      fields.add(FCSField(
        options: categoryTerms
            .map((f) => SelectOption<String>(label: f.name, value: f.code))
            .toList(),
        selections: List<SelectOption>(),
      ));
    }

    return FCSCategoryTermsLoadedState._(fields: fields);
  }

  FCSCategoryTermsLoadedState._({LinkedList<FCSField> fields})
      : super(fields: fields);
}

@immutable
class FCSCompleteState extends FCSState {
  FCSCompleteState({
    @required FCSState prevState,
  }) : super(fields: prevState.fields);
}
