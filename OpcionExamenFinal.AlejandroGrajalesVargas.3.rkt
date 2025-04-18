#lang racket
#|
-Fecha de publicación: 07/04/2025
-Hora: 8:00 am
- Versión de su código: 1
-Autor. Ing(c): Alejandro Grajales Vargas
- Nombre del lenguaje utilizado: racket
- Versión del lenguaje utilizado: 8.16
- Presentado a: Doctor Ricardo Moreno Laverde
- Universidad Tecnológica de Pereira
- Programa de Ingeniería de Sistemas y Computación
- Este programa le permita agregar nuevos servicios a su portafolio, llenar los “comprobantes de solicitud de servicio” y
generar la factura correspondiente a cada “comprobante de solicitud de servicio”.
|#
(require graphics/graphics)
(struct product (code item value))
(open-graphics)
(define board (open-viewport "Diagnosticentro el progreso" 800 355))
(define (DrawView port keyOne codeOne cantOne codeTwo cantTwo codeThree cantThree car date name )
    (if (= keyOne 0)
        (void)
        ((draw-solid-rectangle board) (make-posn 0 0) 800 355 "white")
    )
    ((draw-rectangle board) (make-posn 50 50) 700 255 "black")
    ((draw-rectangle board) (make-posn 56 56) 688 35 "black")
    ((draw-rectangle board) (make-posn 56 102) 688 35 "black")
    ((draw-rectangle board) (make-posn 56 148) 688 149 "black")
    ((draw-string board) (make-posn 62 75) "DIAGNOSTICENTRO EL PROGRESO")
    ((draw-string board) (make-posn 606 75) "NIT. 903.103.888-2")
    ((draw-string board) (make-posn 334 121) "MENU PRINCIPAL")
    ((draw-string board) (make-posn 92 177) "0. Salir del aplicativo")
    ((draw-string board) (make-posn 92 201) "1. Añadir nuevos productos al portafolio")
    ((draw-string board) (make-posn 92 225) "2. Llenar “Comprobante de servicio” a un cliente")
    ((draw-string board) (make-posn 92 249) "3. Generar e imprimir factura")
    ((draw-string board) (make-posn 92 290) "Seleccione su opción:")
    (printf "\nSeleccione la opcion: ")
    (define key (read))
    (define portfolio port)
    (if (number? key)
        (if (= key 1)
            (DrawViewOne port 0 100 79 0 0 "" 0 1)
            (if (= key 2)
                (DrawViewTwo port 0)
                (if (= key 3)
                    (DrawViewThree port codeOne cantOne codeTwo cantTwo codeThree cantThree car date name)
                    (if (= key 0)
                        (close-graphics)
                        (void)
                    )
                )
            )
        )
        (DrawView port 1 codeOne cantOne codeTwo cantTwo codeThree cantThree car date name)
    )
)
(define (DrawViewThree port codeOne cantOne codeTwo cantTwo codeThree cantThree car date name)
    ((draw-solid-rectangle board) (make-posn 0 0) 800 355 "white")
    ((draw-string board) (make-posn 60 30) "DIAGNOSTICENTRO EL PROGRESO")
    ((draw-string board) (make-posn 560 30) "NIT. 903.103.888-2")
    ((draw-string board) (make-posn 60 50) "Factura de venta")
    ((draw-string board) (make-posn 60 70) (string-append "Nombre del cliente: " (~a name)))
    ((draw-string board) (make-posn 60 90) "NIT del cliente: 91.756.345-8")
    ((draw-string board) (make-posn 60 110) (string-append "Placa: " (~a car)))
    ((draw-string board) (make-posn 560 50) (string-append "Fecha(AAAA-MM-DD) " (~a date)))
    ((draw-rectangle board) (make-posn 60 130) 680 130 "black")
    ((draw-line board) (make-posn 60 155) (make-posn 740 155))
    ((draw-line board) (make-posn 60 185) (make-posn 740 185))
    ((draw-line board) (make-posn 60 207) (make-posn 740 207))
    ((draw-line board) (make-posn 60 230) (make-posn 740 230))
    ((draw-line board) (make-posn 150 130) (make-posn 150 260))
    ((draw-line board) (make-posn 480 130) (make-posn 480 260))
    ((draw-line board) (make-posn 620 130) (make-posn 620 260))
    ((draw-string board) (make-posn 80 145) "Código")
    ((draw-string board) (make-posn 80 170) (list-ref (vector-ref port codeOne) 0))
    ((draw-string board) (make-posn 80 200) (list-ref (vector-ref port codeTwo) 0))
    ((draw-string board) (make-posn 80 230) (list-ref (vector-ref port codeThree) 0))
    ((draw-string board) (make-posn 230 170) (list-ref (vector-ref port codeOne) 1))
    ((draw-string board) (make-posn 196 257) "***********FIN FACTURA***********")
    ((draw-string board) (make-posn 230 200) (list-ref (vector-ref port codeTwo) 1))
    ((draw-string board) (make-posn 530 260) "********")
    ((draw-string board) (make-posn 230 230) (list-ref (vector-ref port codeThree) 1))
    ((draw-string board) (make-posn 625 260) "**************")
    ((draw-string board) (make-posn 530 170) (~a cantOne))
    ((draw-string board) (make-posn 530 200) (~a cantTwo))
    ((draw-string board) (make-posn 530 230) (~a cantThree))
    (define costOne (* cantOne (list-ref (vector-ref port codeOne) 2)))
    (define costTwo (* cantTwo (list-ref (vector-ref port codeTwo) 2)))
    (define costThree (* cantThree (list-ref (vector-ref port codeThree) 2)))
    (define subTotal (+ costOne costTwo costThree))
    (define iva (/ (* subTotal 20) 100))
    (define total (+ subTotal iva))
    ((draw-string board) (make-posn 530 170) (~a cantOne))
    ((draw-string board) (make-posn 530 200) (~a cantTwo))
    ((draw-string board) (make-posn 530 230) (~a cantThree))
    ((draw-string board) (make-posn 625 170) (~a costOne))
    ((draw-string board) (make-posn 625 200) (~a costTwo))
    ((draw-string board) (make-posn 625 230) (~a costThree))
    ((draw-string board) (make-posn 300 145) "Producto")
    ((draw-string board) (make-posn 520 145) "Cantidad")
    ((draw-string board) (make-posn 640 145) "Valor")
    ((draw-string board) (make-posn 530 280) "Sub-total           ")
    ((draw-string board) (make-posn 625 280) (~a subTotal))
    ((draw-string board) (make-posn 530 300) "IVA(20%)            ")
    ((draw-string board) (make-posn 625 300) (~a iva))
    ((draw-string board) (make-posn 530 320) "Total               ")
    ((draw-string board) (make-posn 625 320) (~a total))
    ((draw-string board) (make-posn 60 338) (string-append "Valor total a pagar: " (~a (numberToText total)) "PESOS ($" (~a total) ") MCTE"))
    (printf "Ingrese cualquier numero o letra para imprimir la factura: ")
    (read)
    (printf "\n")
    (printf "\n")
    (printf "\n")
    (printf "\n")
    (printf "\n")
    (printf "   DIAGNOSTICENTRO EL PROGRESO                         NIT. 903.103.888-2\n")
    (printf "   Factura de venta                              Fecha(AAAA-MM-DD)~a\n" date)
    (printf "   Nombre del cliente: ~a\n" name)
    (printf "   NIT del cliente: 91.756.345-8\n")
    (printf "   Placa: ~a\n" car)
    (printf "\n    Código            Producto                                                   Cantidad            Valor\n")
    (printf "      ~a             ~a                                  ~a               ~a\n" codeOne (list-ref (vector-ref port codeOne) 1) cantOne costOne)
    (printf "      ~a             ~a                                  ~a               ~a\n" codeTwo (list-ref (vector-ref port codeTwo) 1) cantTwo costTwo)
    (printf "      ~a             ~a                                  ~a               ~a\n" codeThree (list-ref (vector-ref port codeThree) 1) cantThree costThree)
    (printf "                    ******FIN FACTURA*****                                       ********           *********\n")
    (printf "                                   Sub-total                                                          ~a\n" subTotal)
    (printf "                                    IVA(20%)                                                          ~a\n" iva)
    (printf "                                       Total                                                          ~a\n" total)
    (printf "   Valor total a pagar: ~a PESOS ($~a) MCTE\n" (numberToText total) total)
    (DrawView port 1  codeOne cantOne codeTwo cantTwo codeThree cantThree car date name)
)
(define (DrawViewTwo port key)
    (define (VerificateCode vec index search)
        (if (>= index (vector-length vec))
            (equal? "A" "B")
            (if (equal? (list-ref (vector-ref vec index) 0) search)
                (equal? "A" "A")
                (VerificateCode vec (+ index 1) search)
            )
        )
    )
    ((draw-solid-rectangle board) (make-posn 0 0) 800 355 "white")
    ((draw-rectangle board) (make-posn 56 56) 700 255 "black")
    ((draw-line board) (make-posn 56 162) (make-posn 755 162))
    ((draw-string board) (make-posn 127 186) "CÓDIGO DE PRODUCTO")
    ((draw-line board) (make-posn 56 199) (make-posn 755 199))
    ((draw-string board) (make-posn 537 186) "CANTIDAD")
    ((draw-line board) (make-posn 56 236) (make-posn 755 236))
    ((draw-line board) (make-posn 56 273) (make-posn 755 273))
    ((draw-line board) (make-posn 56 310) (make-posn 755 310))
    ((draw-line board) (make-posn 378 162) (make-posn 378 310))
    ((draw-string board) (make-posn 57 30) "DIAGNOSTICENTRO EL PROGRESO")
    ((draw-string board) (make-posn 630 30) "NIT. 903.103.888-2")
    ((draw-string board) (make-posn 57 50) "COMPROBANTE DE SOLICITUD DE SERVICIO:")
    ((draw-string board) (make-posn 57 82) "PLACA: ")
    (printf "Por favor ingrese la placa del vehiculo: ")
    (define idCar (~a (read)))
    ((draw-string board) (make-posn 117 82) idCar)
    ((draw-string board) (make-posn 57 108) "FECHA (AAAA-MM-DD): ")
    (printf "Por favor ingrese la fecha: ")
    (define date (~a (read)))
    ((draw-string board) (make-posn 117 108) date)
    ((draw-string board) (make-posn 57 134) "NOMBRE DEL CLIENTE: ")
    (printf "Por favor ingrese el nombre del cliente:")
    (define name (~a (read)))
    (printf "Por favor ingrese el primer apellido del cliente:")
    (define lastName (~a (read)))
    (printf "Por favor ingrese el segundo apellido del cliente:")
    (define secondLastName (~a (read)))
    (define completName (string-append name " " lastName " " secondLastName))
    ((draw-string board) (make-posn 247 134) completName)
    ((draw-string board) (make-posn 57 160) "NIT: 99999999999")
    (printf "Ingrese el código del producto 1: ")
    (define codeOne (read))
    (define existOne (VerificateCode port 0 (~a codeOne)))
    (if (equal? existOne #f)
        (begin
            (printf "El código ~a no existe en el portafolio.\n" codeOne)
            (DrawViewTwo port 0)
        )
        (void)
    )
    (printf "Ingrese la cantidad del producto 1: ")
    (define cantOne (read))
    ((draw-string board) (make-posn 170 217) (~a codeOne))
    ((draw-string board) (make-posn 540 217) (~a cantOne))
    (printf "Ingrese el código del producto 2: ")
    (define codeTwo (read))
    (define existTwo (VerificateCode port 0 (~a codeTwo)))
    (if (equal? existTwo #f)
        (begin
            (printf "El código ~a no existe en el portafolio.\n" codeTwo)
            (DrawViewTwo port 0)
        )
        (void)
    )
    (printf "Ingrese la cantidad del producto 2: ")
    (define cantTwo (read))
    ((draw-string board) (make-posn 170 254) (~a codeTwo))
    ((draw-string board) (make-posn 540 254) (~a cantTwo))
    (printf "Ingrese el código del producto 3: ")
    (define codeThree (read))
    (define existThree (VerificateCode port 0 (~a codeThree)))
    (if (equal? existThree #f)
        (begin
            (printf "El código ~a no existe en el portafolio.\n" codeThree)
            (DrawViewTwo port 0)
        )
        (void)
    )
    (printf "Ingrese la cantidad del producto 3: ")
    (define cantThree (read))
    ((draw-string board) (make-posn 170 291) (~a codeThree))
    ((draw-string board) (make-posn 540 291) (~a cantThree))
    (printf "Ingrese cualquier numero o letra para guardar y volver al menu: ")
    (read)
    (DrawView port 1  codeOne cantOne codeTwo cantTwo codeThree cantThree idCar date completName)
)
(define (DrawViewOne port counter counterX counterY key keyTwo valueStruct in colum)
    (define portfolio port)
    (define (VerificateCode vec index search)
        (if (>= index (vector-length vec))
            (equal? "A" "B")
            (if (equal? (list-ref (vector-ref vec index) 0) search)
                (equal? "A" "A")
                (VerificateCode vec (+ index 1) search)
            )
        )
    )
    (if (= key 0)
        (begin
            ((draw-solid-rectangle board) (make-posn 0 0) 800 355 "white")
            ((draw-rectangle board) (make-posn 100 50) 600 255 "black")
        )
        (void)
    )
    (if (and (< counter 8) (= keyTwo 0))
        (begin
            ((draw-line board) (make-posn 100 counterY) (make-posn 699 counterY) "black")
            (DrawViewOne port (+ counter 1) counterX (+ counterY 28) 1 0 valueStruct 0 1))
        (if (= keyTwo 0)
            (DrawViewOne port 0 200 counterY 1 1 valueStruct 0 1)
            (void)
        )
    )
    (if (and (< counter 2) (= keyTwo 1))
        (begin
            ((draw-line board) (make-posn counterX 50) (make-posn counterX 304) "black")
            (DrawViewOne port (+ counter 1) (+ counterX 400) counterY 1 1 valueStruct 0 1))
        (if (= keyTwo 1)
            (DrawViewOne port 0 200 74 1 2 valueStruct 0 1)
            (void)
        )
    )
    (if (< colum 4)
        (begin
            (if (and (< counter 9) (= keyTwo 2) (= colum 1))
                (begin
                    ((draw-string board) (make-posn 110 counterY) (~a (list-ref (vector-ref portfolio counter) 0)) "black")
                    (DrawViewOne port (+ counter 1) counterX (+ counterY 28) 1 2 valueStruct 1 1)
                )
                (if (= colum 1)
                    (DrawViewOne port 0 (+ counterX 50) 74 1 2 valueStruct 1 2)
                    (void)
                )
            )
            (if (and (< counter 9) (= keyTwo 2) (= colum 2))
                (begin
                    ((draw-string board) (make-posn counterX counterY) (~a (list-ref (vector-ref portfolio counter) 1)) "black")
                    (DrawViewOne port (+ counter 1) counterX (+ counterY 28) 1 2 valueStruct 1 2)
                )
                (if (= colum 2)
                    (DrawViewOne port 0 (+ counterX 400) 74 1 2 valueStruct 1 3)
                    (void)
                )
            )
            (if (and (< counter 9) (= keyTwo 2) (= colum 3))
                (begin
                    ((draw-string board) (make-posn counterX counterY) (~a (list-ref (vector-ref portfolio counter) 2)) "black")
                    (DrawViewOne port (+ counter 1) counterX (+ counterY 28) 1 2 valueStruct 1 3)
                )
                (if (= colum 3)
                    (DrawViewOne port 0 counterX 74 1 2 valueStruct 1 4)
                    (void)
                )
            )
        )
        (void)
    )
    (printf "Ingrese el código del nuevo producto: ")
    (define codeIn (~a (read)))
    (printf "Ingrese el nombre del producto dentro de comillas dobles: ")
    (define productInO (~a (read)))
    (define productIn (string-append productInO (make-string (- 31 (string-length productInO)) #\space)))
    (printf "Ingrese el valor del producto: ")
    (define priceIn (read))
    (define existe (VerificateCode portfolio 0 codeIn))
    (if (equal? existe #f)
        (void)
        (begin
            (printf "El código ~a ya existe en el portafolio.\n" codeIn)
            (DrawViewOne port 0 100 79 0 0 "" 0 1)
        )
    )
    (define newOne (list codeIn productIn priceIn))
    (define actualizado (vector-append port (vector newOne)))
    (printf "Producto añadido exitosamente.\n")
    (DrawView actualizado 1 0 0 0 0 0 0 0 0 0)
)
(define (Main)
    (define portfolio (vector 
        (list "Código" "Producto" "Valor") 
        (list "1" "Sincronizada                   " 120000) 
        (list "2" "Cambio de aceite (1/4 de galón)" 7000) 
        (list "3" "Cambio de filtro de aire       " 12000) 
        (list "4" "Cambio de filtro de gasolina   " 25000) 
        (list "5" "Cambio de filtro de aceite     " 22000) 
        (list "6" "Alineación delantera           " 90000) 
        (list "7" "Alineación trasera             " 110000) 
        (list "8" "Balanceo de llantas x llanta   " 12000))
    )
    (DrawView portfolio 0 0 0 0 0 0 0 0 0 0)
)
(define (numberToText n)
    (define units (vector "CERO" "UNO" "DOS" "TRES" "CUATRO" "CINCO" "SEIS" "SIETE" "OCHO" "NUEVE"))
    (define specials (vector "DIEZ" "ONCE" "DOCE" "TRECE" "CATORCE" "QUINCE" "DIECISÉIS" "DIECISIETE" "DIECIOCHO" "DIECINUEVE"))
    (define tens (vector "" "" "VEINTE" "TREINTA" "CUARENTA" "CINCUENTA" "SESENTA" "SETENTA" "OCHENTA" "NOVENTA"))
    (define hundreds (vector "" "CIEN" "DOSCIENTOS" "TRESCIENTOS" "CUATROCIENTOS" "QUINIENTOS" "SEISCIENTOS" "SETECIENTOS" "OCHOCIENTOS" "NOVECIENTOS"))
    (define thousand (vector "MIL"))
    (define (readUnidu u)
        (if (= u 0)
            (vector-ref tens 0)
            (vector-ref units u)
        )
    )
    (define (readTens d u)
        (if (= d 0) 
            (readUnidu u)
            (if (= d 1)
                (vector-ref specials u)
                (if (= d 2)
                    (if (= u 0)
                        (vector-ref tens 1)
                        (string-append "VEINTI" (~a (readUnidu u)))
                    )
                    (if (= u 0)
                        (vector-ref tens d)
                        (string-append (vector-ref tens d) " Y " (~a (readUnidu u)))
                    )
                )
            )
        )
    )
    (define (readHundreds c d u)
        (if (= c 0) (readTens d u)
            (if (= c 1)
                (if (and (= d 0) (= u 0)) 
                    (vector-ref hundreds 1)
                    (string-append "CIENTO " (~a (readTens d u)))
                )
                (string-append (vector-ref hundreds c) " " (~a (readTens d u)))
            )
        )
    )
    (define (readThreeDigit n)
        (define c (quotient n 100))
        (define d (quotient (remainder n 100) 10))
        (define u (remainder n 10))
        (readHundreds c d u)
    )
    (define miles (quotient n 1000))
    (define resto (remainder n 1000))
    (if (= miles 0)
        (readThreeDigit resto)
        (if (= miles 1)
            (if (= resto 0)
                (vector-ref thousand 0)
                (string-append "MIL " (~a (readThreeDigit resto)))
            )
            (if (= (remainder miles 100) 0)
                (string-append (readThreeDigit miles) " MIL")
                (string-append (readThreeDigit miles) " MIL " (~a (readThreeDigit resto)))
            )
        )
    )
)
(Main)