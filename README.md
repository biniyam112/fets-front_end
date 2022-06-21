# Financial expenditure tracking System mobile app(fets_mobile)


Betsegaw Gizaw		  atr/1332/10
Biniyam Demissew	atr/7840/10
Ebsa Teklu			        atr/0373/10
Ermiyas Gashu		    atr/2227/10
Yididiya Kebede		    atr/4056/10

Advisor : Yoseph Abate

FETS mobile app is a mobile platform application used in our system by donors. Donors can view and explore multiple projects that are added to the system. Donors can also fund projects using multiple payment options. Donated money will be available in projects to be assigned to specific tasks(to the project manager)

The Feeds area is used to display some statistical information. This information is available both in the mobile and web app. 

tools used for mobile project
Flutter framework is used for mobile app development.
important packages within the project include 
flutterweb3 - used to connect the app to the smart contract deployed on the blockchain network.
bloc- a flutter state management package.
flutter_stripe- all in one flutter payment package 

Installation process
1, run "flutter pub get" in the project directory

![Get packages](https://github.com/biniyam112/fets-front_end/blob/mobile/screenshot/Screenshot%20from%202022-06-21%2015-42-01.png?raw=true)

2, Connect mobile device or start mobile emulator
3, run "flutter run" in project directory to directly install the app

![run flutter app](https://github.com/biniyam112/fets-front_end/blob/mobile/screenshot/Screenshot%20from%202022-06-21%2015-42-27.png?raw=true)
4, or run "flutter build apk --split-per-abi" to create build file

![build mobile app](https://github.com/biniyam112/fets-front_end/blob/mobile/screenshot/Screenshot%20from%202022-06-21%2015-41-37.png?raw=true)
5, locate the app in /build/app/outputs/apk/release/ directory and install the app

![app direcotory](https://github.com/biniyam112/fets-front_end/blob/mobile/screenshot/Screenshot%20from%202022-06-21%2016-25-15.png?raw=true)

References:

Youtube, Block Revolution, Flutter Dapp Simple Wallet. (27 Jan 2022).
Accessed: 29 May 2022[online video].
Available: https://www.youtube.com/watch?v=JMfIBpuAhKA





A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
