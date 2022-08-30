'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "7ba66efa9b34dc851c98930a4c26e0e0",
"index.html": "4b4f5ff757c9a521111a2dbe22712631",
"/": "4b4f5ff757c9a521111a2dbe22712631",
"main.dart.js": "2e8f83ce5a4cd09b5336161dc65f087c",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"favicon.png": "1912996a920b0d11ac8dc76cc908d426",
"icons/Icon-192.png": "54c1f7521c12486153a7b28167f83127",
"icons/Icon-maskable-192.png": "54c1f7521c12486153a7b28167f83127",
"icons/Icon-maskable-512.png": "6c0c2aff862d9680fe8c796a32b5696d",
"icons/Icon-512.png": "6c0c2aff862d9680fe8c796a32b5696d",
"manifest.json": "33a6f985571120e3fbc25fb173c9d850",
"assets/AssetManifest.json": "11549a2c8b20b8ff78ea697df100b306",
"assets/NOTICES": "1058ecb6dfc8f626e12a5e0c9a38f1a8",
"assets/FontManifest.json": "8347478b606c16ea8b211aaa262596e8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/fonts/IRANYekanRegular.ttf": "5504ec99783af49b905fcb3c4ed78e55",
"assets/fonts/IRANYekanBold.ttf": "339f2e127eec6ea1db42d9af398fddde",
"assets/fonts/Dana.ttf": "acc123755c7483e8696fd1e1db79569a",
"assets/fonts/IRANSansMobile.ttf": "d41d82662a710e51ece8325e239c7711",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/fonts/Dana-Bold.ttf": "9836727bfffbcfc305967259ae3ad400",
"assets/assets/png100px/tg.png": "7f91f02b26b74899ff882868bd611714",
"assets/assets/png100px/me.png": "590284bc85810635ace30a173e615ca4",
"assets/assets/png100px/la.png": "e8cd9c3ee6e134adcbe3e986e1974e4a",
"assets/assets/png100px/mr.png": "ec08a3fc510204bc6d741d16452c3ac5",
"assets/assets/png100px/ni.png": "e398dc23e79d9ccd702546cc25f126bf",
"assets/assets/png100px/lv.png": "99712c75e89fa90652b83c41fac343db",
"assets/assets/png100px/om.png": "978e5be1e8156c3b80b6167b14cc14b8",
"assets/assets/png100px/af.png": "ba710b50a060b5351381b55366396c30",
"assets/assets/png100px/cy.png": "7b36f4af86257a3f15f5a5a16f4a2fcd",
"assets/assets/png100px/bj.png": "6fdc6449f73d23ad3f07060f92db4423",
"assets/assets/png100px/aq.png": "0c586e7b91aa192758fdd0f03adb84d8",
"assets/assets/png100px/cn.png": "4c9a123fedb85d9e86cdcdc7447e1b0e",
"assets/assets/png100px/gb-sct.png": "497ce8cd3b0a58ef647b66dc060c37f3",
"assets/assets/png100px/co.png": "e3b1be16dcdae6cb72e9c238fdddce3c",
"assets/assets/png100px/cx.png": "8efa3231c8a3900a78f2b51d829f8c52",
"assets/assets/png100px/ag.png": "41c11d5668c93ba6e452f811defdbb24",
"assets/assets/png100px/ms.png": "9c955a926cf7d57fccb450a97192afa7",
"assets/assets/png100px/md.png": "e8a0147ceb71bd458704e446958b275b",
"assets/assets/png100px/zm.png": "81cec35b715f227328cad8f314acd797",
"assets/assets/png100px/vn.png": "32ff65ccbf31a707a195be2a5141a89b",
"assets/assets/png100px/tf.png": "b2c044b86509e7960b5ba66b094ea285",
"assets/assets/png100px/td.png": "6d35e9d972e29a722bec54452b3cd990",
"assets/assets/png100px/yt.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/png100px/lb.png": "f80cde345f0d9bd0086531808ce5166a",
"assets/assets/png100px/mf.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/png100px/lu.png": "72eb0fe6bb97a59f97f1e30d273c4131",
"assets/assets/png100px/mq.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/png100px/cz.png": "73ecd64c6144786c4d03729b1dd9b1f3",
"assets/assets/png100px/ae.png": "fc01978928642b0904d3fa1b8ed0b41e",
"assets/assets/png100px/cm.png": "42d52fa71e8b4dbb182ff431749e8d0d",
"assets/assets/png100px/bi.png": "adda8121501f0543f1075244a1acc275",
"assets/assets/png100px/ar.png": "3bd245f8c28f70c9ef9626dae27adc65",
"assets/assets/png100px/as.png": "d9c1da515c6f945c2e2554592a9dfaae",
"assets/assets/png100px/bh.png": "a1acd86ef0e19ea5f0297bbe1de6cfd4",
"assets/assets/png100px/cl.png": "6735e0e2d88c119e9ed1533be5249ef1",
"assets/assets/png100px/ad.png": "384e9845debe9aca8f8586d9bedcb7e6",
"assets/assets/png100px/mp.png": "629e3c5f0df92bb664c9ef71e0b5a4a3",
"assets/assets/png100px/lt.png": "ab515ec4ccdb894c136b21d1fc9a0e8c",
"assets/assets/png100px/mg.png": "0ef6271ad284ebc0069ff0aeb5a3ad1e",
"assets/assets/png100px/lc.png": "8c1a03a592aa0a99fcaf2b81508a87eb",
"assets/assets/png100px/tr.png": "27feab1a5ca390610d07e0c6bd4720d5",
"assets/assets/png100px/ua.png": "b7df7f812d0109eb09b7c4f836876262",
"assets/assets/png100px/tv.png": "c57025ed7ae482210f29b9da86b0d211",
"assets/assets/png100px/vi.png": "3f317c56f31971b3179abd4e03847036",
"assets/assets/png100px/mt.png": "b20145b26552e6457ef94a6ac93043e9",
"assets/assets/png100px/no.png": "33bc70259c4908b7b9adeef9436f7a9f",
"assets/assets/png100px/mc.png": "90c2ad7f144d73d4650cbea9dd621275",
"assets/assets/png100px/ch.png": "a59f128eba5538288d04888283c65f6e",
"assets/assets/png100px/bl.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/png100px/aw.png": "a93ddf8e32d246dc47f6631f38e0ed92",
"assets/assets/png100px/bz.png": "be51262dcb7f7c05f4ded261340af150",
"assets/assets/png100px/bm.png": "b366ba84cbc8286c830f392bb9086be5",
"assets/assets/png100px/ci.png": "7f5ca3779d5ff6ce0c803a6efa0d2da7",
"assets/assets/png100px/mu.png": "c5228d1e94501d846b5bf203f038ae49",
"assets/assets/png100px/us.png": "83b065848d14d33c0d10a13e01862f34",
"assets/assets/png100px/tw.png": "0457d069077e07de39913e00fdcea271",
"assets/assets/png100px/ye.png": "4cf73209d90e9f02ead1565c8fdf59e5",
"assets/assets/png100px/mw.png": "ffc1f18eeedc1dfbb1080aa985ce7d05",
"assets/assets/png100px/nl.png": "3649c177693bfee9c2fcc63c191a51f1",
"assets/assets/png100px/ls.png": "2bca756f9313957347404557acb532b0",
"assets/assets/png100px/bo.png": "3ccf6fa7f9cbc27949b8418925e4e89c",
"assets/assets/png100px/at.png": "570c070177a5ea0fe03e20107ebf5283",
"assets/assets/png100px/ck.png": "39f343868a8dc8ca95d27b27a5caf480",
"assets/assets/png100px/by.png": "69be51a4aa792fab712bd1d5739476c6",
"assets/assets/png100px/au.png": "72be14316f0af3903cdca7a726c0c589",
"assets/assets/png100px/bn.png": "ed650de06fff61ff27ec92a872197948",
"assets/assets/png100px/ma.png": "a08e705105c4bedbb77d887dce1a72c9",
"assets/assets/png100px/nz.png": "65c811e96eb6c9da65538f899c110895",
"assets/assets/png100px/lr.png": "b92c75e18dd97349c75d6a43bd17ee94",
"assets/assets/png100px/mv.png": "d9245f74e34d5c054413ace4b86b4f16",
"assets/assets/png100px/tc.png": "d728d6763c17c520ad6bcf3c24282a29",
"assets/assets/png100px/ug.png": "9a0f358b1eb19863e21ae2063fab51c0",
"assets/assets/png100px/tt.png": "a8e1fc5c65dc8bc362a9453fadf9c4b3",
"assets/assets/png100px/pl.png": "f20e9ef473a9ed24176f5ad74dd0d50a",
"assets/assets/png100px/rs.png": "19d22d6f6f8ad35da02c9437075a1fda",
"assets/assets/png100px/in.png": "d0f6ff1ca8b3e945f5978c44b32b6cf1",
"assets/assets/png100px/ge.png": "6fbd41f07921fa415347ebf6dff5b0f7",
"assets/assets/png100px/gr.png": "ec11281d7decbf07b81a23a72a609b59",
"assets/assets/png100px/gs.png": "419dd57836797a3f1bf6258ea6589f9a",
"assets/assets/png100px/gd.png": "7a4864ccfa2a0564041c2d1f8a13a8c9",
"assets/assets/png100px/io.png": "ab226831d6901b67aba33a79e733ff87",
"assets/assets/png100px/hk.png": "72d3d1e95daa8fbc3988389d43cf840b",
"assets/assets/png100px/kp.png": "e1c8bb52f31fca22d3368d8f492d8f27",
"assets/assets/png100px/gb-nir.png": "98773db151c150cabe845183241bfe6b",
"assets/assets/png100px/kg.png": "9572be69d94d41346647b9c07b30d721",
"assets/assets/png100px/pm.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/png100px/sv.png": "217b691efbef7a0f48cdd53e91997f0e",
"assets/assets/png100px/re.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/png100px/sa.png": "bf181e09111f39bcfd9dd9d7adeab3d7",
"assets/assets/png100px/sc.png": "e969fd5afb1eb5902675b6bcf49a8c2e",
"assets/assets/png100px/st.png": "fef62c31713ff1063da2564df3f43eea",
"assets/assets/png100px/ke.png": "cf5aae3699d3cacb39db9803edae172b",
"assets/assets/png100px/im.png": "52314fd7ac783912ce7d322ebe4db8b3",
"assets/assets/png100px/kr.png": "a3b7da3b76b20a70e9cd63cc2315b51b",
"assets/assets/png100px/gf.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/png100px/dj.png": "078bd37d41f746c3cb2d84c1e9611c55",
"assets/assets/png100px/gq.png": "4286e56f388a37f64b21eb56550c06d9",
"assets/assets/png100px/gp.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/png100px/dk.png": "abcd01bdbcc02b4a29cbac237f29cd1d",
"assets/assets/png100px/gg.png": "eed435d25bd755aa7f9cd7004b9ed49d",
"assets/assets/png100px/il.png": "1e06ad7783f24332405d36561024cc4c",
"assets/assets/png100px/pn.png": "0b0641b356af4c3e3489192ff4b0be77",
"assets/assets/png100px/sb.png": "296ecedbd8d1c2a6422c3ba8e5cd54bd",
"assets/assets/png100px/py.png": "5a9868d3f5c5f8be641252fdb41150e7",
"assets/assets/png100px/ru.png": "5ea1e5949eb325e6fdf00160159e0b8c",
"assets/assets/png100px/kw.png": "3ca448e219d0df506fb2efd5b91be092",
"assets/assets/png100px/do.png": "ed35983a9263bb5713be37d9a52caddc",
"assets/assets/png100px/gt.png": "706a0c3b5e0b589c843e2539e813839e",
"assets/assets/png100px/gb.png": "98773db151c150cabe845183241bfe6b",
"assets/assets/png100px/gu.png": "2acb614b442e55864411b6e418df6eab",
"assets/assets/png100px/je.png": "288f8dca26098e83ff0455b08cceca1b",
"assets/assets/png100px/hm.png": "72be14316f0af3903cdca7a726c0c589",
"assets/assets/png100px/sg.png": "bc772e50b8c79f08f3c2189f5d8ce491",
"assets/assets/png100px/pk.png": "7a6a621f7062589677b3296ca16c6718",
"assets/assets/png100px/sr.png": "66c6eb40fe7cbc207fc646bcd1b20b58",
"assets/assets/png100px/se.png": "25dd5434891ac1ca2ad1af59cda70f80",
"assets/assets/png100px/jp.png": "25ac778acd990bedcfdc02a9b4570045",
"assets/assets/png100px/gw.png": "05606b9a6393971bd87718b809e054f9",
"assets/assets/png100px/eh.png": "515a9cf2620c802e305b5412ac81aed2",
"assets/assets/png100px/dz.png": "132ceca353a95c8214676b2e94ecd40f",
"assets/assets/png100px/ga.png": "b0e5b2fa1b7106c7652a955db24c11c4",
"assets/assets/png100px/fr.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/png100px/dm.png": "8886b222ed9ccd00f67e8bcf86dadcc2",
"assets/assets/png100px/hn.png": "0582914a18ec9cfeaf672f00433d817e",
"assets/assets/png100px/sd.png": "65ce270762dfc87475ea99bd18f79025",
"assets/assets/png100px/rw.png": "d1aae0647a5b1ab977ae43ab894ce2c3",
"assets/assets/png100px/ph.png": "e4025d1395a8455f1ba038597a95228c",
"assets/assets/png100px/ss.png": "92652bb6538e87bcaec3f36133d1806b",
"assets/assets/png100px/qa.png": "eb9b3388e554cf85aea1e739247548df",
"assets/assets/png100px/pe.png": "4d9249aab70a26fadabb14380b3b55d2",
"assets/assets/png100px/pr.png": "f1e1648178c221dd9a9739a28009840e",
"assets/assets/png100px/si.png": "da453c534e1a374176a56ab0a755ae51",
"assets/assets/png100px/ht.png": "4bbbd098423d282807f73c9529fe39a6",
"assets/assets/png100px/es.png": "654965f9722f6706586476fb2f5d30dd",
"assets/assets/png100px/gl.png": "b79e24ee1889b7446ba3d65564b86810",
"assets/assets/png100px/gm.png": "7148d3715527544c2e7d8d6f4a445bb6",
"assets/assets/png100px/er.png": "8ca78e10878a2e97c1371b38c5d258a7",
"assets/assets/png100px/fi.png": "3ccd69a842e55183415b7ea2c04b15c8",
"assets/assets/png100px/ee.png": "d00e16b53763c7ce8a42dd02fa411fb8",
"assets/assets/png100px/kn.png": "f318e2fd87e5fd2cabefe9ff252bba46",
"assets/assets/png100px/hu.png": "df87d805f90359074924a03d8a56955b",
"assets/assets/png100px/iq.png": "bc3e6f68c5188dbf99b473e2bea066f2",
"assets/assets/png100px/ky.png": "d7b4a69dc210a6375a44826fdda80434",
"assets/assets/png100px/sh.png": "98773db151c150cabe845183241bfe6b",
"assets/assets/png100px/ps.png": "52a25a48658ca9274830ffa124a8c1db",
"assets/assets/png100px/pf.png": "2f00cd99d184ffe47c6535a0839c184e",
"assets/assets/png100px/sj.png": "33bc70259c4908b7b9adeef9436f7a9f",
"assets/assets/png100px/id.png": "a0232ab265d5aae4774ac90a9df79328",
"assets/assets/png100px/is.png": "f546c8f9316fc2010d92a1e8dbdc8fd4",
"assets/assets/png100px/eg.png": "311d780e8e3dd43f87e6070f6feb74c7",
"assets/assets/png100px/fk.png": "da8b0fe48829aae2c8feb4839895de63",
"assets/assets/png100px/fj.png": "1c6a86752578eb132390febf12789cd6",
"assets/assets/png100px/gn.png": "b2287c03c88a72d968aa796a076ba056",
"assets/assets/png100px/gy.png": "159a260bf0217128ea7475ba5b272b6a",
"assets/assets/png100px/ir.png": "37f67c3141e9843196cb94815be7bd37",
"assets/assets/png100px/km.png": "5554c8746c16d4f482986fb78ffd9b36",
"assets/assets/png100px/ie.png": "7861ac704bc87a0a177e9656857eeb15",
"assets/assets/png100px/kz.png": "cb3b0095281c9d7e7fb5ce1716ef8ee5",
"assets/assets/png100px/ro.png": "85af99741fe20664d9a7112cfd8d9722",
"assets/assets/png100px/sk.png": "1685313d27bd1a210edfd280f13ae881",
"assets/assets/png100px/pg.png": "0f7e03465a93e0b4e3e1c9d3dd5814a4",
"assets/assets/png100px/pt.png": "f7c1cc53dbe403ad2b6a21069f2afe8b",
"assets/assets/png100px/so.png": "1ce20d052f9d057250be96f42647513b",
"assets/assets/png100px/sx.png": "9c19254973d8acf81581ad95b408c7e6",
"assets/assets/png100px/hr.png": "ab77c2f85f850ce120f81c4627138dc3",
"assets/assets/png100px/ki.png": "14db0fc29398730064503907bd696176",
"assets/assets/png100px/jm.png": "2414f68d9e1b3b9bd1c70abbf00ce99e",
"assets/assets/png100px/eu.png": "c58ece3931acb87faadc5b940d4f7755",
"assets/assets/png100px/ec.png": "c1ae60d080be91f3be31e92e0a2d9555",
"assets/assets/png100px/et.png": "57edff61c7fddf2761a19948acef1498",
"assets/assets/png100px/fo.png": "2c7d9233582e83a86927e634897a2a90",
"assets/assets/png100px/kh.png": "d48d51e8769a26930da6edfc15de97fe",
"assets/assets/png100px/sy.png": "08d6ab96719ea1231c0925fdb1652216",
"assets/assets/png100px/sn.png": "68eaa89bbc83b3f356e1ba2096b09b3c",
"assets/assets/png100px/pw.png": "0e7f32166da73c57187d7fc88961d8d2",
"assets/assets/png100px/sl.png": "2efdc34361931814ddfa5fa33c968312",
"assets/assets/png100px/gb-eng.png": "0d9f2a6775fd52b79e1d78eb1dda10cf",
"assets/assets/png100px/fm.png": "d571b8bc4b80980a81a5edbde788b6d2",
"assets/assets/png100px/gi.png": "446aa44aaa063d240adab88243b460d3",
"assets/assets/png100px/de.png": "5d9561246523cf6183928756fd605e25",
"assets/assets/png100px/gh.png": "b35464dca793fa33e51bf890b5f3d92b",
"assets/assets/png100px/jo.png": "c01cb41f74f9db0cf07ba20f0af83011",
"assets/assets/png100px/it.png": "302954e632261d7f5b8f13e9181a8505",
"assets/assets/png100px/pa.png": "bb2140b5a908502c3eb78e6359883280",
"assets/assets/png100px/sz.png": "d1829842e45c2b2b29222c1b7e201591",
"assets/assets/png100px/sm.png": "8e1e356080c68882f13b557439db7e61",
"assets/assets/png100px/tn.png": "6612e9fec4bef022cbd45cbb7c02b2b6",
"assets/assets/png100px/ml.png": "0c50dfd539e87bb4313da0d4556e2d13",
"assets/assets/png100px/cg.png": "eca97338cc1cb5b5e91bec72af57b3d4",
"assets/assets/png100px/ax.png": "48e3d10da408d18b6b79d6faf72428ff",
"assets/assets/png100px/ao.png": "5f0a372aa3aa7150a3dafea97acfc10d",
"assets/assets/png100px/bt.png": "3cfe1440e952bc7266d71f7f1454fa23",
"assets/assets/png100px/bb.png": "a8473747387e4e7a8450c499529f1c93",
"assets/assets/png100px/cf.png": "cd2b286d2eae150a5aa33743ab264461",
"assets/assets/png100px/mm.png": "32e5293d6029d8294c7dfc3c3835c222",
"assets/assets/png100px/li.png": "ecdf7b3fe932378b110851674335d9ab",
"assets/assets/png100px/na.png": "cdc00e9267a873609b0abea944939ff7",
"assets/assets/png100px/mz.png": "1ab1ac750fbbb453d33e9f25850ac2a0",
"assets/assets/png100px/to.png": "1cdd716b5b5502f85d6161dac6ee6c5b",
"assets/assets/png100px/vg.png": "fc095e11f5b58604d6f4d3c2b43d167f",
"assets/assets/png100px/ve.png": "893391d65cbd10ca787a73578c77d3a7",
"assets/assets/png100px/tz.png": "56ec99c7e0f68b88a2210620d873683a",
"assets/assets/png100px/tm.png": "523bda0442cdbe873f831429925157ff",
"assets/assets/png100px/mx.png": "84b12a569b209e213daccfcbdd1fc799",
"assets/assets/png100px/nc.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/png100px/mo.png": "849848a26bbfc87024017418ad7a6233",
"assets/assets/png100px/lk.png": "b70a269974449870ca07a624a7ada832",
"assets/assets/png100px/cd.png": "5b5f832ed6cd9f9240cb31229d8763dc",
"assets/assets/png100px/al.png": "722cf9e5c7a1d9c9e4608fb44dbb427d",
"assets/assets/png100px/bw.png": "4e223201bbbac6d01f5f644eb00231e7",
"assets/assets/png100px/cr.png": "bfd8b41e63fc3cc829c72c4b2e170532",
"assets/assets/png100px/bv.png": "33bc70259c4908b7b9adeef9436f7a9f",
"assets/assets/png100px/am.png": "aaa39141fbc80205bebaa0200b55a13a",
"assets/assets/png100px/az.png": "6ffa766f6883d2d3d350cdc22a062ca3",
"assets/assets/png100px/ba.png": "d415bad33b35de3f095177e8e86cbc82",
"assets/assets/png100px/mn.png": "ff2a285bdf836a1ff6f35f78b6ffbb3c",
"assets/assets/png100px/nu.png": "f4169998548e312584c67873e0d9352d",
"assets/assets/png100px/my.png": "204f43310ca121ae267c8b0d5a16ea46",
"assets/assets/png100px/tl.png": "ca6f376172bf3c3fbf3bd5e8de27ce39",
"assets/assets/png100px/ws.png": "f206322f3e22f175869869dbfadb6ce8",
"assets/assets/png100px/th.png": "11ce0c9f8c738fd217ea52b9bc29014b",
"assets/assets/png100px/xk.png": "079259fbcb1f3c78dafa944464295c16",
"assets/assets/png100px/nf.png": "1c2069b299ce3660a2a95ec574dfde25",
"assets/assets/png100px/ly.png": "8d65057351859065d64b4c118ff9e30e",
"assets/assets/png100px/ai.png": "ce5e91ed1725f0499b9231b69a7fd448",
"assets/assets/png100px/br.png": "5093e0cd8fd3c094664cd17ea8a36fd1",
"assets/assets/png100px/cv.png": "9b1f31f9fc0795d728328dedd33eb1c0",
"assets/assets/png100px/be.png": "7e5e1831cdd91935b38415479a7110eb",
"assets/assets/png100px/ca.png": "76f2fac1d3b2cc52ba6695c2e2941632",
"assets/assets/png100px/bd.png": "86a0e4bd8787dc8542137a407e0f987f",
"assets/assets/png100px/cw.png": "6c598eb0d331d6b238da57055ec00d33",
"assets/assets/png100px/bs.png": "fe732c75505c38f30594b74c43b02633",
"assets/assets/png100px/ng.png": "aedbe364bd1543832e88e64b5817e877",
"assets/assets/png100px/mk.png": "6b3213bccb9864b2777d5dd6217d5964",
"assets/assets/png100px/np.png": "6e099fb1e063930bdd00e8df5cef73d4",
"assets/assets/png100px/va.png": "c010bf145f695d5c8fb551bafc081f77",
"assets/assets/png100px/uz.png": "3adad3bac322220cac8abc1c7cbaacac",
"assets/assets/png100px/um.png": "8fe7c4fed0a065fdfb9bd3125c6ecaa1",
"assets/assets/png100px/tk.png": "5da01ab0c6ad17cf2433ca51ace5783b",
"assets/assets/png100px/vc.png": "c61e50116177358d9ecb09c47c4b194a",
"assets/assets/png100px/zw.png": "d6486e2bf0b8c3a4a1ded4156574f16c",
"assets/assets/png100px/nr.png": "1316f3a8a419d8be1975912c712535ea",
"assets/assets/png100px/ne.png": "a20724c177e86d6a27143aa9c9664a6f",
"assets/assets/png100px/cu.png": "f41715bd51f63a9aebf543788543b4c4",
"assets/assets/png100px/bq.png": "3649c177693bfee9c2fcc63c191a51f1",
"assets/assets/png100px/bf.png": "63f1c67fca7ce8b52b3418a90af6ad37",
"assets/assets/png100px/bg.png": "1d24bc616e3389684ed2c9f18bcb0209",
"assets/assets/png100px/cc.png": "31a475216e12fef447382c97b42876ce",
"assets/assets/png100px/gb-wls.png": "d7d7c77c72cd425d993bdc50720f4d04",
"assets/assets/png100px/mh.png": "112b630ee584e74fca0f756f843bf9d5",
"assets/assets/png100px/za.png": "b28280c6c3eb4624c18b5455d4a1b1ff",
"assets/assets/png100px/uy.png": "d465e7a0c51c63aef606e144d2432f20",
"assets/assets/png100px/wf.png": "6f1644b8f907d197c0ff7ed2f366ad64",
"assets/assets/png100px/vu.png": "3f201fdfb6d669a64c35c20a801016d1",
"assets/assets/png100px/tj.png": "c73b793f2acd262e71b9236e64c77636",
"assets/assets/sms.png": "af33ff2866a131740a4f76c6228d20c6",
"assets/assets/onboard_2.svg": "5ec00b2d21bfb4ead2c8bd1a2244eb1a",
"assets/assets/tasks.svg": "2b368a98a52e71ef24e976838a07f3a2",
"assets/assets/onboard_3.svg": "b4d7eec3135dc3147bd2d92a4a7fd781",
"assets/assets/onboard_1.svg": "24c6a7d5286a9c6cf85fc96f630d9fbf",
"assets/assets/add_contact.svg": "d96a0f2e39430e50abe8986e5e80be62",
"assets/assets/instagram.svg": "a434ac221524ba55d1e49f33c07c0ef7",
"assets/assets/onboard_1.png": "abd4d23e30d4c28fc956b97aee3bb4f4",
"assets/assets/threads.svg": "a3446039632fecee06eb19867fd44529",
"assets/assets/invite_member.svg": "e901aed3d79e84e9745a814576667dc9",
"assets/assets/onboard_2.png": "c7bfa9f8c41644830e91ad29d60d4bb8",
"assets/assets/telegram.svg": "3b15077cd704c43c854dd95139093d3f",
"assets/assets/lemon-old.png": "bbb648dc35c74f79e7fc8e2b3d9a3195",
"assets/assets/app.apk": "223e06d32575c6bf151750d154ea9738",
"assets/assets/avatar.png": "6aa803d38bc7a1557ec4a1f84fb83457",
"assets/assets/messages.svg": "fef9862256f8493fa9a450dc8599f4c1",
"assets/assets/error.png": "8e45d6f0c2734482784e0fb43211547e",
"assets/assets/app_bg.png": "7c69b6e8fd2367e8bfd674a9b7496a31",
"assets/assets/google.svg": "5913c8d66c150754c4230ebe25848141",
"assets/assets/select_workspace.svg": "e36953fe64065017b0a1e9a11ad08728",
"assets/assets/new_call.png": "648b650dfb1f6d9cf4535efe1f651505",
"assets/assets/app_logo.png": "65f57655ce762200bbdcdc27b92e9f9b",
"assets/assets/4.png": "c424eea1e1775a6754712a509c001ce0",
"assets/assets/5.png": "bf5078abc844d9f6ea16c664ebffc062",
"assets/assets/discord.svg": "7c122a96dda6d0ec2badace5c95c1ac0",
"assets/assets/signin.png": "2417d1037b15c23e7e9d7814d6ce9f2c",
"assets/assets/2.png": "e250762078f61548b3c7982a58b85a49",
"assets/assets/3.png": "1bbdbab0c01fb6a4d016e631045d8730",
"assets/assets/start.png": "ad35208acd30dcad3b4178dee75e3bb0",
"assets/assets/1.png": "3812e23c1aa2763051bfcff4531951a7",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
