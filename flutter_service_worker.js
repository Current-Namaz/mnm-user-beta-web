'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"manifest.json": "0e3afe9366fb679139f2bce6d18858fa",
"index.html": "24e1286652a4ee801a89f9c295b57b18",
"/": "24e1286652a4ee801a89f9c295b57b18",
"assets/AssetManifest.bin": "440d82a9a08cf222f8d79bb7b5eddb63",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/assets/notifications_icon.svg": "a55b5842c3f0b4b16bc051e77679fd79",
"assets/assets/suggestions_in_progress.svg": "b0fed40d17fe61302022d7522b75094b",
"assets/assets/suggestions_completed.svg": "0762b9ecac63cf855ee291f23764e3c7",
"assets/assets/suggestions_requests.svg": "10cf8c200f718f906a845bf4b3424303",
"assets/assets/arrow_up_suggestion.svg": "e178ee191d9b6fa2eaaa52977ec23447",
"assets/assets/images/Line%25204.png": "fdc8798c88eaf039433c95ab13e3e17a",
"assets/assets/images/Map%2520Point.png": "999f58c9f9f8dc02356a8f3b8d4870e5",
"assets/assets/images/e619c65edb38af16a1592ddd03118e33.gif": "6243ab965550225923ae65a02aa8b748",
"assets/assets/images/qazaPrayersTotal.png": "97667092baf975ca1381e8df6160512f",
"assets/assets/images/homescreenbackground.svg": "70f0b36ac0486b9029a93f86ebeb5c52",
"assets/assets/images/totalimage1.png": "a57fce949bb19b42444f31f916c1cde2",
"assets/assets/images/dhuhr.png": "c89ccda0d569849660db421ece164ab6",
"assets/assets/images/compass.jpg": "28ee102c9013c2a4bbda8399ad15735c",
"assets/assets/images/fajr.png": "b007e0a7f4ebdf798bcce0f499086bab",
"assets/assets/images/check.png": "3dd62c892d3191e4b4756a068a903f9b",
"assets/assets/images/reload.png": "9b5ecedc71069acea5d2ae4af2d88d2a",
"assets/assets/images/place_holder.jpg": "902b2eac1adab7bc96e96ee7b8d5b98f",
"assets/assets/images/Rectangle%252039385.svg": "3c6df585007636cf317d546608d88d34",
"assets/assets/images/location.png": "6386e52c9fed7f018fc13581c8b85822",
"assets/assets/images/onBoard3.png": "21329384b6cb91701342cfcc99652362",
"assets/assets/images/uncheck.png": "1559658584f407d7d0fe508ccfbf0ba4",
"assets/assets/images/onBoard1.png": "dd2ac1eafbf070de159efd79b8fac7d0",
"assets/assets/images/splashimg.png": "9d5f27b2284f9bea332ddda5aca9fde4",
"assets/assets/images/Sunset.png": "27a0f64be5892f9d1fc6755eacae5aad",
"assets/assets/images/totalimage2.png": "89fa17655ffc9e87a473d70589791f25",
"assets/assets/images/asr.png": "9b32d8a8ff1e7999a52d125b7b8cd490",
"assets/assets/images/splashBGImg.png": "08057964878b1b8415e09f985b19ade3",
"assets/assets/images/Cloudny%2520Night.png": "3ed19fa5b07a897b8ef1a41b79f913f7",
"assets/assets/images/pexels.png": "e5a8c8829b53eaef748c63402587da12",
"assets/assets/images/onBoard2.png": "a66885478b05fa53787080a08dfd5da1",
"assets/assets/images/home_card_img2.png": "d8d0beebb80d015edd90d0ce720c543b",
"assets/assets/images/Info%2520Circle.png": "aff63859e6ab16a323f654d4d2fe1413",
"assets/assets/images/magrib.png": "2c96451d664fae5e32d5f3da920b709e",
"assets/assets/images/isha.png": "7cb3f052a2ab0b846379e26d0113120b",
"assets/assets/images/Clock%2520Circle.png": "5312fea15a4e314d9ea8f259518fc61a",
"assets/assets/images/homescreenbackground.png": "6ae80979d9c015a8fb63af847672a054",
"assets/assets/images/counterImage.png": "c673ffce17839f8dcb73170e7e5310d7",
"assets/assets/images/Sunrise.png": "0bef7f97780014e0f63a2163cd13ebd2",
"assets/assets/images/search.png": "a8296aa8ff5cdbb2a0166c6da3b54ab0",
"assets/assets/images/onBoard4.png": "6baacbf6ea8700133a0862c8d5a11a11",
"assets/assets/images/counterbackground.png": "d956b4ebb3b76c49c57378d3dc9f60d1",
"assets/assets/images/Restart.png": "1e6d5e442ba97574a06bf72028b2d187",
"assets/assets/images/dashboard/tasbih.png": "f95640931d07fa8549661aabb18bcbc3",
"assets/assets/images/dashboard/events.png": "46467b465d769d7fb1a7755a51082ca3",
"assets/assets/images/dashboard/namazTracker.png": "d472fd44363cf1bdd80c2e53a764641c",
"assets/assets/images/dashboard/daroods.png": "ee08c8a77eefdf417f2bb1a3ce636dd9",
"assets/assets/images/dashboard/qibla_needle.png": "889a936d377bd7e880d8c6c1d623351c",
"assets/assets/images/dashboard/counter.png": "cb12cb1626fe84505f51f62a5098c2a3",
"assets/assets/images/dashboard/calendar.png": "72f90df4db42e024409fc4c855ca038e",
"assets/assets/images/dashboard/notification.png": "efecc9663c942e54f13836d23942f5e9",
"assets/assets/images/dashboard/qibla.png": "6766839d0fe5062702a3690ba8fe26d6",
"assets/assets/images/dashboard/qibla_comapss.png": "ec78771f1909e3d7aa407d06f6595f28",
"assets/assets/images/dashboard/qazaNamaz.png": "148e75d2ed726ea4d5d4a4411d266e91",
"assets/assets/images/dashboard/commonDuas.png": "014e68aa010791ce16e25bd9842d7a22",
"assets/assets/images/dashboard/quran.png": "71639e36fd5e66c1db6d7a3f16a718d8",
"assets/assets/images/dashboard/compass_bg.png": "626257639a5bb64627f2efc2914a61f8",
"assets/assets/images/dashboard/qibla_bg.png": "f92813e5ed28f45b72b48d12130201a6",
"assets/assets/images/Sunny%2520with%2520cloud.png": "a0d588b19a5c926fb452c5135f4bf553",
"assets/assets/images/roza.png": "07501c4d34a11290702f69a17c3baa6e",
"assets/assets/images/witr.png": "32f13ace67e0eeac949fcc01a0db4a8a",
"assets/assets/images/Sun.png": "49ff9947f48008e1a5afe59147ef2be2",
"assets/assets/images/Alt%2520Arrow%2520Down.png": "e5a7ff794007e306daf366abc996ec9e",
"assets/assets/images/sent.png": "29c211b26b343a76c04195bb67c1dd8a",
"assets/assets/images/backgroundImage.png": "f5cdfbd76624dda7b39f96aa4cbb076d",
"assets/assets/images/mosque.png": "6a44d9aaa0ed4af59c010894509ac618",
"assets/assets/pen_icon.svg": "3a52d82e0209c466c6a009df52fe464d",
"assets/assets/arrow_left_icon.svg": "94d21835ad2d64282cdcb36060c25d8c",
"assets/assets/fonts/Manrope-ExtraLight.ttf": "100308b8ce2da4b67f4850e9b9252b26",
"assets/assets/fonts/Manrope-Regular.ttf": "f8105661cf5923464f0db8290746d2f9",
"assets/assets/fonts/Manrope-Bold.ttf": "69258532ce99ef9abf8220e0276fff04",
"assets/assets/fonts/Manrope-Light.ttf": "9e353f65739cc41a37bed272850cf92e",
"assets/assets/fonts/Manrope-SemiBold.ttf": "4410f0d144bea752f9bfb5f33909e0c5",
"assets/assets/fonts/Manrope-Medium.ttf": "aa9897f9fa37c84d7b9d3d05a8a6bc07",
"assets/assets/fonts/Manrope-ExtraBold.ttf": "8541582abce817ab8857c51ae0a35ca9",
"assets/assets/lottie/Loading%2520.json": "82620ce2daa9cd89daec228693f8f7de",
"assets/assets/lottie/animation_lls4oeid.json": "3f25ae7160cedc53f40aebad32f643f4",
"assets/assets/arrow_down_icon.svg": "b80d0a00333c3a94784b73baf14ef27f",
"assets/assets/download_icon.svg": "2d71cf4bfdc8cf4c5dd9d5acb8c7a92f",
"assets/assets/suggestions_declined.svg": "569f457194c134b72eef4cb9a88db9c3",
"assets/assets/close_icon.svg": "966a13cef4d007fa0031f4ef7ff48912",
"assets/assets/suggestions_duplicated.svg": "06435fa51f47bc27b21643cce7d2f214",
"assets/assets/plus_icon_thick.svg": "6e71f5850314c887e21b7a69b08290e4",
"assets/assets/plus_icon_thin.svg": "790c5e5ffa9f00bbe9dbbfbfcaec42a5",
"assets/assets/profile_icon.svg": "3b2d402fe38fa55e0f708a0ff93af8f9",
"assets/assets/check_icon.svg": "7f805a45e3f6a7337ac00ad507e06adf",
"assets/assets/delete_icon.svg": "d3cf6b9329e818a8fb5312f26de395e9",
"assets/assets/add_photo_icon.svg": "4a50c284a3adcf30486cd617fa2cc40d",
"assets/assets/icons/home_screen_icon/night_theme_icon.png": "66dc6dd9bc375a732dc3509a1464d4c3",
"assets/assets/icons/home_screen_icon/support_icon.png": "9e1ae832a9124ed048197e39ee244e9f",
"assets/assets/icons/home_screen_icon/light_theme_icon.png": "d64bd84bcc0c43a6ef9e9aa4c4896982",
"assets/assets/icons/app_text_logo.svg": "72f8e9fa968675e69bd782ce98cce02c",
"assets/assets/icons/selected_home_icon.png": "fc22d0a77ccd1bae5edf8fc6e464b19d",
"assets/assets/icons/pngwing.com.png": "81a360119d60aaaf588b87c27aad03c6",
"assets/assets/icons/google-play-png-logo-3798.png": "fd53fc3ed492c70d4db90920da79f7d3",
"assets/assets/icons/app_logo.png": "1cf59d5d39491eb326acc528827613e9",
"assets/assets/icons/shareImg.png": "8610244212b26ece48a95d5b8a4060b5",
"assets/assets/icons/home_icon.png": "09996f5647dd4a674f42939640b29d1e",
"assets/assets/icons/calendar.png": "281c7c9ca67b76f7e8b6e1293d648aa4",
"assets/assets/icons/location.png": "099a9c0b555483e75c3ba74ab913e030",
"assets/assets/icons/clock_icon.png": "2f425a448194fa4c0f19e1a98ac6c022",
"assets/assets/icons/dashboard.png": "41f8377a2a251b42d32ee97e768955f2",
"assets/assets/icons/selected_dashboard_icon.png": "f819df64441db3d7205ec7e496441592",
"assets/assets/icons/icon-foreground.png": "c55af110cc6fdb01c0b387122438e94d",
"assets/assets/icons/talk.png": "9c562cd68ce50b0a029bb5c8311c5ab5",
"assets/assets/icons/img.png": "6d4fd4edc3fda467b426d828839fe58f",
"assets/assets/icons/Mention%2520Circle.png": "a735095bfe7b7ac3b3fe4c9556f3a0ca",
"assets/assets/icons/star.png": "d62b22b052e071d01f3b0b20b4f85f99",
"assets/assets/icons/apple.png": "74598f18144eb40053936e20f7198c90",
"assets/assets/icons/dashboard.svg": "3a9217b352be86e3b4d432f9f8af525c",
"assets/assets/icons/dashboardIcon.png": "6a1231cf9d63eab229c1ff688ad7a05b",
"assets/assets/icons/selected_clock_icon.png": "da3443ab0d04068eb4cdb4dc7f14f491",
"assets/assets/icons/adaptive_icon_background.png": "858bbeb7696ec8d7aa11d30a3f380601",
"assets/assets/icons/security.png": "d222da427ae1612a9535c7e510965ea0",
"assets/assets/icons/4202011_email_gmail_mail_logo_social_icon.png": "c482c74f9b68b129513e3cef98ad34a7",
"assets/assets/icons/Vector.png": "a8ee8a9870ac37186a286b692f2bde41",
"assets/assets/icons/applogo.png": "e70b56525d1c24cb5ed653e70a495e91",
"assets/assets/icons/masjid.svg": "057a181abe585a51a602e34edd087614",
"assets/assets/icons/clock.png": "6cf6fcdec8b22b117bad2328984e405a",
"assets/assets/icons/dark_app_icon.png": "78e3569c2306ac1a3169ea5ea6c009fd",
"assets/AssetManifest.bin.json": "0450598d63be1ec0b3faebe7f017cc46",
"assets/FontManifest.json": "f59796faad59c2d017c63460bb9b405f",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/NOTICES": "f42c1c34d52141c1b746e30e860305a2",
"assets/AssetManifest.json": "128ac409ddac87dcadef2a6bd6d215ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "65d181634545ee8820a9d3d2ea7b9359",
"version.json": "5f5d268cf3667311881f4c09147b7488",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
