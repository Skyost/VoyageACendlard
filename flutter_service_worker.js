'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "game.html": "ba4aedbe2679bd5df34147df57d89f4a",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"index.html": "02e9f6652c8de64220856f8b33588854",
"/": "02e9f6652c8de64220856f8b33588854",
"main.dart.js": "84c8770ad3c8e131cac0169beef2abc4",
"manifest.json": "1e20b3ebb3cf8925e58d08fc6e4278dd",
"favicon.png": "9a7954fda341bf0884244e028985be2c",
"icons/Icon-512.png": "df38b7a1503047cbddd583d472d0f812",
"icons/Icon-maskable-512.png": "6fef5c9d6ccabfb86272a073f194c7eb",
"icons/Icon-maskable-192.png": "b3ea1182aaac55f4c4877677d443eb67",
"icons/Icon-192.png": "d8c3e9720d122d0f46599bd0113f6f80",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/NOTICES": "487a789a521f77e3bac0bc5bdb533365",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/titlescreen-text.png": "50bc1e27210db14b116f1f7885c3da39",
"assets/assets/interactables/arrow-bedroom.svg": "3ee9aca6eab2df2f6a78374729b50ef5",
"assets/assets/interactables/arrow-lobby.svg": "e378ac85cd01df1777987b56797d43ee",
"assets/assets/interactables/arrow-principal-office.svg": "f67091262528b5fb19e32ccb81d1f0d5",
"assets/assets/interactables/cauldron.svg": "dcf055bcd9d9f7648c0e52e9e49b5936",
"assets/assets/interactables/arrow-forgiven-forest.svg": "cc99d51e9fd0ee2ff007adc1a3ddf0f3",
"assets/assets/interactables/trapdoor.svg": "d82837befdde124260930740c84e567c",
"assets/assets/interactables/arrow-teachers-bedrooms.svg": "d20a458f236b13c21ac2c42026e4fa97",
"assets/assets/padlocks/find-x.svg": "76c0ef0c77c0b59ca8c592a779201cff",
"assets/assets/padlocks/squares-2.svg": "b9d9c13b357a6c78b8a5eb5dd18b7078",
"assets/assets/padlocks/squares-1.svg": "76048240be7d26d1c8549ecb774b6e12",
"assets/assets/nothing.svg": "dc6cfddbf22b36bd11978c09f02974ff",
"assets/assets/objects/healing-potion.svg": "d1067fdd82d4e8d84c7e51f8c49a0e14",
"assets/assets/objects/champinum-enigma.svg": "bb60e1b28a0670ff82f8e1ac3381c6cf",
"assets/assets/objects/enchanted-spices.svg": "03ddde86ef63a2a3959a77e4eb3fae87",
"assets/assets/objects/voeilette.svg": "f00a375df6a33f876c1b19f5b3d06e2d",
"assets/assets/objects/scaribo.svg": "e36661462fe4b2f11eaea4dfbe9fffba",
"assets/assets/objects/medusa.svg": "4317612921fa84cc481dba8192a155f1",
"assets/assets/objects/purple-crystals.svg": "610996dde0bd07d4f4fc920c48b9ad44",
"assets/assets/objects/hericorne-claw.svg": "e734163c57846eb76c5fcb7006df06ab",
"assets/assets/objects/happiness-mirror.svg": "1445a030ac96a32a1db7f0445b5ad6a9",
"assets/assets/objects/forest-cards.svg": "29dd23a0bc5b0fa0c01ed11466ad4220",
"assets/assets/objects/teachers-rooms-key.svg": "3820af3714b76ee5fa3274a2fdc9b384",
"assets/assets/objects/sleeping-potion.svg": "f67f64ac10736d1e7090564a913fcf09",
"assets/assets/icon.svg": "35f3a4d89d595379ac699d0415855cf4",
"assets/assets/backgrounds/abandoned-classroom.png": "84eccfe07d0a7f2d2fd8cebc486aa797",
"assets/assets/backgrounds/lobby.png": "1db1d2e4b31b51daf4a10e33141d1382",
"assets/assets/backgrounds/abandoned-library.png": "1056f4f24051ccb7ba2118f9b12b89db",
"assets/assets/backgrounds/teachers-bedrooms.png": "2616b1eae4588ce31025f0b34a145acb",
"assets/assets/backgrounds/teacher-bedroom.png": "5943206efebd90727769ee4f1585f3ea",
"assets/assets/backgrounds/forgiven-forest.png": "ff2a176549049646c43739a959856ee8",
"assets/assets/backgrounds/bedroom.png": "49a2a886166cd0a8f8071cedfce990d9",
"assets/assets/backgrounds/principal-office.png": "50d14e3c3198fb65aee2f5acf5283ed9",
"assets/assets/backgrounds/titlescreen.png": "08ae271a86dfe79efdd117a50d389cb6",
"assets/assets/backgrounds/storage.png": "2a0babab701625fb73af9953aa1c331d",
"assets/packages/window_manager/images/ic_chrome_minimize.png": "4282cd84cb36edf2efb950ad9269ca62",
"assets/packages/window_manager/images/ic_chrome_unmaximize.png": "4a90c1909cb74e8f0d35794e2f61d8bf",
"assets/packages/window_manager/images/ic_chrome_close.png": "75f4b8ab3608a05461a31fc18d6b47c2",
"assets/packages/window_manager/images/ic_chrome_maximize.png": "af7499d7657c8b69d23b85156b60298c",
"assets/AssetManifest.json": "e7ae8969d6ee66b436bf985059f4d564",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"version.json": "e3bc15168191034fe5f347894eeb86f4",
"robots.txt": "9152d7f1724ed8fbcd2e0c87029f193c"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
