// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wayve_test_app/core/api/config.dart';
import 'package:wayve_test_app/core/enums/environment.dart';
import 'package:wayve_test_app/core/utils/loaders/shimmer_loader.dart';
import 'package:wayve_test_app/di.dart';
import 'package:wayve_test_app/features/user_status/data/models/user_response_model.dart';
import 'package:wayve_test_app/features/user_status/presentation/screens/user_list_screen.dart';
import 'package:wayve_test_app/features/user_status/presentation/view_models/user_view_model.dart';

import 'widget_test.mocks.dart';

dynamic responsePayload = {
  "meta": {
    "pagination": {
      "total": 2801,
      "pages": 141,
      "page": 1,
      "limit": 20,
      "links": {
        "previous": null,
        "current": "https://gorest.co.in/public/v1/users?page=1",
        "next": "https://gorest.co.in/public/v1/users?page=2"
      }
    }
  },
  "data": [
    {
      "id": 2822,
      "name": "Garud Guneta",
      "email": "garud_guneta@farrell.co",
      "gender": "male",
      "status": "active"
    },
    {
      "id": 2819,
      "name": "Manjusha Shah",
      "email": "shah_manjusha@hane-gibson.com",
      "gender": "male",
      "status": "active"
    },
    {
      "id": 2818,
      "name": "Brahmdev Pothuvaal I",
      "email": "pothuvaal_i_brahmdev@tillman-littel.info",
      "gender": "male",
      "status": "inactive"
    },
    {
      "id": 2813,
      "name": "Malati Deshpande V",
      "email": "deshpande_malati_v@sanford.net",
      "gender": "male",
      "status": "inactive"
    },
    {
      "id": 2812,
      "name": "Chanakya Iyengar",
      "email": "iyengar_chanakya@purdy-nicolas.info",
      "gender": "male",
      "status": "inactive"
    },
    {
      "id": 2811,
      "name": "Karan Ganaka",
      "email": "karan_ganaka@barrows.co",
      "gender": "female",
      "status": "inactive"
    },
    {
      "id": 2810,
      "name": "Dhanapati Abbott",
      "email": "abbott_dhanapati@hyatt.net",
      "gender": "male",
      "status": "active"
    },
    {
      "id": 2809,
      "name": "Lal Joshi IV",
      "email": "lal_iv_joshi@carroll-johns.name",
      "gender": "female",
      "status": "active"
    },
    {
      "id": 2808,
      "name": "Rajinder Kocchar",
      "email": "kocchar_rajinder@feeney-windler.com",
      "gender": "male",
      "status": "active"
    },
    {
      "id": 2807,
      "name": "Bala Pillai",
      "email": "pillai_bala@gusikowski.name",
      "gender": "female",
      "status": "inactive"
    },
    {
      "id": 2806,
      "name": "Lakshman Kaniyar",
      "email": "lakshman_kaniyar@simonis.biz",
      "gender": "female",
      "status": "active"
    },
    {
      "id": 2805,
      "name": "Udit Namboothiri DVM",
      "email": "udit_namboothiri_dvm@sporer-osinski.info",
      "gender": "male",
      "status": "inactive"
    },
    {
      "id": 2804,
      "name": "Brahmaanand Sethi DVM",
      "email": "sethi_brahmaanand_dvm@littel-denesik.biz",
      "gender": "male",
      "status": "active"
    },
    {
      "id": 2803,
      "name": "Chitrangada Chaturvedi",
      "email": "chaturvedi_chitrangada@yost.co",
      "gender": "female",
      "status": "inactive"
    },
    {
      "id": 2802,
      "name": "Bhooshit Dhawan JD",
      "email": "jd_bhooshit_dhawan@conroy.org",
      "gender": "male",
      "status": "inactive"
    },
    {
      "id": 2801,
      "name": "Anala Butt",
      "email": "anala_butt@kuhn-volkman.info",
      "gender": "male",
      "status": "inactive"
    },
    {
      "id": 2800,
      "name": "Kalyani Arora",
      "email": "arora_kalyani@lebsack.io",
      "gender": "female",
      "status": "active"
    },
    {
      "id": 2799,
      "name": "Sen. Ananta Sharma",
      "email": "ananta_sharma_sen@gottlieb.io",
      "gender": "male",
      "status": "active"
    },
    {
      "id": 2798,
      "name": "Ananda Bhattathiri",
      "email": "bhattathiri_ananda@goodwin.com",
      "gender": "female",
      "status": "active"
    },
    {
      "id": 2797,
      "name": "Gov. Rajiv Patil",
      "email": "gov_patil_rajiv@douglas.info",
      "gender": "female",
      "status": "inactive"
    }
  ]
};

@GenerateMocks([UserViewModel])
void main() async {
  await setupLocator();
  TestWidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  Config.envStatus = Environment.dev;

  var res = UserResponseModel.fromJson(responsePayload);

  group("Wayve App UI Tests", () {
    MockUserViewModel _mockUserViewModel = MockUserViewModel();

    when(_mockUserViewModel.activeUserList)
        .thenAnswer((_) => [...res.userEntities]);

    testWidgets("User Item test", (WidgetTester tester) async {
      MaterialApp testWidget = const MaterialApp(
        home: UserListScreen(),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(testWidget);
        expect(find.byType(ShimmerLoadingWidget), findsWidgets);
        expect(_mockUserViewModel.activeUserList, isNotEmpty);
      });
    });
  });
}
