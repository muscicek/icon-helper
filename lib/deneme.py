import re

with open("lib\ikons_outlined_new.txt", "r") as dosya:
    metin = dosya.read()

# IconData ifadelerini bulma
icon_data_ifadeleri = re.findall(r'static const IconData (\w+) = IconData\((\w+), fontFamily: \'(\w+)\'\);', metin)

# "sharp", "rounded" ve "outlined" içerenleri filtreleme
filtrelenmis_icon_data_ifadeleri = [ifade for ifade in icon_data_ifadeleri if 'sharp' not in ifade[0] and 'rounded' not in ifade[0] and 'outlined' not in ifade[0]]

# Map<String, IconData> oluşturma
list_map = {}
for ifade in filtrelenmis_icon_data_ifadeleri:
    isim, deger, font = ifade
    list_map[isim] = f"IconData({deger}, fontFamily: '{font}')"

# Elde edilen map'i yeni bir dosyaya yazma
with open("yeni_veri_seti_filtrelenmis.txt", "w") as yeni_dosya:
    yeni_dosya.write("Map<String, IconData> list_map_filtrelenmis = {\n")
    for isim, deger in list_map.items():
        yeni_dosya.write(f'  "{isim}": {deger},\n')
    yeni_dosya.write("};\n")

print("Yeni veri seti (filtrelenmiş) başarıyla oluşturuldu.")