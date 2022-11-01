import 'package:flutter/material.dart';
import 'package:final_07610433/models/country_items.dart';
import 'package:final_07610433/services/api.dart';

class CountryListPage extends StatefulWidget {
  const CountryListPage({Key? key}) : super(key: key);

  @override
  _CountryListPageState createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  List<CountryItem>? _CountryList;
  var _isLoading = false;
  String? _errMessage;

  @override
  void initState() {
    super.initState();
    fetchCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Final Exam 07510433')),
      body: Column(
        children: [

          Expanded(
            child: Stack(
              children: [

                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: null /* add child content here */,
                ),
                Row(
                  mainAxisAlignment : MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/images/logo.jpg",
                        height: 120,
                      ),
                    ),
                   
                  ],


               ),


                if (_CountryList != null)
                  ListView.builder(
                    itemBuilder: _buildListItem,
                    itemCount: _CountryList!.length,
                  ),
                if (_isLoading)
                  const Center(child: CircularProgressIndicator()),
                if (_errMessage != null && !_isLoading)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(_errMessage!),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            fetchCountryData();
                          },
                          child: const Text('RETRY'),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchCountryData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var data = await Api().fetch('');
      setState(() {
        _CountryList = data
            .map<CountryItem>((item) => CountryItem.fromJson2(item))
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  Widget _buildListItem(BuildContext context, int index) {
    var countryItem = _CountryList![index];

    return Card(
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Image.network(
              countryItem.flagImage,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8.0),
            Text(countryItem.team),

          ],
        ),
      ),
    );

  }
}
