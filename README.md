# qr_example
# Uygulama Anlatımı

Uygulama başladığında, liste görünümünde bir yükleniyor efekti ile gölgelendirme ekranı görüntülenir. Daha sonra, yerel JSON dosyamdan çektiğim verileri bu liste üzerinde sıralarım. Sağ taraftaki sekmede ise barkodu okunan ürünlerin bir listesi bulunur. QR butonuna tıklanması durumunda kamera açılır ve gerekli izinler talep edilir.

Daha önce belirli ürünlerin seri numaralarını baz alarak oluşturduğum QR kodları, okutulduğunda uygulama, yerel JSON dosyasındaki bilgilerle eşleşiyorsa, bu ürünü barkod okutulmuş ürünler listesine ekler. Eğer okunan QR kod, yerel veriler arasında bulunmayan bir ürünü temsil ediyorsa, hata mesajı gösterilir. Ayrıca, daha önce okutulmuş bir barkod tekrar okunduğunda da bir hata mesajı görüntülenir.


https://github.com/bedirhanayydin/QrCase/assets/58737803/14545f95-8051-493f-9d43-3385f03504c2


<img width="236"  src="https://github.com/bedirhanayydin/QrCase/assets/58737803/d8c76930-f2de-4113-9226-9348fe795900">

<img width="236"  src="https://github.com/bedirhanayydin/QrCase/assets/58737803/9500612c-7de9-4d8a-868c-e03afd4b4326">

<img width="236"  src="https://github.com/bedirhanayydin/QrCase/assets/58737803/e067f202-021b-4561-8b21-901ab7c432a6">

<img width="236"  src="https://github.com/bedirhanayydin/QrCase/assets/58737803/b4da0451-7ef5-4c5e-be45-de137313b832">

<img width="236"  src="https://github.com/bedirhanayydin/QrCase/assets/58737803/5fd82459-74e6-4deb-ad54-ea4d10cfa536">

<img width="236"  src="https://github.com/bedirhanayydin/QrCase/assets/58737803/5055140f-f8a0-42e1-a2d8-9c09abc498d1">

<img width="236"  src="https://github.com/bedirhanayydin/QrCase/assets/58737803/a292fc8e-b3af-45d5-8bd3-29a9e1c54349">

<img width="236"  src="https://github.com/bedirhanayydin/QrCase/assets/58737803/c4349a86-c245-4f56-a6b2-21dab93ca525">


flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
