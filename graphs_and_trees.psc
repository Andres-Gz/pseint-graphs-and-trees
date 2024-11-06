// Funcion que permite verificar o validar el tipo de grafo, el recibe una matriz de adyacencia
Funcion tipoGrafo <- validarTipoGrafoMatrizAdyacencia(matrizAdyacencia, numeroVertices, tipoGrafo)
	Definir dirigido Como Logico
	Definir completo Como Logico
	Definir simple 	 Como Logico
	
	dirigido := Falso
	completo := Verdadero
	simple 	 := Verdadero
	
	Para i=1 Hasta numeroVertices Hacer
		Para j=1 Hasta  numeroVertices Hacer
			
			Si matrizAdyacencia[i,j] <> matrizAdyacencia[j,i] Entonces
				dirigido := Verdadero
			FinSi
			
			Si i <> j y matrizAdyacencia[i,j] = 0 Entonces
				completo := Falso
			FinSi
			
			Si i = j y matrizAdyacencia[i,j] > 0 Entonces
				simple := Falso
			FinSi
			
		FinPara
	FinPara
	
	Escribir '?El grafo es dirigido? - Respuesta :' dirigido
	
	Escribir '?El grafo es completo? - Respuesta :' completo
	
	Escribir '?El grafo es simple? - Respuesta :' simple
	
	// TODO terminar la definicion del tipo de grafo
	tipoGrafo  := 'Definir' 	
	
FinFuncion


// Funcion para mostrar la matriz de adyacencia
Funcion mostrarMatrizAdyacencia (matrizAdyacencia, numeroVertices)
	Escribir "Matriz de ingresada"
	
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
FinFuncion


// Funcion para Grafos con Matriz de Adyacencia
Funcion grafoMatrizAdyacencia
    Dimension matrizAdyacencia[100,100]
    Definir numeroVertices, gradoVertice, gradoGrafo Como Entero
    Definir tipoGrafo Como Caracter
    
    Escribir 'Ingrese numero de vertices'
    Leer numeroVertices
    
	Escribir 'Ingrese matriz de adyacencia (solo 0 o 1)'
	Para i <- 1 Hasta numeroVertices Hacer
		Para j <- 1 Hasta numeroVertices Hacer
			Repetir
				Escribir 'Ingrese el valor para posición [', i, ',', j, '] (0 o 1):'
				Leer matrizAdyacencia[i,j]
			Hasta Que matrizAdyacencia[i,j] = 0 o matrizAdyacencia[i,j] = 1
		FinPara
	FinPara
    
    mostrarMatrizAdyacencia(matrizAdyacencia, numeroVertices)
    
    tipoGrafo <- validarTipoGrafoMatrizAdyacencia(matrizAdyacencia, numeroVertices, tipoGrafo)
    
    // Calcular y mostrar los grados de cada vértice
    Escribir "Grados de los vértices:"
    Para i <- 1 Hasta numeroVertices Hacer
        gradoVertice <- 0
        Para j <- 1 Hasta numeroVertices Hacer
            gradoVertice <- gradoVertice + matrizAdyacencia[i,j]
        FinPara
        Escribir "Vértice ", i, ": ", gradoVertice
    FinPara
    
    // Calcular y mostrar el grado del grafo
    gradoGrafo <- 0
    Para i <- 1 Hasta numeroVertices Hacer
        gradoVertice <- 0
        Para j <- 1 Hasta numeroVertices Hacer
            gradoVertice <- gradoVertice + matrizAdyacencia[i,j]
        FinPara
        Si gradoVertice > gradoGrafo Entonces
            gradoGrafo <- gradoVertice
        FinSi
    FinPara
    Escribir "Grado del grafo: ", gradoGrafo
	
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
		
		//TODO se debe tener la opcion para arboles aca
		
	FinSi
	
	
	// Si el usuario escogio Grafo
	Si opcionMenu = 1 y opcionSubMenu = 1 Entonces
		Escribir 'Recibire un grafo'
		//TODO se debe meter la funcion para recibir un grafo
		
	SiNo Si opcionMenu = 1 y opcionSubMenu = 2 Entonces
			
			Escribir 'Recibire una matriz de abyacencia'
			grafoMatrizAdyacencia
			
		FinSi
	FinSi
	
FinAlgoritmo