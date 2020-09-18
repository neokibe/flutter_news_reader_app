import 'package:flutter/material.dart';
import 'package:news_reader/core/model/news_response.dart';
import 'package:news_reader/presentation/blocs/news_bloc.dart';
import 'package:news_reader/presentation/widgets/news_row.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  NewsBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_bloc == null){
    _bloc = Provider.of<NewsBloc>(context);
      _bloc.fetchNews();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "News Reader",
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: makeBody(context),
    );
  }

  Widget makeBody(BuildContext context) => RefreshIndicator(
        child: Container(
          color: Colors.white,
          child: makeGridView(context),
        ),
        onRefresh: _bloc.fetchNews,
      );

  Widget makeGridView(BuildContext context) => Container(
        padding: EdgeInsets.only(bottom: 4.0, right: 2.0, left: 2.0),
        child: StreamBuilder<NewsResponse>(
            stream: _bloc.newsResponseStream,
            builder: (context, snapshot) {
              return GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 4.0,
                  ),
                  itemCount: snapshot.data?.news?.length ?? 0,
                  itemBuilder: (BuildContext context, int position) =>
                      NewsRow(snapshot.data?.news?.elementAt(position)));
            }),
      );
}
