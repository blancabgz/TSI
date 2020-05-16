(define (problem p3prob)
    (:domain p3dom)
    (:objects
        vce1 vce2 vce3 - unidad
        centro barracon - edificio
        mineral1 mineral2 mineral3 gas1 gas2 - recurso
        c1_1 c1_2 c1_3 c1_4 c1_5 c2_1 c2_2 c2_3 c2_4 c2_5 c3_1 c3_2 c3_3 c3_4 c3_5 c4_1 c4_2 c4_3 c4_4 c4_5 c5_1 c5_2 c5_3 c5_4 c5_5 - localizacion
    )
    (:init
        (esTipoUnidad vce1 VCE)(define (domain p3dom)
   (:requirements :adl)
   (:types
       posicionable localizacion - object
       unidad edificio recurso - posicionable
   )
   (:constants 
      CentroDeMando Barracones Extractor - tipoEdificio
      VCE - tipoUnidad
      Minerales Gas - tipoRecurso
   )
   (:predicates
      (en ?p - posicionable ?x - localizacion)
      (camino ?x - localizacion ?y - localizacion)
      (extrae ?u - unidad ?r - recurso)
      (construir ?e - edificio ?r - recurso)
      (esTipoEdificio ?e - edificio ?t - tipoEdificio)
      (esTipoUnidad ?u - unidad ?t - tipoUnidad)
      (esTipoRecurso ?r - recurso ?t - tipoRecurso)
      (necesita ?e - edificio ?t - tipoRecurso)
   )

   (:action Navegar
      :parameters (?u - unidad ?x ?y - localizacion)
      :precondition
         (and
            (camino ?x ?y)
            (en ?u ?x)
         )
      :effect
         (and
            (en ?u ?y)
            (not (en ?u ?x))
         )
   )

   (:action Asignar
      :parameters (?u - unidad ?r - recurso ?x - localizacion)
      :precondition
         (or
            (and
               (en ?u ?x)
               (en ?r ?x)
               (exists (?e - edificio)
                  (and 
                     (en ?e ?x)
                     (esTipoEdificio ?e Extractor)
                  )
               )
            )
            (and
               (en ?u ?x)
               (en ?r ?x)
               (not (esTipoRecurso ?r Gas))
            )
         )
         
      :effect
         (and
            (extrae ?u ?r)
         )
   )



   (:action Construir
      :parameters (?u - unidad ?e - edificio ?x - localizacion)
      :precondition
         (and
            (forall (?r - recurso)
               (not (extrae ?u ?r))
            )
            (exists (?u1 - unidad ?r - recurso ?t - tipoRecurso)
               (and 
                  (extrae ?u1 ?r)
                  (necesita ?e ?t)
                  (esTipoRecurso ?r ?t)
               )
            )
            (en ?u ?x)
         )
      :effect
         (and
            (en ?e ?x)
         )
   )
)

        (esTipoUnidad vce2 VCE)
        (esTipoUnidad vce3 VCE)
        (esTipoEdificio centro CentroDeMando)
        (esTipoEdificio barracon Barracones)
        (esTipoRecurso mineral1 Minerales)
        (esTipoRecurso mineral2 Minerales)
        (esTipoRecurso mineral3 Minerales)
        (esTipoRecurso gas1 Gas)
        (esTipoRecurso gas2 Gas)
        (necesita centro Gas)
        (necesita barracon Minerales)
        (en centro c3_3)
        (en mineral1 c1_1)
        (en mineral2 c1_2)
        (en mineral3 c1_3)
        (en gas1 c5_1)
        (en gas2 c5_2)
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