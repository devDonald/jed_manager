import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:jedmgr/core/constants/contants.dart';
import 'package:jedmgr/features/distribution/model/new_customer_details.dart';
import 'package:jedmgr/features/feeders/services/feeder_services.dart';

import '../../../core/themes/theme_colors.dart';
import '../../../core/widgets/primary_button.dart';
import 'controller/distribution_controller.dart';

class AddDT extends StatefulWidget {
  static const String id = 'AddDT';
  final String token, longitude, latitude, address;
  const AddDT(
      {Key? key,
      required this.token,
      required this.longitude,
      required this.address,
      required this.latitude})
      : super(key: key);

  @override
  _AddDTState createState() => _AddDTState();
}

class _AddDTState extends State<AddDT> {
  DistributionController cont = DistributionController.to;

  final receiverPhone = TextEditingController();
  final feeder = TextEditingController();
  final dt = TextEditingController();
  final _account_name = TextEditingController();
  final _account_no = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _band = TextEditingController();
  final _areaOffice = TextEditingController();
  final _status = TextEditingController();
  final _paymentDate = TextEditingController();
  final reportDetails = TextEditingController();
  final _paymentAmount = TextEditingController();

  List<Map> _feederSearch = [];
  List<Map> _dtSearch = [];
  List<Map> _areaSearch = [];
  List<Map> _statusSearch = [];

  String feederId = '1', dtID = '1', statusId = '1', areaId = '1';

  Future<void> getFeeder() async {
    _feederSearch =
        await HelperServices.getFeeder('marketer/getAllFeeders', widget.token);
    _areaSearch = await HelperServices.getAreaOffice(
        'marketer/getAllAreaOffices', widget.token);
    _statusSearch =
        await HelperServices.getStatus('marketer/getAllStatuses', widget.token);
  }

  Future<void> getDT() async {
    _dtSearch = await HelperServices.getDT(
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
        title: const Text('Add Customer Details'),
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
              const SizedBox(height: 9.5),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _account_no,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Customer\'s Account Number',
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
                  controller: _account_name,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    hintText: 'Customer\'s name',
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
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
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
                  textCapitalization: TextCapitalization.sentences,
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: false,
                    controller: _areaOffice,
                    style: const TextStyle(
                      color: ThemeColors.blackColor1,
                      fontSize: 18.0,
                    ),
                    decoration: const InputDecoration(hintText: 'Area Office'),
                  ),
                  suggestionsCallback: (pattern) async {
                    // Here you can call http call
                    return _areaSearch.where(
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
                    _areaOffice.text = '${suggestion['name']}';
                    areaId = '${suggestion['id']}';
                  },
                ),
              ),
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
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  readOnly: true,
                  controller: _paymentDate,
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
                        _paymentDate.text =
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
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _paymentAmount,
                  decoration: const InputDecoration(
                    hintText: 'Last Payment Amount',
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
                  controller: receiverPhone,
                  maxLength: 11,
                  decoration: const InputDecoration(
                    hintText: "Receiver's Phone",
                    hintStyle: TextStyle(
                      color: ThemeColors.blackColor1,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 49),
              Align(
                alignment: Alignment.bottomRight,
                child: PrimaryButton(
                  onTap: () async {
                    if (validateForm(
                        _account_no.text,
                        _account_name.text,
                        _address.text,
                        _paymentDate.text,
                        _band.text,
                        _paymentAmount.text)) {
                      NewCustomerModel model = NewCustomerModel(
                        resolvedAddress: widget.address,
                        accountNumber: _account_no.text,
                        address: _address.text,
                        areaOfficeId: areaId,
                        feederId: feederId,
                        dtId: dtID,
                        longitude: widget.longitude,
                        latitude: widget.latitude,
                        band: _band.text,
                        billStatus: statusId,
                        receiverPhoneNumber: receiverPhone.text,
                        email: _email.text,
                        lastPaymentAmount: int.parse(_paymentAmount.text),
                        lastPaymentDate: _paymentDate.text,
                        name: _account_name.text,
                        statusId: statusId,
                      );

                      cont.createAccount(model, widget.token);
                    }
                  },
                  buttonTitle: 'Create Customer',
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
