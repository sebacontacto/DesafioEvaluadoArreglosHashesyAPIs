# Desafío evaluado - Arreglos hashes y APIs

Descripción
Aplicando los conceptos y herramientas aprendidas hasta ahora nos conectaremos a la API de la NASA para descargar fotos de los Rovers y filtrar resultados acorde a lo pedido.

Requerimientos

1. Crear el método request que reciba una url y retorne el hash con los resultados. (4 Puntos)

2. Crear un método llamado buid_web_page que reciba el hash de respuesta con todos los datos y construya una página web. Se evaluará la página creada y tiene que tener este formato: (5 Puntos)
   <html>
   <head>
   </head>
   <body>
   <ul>
       <li><img src='.../398380645PRCLF0030000CC AM04010L1.PNG'></li>
       <li><img src='.../398381687EDR_F0030000CCAM05010M_.JPG'></li> </ul>
   </body>
   </html>

3. Crear un método photos_count que reciba el hash de respuesta y devuelva un nuevo hash con el nombre de la cámara y la cantidad de fotos. (1 Punto)

