// import 'package:flutter/foundation.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class SocketService {
//   late IO.Socket socket;
//   // TODO: Replace with actual socket URL
//   final String _socketUrl = 'https://dev-api.presshop.news:3005';
//   final String _userId =
//       '67ed646cd9889612efdd464c'; // Static user ID as requested

//   void initSocket() {
//     debugPrint(":::: Inside Socket Func :::::");
//     debugPrint("socketUrl:::::$_socketUrl");

//     socket = IO.io(
//       _socketUrl,
//       IO.OptionBuilder().setTransports(['websocket']).build(),
//     );

//     debugPrint("Socket Disconnect : ${socket.disconnected}");

//     socket.connect();

//     socket.onConnect((_) {
//       debugPrint('Connected to socket');
//       // Join room or initial setup if needed
//       // socket.emit('room join', {"room_id": "YOUR_ROOM_ID"});
//     });

//     socket.onDisconnect((_) => debugPrint('Disconnected from socket'));
//     socket.onError((data) => debugPrint("Error Socket ::: $data"));
//   }

//   void emitAlert({
//     required String alertType,
//     required LatLng position,
//     String message = "",
//   }) {
//     debugPrint(":::: Inside Socket Emit Alert :::::");

//     final Map<String, dynamic> data = {
//       "message_type": "alert",
//       "sender_id": _userId,
//       "message": message,
//       "alert_type": alertType,
//       "latitude": position.latitude,
//       "longitude": position.longitude,
//       "sender_type": "user",
//       "timestamp": DateTime.now().toIso8601String(),
//     };

//     debugPrint("Emit Socket Alert : $data");
//     socket.emit(
//       "alert_message",
//       data,
//     ); // Assuming 'alert_message' is the event name
//   }

//   void dispose() {
//     socket.dispose();
//   }
// }
