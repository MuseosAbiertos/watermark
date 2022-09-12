# Este script crea una imagen conteniendo texto y lo graba en otra imagen, creando así una imagen con una marca de agua (waternark)
#
# Este script
# https://gist.github.com/brockthebear/5c05bfd51199bc82bf29c51fafd42208
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
#
# Este comando se debe ejecutar en la carpeta principal que:
# 1. contenga el o los archivos a convertir
# 2. tenga subdirectorios que contengan archivos a convertir
# 3. los dos anteriores
#
# Este ejemplo encuentra todos los archivos .tif en la carpeta 'entrada' y los convierte a .jpg en la carpeta 'salida',
# pero cualquier conversión soportada por ImageMagick podría ser usada aquí.
# Si no tienes ImageMagick instalado, puedes bajarlo desde aquí (https://imagemagick.org/script/download.php)
#
#
## Crear watermark
convert -size 1100x20 xc:#1c1c1c -font IBM-Plex-Mono -pointsize 11 -gravity east \
  -fill white -annotate +4+0 'https://repo.museosabiertos.org' \
  watermark.png

## Pega watermark en imágenes de modo recursivo
for f in $(find . -name '*.tif');
  do echo "Converting $f";
  mogrify -path salida -format jpg -gravity southeast -draw \
  "image over 5,5 0,0 'watermark.png'" *.jpg "$f";
done;

# Manual de Amy Tabb
# https://amytabb.com/til/photography/2021/01/23/image-magick-watermark/
#
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