% Problema 1 – Predicción
% El archivo dblue.csv presenta una serie histórica de variación del dólar paralelo (del 03-01-2012 al 03-05-2013). Implementar un sistema de predicción neuronal bajo las siguientes consideraciones:
% Completar las series para los días faltantes.
% Implementar tres redes neuronales feedforward de tiempo diferido ((1+d)+N+1) para predecir el valor de la serie venta, para uno, seis y quince pasos adelantados, fuera de la serie, luego comparar con el valor correcto. 
% Seleccionar con algún criterio (y explicar) la cantidad necesaria de ventanas de tiempo diferido para cada modelo.
% Utilizar una heurística disponible para determinar la cantidad N de neuronas ocultas.
% En la fase de entrenamiento, distribuir convenientemente los conjuntos de entrenamiento y comprobación.
% Repetir la operación utilizando redes recurrentes, sin ventana de tiempo y  con realimentación de la salida anterior.
% Graficar, en todos los casos, los segmentos de predicción simultáneamente con los segmentos originales.
% Comparar los resultados y sacar conclusiones.


Tentrada = dataset';
intervalo = minmax(Tentrada);

ncapas = [10 5 1];
funcacti = {'tansig' 'tansig' 'purelin'};

net = newff(intervalo, ncapas, funcacti);

net = train(net, Tentrada)