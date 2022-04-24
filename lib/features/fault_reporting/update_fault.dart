import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:jedmgr/features/cash_drive/cash_drive_model.dart';

import '../../../core/themes/theme_colors.dart';
import '../../../core/widgets/primary_button.dart';
import '../distribution/controller/distribution_controller.dart';
import '../feeders/services/feeder_services.dart';

class UpdateBill extends StatefulWidget {
  final String token, longitude, latitude, statusName, statusId, billId;

  static const String id = 'UpdateInfo';
  const UpdateBill({
    Key? key,
    required this.token,
    required this.billId,
    required this.longitude,
    required this.latitude,
    required this.statusName,
    required this.statusId,
  }) : super(key: key);

  @override
  _UpdateBillState createState() => _UpdateBillState();
}

class _UpdateBillState extends State<UpdateBill> {
  DistributionController cont = DistributionController.to;

  final _status = TextEditingController();
  final _amount_paid = TextEditingController();

  List<Map> _statusSearch = [];

  String statusId = '1';

  Future<void> getFeeder() async {
    _statusSearch = await FeederServices.getStatus(
        'marketer/getAllBillsStatus', widget.token);
  }

  @override
  void initState() {
    _status.text = widget.statusName;
    statusId = widget.statusId;

    getFeeder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleSpacing: -5,
        title: const Text('Update Bill Record'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 15.0,
            left: 10,
            right: 10,
            bottom: 30, //fNow
          ),
          margin: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 20,
            bottom: 10,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ThemeColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(0.0, 2.5),
                color: ThemeColors.shadowColor,
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: false,
                    controller: _status,
                    style: const TextStyle(
                      color: ThemeColors.primaryGreyColor,
                      fontSize: 20.0,
                    ),
                    decoration: const InputDecoration(hintText: 'Status'),
                  ),
                  suggestionsCallback: (pattern) async {
                    // Here you can call http call
                    return _statusSearch.where(
                      (doc) => jsonEncode(doc)
                          .toLowerCase()
                          .contains(pattern.toLowerCase()),
                    );
                  },
                  itemBuilder: (context, dynamic suggestion) {
                    return ListTile(
                      title: Text(suggestion['name']),
                    );
                  },
                  onSuggestionSelected: (dynamic suggestion) {
                    // This when someone click the items
                    _status.text = '${suggestion['name']}';
                    statusId = '${suggestion['id']}';
                  },
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _amount_paid,
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Amount Paid',
                    hintStyle: TextStyle(
                      color: ThemeColors.primaryGreyColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomRight,
                child: PrimaryButton(
                  onTap: () async {
                    if (_status.text != '' && _amount_paid.text != '') {
                      UpdateBillModel model = UpdateBillModel(
                          statusId: int.parse(statusId),
                          amount: int.parse(_amount_paid.text),
                          longitude: widget.longitude,
                          latitude: widget.latitude);
                      cont.updateBill(model, widget.token, widget.billId);
                    }
                  },
                  buttonTitle: 'Update Record',
                  color: ThemeColors.primaryColor,
                  blurRadius: 3,
                  roundedEdge: 5,
                  width: double.infinity,
                  height: 36.5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
