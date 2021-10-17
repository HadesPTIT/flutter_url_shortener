# flutter_url_shortener

A URL shortener built with Flutter using [Bitly API service](https://dev.bitly.com/api-reference)

## Getting Started 

First, you need to register account and get token from [here](https://bitly.com/)

* Converts a long url to a Bitlink.
* Converts a long url to a Bitlink and sets additional parameters.

### Example

> Converts a long url to a Bitlink and sets additional parameters.

~~~dart
try {
      FShort.instance
          .generateShortenURL(longUrl: 'https://www.google.com.vn/')
          .then((value) {
        setState(() {
          _shortenURL = value.link;
        });
      });
    } on BitlyException catch (e) {
      // TODO
    } on Exception catch (e) {
      // TODO
    }
~~~

> Converts a long url to a Bitlink.

~~~dart
try {
      FShort.instance
          .createBitLink(
              params: BitlyParams(
        longUrl: "https://dev.bitly.com",
        domain: 'bit.ly',
        tags: ['ver1.1', 'ver1.2'],
        deeplinks: [
          DeeplinkParams(
            appId: 'com.hades.test',
            appUriPath: '/store?id=123456',
            installUrl:
                'https://play.google.com/store/apps/details?id=com.hades.test&hl=en_US',
            installType: 'promote_install',
          ),
        ],
      ))
          .then((value) {
        setState(() {
          _customURL = value.link;
        });
      });
    } on BitlyException catch (e) {
      // TODO
    } on Exception catch (e) {
      // TODO
    }
~~~