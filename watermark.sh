# Este script crea una imagen conteniendo texto y lo graba en otra imagen, creando así una imagen con una marca de agua (waternark)
#
# Este script
# https://github.com/MuseosAbiertos/watermark
# 
# Uso
# Este ejemplo busca imágenes en la carpeta 'entrada' y guarda los watermarks en la carpera 'salida'
# ./watermark.sh entrada 
# 
# Contenido de la carpeta
# watermark.sh
# /entrada 
# /salida
#
# Este ejemplo encuentra todos los archivos .jpg en la carpeta 'entrada' y los convierte a .jpg en la carpeta 'salida',
# pero cualquier conversión soportada por ImageMagick podría ser usada aquí.
# Si no tienes ImageMagick instalado, puedes bajarlo desde aquí (https://imagemagick.org/script/download.php)
#
## Crear watermark
convert -size 1100x20 xc:#1c1c1c -font IBM-Plex-Mono -pointsize 11 -gravity east \
  -fill white -annotate +4+0 'https://repo.museosabiertos.org' \
  watermark.png

## Pegar watermark recursivo
for f in $(find . -name '*.jpg');
  do echo "Converting $f";
  mogrify -path salida -format jpg -gravity southeast -draw \
  "image over 5,5 0,0 'watermark.png'" *.jpg "$f";
done;

# Lista las fonts de Image Magick: 
# convert -list font > fonts.txt
# identify -list font | grep -i 'fontname'
#
# Buscar colores HTML para las fonts
# html colors: https://htmlcolorcodes.com/es/
#
# Help Fonts
# https://stackoverflow.com/questions/1392858/with-imagemagick-how-can-you-see-all-available-fonts
# https://gothick.org.uk/2008/03/14/using-os-x-fonts-in-imagemagick/
#
# Bonus: El manual de Amy Tabb
# https://amytabb.com/til/photography/2021/01/23/image-magick-watermark/
