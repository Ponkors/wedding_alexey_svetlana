'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"wedding_icon.png": "d41d8cd98f00b204e9800998ecf8427e",
"flutter_bootstrap.js": "cfcce9f472d6aabc5c5059f82eccb3d6",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-maskable-512.png": "d41d8cd98f00b204e9800998ecf8427e",
"icons/Icon-maskable-192.png": "d41d8cd98f00b204e9800998ecf8427e",
"icons/Icon-512.png": "d41d8cd98f00b204e9800998ecf8427e",
"icons/Icon-192.png": "d41d8cd98f00b204e9800998ecf8427e",
"manifest.json": "7e0930329646215e01fd94c0695a046c",
"version.json": "3d0a8b3e454aa8006e8b32fefcd8e5e3",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"main.dart.js": "8e14410ce704e74f2b5e74211ca46535",
"index.html": "cbb85301dea3a16379052b22ca0b3a3a",
"/": "cbb85301dea3a16379052b22ca0b3a3a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/FontManifest.json": "c6b42c80a270f11c12b465049049458f",
"assets/NOTICES": "f9aee211fbb29db1acaeb276b265eebb",
"assets/AssetManifest.json": "828ca06391b9ea1f6dfad4b98e2793cc",
"assets/AssetManifest.bin": "381d87561370b98f795aee177be7f009",
"assets/AssetManifest.bin.json": "c175effc5913384d0fe9628b1e0b6f1c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "45154815a99b7d6ed9aa58c12f009424",
"assets/assets/images/wedding_registration.jpg.webp": "57a6e932e0139cd6a22622d6a9cb6d7e",
"assets/assets/images/pattern.png": "9d5bf0de20b2faf2c23994efd7566236",
"assets/assets/images/pattern.svg": "02df8ac9ba5ad42e4f6e5317741fcc8f",
"assets/assets/images/champagne.png": "387f935ee7c7ad4c82d56535d45a3124",
"assets/assets/images/franopol.jpg": "672e9c7e7af6a11256b2ff350bdd13e7",
"assets/assets/images/story2.jpg": "7bd1bd671ce8035d83785402324d8f43",
"assets/assets/images/wedding_meet.jpg": "fcea3ab3336914ca5a462e1005d437b5",
"assets/assets/images/rings.png": "de9110f622cbdaf072a1899a1e75ef26",
"assets/assets/images/church.jpg": "41be9f7a150cd161d7fd9c8f8a42ad32",
"assets/assets/images/flowers.png": "a62b770bf3056ad06116fea108d61e11",
"assets/assets/images/hero_bg.jpg": "fcfd774bff264e6a0ec2271a95d3c32d",
"assets/assets/images/groom.jpg": "8667c3d2ae812a1b0da4d9f8ef806e30",
"assets/assets/images/wedding_place.jpg": "5b77a84f3dd592d8dbaaede4af6be4fb",
"assets/assets/images/wedding_photosession.jpg": "6a36bcbc383b7479614b8568ecaf02e5",
"assets/assets/images/love.png": "93921696537a4445dd1921f6c1f19733",
"assets/assets/images/bride.jpg": "d2c10203b76a9a5b65cd8fc243394af6",
"assets/assets/images/story3.jpg": "ff61f9b9ee5383483e17f280a45fa446",
"assets/assets/images/story1.jpg": "38db7164b0ad04a670dd62bd3e24f727",
"assets/assets/images/hero_bg1.jpg": "0910bb6bc4c8faf3cd798b48e93279e0",
"assets/assets/images/hearth.png": "d802a78e19d968c43e1b1bd904325cb4",
"assets/assets/images/wedding_registration.jpg": "a8a3b92ba99e1132a5d04689281c3d5a",
"assets/assets/images/wedding_cake.png": "ecaa57aa28bbc01a1f066477c87cc16b",
"assets/assets/images/hero_bg2.jpg": "039af4f78d02926337b272cd66575480",
"assets/assets/images/wedding_marker.png": "7215ee9c7d9dc229d2921a40e899ec5f",
"assets/assets/images/venue.jpg": "bf84f03bc9f5e69f80f3d542cd0b4814",
"assets/assets/fonts/PlayfairDisplay-Regular.ttf": "1a28efdbd2876d90e554a67faabad24b",
"assets/assets/fonts/PlayfairDisplay-BoldItalic.ttf": "c6bd3951c4797106c1dac753a795534a",
"assets/assets/fonts/PlayfairDisplay-Bold.ttf": "9b38798112efb7cf6eca1de031cec4ca",
"assets/assets/fonts/PlayfairDisplay-Italic.ttf": "f38e89a44737b67d5dba2d9c860c3b65"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
