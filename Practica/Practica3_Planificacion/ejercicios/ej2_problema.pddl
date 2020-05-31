(define (problem p3prob)
    (:domain p3dom)
    (:objects
        vce1 vce2 vce3 - unidad
        centro barracon extractor - edificio
        c1_1 c1_2 c1_3 c1_4 c1_5 c2_1 c2_2 c2_3 c2_4 c2_5 c3_1 c3_2 c3_3 c3_4 c3_5 c4_1 c4_2 c4_3 c4_4 c4_5 c5_1 c5_2 c5_3 c5_4 c5_5 - localizacion
    )
    (:init
        (esTipoUnidad vce1 VCE)
        (esTipoUnidad vce2 VCE)
        (esTipoUnidad vce3 VCE)
        (esTipoEdificio centro CentroDeMando)
        (esTipoEdificio barracon Barracones)
        (esTipoEdificio extractor Extractor)
        (necesita CentroDeMando Gas)
        (necesita Barracones Minerales)
        (necesita Extractor Minerales)
        (en centro c3_3)
        (en Minerales c1_1)
        (en Minerales c1_2)
        (en Minerales c1_3)
        (en Gas c5_1)
        (en Gas c5_2)
        (en vce1 c2_2)
        (en vce2 c2_3)
        (en vce3 c2_4)
        (camino c1_1 c2_1)
        (camino c1_1 c1_2)
        (camino c1_2 c2_2)
        (camino c1_2 c1_3)
        (camino c1_2 c1_1)
        (camino c1_3 c2_3)
        (camino c1_3 c1_4)
        (camino c1_3 c1_2)
        (camino c1_4 c2_4)
        (camino c1_4 c1_5)
        (camino c1_4 c1_3)
        (camino c1_5 c2_5)
        (camino c1_5 c1_4)
        (camino c2_1 c1_1)
        (camino c2_1 c3_1)
        (camino c2_1 c2_2)
        (camino c2_2 c1_2)
        (camino c2_2 c3_2)
        (camino c2_2 c2_3)
        (camino c2_2 c2_1)
        (camino c2_3 c1_3)
        (camino c2_3 c3_3)
        (camino c2_3 c2_4)
        (camino c2_3 c2_2)
        (camino c2_4 c1_4)
        (camino c2_4 c3_4)
        (camino c2_4 c2_5)
        (camino c2_4 c2_3)
        (camino c2_5 c1_5)
        (camino c2_5 c3_5)
        (camino c2_5 c2_4)
        (camino c3_1 c2_1)
        (camino c3_1 c4_1)
        (camino c3_1 c3_2)
        (camino c3_2 c2_2)
        (camino c3_2 c4_2)
        (camino c3_2 c3_3)
        (camino c3_2 c3_1)
        (camino c3_3 c2_3)
        (camino c3_3 c4_3)
        (camino c3_3 c3_4)
        (camino c3_3 c3_2)
        (camino c3_4 c2_4)
        (camino c3_4 c4_4)
        (camino c3_4 c3_5)
        (camino c3_4 c3_3)
        (camino c3_5 c2_5)
        (camino c3_5 c4_5)
        (camino c3_5 c3_4)
        (camino c4_1 c3_1)
        (camino c4_1 c5_1)
        (camino c4_1 c4_2)
        (camino c4_2 c3_2)
        (camino c4_2 c5_2)
        (camino c4_2 c4_3)
        (camino c4_2 c4_1)
        (camino c4_3 c3_3)
        (camino c4_3 c5_3)
        (camino c4_3 c4_4)
        (camino c4_3 c4_2)
        (camino c4_4 c3_4)
        (camino c4_4 c5_4)
        (camino c4_4 c4_5)
        (camino c4_4 c4_3)
        (camino c4_5 c3_5)
        (camino c4_5 c5_5)
        (camino c4_5 c4_4)
        (camino c5_1 c4_1)
        (camino c5_1 c5_2)
        (camino c5_2 c4_2)
        (camino c5_2 c5_3)
        (camino c5_2 c5_1)
        (camino c5_3 c4_3)
        (camino c5_3 c5_4)
        (camino c5_3 c5_2)
        (camino c5_4 c4_4)
        (camino c5_4 c5_5)
        (camino c5_4 c5_3)
        (camino c5_5 c4_5)
        (camino c5_5 c5_4)

    )
    (:goal
        (and
            (en barracon c4_1)
        )
    )
)
