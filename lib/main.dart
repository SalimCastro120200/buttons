import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollViewController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              title: Text(
                'Buttons by Salim Castro 180017',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontFamily: "Smooch"),
              ),
              pinned: true,
              floating: true,
              forceElevated: boxIsScrolled,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "Alumno",
                    icon: Icon(Icons.person),
                  ),
                  Tab(
                    text: "Información",
                    icon: Icon(Icons.card_travel_sharp),
                  ),
                  Tab(
                    text: "Materias",
                    icon: Icon(Icons.dashboard_rounded),
                  )
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            Alumno(),
            Informacion(),
            Materias(),
          ],
          controller: _tabController,
        ),
      ),
      floatingActionButton: Column(
        // padding: const EdgeInsets.symmetric(vertical: 10.0),
        // child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.contacts_rounded),
            backgroundColor: Colors.indigo,
            onPressed: () {
              _tabController.animateTo(0,
                  curve: Curves.bounceInOut,
                  duration: Duration(milliseconds: 10));

              _scrollViewController.animateTo(
                  _scrollViewController.position.minScrollExtent,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.decelerate);

              _scrollViewController
                  .jumpTo(_scrollViewController.position.maxScrollExtent);
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.info),
            backgroundColor: Colors.indigo,
            onPressed: () {
              _tabController.animateTo(1,
                  curve: Curves.bounceInOut,
                  duration: Duration(milliseconds: 10));

              _scrollViewController.animateTo(
                  _scrollViewController.position.minScrollExtent,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.decelerate);

              _scrollViewController
                  .jumpTo(_scrollViewController.position.maxScrollExtent);
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.menu_book_sharp),
            backgroundColor: Colors.indigo,
            onPressed: () {
              _tabController.animateTo(2,
                  curve: Curves.bounceInOut,
                  duration: Duration(milliseconds: 10));

              _scrollViewController.animateTo(
                  _scrollViewController.position.minScrollExtent,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.decelerate);

              _scrollViewController
                  .jumpTo(_scrollViewController.position.maxScrollExtent);
            },
          ),
        ],
      ),
      // ),
    );
  }
}

class Alumno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 250.0,
      itemBuilder: (context, index) => Container(
        // width: MediaQuery.of(context).size.width * 2.5,
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(2.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey.shade200,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/salim.jpg',
                            height: 110,
                            width: 500,
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Salim Rafael Castro Ortiz"),
                          Text("180017"),
                          Text("salimrafael.castro@utxicotepec.edu.mx")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 250.0,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(10.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey.shade200,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Column(
                      children: <Widget>[
                        Text("Salim Rafael Castro Ortiz"),
                        Text("180017"),
                        Text("salimrafael.castro@utxicotepec.edu.mx"),
                        Text("CAOS120200HYNSRLA0"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Materias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 250.0,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(10.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey.shade200,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Column(
                      children: <Widget>[
                        Text(
                          "Materia",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Desarrollo Móvil Multiplataforma",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Docente",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "M.T.I. Marco Antonio Ramirez Hernandez",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
