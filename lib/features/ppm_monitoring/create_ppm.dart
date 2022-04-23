import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:jedmgr/core/constants/contants.dart';
import 'package:jedmgr/features/fault_reporting/controller/fault_controller.dart';
import 'package:jedmgr/features/feeders/services/feeder_services.dart';
import 'package:jedmgr/features/ppm_monitoring/create_ppm_model.dart';

import '../../../core/themes/theme_colors.dart';
import '../../../core/widgets/primary_button.dart';

class CreatePPM extends StatefulWidget {
  static const String id = 'CreatePPM';
  final String token, longitude, latitude;
  const CreatePPM(
      {Key? key,
      required this.token,
      required this.longitude,
      required this.latitude})
      : super(key: key);

  @override
  _CreatePPMState createState() => _CreatePPMState();
}

class _CreatePPMState extends State<CreatePPM> {
  FaultController cont = FaultController.to;

  final phone = TextEditingController();
  final feeder = TextEditingController();
  final dt = TextEditingController();
  final _meter_no = TextEditingController();
  final _band = TextEditingController();
  final _address = TextEditingController();
  final _vendingDate = TextEditingController();

  List<Map> _feederSearch = [];
  List<Map> _dtSearch = [];

  String feederId = '1', dtID = '1', statusId = '1', areaId = '1';

  Future<void> getFeeder() async {
    _feederSearch =
        await FeederServices.getFeeder('marketer/getAllFeeders', widget.token);
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
        title: const Text('Create PPM'),
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
                  controller: _meter_no,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    hintText: "Meter Serial Number",
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
                    hintText: "Customer's Phone Number",
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
                  controller: _band,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Band',
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
                  readOnly: true,
                  controller: _vendingDate,
                  style: const TextStyle(
                    color: ThemeColors.blackColor1,
                    fontSize: 18.0,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Date of Last Payment',
                  ),
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015),
                      lastDate: DateTime(2025),
                    ).then((selectedDate) {
                      if (selectedDate != null) {
                        _vendingDate.text =
                            DateFormat('yyyy-MM-dd').format(selectedDate);
                      }
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter date.';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 22),
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
                    setState(() {
                      getDT();
                    });
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
                      if (validatePhoneAddress(phone.text, _address.text,
                          _vendingDate.text, _meter_no.text)) {
                        CreatePpmModel model = CreatePpmModel(
                          address: _address.text,
                          feederId: int.parse(feederId),
                          dtId: int.parse(dtID),
                          lastVendingDate: _vendingDate.text,
                          statusId: 1,
                          longitude: widget.longitude,
                          latitude: widget.latitude,
                          phone: phone.text,
                          band: _band.text,
                          meterSerialNumber: _meter_no.text,
                        );
                        cont.createPPM(model, widget.token);
                      }
                    },
                    buttonTitle: 'Create PPM',
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
