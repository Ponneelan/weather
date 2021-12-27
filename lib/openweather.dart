import 'package:flutter/material.dart';
import 'api.dart';
class OpenWeather extends StatefulWidget {
  String city;   
  OpenWeather(this.city,{Key? key}) : super(key: key ) ;
  @override
  _OpenWeatherState createState() => _OpenWeatherState();
}
class _OpenWeatherState extends State<OpenWeather> {
  late Future<Weather> FutureWeather;  
  @override
  void initState(){
    super.initState();
    FutureWeather=fetchWeather();  
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      iconTheme:const IconThemeData(
        color: Colors.black
      ),
      actions: <Widget>[
        IconButton(onPressed: (){
          Navigator.pop(context);
        }, 
        icon: const Icon(Icons.search,
        color: Colors.black,))
      ],
      elevation: 0,
      backgroundColor: Colors.white,      
      ),
      body: Center(
        child: FutureBuilder<Weather>(
          future: FutureWeather,
          builder: (context, snapshot){             
            if(snapshot.hasData){               
              return ListView(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 60.0,),
                      Text(snapshot.data!.name.toUpperCase(),style:const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,letterSpacing: 3)),
                      const SizedBox(height: 25.0,),
                      Text(snapshot.data!.mainw.toUpperCase(),style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 3,color: Colors.black38)),
                      const SizedBox(height: 30,),
                      
                            Container(
                              padding: EdgeInsets.only(left: 10,right: 10),
                              height: 350,
                              width: double.infinity,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[                                  
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('${snapshot.data!.temp-273.15}'.toString().substring(0,2),style: TextStyle(fontSize:130,),),
                                      const Text('o',style: TextStyle(fontSize: 40),)                                      
                                    ],
                                  ),                                 
                                  const SizedBox(height: 30,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 100,
                                        width: 50,
                                        child:  Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            const Text("Min",style: TextStyle(color: Colors.black38,fontSize: 15),),
                                            const SizedBox(height: 10,),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text('${snapshot.data!.min_temp-273.15}'.toString().substring(0,2),style: TextStyle(fontSize:25,),),
                                                  const Text('o',style: TextStyle(fontSize: 10),)                                      
                                                 ],
                                                ),
                                          ],
                                        ),
                                      ),
                                      const VerticalDivider(color: Colors.black12,),
                                      SizedBox(
                                        height: 100,
                                        width: 60,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            const Text("Max",style: TextStyle(color: Colors.black38,fontSize: 15),),
                                            const SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                              Text('${snapshot.data!.max_temp-273.15}'.toString().substring(0,2),style: TextStyle(fontSize:25,),),
                                              const Text('o',style: TextStyle(fontSize: 10),)
                                               ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            
                          
                      const SizedBox(height: 10,),
                      Container(
                        height: 80,
                        width: double.infinity,
                        //color: Colors.black12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:  <Widget>[
                            SizedBox(
                              width: 90,
                              child:Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 5,),
                                    Text("Country",style: TextStyle(color: Colors.black38,fontSize: 16),),
                                    SizedBox(height: 20,),
                                    Text('${snapshot.data!.country}'.toString(),style: TextStyle(fontSize: 17),)
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(),
                            SizedBox(
                              width: 90,
                              child:Container(
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(height: 5,),
                                    const Text("Pressure",style: TextStyle(color: Colors.black38,fontSize: 17),),
                                    const SizedBox(height: 20,),
                                    Text('${snapshot.data!.pressure} hPa',style: TextStyle(fontSize: 17),)
                                  ],
                                ),
                              ),
                            ),
                           const VerticalDivider(),
                            SizedBox(
                              width: 90,
                              child:Container(
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(height: 5,),
                                    const Text("Visibility",style: TextStyle(color: Colors.black38,fontSize: 17),),
                                    const SizedBox(height: 20,),
                                    Text('${snapshot.data!.visibility/1000}'.substring(0,2)+' km',style: TextStyle(fontSize: 17),)
                                  ],
                                ),
                              ),      
                            ),
                            const VerticalDivider(),
                            SizedBox(
                              width: 90,
                              child:Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 5,),
                                    Text("Feels Like",style: TextStyle(color: Colors.black38,fontSize: 17),),
                                    SizedBox(height: 20,),
                                    Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                              Text('${snapshot.data!.max_temp-273.15}'.toString().substring(0,2),style: TextStyle(fontSize:17,),),
                                              const Text('o',style: TextStyle(fontSize: 10),)
                                               ],
                                            ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      SizedBox(height: 10,),
                      Container(
                        height: 80,
                        width: double.infinity,
                        //color: Colors.black12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:  <Widget>[
                            SizedBox(
                              width: 90,
                              child:Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 5,),
                                    Text("wind speed",style: TextStyle(color: Colors.black38,fontSize: 16),),
                                    SizedBox(height: 20,),
                                    Text('${snapshot.data!.wind_speed} '.toString().substring(0,5)+' km/h',style: TextStyle(fontSize: 17),)
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(),
                            SizedBox(
                              width: 90,
                              child:Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 5,),
                                    Text("sunrise",style: TextStyle(color: Colors.black38,fontSize: 17),),
                                    SizedBox(height: 20,),
                                    Text('${DateTime.fromMillisecondsSinceEpoch(snapshot.data!.sunrise*1000)} '.substring(11,16)+' AM',style: TextStyle(fontSize: 17),)
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(),
                            SizedBox(
                              width: 90,
                              child:Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 5,),
                                    Text("sunset",style: TextStyle(color: Colors.black38,fontSize: 17),),
                                    SizedBox(height: 20,),
                                    Text('${DateTime.fromMillisecondsSinceEpoch(snapshot.data!.sunset*1000)} '.substring(11,16)+' PM',style: TextStyle(fontSize: 17),)
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(),
                            SizedBox(
                              width: 90,
                              child:Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 5,),
                                    Text("Humidity",style: TextStyle(color: Colors.black38,fontSize: 17),),
                                    SizedBox(height: 20,),
                                    Text('${snapshot.data!.humidity}%'.toString(),style: TextStyle(fontSize: 17),)
                                  ],
                                ),
                              ),
                              
                            ),
                            
                          ],
                        ),
                      )

                    ],
                  ),
                  
                ],
              );              
            }
            else if(snapshot.hasError){
              return const Image(image: AssetImage('images/404.png'),
              height: 1000,
              width: 1000,);
            }
            else{
              return CircularProgressIndicator();
            }           
          }
        ),
      ),
    
    );
  }
}

