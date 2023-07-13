# 1. Crear el método request que reciba una url y retorne el hash con los resultados.
require "uri"
require "net/http"
require 'json'
 
# Metodo request, recibe una api, guarda la info del JSON en un hash de nombre results,
# retorna el hash results
def request (pagina)
  url = URI(pagina)
  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true
  
  request = Net::HTTP::Get.new(url)
  response = https.request(request)
  
  results = JSON.parse(response.read_body)
  
  return results
end

# 2. Crear un método llamado buid_web_page que reciba el hash de respuesta con todos
# los datos y construya una página web. Se evaluará la página creada y tiene que tener # este formato:
# <html>
# <head>
# </head>
# <body>
# <ul>
#     <li><img src='.../398380645PRCLF0030000CC AM04010L1.PNG'></li>
#     <li><img src='.../398381687EDR_F0030000CCAM05010M_.JPG'></li>
# </ul>
# </body>
# </html>
def buid_web_page (hash)
  
  transform_level0 = hash.to_a
  transform_level1 = transform_level0[0][1]
  
  transform_level2 = []
  transform_level1.map do |elemento|
    elemento.each do |k, v|
      if k == "img_src"
        transform_level2 << v
      else
      end
    end
    print
  end
  
  puts ("<html>")
  puts ("<head>")
  puts ("</head>")
  puts ("<body>")
  puts ("<ul>")

  transform_level2.map do |img|
    puts ("    <li><img src='#{img}'></li>")
  end

  puts ("</ul>")
  puts ("</body>")
  puts ("</html>")

end

# 3. Crear un método photos_count que reciba el hash de respuesta y devuelva un nuevo hash con el
# nombre de la cámara y la cantidad de fotos. (1 Punto)
def photos_count (hash)
  
  transform_level0 = hash.to_a
  transform_level1 = transform_level0[0][1]
  
  transform_level2 = []
  transform_level1.map do |elemento|
    elemento.each do |k1, v1|
      if k1 == "camera"
        v1.each do |k2, v2|
          if k2 == "full_name"
            transform_level2 << v2
          else
          end
        end
      else
      end
    end
      print
  end

  transform_level3 = transform_level2.tally

  return transform_level3

end

# Usando el metodo request: envio de api NASA, guardado en hash
nasa_api_hash = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1&api_key=r5bINKZehjosijOSpdVtqTds3ETN3oUvETNpCadU")
# Comprobacion de guardado en hash
puts nasa_api_hash.class
puts
# Mostrar resultados
puts nasa_api_hash
puts

# Usando el metodo buid_web_page: envio del hash con info de la api NASA, guardado en una variable
mostrar_html = buid_web_page(nasa_api_hash)
# Mostar resultado de metodo buid_web_page
puts mostrar_html

# Usando el metodo photos_count: envio del hash con info de la api NASA y guardado en una variable
mostrar_camaras_cantidades = photos_count(nasa_api_hash)
# Mostar resultado de metodo photos_count
puts mostrar_camaras_cantidades
# Comprobacion de guardado en hash
puts mostrar_camaras_cantidades.class