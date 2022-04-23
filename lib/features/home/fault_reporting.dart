import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:jedmgr/core/constants/contants.dart';
import 'package:jedmgr/features/fault_reporting/controller/fault_controller.dart';
import 'package:jedmgr/features/feeders/services/feeder_services.dart';
import 'package:jedmgr/features/home/fault_report_model.dart';

import '../../../core/themes/theme_colors.dart';
import '../../../core/widgets/primary_button.dart';

class FaultReporting extends StatefulWidget {
  static const String id = 'FaultReporting';
  final String token, longitude, latitude;
  const FaultReporting(
      {Key? key,
      required this.token,
      required this.longitude,
      required this.latitude})
      : super(key: key);

  @override
  _FaultReportingState createState() => _FaultReportingState();
}

class _FaultReportingState extends State<FaultReporting> {
  FaultController cont = FaultController.to;

  final phone = TextEditingController();
  final feeder = TextEditingController();
  final dt = TextEditingController();
  final _name = TextEditingController();
  final _description = TextEditingController();
  final _address = TextEditingController();
  final _status = TextEditingController();

  List<Map> _feederSearch = [];
  List<Map> _dtSearch = [];
  List<Map> _statusSearch = [];

  String feederId = '1', dtID = '1', statusId = '1', areaId = '1';

  Future<void> getFeeder() async {
    _feederSearch =
        await FeederServices.getFeeder('marketer/getAllFeeders', widget.token);

    _statusSearch =
        await FeederServices.getStatus('marketer/getAllStatuses', widget.token);
  }

  Future<void> getDT() async {
    _dtSearch = await FeederServices.getDT(
        'marketer/getFeederDts', widget.token, feederId);
  }

  @override
  void initState() {
    getFeeder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleSpacing: -5,
        title: const Text('Fault Reporting'),
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
              const SizedBox(height: 22.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _name,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      color: ThemeColors.blackColor1,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phone,
                  maxLength: 11,
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                    hintStyle: TextStyle(
                      color: ThemeColors.blackColor1,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _address,
                  decoration: const InputDecoration(
                    hintText: 'Address',
                    hintStyle: TextStyle(
                      color: ThemeColors.blackColor1,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _description,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  minLines: 2,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(
                      color: ThemeColors.blackColor1,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: false,
                    controller: _status,
                    style: const TextStyle(
                      color: ThemeColors.blackColor1,
                      fontSize: 18.0,
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
              const SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: false,
                    controller: feeder,
                    style: const TextStyle(
                      color: ThemeColors.blackColor1,
                      fontSize: 18.0,
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
                    feeder.text = '${suggestion['name']}';
                    feederId = '${suggestion['id']}';
                    if (mounted) {
                      setState(() {
                        getDT();
                      });
                    }
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
              const SizedBox(height: 49),
              Align(
                  alignment: Alignment.bottomRight,
                  child: PrimaryButton(
                    onTap: () async {
                      if (validatePhoneDescription(
                          phone.text, _description.text)) {
                        FaultReportModel model = FaultReportModel(
                          address: _address.text,
                          feederId: int.parse(feederId),
                          dtId: int.parse(dtID),
                          longitude: widget.longitude,
                          latitude: widget.latitude,
                          phone: phone.text,
                          description: _description.text,
                          name: _name.text,
                          statusId: int.parse(statusId),
                        );
                        cont.reportFaults(model, widget.token);
                      }
                    },
                    buttonTitle: 'Create Fault Report',
                    color: ThemeColors.primaryColor,
                    blurRadius: 3,
                    roundedEdge: 5,
                    width: double.infinity,
                    height: 36.5,
                    enabled: !cont.isLoading.value,
                    busy: cont.isLoading.value,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
