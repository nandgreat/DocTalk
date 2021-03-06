import 'package:doctalk/models/doctors.dart';
import 'package:doctalk/utils/colors.dart';
import 'package:doctalk/utils/commons.dart';
import 'package:doctalk/view/book_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'expansionPanel.dart';

class DoctorProfile extends StatefulWidget {
  final Doctors doctor;

  DoctorProfile({this.doctor});

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: MyColors.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 33 / 100,
              color: MyColors.primaryColor,
              child: Column(
                children: [
                  Expanded(
                      flex: 22,
                      child: Column(
                        children: [
                          Text(
                            "${widget.doctor.firstname} ${widget.doctor.lastname}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          Text(
                            widget.doctor.specialty,
                            style: TextStyle(
                                color: Colors.grey[300], fontSize: 15.0),
                          ),
                        ],
                      )),
                  ProfileImage(context),
                  Expanded(
                    flex: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 2.0, top: 8.0, right: 2.0, bottom: 8.0),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("₦${widget.doctor.amount}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              Text("3 Years exp.",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              Text("34 likes",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          SizedBox(
            height: 5.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: MyColors.primaryColor,
                isScrollable: false,
                labelPadding: EdgeInsets.only(right: 10.0),
                unselectedLabelColor: Color(0xFFCDCDCD),
                unselectedLabelStyle: TextStyle(
                  color: Color(0xFFCDCDCD),
                ),
                tabs: [
                  Tab(
                    child: Text(
                      "Doctor's Info",
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Clinic Info',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Feedback',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 38 / 100,
            child: ListView(
              padding: EdgeInsets.only(left: 16.0),
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 50,
                  width: double.infinity,
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      ClinicInfoWidget(doctors: widget.doctor),
                      ClinicInfoWidget(doctors: widget.doctor),
                      FeedBackWidget()
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 8 / 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    print("So you want to book Dr. ${widget.doctor.firstname}");
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => BookDoctor(doctor: widget.doctor)));

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Center(
                        child: Text(
                      "Book Appointment",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded ProfileImage(BuildContext context) {
    return Expanded(
      flex: 60,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.phone,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(75),
                    color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 136.0,
                      width: 136.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(68),
                          color: Colors.transparent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 120.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(60),
                                color: Colors.transparent),
                            child: CircleAvatar(
                              backgroundImage:
                              NetworkImage("${Commons.imageBaseURL}${widget.doctor.photo}"),
                              radius: 100.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              width: 10.0,
            ),
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: SvgPicture.asset(
                  'assets/chat_bubble.svg',
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClinicInfoWidget extends StatelessWidget {

  final Doctors doctors;

  ClinicInfoWidget({this.doctors});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        clinicInfoItems(Icons.phone, doctors.phone),
        Divider(
          color: Colors.grey,
          height: 5,
          thickness: 0.3,
          indent: 10,
          endIndent: 10,
        ),
        clinicInfoItems(
            Icons.location_on, "24 I.T Igbani Street, Jabi, Abuja, Nigeria"),
      ],
    );
  }

  Padding clinicInfoItems(IconData itemIcon, String item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 4.0,
          ),
          Icon(
            itemIcon,
            color: Colors.grey[700],
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            item,
            style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

class FeedBackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "19 days ago",
                    style: TextStyle(color: Colors.grey[400], fontSize: 14.0),
                  ),
                  Text(
                    "Verified User - 1",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  Text(
                    "I'm very impressed with his service",
                    style: TextStyle(color: Colors.grey[700], fontSize: 14.0),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "19 days ago",
                    style: TextStyle(color: Colors.grey[400], fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    "Verified User - 1",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    "I'm very impressed with his service",
                    style: TextStyle(color: Colors.grey[700], fontSize: 14.0),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
