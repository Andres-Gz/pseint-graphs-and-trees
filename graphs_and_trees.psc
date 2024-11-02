// Funcion para Grafos con Matriz de Adyacencia
Funcion grafoMatrizAdyacencia
	Definir numeroVertices Como Entero
	Dimension matrizAdyacencia[100,100]
	Definir dirigido Como Logico
	Definir Completo Como Logico
	
	
	dirigido := Falso
	completo := Verdadero
	simple := Verdadero
	
	
	Escribir 'Ingrese numero de vertices'
	Leer numeroVertices
	
	Escribir 'Ingrese matriz de adyacencia'
	Para i<-1 Hasta numeroVertices Con Paso 1 Hacer
		Para j<-1 Hasta numeroVertices Con Paso 1 Hacer
			Leer matrizAdyacencia[i,j]
		FinPara
	FinPara
	
	Escribir 'Si salimos'
	
	// Imprimir la matriz con formato
	Escribir "Matriz de Adyacencia:"
	
	// Mostrar matriz de adyacencia
	Escribir Sin Saltar "     "
	Para j<-1 Hasta numeroVertices Hacer
		Escribir Sin Saltar "  ", j, " "
	FinPara
	Escribir ""
	
	
	Para i=1 Hasta numeroVertices Hacer
		Escribir Sin Saltar i, " |"
		Para j=1 Hasta numeroVertices Hacer
			Escribir Sin Saltar "  ", matrizAdyacencia[i, j], " "
		FinPara
		Escribir ""
	FinPara
	

	Para i=1 Hasta numeroVertices Hacer
		Para j=1 Hasta  numeroVertices Hacer
			
			
			Si matrizAdyacencia[i,j] <> matrizAdyacencia[j,i] Entonces
				dirigido := Verdadero
			FinSi
			
			Si i <> j y matrizAdyacencia[i,j] = 0 Entonces
				completo = Falso
			FinSi
			
			Si i = j y matrizAdyacencia[i,j] > 0 Entonces
				simple = Falso
			FinSi
			
			
			
			
			
		FinPara
	FinPara
	
	Escribir '¿El grafo es dirigido? - Respuesta :' dirigido
	
	Escribir '¿El grafo es completo? - Respuesta :' completo
	
	Escribir '¿El grafo es simple? - Respuesta :' simple
	
	
FinFuncion




// Funcion para solamente mostrar el menu, debe ser llamada siempre antes de seleccionarOpcionMenu
Funcion mostrarSubMenu
	Escribir '	   		   SUB-MENU	    	   '
	Escribir '---------------------------------'
	Escribir '(1) Ingresar Grafo			   '
	Escribir '(2) Ingresar Matriz de adyacencia'
Fin Funcion


// Funcion que permite mostrar la opcion que el usuario selecciono en el menu
Funcion mostrarOpcionSeleccionada (opcion)
	Escribir 'Elegiste la opcion: ', opcion
FinFuncion


// Funcion que permite leer la opcion que el usuario quiera seleccionar del menu
Funcion opcion <- leerOpcion(opcion)
	Escribir 'Seleccione una opcion por favor'
	Leer opcion
	Mientras opcion <> 1 y opcion <> 2 Hacer
		Escribir 'Seleccion no valida, vuelva a intentarlo por favor'
		Leer opcion
	Fin Mientras
FinFuncion


// Funcion para solamente mostrar el menu, debe ser llamada siempre antes de seleccionarOpcionMenu
Funcion mostrarMenu
	Escribir '		MENU		'
	Escribir '------------------'
	Escribir '(1) Grafos		'
	Escribir '(2) Arboles		'
Fin Funcion


// Funcion 'Hola Mundo'
Funcion saludar
	Escribir 'Hola Mundo'
Fin Funcion


// Algoritmo Principal (Funcion Main)
Algoritmo graphs_and_trees
	// Definicion variables Globales
	Definir opcionSubMenu Como Entero
	Definir opcionMenu Como Entero
	
	// Saludar
	saludar
	
	// Menu Principal
	mostrarMenu
	opcionMenu := leerOpcion(opcionMenu)
	mostrarOpcionSeleccionada(opcionMenu)
	
	// SubMenu
	Si opcionMenu = 1 Entonces
		mostrarSubMenu
		opcionSubMenu := leerOpcion(opcionSubMenu)
		mostrarOpcionSeleccionada(opcionSubMenu)
	SiNo  
		
	FinSi
	
	
	// Si el usuario escogio Grafo y con Grafo
	Si opcionMenu = 1 y opcionSubMenu = 1 Entonces
		Escribir 'Recibire un grafo'
		
	SiNo Si opcionMenu = 1 y opcionSubMenu = 2 Entonces
			Escribir 'Recibire una matriz de abyacencia'
			grafoMatrizAdyacencia
		FinSi
		
	FinSi
	
	
	
	
	
FinAlgoritmo

