import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunbird_ed_flutter_mobile_app/app_localizations.dart';
import 'package:sunbird_ed_flutter_mobile_app/modals/framework_category_selection_modal/blocs/framework_category_selection_form_bloc.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/forms/select_input/select_input.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/inputs/primary_button.dart';

class FrameworkCategorySelectionModal extends StatefulWidget {
  @override
  _FrameworkCategorySelectionModalState createState() =>
      _FrameworkCategorySelectionModalState();
}

class _FrameworkCategorySelectionModalState
    extends State<FrameworkCategorySelectionModal> {
  List<CategoryConfig> categories = [
    CategoryConfig(display: 'BOARD', code: 'board', multiSelect: false),
    CategoryConfig(display: 'MEDIUM', code: 'medium', multiSelect: true),
    CategoryConfig(display: 'CLASS', code: 'gradeLevel', multiSelect: true),
  ];
  String channelId = "0126632859575746566";
  FrameworkCategorySelectionFormBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = FrameworkCategorySelectionFormBloc(
      categories: categories,
      channelId: channelId,
    );

    bloc.add(
      FCSInitEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FrameworkCategorySelectionFormBloc>.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<FrameworkCategorySelectionFormBloc, FCSState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBody(context, state),
                  _buildContinueButton(context, state),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, FCSState state) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SelectInput(
              key: UniqueKey(),
              selection: state.selectionAt(index),
              title: AppLocalizations.of(context)
                  .translate(categories[index].display),
              options: state
                  .valueAt(index)
                  ?.options ?? [],
              onSelection: (selection) {
                bloc.add(
                  FCSCategoryTermSelectionEvent(
                    categoryIndex: index,
                    selectedOptions: [selection],
                  ),
                );
              },
            ),
            SizedBox(
              height: 16,
            ),
          ],
        );
      },
    );
  }

  Widget _buildContinueButton(BuildContext context, FCSState state) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (() {
              if (state is FCSCategoryTermsSelectedState) {
                return CircularProgressIndicator();
              } else {
                return PrimaryButton(
                  disabled: !state.isValid,
                  expanded: true,
                  text: "CONTINUE",
                  onPressed: () {},
                );
              }
            }())
          ],
        ),
      ),
    );
  }
}
