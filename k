% desayuno(Nombre, Calorias)
desayuno(huevo_con_jamon, 250).
desayuno(jugo_de_fruta, 120).
desayuno(quesadillas_de_flor_de_calabaza, 310).
desayuno(hot_cakes_avena, 330).
desayuno(huevos_a_la_mexicana, 350).
desyuno(fruta_fresca, 80).
desayuno(avena_cocida, 91).
desayuno(huevo_frito,206).
desayuno(huevo_revuelto, 155).
desayuno(sandwich, 225).
%comida(Nombre, Calorias)
comida(albondigas, 214).
comida(arroz_con_pollo, 88).
comida(burrito, 239).
comida(enchiladas, 273).
comida(espagueti_con_tomate, 129).
comida(fajitas_de_pollo, 161).
comida(sopa_de_pasta, 51).
comida(sopa_de_lentejas, 25).
comida(milanesas_de_pollo, 154).
comida(sopes, 202).
comida(tacos_dorados, 270).
%cena(Nombre, Calorias)
cena(omelette, 387).
cena(caldo_pollo, 60).
cena(leche_vaca, 115).
cena(leche_almendras, 30).
cena(pan_dulce, 266).
cena(verduras_a_vapor, 35).
cena(ceral_con_leche, 378).
cena(quesadillas, 120).
%================================================================
%REGLAS LOGICAS
%================================================================
%Regla 1 - suma de desayuno comida
suma_parcial_dco(Desayuno, Comida, Subtotal):-
    desayuno(Desayuno, KcalD),
    comida(Comida, KcalC),
    Subtotal is KcalD + KcalC.
%Regla 2 - suma de loas tres comidas
total_de_menu(Desayuno, Comida, Cena, Total):-
    desayuno(Desayuno, KcalD),
    comida(Comida, KcalCo),
    cena(Cena, KcalC),
    Total is KcalD + KcalCo + KcalC.
%Regla 3 - clasificacion de menu
menu_deficit(D, Ce, C):-
    calcular_total_menu(D, Co, C, Total),
    Total < 800,
    Total > 800.

