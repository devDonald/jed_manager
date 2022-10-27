import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:jedmgr/features/distribution/model/update_customer_model.dart';

import '../../../core/themes/theme_colors.dart';
import '../../../core/widgets/primary_button.dart';
import '../feeders/services/feeder_services.dart';
import 'controller/distribution_controller.dart';

class UpdateCustomerBill extends StatefulWidget {
  final String token,
      mapAddress,
      longitude,
      latitude,
      status,
      feeder,
      customerNo,
      feederId,
      dtName,
      dtId,
      statusId,
      billId;

  static const String id = 'UpdateInfo';
  const UpdateCustomerBill(
      {Key? key,
      required this.token,
      required this.longitude,
      required this.latitude,
      required this.status,
      required this.customerNo,
      required this.feederId,
      required this.dtId,
      required this.mapAddress,
      required this.dtName,
      required this.statusId,
      required this.billId,
      required this.feeder})
      : super(key: key);

  @override
  _UpdateCustomerBillState createState() => _UpdateCustomerBillState();
}

class _UpdateCustomerBillState extends State<UpdateCustomerBill> {
  DistributionController cont = DistributionController.to;

  final _status = TextEditingController();
  final _feeder = TextEditingController();
  final _receiverNo = TextEditingController();
  final dt = TextEditingController();

  List<Map> _feederSearch = [];
  List<Map> _dtSearch = [];

  String feederId = '1', dtID = '1', statusId = '1', areaId = '1';

  Future<void> getFeeder() async {
    _feederSearch =
        await HelperServices.getFeeder('marketer/getAllFeeders', widget.token);
  }

  Future<void> getDT() async {
    _dtSearch = await HelperServices.getDT(
        'marketer/getFeederDts', widget.token, feederId);
  }

  @override
  void initState() {
    _status.text = widget.status;
    _feeder.text = widget.feeder;
    feederId = widget.feederId;
    statusId = widget.statusId;
    dtID = widget.dtId;
    dt.text = widget.dtName;

    getFeeder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleSpacing: -5,
        title: const Text('Update Customer Record'),
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
                    controller: _feeder,
                    style: const TextStyle(
                      color: ThemeColors.primaryGreyColor,
                      fontSize: 20.0,
                    ),
                    decoration: const InputDecoration(hintText: 'Feeder Name'),
                  ),
                  suggestionsCallback: (pattern) async {
                    // Here you can call http call
                    return _feederSearch.where(
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
                    _feeder.text = '${suggestion['name']}';
                    feederId = '${suggestion['id']}';
                    getDT();
                    print('feederId $feederId');
                  },
                ),
              ),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: false,
                    controller: dt,
                    style: const TextStyle(
                      color: ThemeColors.blackColor1,
                      fontSize: 18.0,
                    ),
                    decoration: const InputDecoration(hintText: 'DT Name'),
                  ),
                  suggestionsCallback: (pattern) async {
                    return _dtSearch.where(
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
                    dt.text = '${suggestion['name']}';
                    dtID = '${suggestion['id']}';
                  },
                ),
              ),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _receiverNo,
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Receiver\'s Phone Number:',
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
                    if (_status.text != '' ||
                        _feeder.text != '' ||
                        _receiverNo.text != '') {
                      UpdateCustomerModel model = UpdateCustomerModel(
                          resolvedAddress: widget.mapAddress,
                          feederId: feederId,
                          dtId: int.parse(dtID),
                          billStatus: int.parse(statusId),
                          receiverPhoneNumber: _receiverNo.text,
                          longitude: widget.longitude,
                          latitude: widget.latitude);
                      cont.updateAccount(model, widget.token, widget.customerNo,
                          widget.billId);
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
