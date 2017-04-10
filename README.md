# College Application ( MYC App ) Created by The Panthers Team

A PhoneGap app using [Framework7 HTML Framework](http://framework7.io/) and the [Spotify API](https://developer.spotify.com/web-api/).

## Previewing the app

### Requirements

- PhoneGap CLI: `npm install -g phonegap`

### Clone

```
git clone https://github.com/phonegap/phonegap-app-star-track
cd phonegap-app-star-track
phonegap serve
```

### Template

Alternatively, you can use the app as a template for the PhoneGap CLI:

```
phonegap create StarTrack --template phonegap-app-star-track
cd StarTrack
phonegap serve
```

### View

You can now view the app either in a browser at`localhost:3000`, or using the [PhoneGap Developer App](http://app.phonegap.com/) on your device(s).


Of course, all the other PhoneGap CLI commands work as expected.

```
phonegap platform add ios
phonegap run ios
cordova platform add android
cordova run android --device
```



### Starting your API
To start the api 
cd to mycapp/mycapi
and type node .
This starts the api and your api should be up at 0.0.0.0:3002
and then cd back to mycapp and try phonegap serve and support page should be able to access the api.
Good Luck!
